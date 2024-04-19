<?php
session_start();

// Check if the session variables are set
if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_username'])) {
    // Redirect the user if session variables are not set
    header("Location: Parent-Login.php"); // Change login.php to your login page
    exit();
}

// Include Connection.php file to get the database connection
require '../include/Connection.php';
$conn = getDB();

// Check if the payment_id parameter is provided in the URL
if (isset($_GET['payment_id'])) {
    $payment_id = $_GET['payment_id'];
    
    // Fetch the transaction photo for the given payment_id from the database
    $sql = "SELECT p_proof FROM payment WHERE payment_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $payment_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $transaction_photo = $row['p_proof'];
    } else {
        // Handle case where transaction photo is not found
        $transaction_photo = "not_found.jpg"; // Provide a default image
    }
} else {
    // Handle case where payment_id parameter is not provided
    $transaction_photo = "not_found.jpg"; // Provide a default image
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Photo</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>
<div class="white-box">
        <body>
        <div class="main_content"> 
            <div class="info">
                <button class="submitBTN" onclick="window.close()">Close</button> <!-- Button to close the window -->

                <div class="transaction-photo">
                    <img src="../uploaded-image/<?php echo $transaction_photo; ?>" alt="Transaction Photo">
                    <br>
                    
                </div>
                </div>
                </div>
</body>
</div>
</html>