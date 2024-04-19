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
    if (isset($_GET['ps_id'])) {

        $ps_id=htmlentities($_GET['ps_id']);

        $GetPSName = "SELECT school_name from preschool 
        where ps_id = '$ps_id' LIMIT 1;";
        $res = mysqli_query($conn, $GetPSName);
        $results = mysqli_fetch_assoc($res);
        $schoolName = $results['school_name'];

        $current_year = date('Y');
        $next_year = $current_year + 1;
        $default_school_year = "$current_year - $next_year";

        $current_year = date('Y');
        $last_year = $current_year - 1;
        $last_school_year = "$last_year - $current_year";
        
        }
    

?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Enrollment Form</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content">
                <div class="info">
                    <h2 class="header">Enrollment Form</h2>

                    <?php 
                        $numbers = range(0, 9999);
                        shuffle($numbers);
                        function UniqueRN($min, $max, $quantity) {
                            $numbers = range($min, $max);
                            shuffle($numbers);
                            return array_slice($numbers, 0, $quantity);
                            
                        } 
                    ?>
                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                    <script type="text/javascript">
                        $(function () {
                            $("#TransferStudent").change(function () {
                                if ($(this).val() == "Y") {
                                    $("#WithoutReportCard").hide();
                                    $("#WithReportCard").show();
                                } else if ($(this).val() == "N") {
                                    $("#WithReportCard").hide();
                                    $("#WithoutReportCard").show();
                                }
                                else {
                                    $("#WithReportCard").hide();
                                    $("#WithoutReportCard").hide();
                                }
                            });
                        });

                        document.addEventListener('DOMContentLoaded', function () {
                            // Select the year level select element
                            var yearLevelSelect = document.getElementById('year_level_select');

                            // Select the preferred schedule options for Kindergarten 1 and Kindergarten 2
                            var preferredScheduleK1 = document.getElementById('preferred_schedule_k1');
                            var preferredScheduleK2 = document.getElementById('preferred_schedule_k2');

                            // Initially hide the preferred schedule options
                            preferredScheduleK1.style.display = 'none';
                            preferredScheduleK2.style.display = 'none';

                            // Add event listener to the year level select element
                            yearLevelSelect.addEventListener('change', function () {
                                // Get the selected value
                                var selectedYearLevel = yearLevelSelect.value;

                                // Show or hide preferred schedule options based on the selected year level
                                if (selectedYearLevel === 'Kindergarten 1') {
                                    preferredScheduleK1.style.display = 'block';
                                    preferredScheduleK2.style.display = 'none';
                                } else if (selectedYearLevel === 'Kindergarten 2') {
                                    preferredScheduleK1.style.display = 'none';
                                    preferredScheduleK2.style.display = 'block';
                                } else {
                                    preferredScheduleK1.style.display = 'none';
                                    preferredScheduleK2.style.display = 'none';
                                }
                            });
                        });

                        document.addEventListener('DOMContentLoaded', function () {
                            // Select the year level select element
                            var yearLevelSelect = document.getElementById('year_level_select_1');

                            // Select the preferred schedule options for Kindergarten 1 and Kindergarten 2
                            var preferredScheduleK1 = document.getElementById('preferred_schedule_k3');
                            var preferredScheduleK2 = document.getElementById('preferred_schedule_k4');

                            // Initially hide the preferred schedule options
                            preferredScheduleK1.style.display = 'none';
                            preferredScheduleK2.style.display = 'none';

                            // Add event listener to the year level select element
                            yearLevelSelect.addEventListener('change', function () {
                                // Get the selected value
                                var selectedYearLevel = yearLevelSelect.value;

                                // Show or hide preferred schedule options based on the selected year level
                                if (selectedYearLevel === 'Kindergarten 1') {
                                    preferredScheduleK1.style.display = 'block';
                                    preferredScheduleK2.style.display = 'none';
                                } else if (selectedYearLevel === 'Kindergarten 2') {
                                    preferredScheduleK1.style.display = 'none';
                                    preferredScheduleK2.style.display = 'block';
                                } else {
                                    preferredScheduleK1.style.display = 'none';
                                    preferredScheduleK2.style.display = 'none';
                                }
                            });
                        });

                        function showLRNInput() {
                            var selectBox = document.getElementById("lrn_status");
                            var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                            var lrnInputContainer = document.getElementById("lrn_input_container");

                            if (selectedValue === "With LRN" || selectedValue === "Returning/Balik-Aral") {
                                lrnInputContainer.style.display = "block";
                            } else {
                                lrnInputContainer.style.display = "none";
                            }
                        }

                        function showSpecifyField() {
                            document.getElementById('specifyField').style.display = 'block';
                        }

                        function hideSpecifyField() {
                            document.getElementById('specifyField').style.display = 'none';
                        }

                        function showSpecifyField1() {
                            document.getElementById('specifyField1').style.display = 'block';
                        }

                        function hideSpecifyField1() {
                            document.getElementById('specifyField1').style.display = 'none';
                        }

                    </script>
                
                    <div class="menu">
                        <span>Are you a transfer student?</span>
                        <select id="TransferStudent">
                            <option value="">Select</option>
                            <option value="N">No</option>
                            <option value="Y">Yes</option>
                        </select>
                    </div>
                    
                    <!-- This is the enrollment form for transfer student -->
                    <div id="WithReportCard" style="display: none"> 
                        <form method="post" enctype="multipart/form-data" class="edit-form" action="Parent-EnForm1.php?ps_id=<?= $ps_id ?>">
                            <h3 class="head2">Transfer Students</h3>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label> Enrollment ID:</label> 
                                        <input type="text" value="<?php echo date('Y-m-') . implode(UniqueRN(0,9999,1))  . "-00"; ?>" name="enrollID"
                                            id="enrollID" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label for="enrollment_date">Enrollment Date</label>
                                        <input type="date" name="enrollment_date" id="enrollment_date" value=<?= $currentDate = date('Y-m-d'); ?>
                                            readonly>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="stud_fname">Student's First Name</label>
                                        <input type="text" name="stud_fname" id="stud_fname" placeholder="First Name"
                                            required>
                                    </div>

                                    <div class="form-group">
                                        <label for="stud_lname">Student's Last Name</label>
                                        <input type="text" name="stud_lname" id="stud_lname" placeholder="Last Name"
                                            required>
                                    </div>
                                </div>

                                <div class="form-group full-width">
                                    <label for="ps_id"> Enrolling for Preschool:</label>
                                    <input type="text" name="ps_id" id="ps_id" value="<?php $ps_id ?>" placeholder="<?php echo $schoolName?>" readonly>
                                </div>   
                                
                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Year Level:</label>
                                        <select name="year_level" id="year_level_select" required>
                                            <option>Select</option>
                                            <option value="Kindergarten 1">Kindergarten 1</option>
                                            <option value="Kindergarten 2">Kindergarten 2</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <?php 
                                            $min = date('Y-m-d', strtotime('-5 years'));
                                            $max = date('Y-m-d', strtotime('-3 years'));
                                        ?>
                                        <label for="stud_DOB">Student's Date of Birth</label>
                                        <input type="date" name="stud_DOB" id="stud_DOB" min=<?= $min ?>  max=<?= $max ?> required>
                                        <div style="color:red; font-size:90%; font-style: italic;"><strong>Note:</strong>Only students from 3 to 5 years old are allowed to enroll.</div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="sy">School Year</label>
                                        <input type="text" name="sy" id="sy" value="<?php echo $default_school_year; ?>" placeholder="Enter the school year" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Learner Status</label>
                                        <select id="lrn_status" name="lrn_status" required onchange="showLRNInput()">
                                            <option value="No LRN">No LRN</option>
                                            <option value="With LRN">With LRN</option>
                                            <option value="Returning/Balik-Aral">Returning/Balik-Aral</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group full-width" id="lrn_input_container" style="display: none;">
                                    <label for="lrn">LRN Number:</label>
                                    <input type="text" id="lrn" name="lrn">
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Last Grade Level</label>
                                        <select name="last_gradelevel" required>
                                            <option>Select</option>
                                            <option value="Kindergarten 1">Kindergarten 1</option>
                                            <option value="Kindergarten 2">Kindergarten 2</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="last_sy">Last School Year</label>
                                        <input type="text" name="last_sy" id="last_sy" value="<?php echo $last_school_year; ?>"
                                            placeholder="Last school year attended" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="last_school_name">School Name</label>
                                        <input type="text" name="last_school_name" id="last_school_name"
                                            placeholder="Name of previous school" required>
                                    </div>               
                                    
                                    <div class="form-group">
                                        <label>Student's Sex</label>
                                        <input class="input" type="radio" name="stud_sex" value="Female" required>Female
                                        <input class="input" type="radio" name="stud_sex" value="Male" required>Male
                                    </div>
                                </div>

                                <div class="form-group full-width">
                                    <?php 
                                        $getEmail = "SELECT email FROM users WHERE user_id = '$user_id' LIMIT 1";
                                        $query = mysqli_query($conn, $getEmail);
                                        $results = mysqli_fetch_assoc($query);
                                        $email = $results['email'];
                                    ?>
                                    <label for="e_email">Email Address</label>
                                    <input type="text" name="e_email" id="e_email" value=<?= $email ?> required>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Belonging to Indigenous People (IP):</label>
                                        <input class="input" type="radio" name="IP" value="Yes" required>Yes
                                        <input class="input" type="radio" name="IP" value="No" required>No
                                    </div>

                                    <div class="form-group">
                                        <label>For Learners with Special Education Needs:</label>
                                        <input class="input" type="radio" name="SP" value="Yes" required onclick="showSpecifyField()">Yes
                                        <input class="input" type="radio" name="SP" value="No" required onclick="hideSpecifyField()">No
                                    </div>
                                </div>

                                <div id="specifyField" style="display:none;" class="form-group full-width">
                                    <label>Please specify:</label>
                                    <input class="input" type="text" name="specify">
                                </div>

                                <div class="form-group full-width">
                                    <label for="stud_address">Student Address</label>
                                    <input type="text" name="stud_address" id="stud_address" placeholder="Complete Address"
                                            required>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="father_name">Father Name:</label>
                                        <input type="text" name="father_name" id="father_name" placeholder="Father's Name">
                                    </div>

                                    <div class="form-group">
                                        <label for="f_contact">Contact Number:</label>
                                        <input type="tel" pattern="[0-9]{11}" maxlength="11" name="f_contact" id="f_contact" placeholder="Contact Number">
                                        <small>Format: 09XX-XXX-XXXX</small>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="mother_name">Mother Name:</label>
                                        <input type="text" name="mother_name" id="mother_name" placeholder="Mother's Name" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="m_contact">Contact Number:</label>
                                        <input type="tel" pattern="[0-9]{11}" maxlength="11" name="m_contact" id="m_contact" placeholder="Contact Number" required>
                                        <small>Format: 09XX-XXX-XXXX</small>
                                    </div>
                                </div>    

                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="PSA_file">PSA Birth Certicate: </label>
                                        <input type="file" name="PSA_file" id="PSA_file" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="prev_RepCard">Report Card from Previous School: </label>
                                        <input type="file" name="prev_RepCard" id="prev_RepCard" required>
                                    </div>
                                </div>

                                <div class="form-group full-width" id="preferred_schedule_k1">
                                    <!-- Preferred schedule options for Kindergarten 1 -->
                                    <label for="details_k1">Preferred Schedule for Kindergarten 1:</label>
                                    <select name="details_k1" required>
                                    <?php 
                                        
                                        // Get all the list of the adviser that is registered on the preschool
                                        $sql1 = "SELECT * FROM adviser 
                                        JOIN faculty ON adviser.faculty_id = faculty.faculty_id
                                        WHERE faculty.ps_id='$ps_id'AND grade_level = 'Kindergarten 1';";
                                
                                        $sql1_results = mysqli_query($conn, $sql1);

                                        // If there is an connection error, then echo the description of the  error
                                        // Else, store the results on a variable using mysqli_fetch_all
                                        if ($sql1_results === false) {
                                            echo mysqli_error($conn);
                                        } else {
                                            $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
                                        }
                                        
                                        foreach ($showFL as $faculty) : 
                                            $f_id = $faculty["adviser_ID"];
                                            $section_capacity = $faculty["max_capacity"];
                                            
                                            // Query to count the number of students enrolled in the current section
                                            $sql2 = "SELECT COUNT(*) AS enrolled_students FROM studrec WHERE adviser_ID = '" . $faculty['adviser_ID'] . "'";
                                            $result = mysqli_query($conn, $sql2);
                                            $row = mysqli_fetch_assoc($result);
                                            $current_students = $row['enrolled_students'];
                                            $remaining_capacity = $section_capacity - $current_students;
                                            
                                            
                                            // Check if there are remaining slots or not
                                            if ($remaining_capacity > 0) { 
                                                // If there are remaining slots, display the option
                                                ?>
                                                <option value="<?php echo $f_id; ?>" data-adviser-id="<?php echo $f_id; ?>"><?php echo $faculty["section"]; ?> |
                                                    <?php echo $faculty["class_sched"]; ?></option>
                                                <?php
                                            } else {
                                                // If there are no remaining slots, display the option as disabled
                                                ?>
                                                <option disabled><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?> (Capacity Full)</option>
                                                <?php
                                            }
                                        endforeach; ?>
                                    </select>
                                </div>

                                <div class="form-group full-width" id="preferred_schedule_k2">
                                    <!-- Preferred schedule options for Kindergarten 2 -->
                                    <label for="details_k2">Preferred Schedule for Kindergarten 2:</label>
                                    <select name="details_k2" required>
                                    <?php 
                                        
                                        // Get all the list of the adviser that is registered on the preschool
                                        $sql1 = "SELECT * FROM adviser 
                                        JOIN faculty ON adviser.faculty_id = faculty.faculty_id
                                        WHERE faculty.ps_id='$ps_id'AND grade_level = 'Kindergarten 2';";
                                
                                        $sql1_results = mysqli_query($conn, $sql1);

                                        // If there is an connection error, then echo the description of the  error
                                        // Else, store the results on a variable using mysqli_fetch_all
                                        if ($sql1_results === false) {
                                            echo mysqli_error($conn);
                                        } else {
                                            $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
                                        }
                                        
                                        foreach ($showFL as $faculty) : 
                                            $f_id = $faculty["adviser_ID"];
                                            $section_capacity = $faculty["max_capacity"];
                                            
                                            // Query to count the number of students enrolled in the current section
                                            $sql2 = "SELECT COUNT(*) AS enrolled_students FROM studrec WHERE adviser_ID = '" . $faculty['adviser_ID'] . "'";
                                            $result = mysqli_query($conn, $sql2);
                                            $row = mysqli_fetch_assoc($result);
                                            $current_students = $row['enrolled_students'];
                                            $remaining_capacity = $section_capacity - $current_students;
                                            
                                            
                                            // Check if there are remaining slots or not
                                            if ($remaining_capacity > 0) { 
                                                // If there are remaining slots, display the option
                                                ?>
                                                <option value="<?php echo $f_id; ?>" data-adviser-id="<?php echo $f_id; ?>"><?php echo $faculty["section"]; ?> |
                                                    <?php echo $faculty["class_sched"]; ?></option>
                                                <?php
                                            } else {
                                                // If there are no remaining slots, display the option as disabled
                                                ?>
                                                <option disabled><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?> (Capacity Full)</option>
                                                <?php
                                            }
                                        endforeach; ?>
                                    </select>
                                </div>
                               

                                <br>
                                    <div>
                                        <label for="terms">
                                            <input class="input" type="checkbox" name="terms" id="terms" value="Agree" required> I hereby
                                            certify that all information given below are true and correct to the
                                            best of my knowledge and I allow the Tiny Tots to use my child's details to create
                                            and/or update his/her learner profile in the Tiny Tots 
                                            Management System. The information herein shall be treated as confidential in compliance with the
                                            Data Privacy Act of 2012.*Click OK and continue
                                            filling-out the form if you AGREE; disregard the use of this Form if you DISAGREE.
                                        </label>
                                    </div>
                                <button class="print">Register</button>
                        </form>
                    </div>
                    
                    <!-- This is the enrollment form for new student -->
                    <div id="WithoutReportCard" style="display: none">
                        <form method="post" enctype="multipart/form-data" class="edit-form" action="Parent-EnForm.php?ps_id=<?= $ps_id ?>">
                            <h3 class="head2">New Students</h3>
                            <div class="form-row">
                                <div class="form-group">
                                    <label> Enrollment ID:</label> 
                                    <input type="text" value="<?php echo date('Y-m-') . implode(UniqueRN(0,9999,1))  . "-00"; ?>" name="enrollID"
                                        id="enrollID" readonly>
                                </div>
                            
                                <div class="form-group">
                                    <label for="enrollment_date">Enrollment Date</label>
                                    <input type="date" name="enrollment_date" id="enrollment_date" value=<?= $currentDate = date('Y-m-d'); ?>
                                        readonly>
                                </div>
                            </div>


                            <div class="form-row">
                                <div class="form-group">
                                    <label for="stud_fname">Student's First Name</label>
                                    <input type="text" name="stud_fname" id="stud_fname" placeholder="First Name"
                                        required>
                                </div>

                                <div class="form-group">
                                    <label for="stud_lname">Student's Last Name</label>
                                    <input type="text" name="stud_lname" id="stud_lname" placeholder="Last Name"
                                        required>
                                </div>
                            </div>

                            <div class="form-group full-width">
                                <label for="ps_id"> Enrolling for Preschool:</label>
                                <input type="text" name="ps_id" id="ps_id" value="<?php $ps_id ?>" placeholder="<?php echo $schoolName?>" readonly>
                            </div>  

                            <div class="form-row">
                                    <div class="form-group">
                                        <label>Year Level:</label>
                                        <select name="year_level" id="year_level_select_1" required>
                                        <option value="" selected disabled>Select</option>
                                            <option value="Kindergarten 1">Kindergarten 1</option>
                                            <option value="Kindergarten 2">Kindergarten 2</option>
                                        </select>
                                    </div>

                                <div class="form-group">
                                    <?php 
                                        $min = date('Y-m-d', strtotime('-5 years'));
                                        $max = date('Y-m-d', strtotime('-3 years'));
                                    ?>
                                    <label for="stud_DOB">Student's Date of Birth</label>
                                    <input type="date" name="stud_DOB" id="stud_DOB" min=<?= $min ?>  max=<?= $max ?> required>
                                    <div style="color:red; font-size:90%; font-style: italic;"><strong>Note:</strong>Only students from 3 to 5 years old are allowed to enroll.</div>

                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="sy">School Year</label>
                                    <input type="text" name="sy" id="sy" value="<?php echo $default_school_year; ?>"placeholder="Enter the school year" required>
                                </div>

                                <div class="form-group">
                                    <label for="lrn_status">Learner Status</label>
                                    <input type="text" name="lrn_status" id="lrn_status" value="No LRN" readonly>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="last_gradelevel">Last Grade Level</label>
                                    <input type="text" name="last_gradelevel" id="last_gradelevel" value="N/A" readonly > 
                                </div>

                                <div class="form-group">
                                    <label for="last_sy">Last School Year</label>
                                    <input type="text" name="last_sy" id="last_sy" value="N/A" readonly >
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="last_school_name">School Name</label>
                                    <input type="text" name="last_school_name" id="last_school_name" value="N/A" readonly >
                                </div>               

                            
                                <div class="form-group">
                                    <label>Student's Sex</label>
                                    <input type="radio" name="stud_sex" value="Female" required>Female
                                    <input type="radio" name="stud_sex" value="Male" required>Male
                                </div>                            
                            </div>

                            <div class="form-group full-width">
                                <?php 
                                    $getEmail = "SELECT email FROM users WHERE user_id = '$user_id' LIMIT 1";
                                    $query = mysqli_query($conn, $getEmail);
                                    $results = mysqli_fetch_assoc($query);
                                    $email = $results['email'];
                                ?>
                                <label for="e_email">Email Address</label>
                                <input type="text" name="e_email" id="e_email" value=<?= $email ?> required>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Belonging to Indigenous People (IP):</label>
                                    <input class="input" type="radio" name="IP" value="Yes" required>Yes
                                    <input class="input" type="radio" name="IP" value="No" required>No
                                </div>

                                <div class="form-group">
                                    <label>For Learners with Special Education Needs:</label>
                                    <input class="input" type="radio" name="SP" value="Yes" required onclick="showSpecifyField1()">Yes
                                    <input class="input" type="radio" name="SP" value="No" required onclick="hideSpecifyField1()">No
                                </div>
                            </div>

                            <div id="specifyField1" style="display:none;" class="form-group full-width">
                                <label>Please specify:</label>
                                <input class="input" type="text" name="specify">
                            </div>

                            <div class="form-group full-width">
                                <label for="stud_address">Student Address</label>
                                <input type="text" name="stud_address" id="stud_address" placeholder="Complete Address"
                                    required>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="father_name">Father Name:</label>
                                    <input type="text" name="father_name" id="father_name" placeholder="Father's Name">
                                </div>

                                <div class="form-group">
                                    <label for="f_contact">Contact Number:</label>
                                    <input type="tel" pattern="[0-9]{11}" maxlength="11" name="f_contact" id="f_contact" placeholder="Contact Number">
                                    <small>Format: 09XX-XXX-XXXX</small>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="mother_name">Mother Name:</label>
                                    <input type="text" name="mother_name" id="mother_name" placeholder="Mother's Name" required>
                                </div>

                                <div class="form-group">
                                    <label for="m_contact">Contact Number:</label>
                                    <input type="tel" pattern="[0-9]{11}" maxlength="11"name="m_contact" id="m_contact" placeholder="Contact Number" required>
                                    <small>Format: 09XX-XXX-XXXX</small>
                                </div>
                            </div>

                            
                            <div class="form-group full-width">
                                <label for="PSA_file">PSA Birth Certicate: </label>
                                <input type="file" name="PSA_file" id="PSA_file" required>
                            </div>

                            <div class="form-group full-width" id="preferred_schedule_k3">
                                    <!-- Preferred schedule options for Kindergarten 1 -->
                                    <label for="details_k1">Preferred Schedule for Kindergarten 1:</label>
                                    <select name="details_k1" required>
                                    <?php 
                                        
                                        // Get all the list of the adviser that is registered on the preschool
                                        $sql1 = "SELECT * FROM adviser 
                                        JOIN faculty ON adviser.faculty_id = faculty.faculty_id
                                        WHERE faculty.ps_id='$ps_id'AND grade_level = 'Kindergarten 1';";
                                
                                        $sql1_results = mysqli_query($conn, $sql1);

                                        // If there is an connection error, then echo the description of the  error
                                        // Else, store the results on a variable using mysqli_fetch_all
                                        if ($sql1_results === false) {
                                            echo mysqli_error($conn);
                                        } else {
                                            $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
                                        }

                                        foreach ($showFL as $faculty) : 
                                            $f_id = $faculty["adviser_ID"];
                                            $section_capacity = $faculty["max_capacity"];
                                            
                                            // Query to count the number of students enrolled in the current section
                                            $sql2 = "SELECT COUNT(*) AS enrolled_students FROM studrec WHERE adviser_ID = '" . $faculty['adviser_ID'] . "'";
                                            $result = mysqli_query($conn, $sql2);
                                            $row = mysqli_fetch_assoc($result);
                                            $current_students = $row['enrolled_students'];
                                            $remaining_capacity = $section_capacity - $current_students;
                                            
                                            
                                            // Check if there are remaining slots or not
                                            if ($remaining_capacity > 0) { 
                                                // If there are remaining slots, display the option
                                                ?>
                                                <option value="<?php echo $f_id; ?>" data-adviser-id="<?php echo $f_id; ?>"><?php echo $faculty["section"]; ?> |
                                                    <?php echo $faculty["class_sched"]; ?></option>
                                                <?php
                                            } else {
                                                // If there are no remaining slots, display the option as disabled
                                                ?>
                                                <option disabled><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?> (Capacity Full)</option>
                                                <?php
                                            }
                                        endforeach; ?>
                                    </select>
                            </div>

                            <div class="form-group full-width" id="preferred_schedule_k4">
                                <!-- Preferred schedule options for Kindergarten 2 -->
                                <label for="details_k2">Preferred Schedule for Kindergarten 2:</label>
                                <select name="details_k2" required>
                                <?php 
                                    // Get all the list of the adviser that is registered on the preschool
                                    $sql1 = "SELECT * FROM adviser 
                                    JOIN faculty ON adviser.faculty_id = faculty.faculty_id
                                    WHERE faculty.ps_id='$ps_id' AND grade_level = 'Kindergarten 2';";

                                    $sql1_results = mysqli_query($conn, $sql1);

                                    // If there is a connection error, echo the description of the error
                                    // Else, store the results on a variable using mysqli_fetch_all
                                    if ($sql1_results === false) {
                                        echo mysqli_error($conn);
                                    } else {
                                        $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
                                    }
                                    
                                    foreach ($showFL as $faculty) : 
                                        $f_id = $faculty["adviser_ID"];
                                        $section_capacity = $faculty["max_capacity"];
                                        
                                        // Query to count the number of students enrolled in the current section
                                        $sql2 = "SELECT COUNT(*) AS enrolled_students FROM studrec WHERE adviser_ID = '" . $faculty['adviser_ID'] . "'";
                                        $result = mysqli_query($conn, $sql2);
                                        $row = mysqli_fetch_assoc($result);
                                        $current_students = $row['enrolled_students'];
                                        $remaining_capacity = $section_capacity - $current_students;
                                        
                                        
                                        // Check if there are remaining slots or not
                                        if ($remaining_capacity > 0) { 
                                            // If there are remaining slots, display the option
                                            ?>
                                            <option value="<?php echo $f_id; ?>" data-adviser-id="<?php echo $f_id; ?>"><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?></option>
                                            <?php
                                        } else {
                                            // If there are no remaining slots, display the option as disabled
                                            ?>
                                            <option disabled><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?> (Capacity Full)</option>
                                            <?php
                                        }
                                    endforeach; ?>
                                </select>
                            </div>


                            <br>
                            <div>
                                <label for="terms">
                                    <input class="input" type="checkbox" name="terms" id="terms" value="Agree" required> I hereby
                                            certify that all information given below are true and correct to the
                                            best of my knowledge and I allow the Tiny Tots to use my child's details to create
                                            and/or update his/her learner profile in the Tiny Tots 
                                            Management System. The information herein shall be treated as confidential in compliance with the
                                            Data Privacy Act of 2012.*Click OK and continue
                                            filling-out the form if you AGREE; disregard the use of this Form if you DISAGREE.
                                </label>
                            </div>
                            <button class="print">Register</button>
                            </form>
                    </div>
                </div>
            </div>
        </body>
    </div>

</html>

