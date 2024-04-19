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

    // Enrollment Table
    $showEnroll = "SELECT * FROM archive_enroll  
                join preschool on archive_enroll.ps_id = preschool.ps_id
                join users on archive_enroll.user_id = users.user_id
                where archive_enroll.user_id='".$user_id."' 
                AND (stud_lname='$search_query' 
                OR stud_fname = '$search_query');";

    $showEnroll_results = mysqli_query($conn, $showEnroll);

    // If there is an connection error, then echo the description of the  error
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
        <title>Archived Enrollment List</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <?php if (empty($showE)): ?>
                    <h2 class="head2">No Archived Enrollment Students Found</h2>
                    <a href="Parent-Enroll.php"><button class="allbutton">Back</button></a>

                    <?php else: ?>
                    <h2 class="header">Archived Student Information</h2>
                    <a href="Parent-Enroll.php"><button class="allbutton">Back</button></a>

                    <table class="tblBorder">                   
                        <tr>
                            <th>Enrollment ID</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        <tr>
                        <?php foreach ($showE as $enroll): ?>
                            <td><?= $enroll["enrollID"] ?></td>
                            <td><?= $enroll["stud_fname"] ?> <?= $enroll["stud_lname"] ?></td>
                            <td><?= $enroll["en_status"] ?></td>
                            <td><a href="Parent-ViewEnArchive.php?en_id=<?= $enroll[
                                            "en_id"
                                        ] ?>"><button>View</button></a></td>
                        </tr>
                        <?php endforeach; ?>
                    </table>
                    <?php endif; ?>
                </div>
            </div>
        </body>
    </div>
<html>