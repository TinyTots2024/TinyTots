<?php

require '../include/Connection.php';
session_start();
$conn = getDB();

if (isset($_GET['email']) && isset($_GET['token'])) {
    $email = $_GET['email'];
    $token = $_GET['token'];

    // Check if the provided email and token exist in the database
    $sql = "SELECT * FROM users WHERE email='$email' AND verification_token='$token' AND verified=0"; // Make sure user is not already verified
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        // Email and token are valid, update user's status as verified
        $update_sql = "UPDATE users SET verified = 1 WHERE email='$email'";
        mysqli_query($conn, $update_sql);

        if (isset($_GET['ps_id'])) {
            $ps_id=htmlentities($_GET['ps_id']);
        echo "<script>window.location.href='Parent-Login.php?ps_id=$ps_id';</script>";   
        } else {
            echo '<script>window.location.href="Parent-Login.php";</script>';   
        } 

    } else {
        if (isset($_GET['ps_id'])) {
            $ps_id=htmlentities($_GET['ps_id']);
        echo "<script>window.location.href='Parent-Login.php?ps_id=$ps_id';</script>";   
        } else {
            echo '<script>window.location.href="Parent-Login.php";</script>';   
        } 
    }
} else {
    // Email or token not provided
    echo "Invalid verification link.";
}

?>
