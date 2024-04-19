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

    // Retrieve Information from the Enroll Table
    $showEnroll = "SELECT * FROM enroll 
                    JOIN preschool ON enroll.ps_id = preschool.ps_id
                    JOIN users ON enroll.user_id = users.user_id
                    WHERE enroll.user_id = '$user_id' AND en_status = 'Enrolled'";
    $showEnroll_results = mysqli_query($conn, $showEnroll);

    // If there is a connection error, then echo the description of the error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showEnroll_results === false) {
        echo mysqli_error($conn);
    } else {
        $showE = mysqli_fetch_all($showEnroll_results, MYSQLI_ASSOC);
    }

    // Function to check if grades are complete
    function areGradesComplete($conn, $en_id) {
        // Get the list of unique subjects associated with the en_id
        $subjects_query = "SELECT DISTINCT subject_id FROM grades_per_subject WHERE SR_ID IN (SELECT SR_ID FROM studrec WHERE en_id = '$en_id')";
        $subjects_result = mysqli_query($conn, $subjects_query);
    
        // Count the number of subjects that have grades for the first three gradings or more
        $num_complete_subjects = 0;
        while ($subject_row = mysqli_fetch_assoc($subjects_result)) {
            $subject_id = $subject_row['subject_id'];
            $grades_query = "SELECT COUNT(*) AS num_grades FROM grades_per_subject WHERE SR_ID IN (SELECT SR_ID FROM studrec WHERE en_id = '$en_id') AND subject_id = '$subject_id' AND (f_grading IS NOT NULL AND s_grading IS NOT NULL AND t_grading IS NOT NULL)";
            $grades_result = mysqli_query($conn, $grades_query);
            $grades_row = mysqli_fetch_assoc($grades_result);
            $num_grades = $grades_row['num_grades'];
            if ($num_grades >= 3) {
                $num_complete_subjects++;
            } elseif ($num_grades > 0) {
                // If at least some grades are available, count as complete
                $num_complete_subjects++;
            }
        }
    
        // Count the total number of subjects associated with SR_ID
        $total_subjects_query = "SELECT COUNT(DISTINCT subject_id) AS total_subjects FROM grades_per_subject WHERE SR_ID IN (SELECT SR_ID FROM studrec WHERE en_id = '$en_id')";
        $total_subjects_result = mysqli_query($conn, $total_subjects_query);
        $total_subjects_row = mysqli_fetch_assoc($total_subjects_result);
        $total_subjects = $total_subjects_row['total_subjects'];
    
        return $num_complete_subjects == $total_subjects; // If all subjects have grades for the first three gradings or more, return true
    }
    
    
    

    // Function to get student information by enrollment ID
    function getStudentInfo($conn, $student_id) {
        $sql = "SELECT * FROM enroll 
        JOIN preschool ON enroll.ps_id = preschool.ps_id
        WHERE en_id = '$student_id'";
        $result = mysqli_query($conn, $sql);
        return mysqli_fetch_assoc($result);
    }

    // Check if a student is selected
    if (isset($_POST['student_id'])) {
        $selected_student_id = $_POST['student_id'];
        $selected_student_info = getStudentInfo($conn, $selected_student_id);
        // Generate a new enrollment ID
        $new_enrollment_id = date('Y-m-') . rand(0, 9999) . "-00";

        // Get the current year level and set the next available year level
        $current_year_level = $selected_student_info['year_level'];
        $next_year_level = getNextYearLevel($current_year_level);

        // Set default learner status to "With LRN"
        $default_lrn_status = "With LRN";

        // Set default school year to current year - next year format
        $current_year = date('Y');
        $next_year = $current_year + 1;
        $default_school_year = "$current_year - $next_year";

        $last_grade_level = $selected_student_info['year_level'];
    }


    // Function to get the next available year level based on the current year level
    function getNextYearLevel($current_year_level) {
        if (strpos($current_year_level, 'Kindergarten') !== false) {
            $current_level = (int)substr($current_year_level, -1);
            $next_level = $current_level + 1;
            return "Kindergarten $next_level";
        }
        // Add logic for other year levels if needed
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Enrollment Management</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

<script>
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

        // Trigger change event on page load to ensure correct initial visibility
        yearLevelSelect.dispatchEvent(new Event('change'));
    });
</script>

<body>
    <div class="white-box">
        <div class="main_content">
            <div class="info">
                <h2 class="head2">Re-Enroll a Student</h2>

                <div class="form-group full-width">
                    <label>Select the name of the student</label>
                    <form id="studentForm" method="post">
                        <select name="student_id" onchange="this.form.submit()">
                            <option value="">Select</option>
                            <?php foreach ($showE as $enroll): ?>
                                <?php $en_id = $enroll['en_id']; ?>
                                <option value="<?php echo $en_id; ?>" <?php if (!areGradesComplete($conn, $en_id)) echo 'disabled'; ?>>
                                    <?php echo $enroll['stud_fname'] . ' ' . $enroll['stud_lname']; 
                                    if (!areGradesComplete($conn, $en_id)) echo ' - Incomplete Grades'; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </form>
                </div>

                <?php if (isset($selected_student_info)): ?>
                    <form id="enrollForm" method="post"  action="Parent-ReEn.php">
                        
                            <!-- New Enrollment ID created -->
                            <div class="form-row">
                                <div class="form-group">
                                    <label> Enrollment ID:</label> 
                                    <input type="text" value="<?php echo $new_enrollment_id; ?>" name="enrollID"
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
                                    <label>Student First Name:</label>
                                    <input type="text" name="stud_fname" id="stud_fname" value="<?php echo $selected_student_info['stud_fname']  ?>" readonly>
                                </div>

                                <div class="form-group">
                                    <label>Student Last Name:</label>
                                    <input type="text" name="stud_lname" id="stud_lname" value="<?php echo $selected_student_info['stud_lname']; ?>" readonly>
                                </div>
                            </div>

                           
                            <div class="form-group full-width">
                                <label for="ps_id">Enrolling for Preschool:</label>
                                <!-- Hide the ps_id input field and display the school name -->
                                <input type="hidden" name="ps_id" id="ps_id" value="<?php echo $selected_student_info['ps_id'] ?>">
                                <input type="text" value="<?php echo $selected_student_info['school_name']?>" readonly>
                            </div>


                            <div class="form-row">
                                <div class="form-group">
                                    <label>Year Level:</label>
                                        <select name="year_level" id="year_level_select" require>
                                            <option>Select</option>
                                            <option value="Kindergarten 1" <?php if ($next_year_level === 'Kindergarten 1') echo 'selected'; ?>>Kindergarten 1</option>
                                            <option value="Kindergarten 2" <?php if ($next_year_level === 'Kindergarten 2') echo 'selected'; ?>>Kindergarten 2</option>
                                        </select>
                                </div> 

                                <div class="form-group">
                                    <label>Student's Date of Birth:</label>
                                    <input type="date" name="stud_DOB" value="<?php echo $selected_student_info['stud_DOB']; ?>" required>
                                </div> 
                            </div> 

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="sy">School Year</label>
                                    <input type="text" name="sy" id="sy" value="<?php echo $default_school_year; ?>" required>
                                </div>

                                <div class="form-group">
                                    <label>Learner Status</label>
                                    <select name="lrn_status">
                                        <option value="No LRN">No LRN</option>
                                        <option value="With LRN" selected>With LRN</option>
                                        <option value="Returning/Balik-Aral">Returning/Balik-Aral</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Last Grade Level</label>
                                    <select name="last_gradelevel" required>
                                        <option>Select</option>
                                        <option value="Kindergarten 1" <?php if ($last_grade_level === 'Kindergarten 1') echo 'selected'; ?>>Kindergarten 1</option>
                                        <option value="Kindergarten 2" <?php if ($last_grade_level === 'Kindergarten 2') echo 'selected'; ?>>Kindergarten 2</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="last_sy">Last School Year</label>
                                        <input type="text" name="last_sy" id="last_sy" value="<?php echo $selected_student_info['sy']; ?>"
                                            placeholder="Enter the last school year of the student" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="last_school_name">School Name</label>
                                    <input type="text" name="last_school_name" id="last_school_name" value="<?php echo $selected_student_info['school_name']?>"
                                            placeholder="Enter the name of the last school" required>
                                </div>               
                                    
                                <div class="form-group">
                                    <label>Student's Sex</label>
                                    <input class="input" type="radio" name="stud_sex" value="Female" <?php if ($selected_student_info['stud_sex'] === 'Female') echo 'checked'; ?>>Female
                                    <input class="input" type="radio" name="stud_sex" value="Male" <?php if ($selected_student_info['stud_sex'] === 'Male') echo 'checked'; ?>>Male
                                </div>
                            </div>
                            
                                <div class="form-group full-width">
                                    <label for="e_email">Email Address</label>
                                    <input type="text" name="e_email" id="e_email" value="<?php echo $selected_student_info['e_email']?>" required>
                                </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Belonging to Indigenous People (IP):</label>
                                    <input class="input" type="radio" name="IP" value="Yes" <?php if ($selected_student_info['IP'] === 'Yes') echo 'checked'; ?>>Yes
                                    <input class="input" type="radio" name="IP" value="No" <?php if ($selected_student_info['IP'] === 'No') echo 'checked'; ?>>No
                                </div>

                                <!-- Add the form group for For Learners with Special Education Needs -->
                                <div class="form-group">
                                    <label>For Learners with Special Education Needs:</label>
                                    <input class="input" type="radio" name="SP" value="Yes" <?php if ($selected_student_info['SP'] === 'Yes') echo 'checked'; ?>>Yes
                                    <input class="input" type="radio" name="SP" value="No" <?php if ($selected_student_info['SP'] === 'No') echo 'checked'; ?>>No
                                </div>
                            </div>

                                <div class="form-group full-width">
                                    <label for="stud_address">Address</label>
                                    <input type="text" name="stud_address" id="stud_address" value="<?php echo $selected_student_info['stud_address']?>" required>
                                </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="father_name">Father Name:</label>
                                    <input type="text" name="father_name" id="father_name" placeholder="Enter the father's name" value="<?php echo $selected_student_info['father_name']; ?>">
                                </div>

                                <div class="form-group">
                                    <label for="f_contact">Contact Number:</label>
                                    <input type="text" name="f_contact" id="f_contact" placeholder="Enter the father's contact number" value="<?php echo $selected_student_info['f_contact']; ?>">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label for="mother_name">Mother Name:</label>
                                    <input type="text" name="mother_name" id="mother_name" placeholder="Enter the mother's name" value="<?php echo $selected_student_info['mother_name']; ?>">
                                </div>

                                <div class="form-group">
                                    <label for="m_contact">Contact Number:</label>
                                    <input type="text" name="m_contact" id="m_contact" placeholder="Enter the mother's contact number" value="<?php echo $selected_student_info['m_contact']; ?>">
                                </div>
                            </div>

                            <div class="form-group full-width">
                                <label for="PSA_file">PSA Birth Certificate: </label>
                                <input type="file" name="PSA_file" id="PSA_file">
                                <?php if (!empty($selected_student_info['PSA_file'])): ?>
                                    <p>Current PSA Birth Certificate: <a href="<?php echo $selected_student_info['PSA_file']; ?>" target="_blank"><?php echo basename($selected_student_info['PSA_file']); ?></a></p>
                                <?php endif; ?>
                            </div>

                            <div class="form-group full-width" id="preferred_schedule_k1">
                                    <!-- Preferred schedule options for Kindergarten 1 -->
                                    <label for="details_k1">Preferred Schedule for Kindergarten 1:</label>
                                    <select name="details_k1">
                                    <?php 
                                        
                                        // Get all the list of the adviser that is registered on the preschool
                                        $sql1 = "SELECT * FROM adviser 
                                        JOIN faculty ON adviser.faculty_id = faculty.faculty_id
                                        WHERE faculty.ps_id='".$selected_student_info['ps_id']."' AND grade_level = 'Kindergarten 1';";
                                
                                        $sql1_results = mysqli_query($conn, $sql1);

                                        // If there is an connection error, then echo the description of the  error
                                        // Else, store the results on a variable using mysqli_fetch_all
                                        if ($sql1_results === false) {
                                            echo mysqli_error($conn);
                                        } else {
                                            $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
                                        }
                                        
                                        foreach ($showFL as $faculty) : $f_id = $faculty["adviser_ID"];?>
                                        <option value="<?php echo $f_id; ?>" data-adviser-id="<?php echo $f_id; ?>"><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>

                                <div class="form-group full-width" id="preferred_schedule_k2">
                                    <!-- Preferred schedule options for Kindergarten 2 -->
                                    <label for="details_k2">Preferred Schedule for Kindergarten 2:</label>
                                    <select name="details_k2">
                                    <?php 
                                        
                                        // Get all the list of the adviser that is registered on the preschool
                                        $sql1 = "SELECT * FROM adviser 
                                        JOIN faculty ON adviser.faculty_id = faculty.faculty_id
                                        WHERE faculty.ps_id='".$selected_student_info['ps_id']."' AND grade_level = 'Kindergarten 2';";
                                
                                        $sql1_results = mysqli_query($conn, $sql1);

                                        // If there is an connection error, then echo the description of the  error
                                        // Else, store the results on a variable using mysqli_fetch_all
                                        if ($sql1_results === false) {
                                            echo mysqli_error($conn);
                                        } else {
                                            $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
                                        }
                                        
                                        foreach ($showFL as $faculty) : $f_id = $faculty["adviser_ID"];?>
                                        <option value="<?php echo $f_id; ?>" data-adviser-id="<?php echo $f_id; ?>"><?php echo $faculty["section"]; ?> |
                                                <?php echo $faculty["class_sched"]; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                               

                                <br>
                                    <div>
                                        <label for="terms">
                                            <input class="input" type="checkbox" name="terms" id="terms" value="Agree" required> I hereby
                                            certify that all information given below are true and correct to the
                                            best of my knowledge and I allow the Department of Education to use my child's details to create
                                            and/or update his/her learner profile in the Learner
                                            Information System. The information herein shall be treated as confidential in compliance with the
                                            Data Privacy Act of 2012.*Click OK and continue
                                            filling-out the form if you AGREE; disregard the use of this Form if you DISAGREE.
                                        </label>
                                    </div>
                                                            
                            <br><button type="submit" class="print">Re-Enroll Student</button>
                      
                    </form>
                <?php endif; ?>
            </div>
        </div>
    </div>
</body>

</html>
