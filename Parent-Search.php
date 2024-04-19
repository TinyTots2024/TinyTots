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
    $search_query = $_GET['query'];

    // Enroll Table
    $showEnroll = "SELECT * from enroll 
    JOIN preschool ON enroll.ps_id = preschool.ps_id
    JOIN users on enroll.user_id = users.user_id
    WHERE enroll.user_id='".$user_id."' 
    AND (stud_lname='$search_query' 
    OR stud_fname = '$search_query')";
    $showEnroll_results = mysqli_query($conn, $showEnroll);

    // If there is a connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showEnroll_results === false) {
        echo mysqli_error($conn);
    } else {
        $showE = mysqli_fetch_all($showEnroll_results, MYSQLI_ASSOC);
    }


?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Enrollment Management</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>
    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <?php if (empty($showE)): ?>
                    <h2 class="header">No Enrollment Found</h2>
                
                    <?php else: ?>
                    <h2 class="header">List of Enrollment Submitted</h2>
                    <table class="tblBorder">
                        
                            <tr>
                            <th>Enrollment ID</th>
                            <th>Student Name</th>
                            <th>School Name</th>
                            <th>Status</th>
                            <th>Action</th>
                            </tr>
                    
                            <tr>
                            <?php foreach ($showE as $enroll): ?>
                                <td><?= $enroll["enrollID"] ?></td>
                                <td style="font-weight: bold;"><?= $enroll["stud_fname"] ?> <?= $enroll["stud_lname"] ?></td>
                                <td><?= $enroll["school_name"] ?></td>
                                <td><?= $enroll["en_status"] ?></td>
                                <td><a href="Parent-DetEnroll.php?en_id=<?= $enroll["en_id"] ?>">
                                        <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button></a>
                                    <a href="Parent-EdPSA.php?en_id=<?= $enroll["en_id"] ?>">
                                        <button><i class="fa-solid fa-pen" style="color: #ffffff;"></i></button></a>
                                    <a href="Parent-DelEnroll.php?en_id=<?= $enroll["en_id"] ?>">
                                        <button><i class="fa-solid fa-trash" style="color: #ffffff;"></i></button></a><br>
                                </td>
                                
                            </tr>
                            <?php endforeach; ?>
                    </table>
                    
                    <?php endif; ?> 
                </div>
            </div>
        </body>
    </div>


</html>