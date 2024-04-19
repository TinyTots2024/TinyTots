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

    // Enroll Table
    $showEnroll = "SELECT * from archive_enroll 
    JOIN preschool ON archive_enroll.ps_id = preschool.ps_id
    JOIN users on archive_enroll.user_id = users.user_id
    WHERE archive_enroll.user_id='".$user_id."'
    ORDER BY en_status desc";
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
        <title>Enrollment List</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <?php if (empty($showE)): ?>
                    <h2 class="head2">No Archive Found</h2>

                    <?php else: ?>
                    <h2 class="header">List of Archived Enrollment</h2>
                    
                    <form action="Parent-Search-Archive.php" method="GET">
                        <div class="search-form">
                            <label for="search_query">Search Name: </label>
                            <input type="text" id="search_query" name="query" required>
                        <button class="searchButton">Search</button>
                        </div>
                    </form>
                    
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