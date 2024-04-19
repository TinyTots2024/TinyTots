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

    // Get the List of the students under the section
    $showStudRec = "SELECT * from archive_StudRec   
                join preschool on archive_StudRec.ps_id = preschool.ps_id
                join users on archive_StudRec.user_id = users.user_id
                join archive_enroll on archive_StudRec.en_id = archive_enroll.en_id
                where archive_StudRec.user_id = '$user_id'";

    $showStudRec_results = mysqli_query($conn, $showStudRec);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showStudRec_results === false) {
        echo mysqli_error($conn);
    } else {
        $showSTR = mysqli_fetch_all($showStudRec_results, MYSQLI_ASSOC);
    }

?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Archive Student Record</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                <h2 class="header">Archive - Student Records</h2>
                <table class="tblBorder">
                    <tr>
                        <th>Student Name</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                    <?php foreach ($showSTR as $STR): ?>
                        <td><?= $STR["stud_fname"] ?> <?= $STR["stud_lname"] ?></td>
                        <td><a href="Parent-ArchiveSTRec.php?SR_ID=<?= $STR["SR_ID"] ?>">
                            <button class="action-btn">View Details</button></a></td>
                    </tr>
                    <?php endforeach ?>
                    </table>
                </div>
            </div>
        </body>
    </div>

</html>

