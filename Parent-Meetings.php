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

    //Meetings Table
    $showMeetings = "SELECT * from meetings 
    JOIN preschool ON meetings.ps_id = preschool.ps_id
    JOIN users on meetings.user_id = users.user_id
    JOIN faculty on meetings.faculty_id = faculty.faculty_id
    WHERE meetings.user_id='".$user_id."'";
    $showMeetings_results = mysqli_query($conn, $showMeetings);

    // If there is a connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showMeetings_results === false) {
        echo mysqli_error($conn);
    } else {
        $showM = mysqli_fetch_all($showMeetings_results, MYSQLI_ASSOC);
    }



?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Meetings Management</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <?php if (empty($showM)): ?>
                    <h2 class="header">No Meeting Found</h2>
                    <a href="Parent-SetMeet.php"><button class="allbutton"><i class="fa-solid fa-plus" style="color: #ffffff;"></i> Setup New Meeting</button></a>

                    <?php else: ?>
                    <h2 class="header">Scheduled Meetings</h2>
                    <a href="Parent-SetMeet.php"><button class="allbutton"><i class="fa-solid fa-plus" style="color: #ffffff;"></i> Setup New Meeting</button></a>
                        
                    <table class="tblBorder">

                        <tr>
                            <th>Topic</th>
                            <th>Description</th>
                            <th>Faculty Name</th>
                            <th>Meeting Date</th>
                            <th>Meeting Status</th>
                            <th>Meeting Setup</th>
                            <th>Meeting Link</th>
                            <th>Action</th>
                        </tr>       
                                
                        <tr>
                        <?php foreach ($showM as $meet): ?>
                            <td><?= $meet["meet_topic"] ?></td>
                            <td><?= $meet["meet_desc"] ?></td>
                            <td><?= $meet["f_fname"] ?> <?= $meet["f_lname"] ?></td>
                            <td><?= $meet["meeting_date"] ?> <?= $meet["meeting_time"] ?></td>
                            <td><?= $meet["meetstatus"] ?></td>
                            <td><?= $meet["setup"] ?></td>
                            <td>
                                        <?php if ($meet["meetstatus"] == "Requested"): ?>
                                        No Zoom link available at the moment.
                                        <?php else: ?>
                                        <a target="_blank" href="<?= $meet["ps_zoom"] ?>">Link</a>
                                        <?php endif; ?>
                            </td>
                            <td><a href="Parent-DelMeet.php?meetings_id=<?= $meet["meetings_id"] ?>">
                                    <button><i class="fa-solid fa-trash" style="color: #ffffff;"></i></button></a>
                                <a href="Parent-EdMeet.php?meetings_id=<?= $meet["meetings_id"] ?>">
                                    <button><i class="fa-solid fa-pen" style="color: #ffffff;"></i></button></a>
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