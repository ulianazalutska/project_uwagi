<?php
include './cfg/conn.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $person_id = intval($_POST['personId']);
    $description = $conn->real_escape_string($_POST['description']);
    $points = intval($_POST['points']);
    $remark_date = date('Y-m-d'); 

    $insert_query = "INSERT INTO remarks (offender_id, description, points, remark_date) VALUES ('$person_id', '$description', '$points', '$remark_date')";
    
    if ($conn->query($insert_query) === TRUE) {
        header("Location: home_page.php?success=1");
        exit();
    } else {
        $error_message = urlencode("Error: " . $conn->error);
        header("Location: home_page.php?success=0&error=$error_message");
        exit();
    }
}

$conn->close();
?>
