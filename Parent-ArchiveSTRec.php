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

    $SR_Id=htmlentities($_GET['SR_ID']);

    // Student Record Table
    $showRecord = "SELECT * from archive_StudRec 
    JOIN users on archive_StudRec.user_id = users.user_id
    JOIN archive_enroll on archive_StudRec.en_id = archive_enroll.en_id
    JOIN preschool ON archive_StudRec.ps_id = preschool.ps_id
    JOIN adviser on archive_StudRec.adviser_ID = adviser.adviser_ID
    WHERE archive_StudRec.SR_ID = '".$SR_Id."';";

    $sshowRecord_results = mysqli_query($conn, $showRecord);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($sshowRecord_results === false) {
        echo mysqli_error($conn);
    } else {
        $showR = mysqli_fetch_all($sshowRecord_results, MYSQLI_ASSOC);
    }

    // Extract the adviser ID from the Student Record Table
    $sql = "SELECT * FROM archive_studrec WHERE archive_studrec.SR_ID = '".$SR_Id."'";
    $query = mysqli_query($conn, $sql);
    $results = mysqli_fetch_assoc($query);
    $extracted_Adviser_ID = $results['adviser_ID'];

    // Adviser Table
    $showAdviser = "SELECT * from adviser 
    JOIN faculty on faculty.faculty_id = adviser.faculty_id
    WHERE adviser.adviser_ID = '$extracted_Adviser_ID'";

    $AdviserResult = $conn->query($showAdviser);

    // Grades Table
    $showGrade = "SELECT * from archive_grades_per_subject 
    JOIN archive_StudRec on archive_grades_per_subject.SR_ID = archive_StudRec.SR_ID
    JOIN subjects on archive_grades_per_subject.subject_id = subjects.subject_id
    WHERE archive_grades_per_subject.SR_ID = $SR_Id
    ORDER by grades_id;";

    $showGrade_results = mysqli_query($conn, $showGrade);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showGrade_results === false) {
        echo mysqli_error($conn);
    } else {
        $showG = mysqli_fetch_all($showGrade_results, MYSQLI_ASSOC);
    }

    // Attendance Table
    $showAtt = "SELECT * from archive_attendance 
    JOIN adviser on archive_attendance.adviser_ID = adviser.adviser_ID
    JOIN archive_StudRec on archive_attendance.SR_ID = archive_StudRec.SR_ID
    WHERE archive_attendance.SR_ID = '".$SR_Id."'";

    $AttResult = $conn->query($showAtt);


?>

<!DOCTYPE html>
<html>

    <head>
        <title>Archive - Student Grade and Attendance</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <?php if (empty($showR)): ?>
                    <h2 class="head2">No Record Found</h2>

                    <?php else:  ?>
                        <h2 class="header">Archive - Student Detailed Records</h2>
                        <?php endif; ?>
                        <button onclick="window.print()" class="print">Print Student Record</button>
                      
                            <?php foreach ($showR as $Rec): ?>
                                <div>
                                    <p><?=$Rec["stud_fname"] ?> <?=$Rec["stud_lname"] ?></p>
                                    <p> <?=$Rec["school_name"] ?></p>
                                    <p><?=$Rec["grade_level"] ?> - <?=$Rec["section"] ?></p>
                                    <p><?=$Rec["school_year"] ?></p>
                                    <?php while ($AdviserRow = $AdviserResult->fetch_assoc()) : ?>
                                        <p><?php echo $AdviserRow['f_fname']; ?>  <?php echo $AdviserRow['f_lname']; ?></p>
                                    <?php endwhile; ?><br>
                                 </div>
                            <?php endforeach; ?>

              
                        <?php if (empty($showG)): ?>
                        <h2 class="head2">No Record Found for Student Grade</h2>

                        <?php else:  ?>
                            <h2 class="header">Student Grade</h2>
                            

                            <table class="tblBorder">
                                <tr>
                                    <th>Subject</th>
                                    <th>First Grading</th>
                                    <th>Second Grading</th>
                                    <th>Third Grading</th>
                                    <th>Fourth Grading</th>
                                    <th>Finals</th>
                                    <th>Remarks</th>
                                </tr>

                                <?php 
                                    $totalSubjects = count($showG); // Get the total number of subjects
                                    $totalFirstGrading = $totalSecondGrading = $totalThirdGrading = $totalFourthGrading = 0; // Initialize total grades for each grading
                                    foreach ($showG as $grade): 
                                        // Sum up the grades for each grading
                                        $totalFirstGrading += ($grade['f_grading'] ?? 0);
                                        $totalSecondGrading += ($grade['s_grading'] ?? 0);
                                        $totalThirdGrading += ($grade['t_grading'] ?? 0);
                                        $totalFourthGrading += ($grade['fourth_grading'] ?? 0);
                                ?>
                                <tr>
                                    <td><?=$grade['subjects']; ?> </td>
                                    <td><?php echo (empty($grade["f_grading"])) ? " " : $grade["f_grading"]; ?></td>
                                    <td><?php echo (empty($grade["s_grading"])) ? " " : $grade["s_grading"]; ?></td>
                                    <td><?php echo (empty($grade["t_grading"])) ? " " : $grade["t_grading"]; ?></td>
                                    <td><?php echo (empty($grade["fourth_grading"])) ? " " : $grade["fourth_grading"]; ?>
                                    </td>
                                    <td>
                                        <?php
                                            $totalGrades = '';
                                            $remarks = '';

                                            if (!empty($grade["f_grading"]) && !empty($grade["s_grading"]) && !empty($grade["t_grading"]) && !empty($grade["fourth_grading"])) {
                                                $totalGrades = ($grade['f_grading'] + $grade['s_grading'] + $grade['t_grading'] + $grade['fourth_grading']) / 4;
                                                $remarks = ($totalGrades <= 74) ? 'Failed' : 'Passed';
                                            }

                                            echo (empty($totalGrades)) ? 'Incomplete Grades' : $totalGrades;
                                            ?>
                                    </td>
                                    <td><?php echo (empty($remarks)) ? ' ' : $remarks; ?></td>
                                    
                                </tr>
                                <?php endforeach; ?>
                                </tr>
                                <!-- Add a new row for total scores per grading -->
                                <tr>
                                    <td>General Average</td>
                                    <?php
                                        // Initialize total scores per grading
                                        $totalFGrading = 0;
                                        $totalSGrading = 0;
                                        $totalTGrading = 0;
                                        $totalFourthGrading = 0;

                                        // Calculate the total scores per grading
                                        foreach ($showG as $grade) {
                                            $totalFGrading += $grade['f_grading'] ?? 0;
                                            $totalSGrading += $grade['s_grading'] ?? 0;
                                            $totalTGrading += $grade['t_grading'] ?? 0;
                                            $totalFourthGrading += $grade['fourth_grading'] ?? 0;
                                        }
                                    ?>

                                    <td><?= (round($totalFirstGrading / $totalSubjects, 2)); ?></td>
                                    <td><?= (round($totalSecondGrading / $totalSubjects, 2)); ?></td>
                                    <td><?= (round($totalThirdGrading / $totalSubjects, 2)); ?></td>
                                    <td><?= (round($totalFourthGrading / $totalSubjects, 2)); ?></td>
                                    <td><?php

                                        // Calculate overall grade as the average of all gradings
                                        if (!empty($totalFirstGrading) && !empty($totalSecondGrading ) && !empty($totalThirdGrading) && !empty($totalFourthGrading)) {
                                            $overallGrade = ($totalFirstGrading + $totalSecondGrading + $totalThirdGrading + $totalFourthGrading) / (4 * $totalSubjects);
                                        } 
                                        echo (empty($totalGrades)) ? 'Incomplete Grades' : round($overallGrade, 2);
                                        ?>
                                    </td>

                                    <td><?php
                                    // Determine remarks based on overall grade
                                    if (!empty($overallGrade)) {
                                        $remarks = ($overallGrade <= 74) ? 'Failed' : 'Passed';
                                        
                                    } echo (empty($remarks)) ? ' ' : $remarks;
                                    
                                    ?></td>
                                </tr>
                            </table>
                        <?php endif; ?>
                        
                            

                            <br>
                            <?php if (empty($AttResult)): ?>
                            <h2 class="head2">No Record Found for Attendance</h2>

                            <?php else:  ?><h3 class="header">Student Attendance</h3>
                                <table class="tblBorder">
                                    <tr>
                                        <th>Month</th>
                                        <th>Present</th>
                                        <th>Absent</th>
                                        <th>School Days</th>
                                        <!-- Title for the columns -->
                                    </tr>
                                    <?php
                                    $totalPresent = $totalAbsent = $totalSchoolDays = 0; // Initialize total counts
                                    while ($AttRow = $AttResult->fetch_assoc()) :
                                        // Accumulate total counts
                                        $totalPresent += $AttRow['number_of_present'];
                                        $totalAbsent += $AttRow['number_of_absence'];
                                        $totalSchoolDays += $AttRow['number_of_scdays'];
                                    ?>
                                        <tr>
                                            <td><?php echo $AttRow['month_for_attendance']; ?></td>
                                            <td><?php echo $AttRow['number_of_present']; ?></td>
                                            <td><?php echo $AttRow['number_of_absence']; ?></td>
                                            <td><?php echo $AttRow['number_of_scdays']; ?></td>
                                        </tr>
                                    <?php endwhile; ?>
                                    <!-- Row for total counts -->
                                    <tr>
                                        <td><strong>Total</strong></td>
                                        <td><?php echo $totalPresent; ?></td>
                                        <td><?php echo $totalAbsent; ?></td>
                                        <td><?php echo $totalSchoolDays; ?></td>
                                    </tr>
                                </table>
                                
                            <?php endif; ?>

                </div>
            </div>
        </body>
    </div>

</html>