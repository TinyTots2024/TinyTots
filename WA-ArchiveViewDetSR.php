<?php
session_start();
// Check if the session variables are set
if (!isset($_SESSION['wba_id']) || !isset($_SESSION['wba_username'])) {
    // Redirect the user if session variables are not set
    header("Location: WA-Login.php"); // Change login.php to your login page
    exit();
}

    require '../include/Connection.php';
    $conn = getDB();

    $wba_id = $_SESSION["wba_id"];
    $SR_ID = htmlentities($_GET['SR_ID']);

    $studentQuery = "SELECT * FROM archive_StudRec JOIN archive_enroll ON archive_StudRec.en_id = archive_enroll.en_id WHERE SR_ID=$SR_ID";
    $studentResult = $conn->query($studentQuery);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Information</title>
    <?php require 'include/WA-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                <a href="WA-ArchiveStudList.php"><button class="cButton">Back</button></a>
                <h3 class="header">Archive - Detailed Student Records</h3>
                <table class="DettblBorder">
                    <?php while ($studentRow = $studentResult->fetch_assoc()) : ?>
                    <tr>
                        <td>Enrollment ID</td>
                        <td><?php echo $studentRow['enrollID']; ?></td>
                    </tr>
                    <tr>
                        <td>Student Name</td>
                        <td><?php echo $studentRow['stud_fname'] . ' ' . $studentRow['stud_lname']; ?></td>
                    </tr>
                    <tr>
                        <td>Year Level</td>
                        <td><?php echo $studentRow['year_level']; ?></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><?php echo $studentRow['stud_DOB']; ?></td>
                    </tr>
                    <tr>
                        <td>School Year</td>
                        <td><?php echo $studentRow['sy']; ?></td>
                    </tr>
                    <tr>
                        <td>Learner Status</td>
                        <td><?php echo $studentRow['lrn_status']; ?></td>
                    </tr>
                    <tr>
                        <td>Student Age</td>
                        <td><?php echo $studentRow['stud_age']; ?></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><?php echo $studentRow['e_email']; ?></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><?php echo $studentRow['stud_address']; ?></td>
                    </tr>
                    <tr>
                        <td>IP</td>
                        <td><?php echo $studentRow['IP']; ?></td>
                    </tr>
                    <tr>
                        <td>SP</td>
                        <td><?php echo $studentRow['SP']; ?></td>
                    </tr>
                    <tr>
                        <td>Father Name</td>
                        <td><?php echo $studentRow['father_name']; ?></td>
                    </tr>
                    <tr>
                        <td>Father Contact Number</td>
                        <td><?php echo $studentRow['f_contact']; ?></td>
                    </tr>
                    <tr>
                        <td>Mother Name</td>
                        <td><?php echo $studentRow['mother_name']; ?></td>
                    </tr>
                    <tr>
                        <td>Mother Contact Number</td>
                        <td><?php echo $studentRow['m_contact']; ?></td>
                    </tr>
                    <tr>
                        <td>Enrollment Date</td>
                        <td><?php echo $studentRow['enrollment_date']; ?></td>
                    </tr>
                    <tr>
                        <td>Enrollment Status</td>
                        <td><?php echo $studentRow['en_status']; ?></td>
                    </tr>
                    <?php endwhile; ?>
                </table>
                </div>
            </div>
        </body>
    </div>
</html>