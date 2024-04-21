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

    //Web Admin information will be gathered
    $wba_id = $_SESSION["wba_id"];

    $info_sql = "SELECT * FROM webadmins
                WHERE wba_id='".$wba_id."'";

    $info_results = mysqli_query($conn, $info_sql);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($info_results === false) {
        echo mysqli_error($conn);
    } else {
        $info= mysqli_fetch_all($info_results, MYSQLI_ASSOC);
    }

    // Retrieve student records
    $studentQuery = "SELECT * FROM archive_StudRec JOIN archive_enroll 
    ON archive_StudRec.en_id = archive_enroll.en_id";
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
            
                <br><h3 class="header">Archive- Student Records</h3>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($studentRow = $studentResult->fetch_assoc()) : ?>
                        <tr>
                            <td><?php echo $studentRow['stud_fname']; ?> <?php echo $studentRow['stud_lname']; ?></td>
                            <td>
                                <a href="WA-ArchiveViewDetSR.php?SR_ID=<?= $studentRow["SR_ID"] ?>">
                                <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                </a>
                            </td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>

            </div>
        </body>
    </div>

</html>