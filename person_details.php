<?php
include './cfg/conn.php'; 

if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("Person ID not provided.");
}

$person_id = intval($_GET['id']);
$person_query = "SELECT first_name, last_name FROM persons WHERE person_id = $person_id";
$person_result = mysqli_query($conn, $person_query);

if (!$person_result || mysqli_num_rows($person_result) === 0) {
    die("Person not found.");
}

$person = mysqli_fetch_assoc($person_result);

$remarks_query = "SELECT description, points, remark_date FROM remarks WHERE offender_id = $person_id";
$remarks_result = mysqli_query($conn, $remarks_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($person['first_name'] . ' ' . $person['last_name']) ?></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center"><?= htmlspecialchars($person['first_name'] . ' ' . $person['last_name']) ?></h1>
        <h2 class="text-center">Scores and Comments</h2>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Points</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($remark = $remarks_result->fetch_assoc()): ?>
                    <tr class="<?= ($remark['points'] < 0) ? 'negative' : 'positive' ?>">
                        <td><?= htmlspecialchars($remark['description'], ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= htmlspecialchars($remark['points'], ENT_QUOTES, 'UTF-8') ?></td>
                        <td><?= date('d-m-Y', strtotime($remark['remark_date'])) ?></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
        <div class="text-center">
            <a href="home_page.php" class="btn btn-secondary">Back to the list of persons</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
