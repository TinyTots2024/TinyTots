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

    // Payment Table
    $showFee = "SELECT *, SUM(CASE WHEN payment_status = 'Paid' THEN amount_paid ELSE 0 END) 
    AS total_paid_amount 
    FROM payment
    JOIN preschool ON payment.ps_id = preschool.ps_id
    JOIN users on payment.user_id = users.user_id
    JOIN enroll on payment.en_id = enroll.en_id
    WHERE payment.user_id='".$user_id."'
    GROUP BY payment.en_id";
    $showFee_results = mysqli_query($conn, $showFee);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showFee_results === false) {
        echo mysqli_error($conn);
    } else {
        $showF = mysqli_fetch_all($showFee_results, MYSQLI_ASSOC);
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Parent - Fees Management</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

<div class="white-box">
    <body>
        <div class="main_content"> 
            <div class="info">
            <h2 class="header">Payment Details</h2>

            <a href="Parent-ArchiveFees.php"><button class="allbutton">Archive</button></a>

                <table class="tblBorder">
                    <tr>
                        <th>Enrollment ID</th>
                        <th>Student Name</th>
                        <th>Payable Fee</th>
                        <th>Paid Amount</th>
                        <th>Balance</th>
                        <th>Action</th>
                    </tr>

                    <tr>
                    <?php foreach ($showF as $fee): ?>
                        <td><?= $fee["enrollID"] ?></td>
                        <td><?= $fee["stud_fname"] ?> <?= $fee["stud_lname"] ?></td>
                        <td><?= $fee["fees"] ?></td>
                        <td><?= $fee["total_paid_amount"] ?></td>
                        <td><?= $fee['fees'] -  $fee["total_paid_amount"] ?></td>
                        
                        <td><a href="Parent-DetFee.php?en_id=<?= $fee["en_id"] ?>&ps_id=<?= $fee["ps_id"] ?>">
                            <button class="buttons green">Manage Fees</button></a>
                            
                        </td>
                    </tr>
           
                <?php endforeach; ?>
                </table>
            </div>
        </div>
    </body>
</div>

</html>