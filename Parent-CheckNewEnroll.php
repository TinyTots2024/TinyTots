<?php
session_start();
// Check if the session variables are set
if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_username'])) {
    // Redirect the user if session variables are not set
    header("Location: Parent-Login.php"); // Change login.php to your login page
    exit();
}  
    require '../include/Connection.php';
    $conn = getDB();
    $user_id = $_SESSION["user_id"];
    
    if (isset($_GET['ps_id'])) {
        $ps_id=htmlentities($_GET['ps_id']);
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enrollment Options</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content">
                <div class="info">
                    <h2 class="head2">Enrollment Options</h2>
                    <p class="centerText">Do you want to process a new enrollment?</p>
                    <a href="Parent-EnrollForm.php?ps_id=$ps_id"><button class="submitBTN">Yes</button></a>
                    <a href="Parent-Fees.php"><button class="cancelBTN">No</button></a>
                
                </div>
            </div>
        </body>
    </div>
</html>
