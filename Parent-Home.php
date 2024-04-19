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

    // Student Record Table
    $showRecord = "SELECT * from StudRec 
    join users on StudRec.user_id = users.user_id
    join enroll on StudRec.en_id = enroll.en_id
    JOIN adviser on StudRec.adviser_ID = adviser.adviser_ID
    WHERE StudRec.user_id = '".$user_id."';";

    $sshowRecord_results = mysqli_query($conn, $showRecord);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($sshowRecord_results === false) {
        echo mysqli_error($conn);
    } else {
        $showR = mysqli_fetch_all($sshowRecord_results, MYSQLI_ASSOC);
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Dashboard</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
    
</head>

<div class="white-box">
    <body>
        <div class="main_content"> 
            <div class="info">
                <?php if (empty($showR)): ?>
                    <h2>No Record Found</h2>

                    <h1><?php else:  ?>
                        <h2 class="header">Student Record</h2>
                        <button onclick="window.print()" class="allbutton"><i class="fa-solid fa-print" style="color: #ffffff;"></i> Print Records</button>

                        <a href="Parent-ArchiveStudList.php"><button class="allbutton"><i class="fa-solid fa-inbox" style="color: #ffffff;"></i> Archive</button></a>

                    <table class="tblBorder">                
                            <tr>
                                <th>Student Name</th>
                                <th>Grade Level</th>
                                <th>Section</th>
                                <th>Action</th>
                            </tr>

                            <tr>
                            <?php foreach ($showR as $Rec): ?>    
                                <td><?=$Rec["stud_fname"] ?> <?=$Rec["stud_lname"] ?></td>
                                <td><?=$Rec["grade_level"] ?></td>
                                <td><?=$Rec["section"] ?></td>
                                <td><a href="Parent-DetStudInfo.php?SR_ID=<?= $Rec["SR_ID"] ?>"><button>
                                <i class="fa-solid fa-pen" style="color: #ffffff;"></i> View Details</button></a></td>
                            </tr> 
                            <?php endforeach; ?>
                        </table>
                <?php endif; ?>               
            </div>
        </div>
    </body>
</div>

</html>

