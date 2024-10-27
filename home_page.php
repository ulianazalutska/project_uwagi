<?php
include './cfg/conn.php';  

if (isset($_GET['success'])) {
    if ($_GET['success'] == 1) {
        echo "<div class='alert alert-success'>Successfully!</div>";
    } else if (isset($_GET['error'])) {
        $error_message = htmlspecialchars($_GET['error'], ENT_QUOTES, 'UTF-8');
        echo "<div class='alert alert-danger'>Error adding:  $error_message</div>";
    }
}

$result = $conn->query("
SELECT 
    p.person_id, 
    p.first_name, 
    p.last_name, 
    COALESCE(SUM(r.points), 0) AS total_points,
    MAX(r.remark_date) AS last_remark_date
FROM 
    persons p 
LEFT JOIN 
    remarks r ON p.person_id = r.offender_id 
GROUP BY 
    p.person_id
ORDER BY 
    p.person_id;
");

if (!$result) {
    die("Query failed: " . $conn->error);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">

</head>
<body>
    <div class="container mt-3">
        <h1 class="text-center">Person List</h1>
        <div class="text-center mt-4 mb-4">
            <button id="addRemarkBtn" class="btn btn-primary" data-toggle="modal" data-target="#remarkModal">Add New Remark</button>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Total Points</th>
                    <th>Date of Last Remark</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($person = $result->fetch_assoc()): ?>
                    <tr class="<?= ($person['total_points'] < 0) ? 'negative' : 'positive' ?>">
                        <td>
                            <a class="flt" href="person_details.php?id=<?= $person['person_id'] ?>">
                                <?= htmlspecialchars($person['first_name'] . ' ' . $person['last_name'], ENT_QUOTES, 'UTF-8') ?>
                            </a>
                        </td>
                        <td><?= htmlspecialchars($person['total_points'], ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= $person['last_remark_date'] ? date('d-m-Y', strtotime($person['last_remark_date'])) : 'None' ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>

    <div id="remarkModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="remarkModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="remarkModalLabel">Add New Remark</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   <form id="remarkForm" action="add_remark.php" method="POST" autocomplete="off">
                        <div class="form-group">
                            <label for="personId">Person:</label>
                            <select class="form-control" id="personId" name="personId" required>
                                <option value="">Select a person</option>
                                <?php
                                    $person_query = "SELECT person_id, first_name, last_name FROM persons ORDER BY last_name";
                                    $person_result = $conn->query($person_query);
                                    while ($person = $person_result->fetch_assoc()) {
                                        echo "<option value='" . htmlspecialchars($person['person_id'], ENT_QUOTES, 'UTF-8') . "'>" . 
                                        htmlspecialchars($person['first_name'] . " " . $person['last_name'], ENT_QUOTES, 'UTF-8') . 
                                        "</option>";
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="description">Description:</label>
                            <input type="text" class="form-control" id="description" name="description" required>
                        </div>
                        <div class="form-group">
                            <label for="points">Points:</label>
                            <input type="number" class="form-control" id="points" name="points" min="-100" max="100" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $('#remarkModal').on('show.bs.modal', function () {
            $('body').addClass('block');
        });
        
        $('#remarkModal').on('hidden.bs.modal', function () {
            $('body').removeClass('block');
        });
    </script>
    
</body>
</html>
