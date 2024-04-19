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

    $en_id=htmlentities($_GET['en_id']);

        // Enrollment Table
        $showEnroll = "SELECT * from archive_enroll 
        join preschool on archive_enroll.ps_id = preschool.ps_id
        join users on archive_enroll.user_id = users.user_id
        where archive_enroll.en_id = '".$en_id."'";

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
        <title>Update Enrollment</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <h2 class="head2">Update Enrollment Status</h2>
                    <button onclick="window.print()" class="print">Print Enrollment Form</button>
                    <?php foreach ($showE as $enroll): ?>

                    <table class="DettblBorder">
                    <tr>
                        <td label>Enrollment ID</td>
                        <td><?= $enroll["enrollID"] ?></td>
                    </tr>

                    <tr>
                        <td>Enrollment Date</td>
                        <td><?= $enroll["enrollment_date"] ?></td>
                    </tr>

                    <tr>
                        <td>Status</td>
                        <td><?= $enroll["en_status"] ?></td>
                    <tr>

                    <tr>
                        <td>Student Name</td>
                        <td><?= $enroll["stud_fname"] ?> <?= $enroll["stud_lname"] ?></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><?= $enroll["stud_DOB"] ?></td>
                    </tr>
                    <tr>
                        <td>School Year</td>
                        <td><?= $enroll["sy"] ?></td>
                    </tr>
                    <tr>
                        <td>Learner Status</td>
                        <td><?= $enroll["lrn_status"] ?></td>
                    </tr>
                    <tr>
                        <td>Year Level</td>
                        <td><?= $enroll["year_level"] ?></td>
                    </tr>
                    <tr>
                        <td>last Grade Level</td>
                        <td><?= $enroll["last_gradelevel"] ?></td>
                    </tr>
                    <tr>
                        <td>Last School Year</td>
                        <td><?= $enroll["last_sy"] ?></td>
                    </tr>
                    <tr>
                        <td>School Name</td>
                        <td><?= $enroll["school_name"] ?></td>
                    </tr>
                    <tr>
                        <td>Student Age</td>
                        <td><?= $enroll["stud_age"] ?></td>
                    </tr>
                    <tr>
                        <td>Student Sex</td>
                        <td><?= $enroll["stud_sex"] ?></td>
                    </tr>
                    <tr>
                        <td>Belonging to Indigenous People (IP)</td>
                        <td><?= $enroll["IP"] ?></td>
                    </tr>
                    <tr>
                        <td>For Learners with Special Education Needs (SP)</td>
                        <td><?= $enroll["SP"] ?></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><?= $enroll["e_email"] ?></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><?= $enroll["stud_address"] ?></td>
                    </tr>
                    <tr>
                        <td>Father Name</td>
                        <td><?= $enroll["father_name"] ?></td>
                    </tr>

                    <tr>
                        <td>Father Contact Number</td>
                        <td><?= $enroll["f_contact"] ?></td>
                    </tr>
                    <tr>
                        <td>Mother Name</td>
                        <td><?= $enroll["mother_name"] ?></td>
                    </tr>
                    <tr>
                        <td>Mother Contact Number</td>
                        <td><?= $enroll["m_contact"] ?></td>
                    </tr>
                    
                    <tr>
                        <td>Details</td>
                        <td><?php if (empty($enroll["details"])): ?> No Details found
                            <?php else: $enroll["details"]?></td>
                        <?php endif; ?>
                    </tr>
                    
                    <tr>
                        <td>PSA File</td>
                        <td>
                            <?php if (empty($enroll['PSA_file'])): ?> No PSA Photo submitted
                            <?php else: $enroll['PSA_file']?>
                            <img src="../uploaded-image/<?=$enroll['PSA_file']?>" class="extraFilePic" alt="PSA FILE">
                            <?php endif; ?>
                        </td>
                    </tr>
                </table>

                            <?php endforeach; ?>
                </div>
            </div>
        </body>
    </div>

<html>