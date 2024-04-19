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

                if ($_SERVER["REQUEST_METHOD"] == "POST") {

                    $stud_DOB = $_POST['stud_DOB'];
                    $glevel = $_POST['year_level'];
                    $detailsK1 = $_POST['details_k1'];
                    $detailsK2 = $_POST['details_k2'];

                    $img_name = $_FILES['PSA_file']['name'];
                    $img_size = $_FILES['PSA_file']['size'];
                    $tmp_name = $_FILES['PSA_file']['tmp_name'];
                    $error = $_FILES['PSA_file']['error'];

                    $img_name1 = $_FILES['prev_RepCard']['name'];
                    $img_size1 = $_FILES['prev_RepCard']['size'];
                    $tmp_name1 = $_FILES['prev_RepCard']['tmp_name'];
                    $error1 = $_FILES['prev_RepCard']['error'];

                    if ($error === 0) {
                        if ($img_size > 5000000) {
                            $em = "Sorry, your file is too large.";
                            header("Location: Parent-Enroll.php?error=$em");
                        }else {
                            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
                            $img_ex_lc = strtolower($img_ex);

                            $allowed_exs = array("jpg", "jpeg", "png", "pdf", "docx"); 

                            if (in_array($img_ex_lc, $allowed_exs)) {
                                $new_img_name = uniqid("IMG-", true).'.'.$img_ex_lc;
                                $img_upload_path = '../uploaded-image/'.$new_img_name;
                                move_uploaded_file($tmp_name, $img_upload_path);

                                if ($error1 === 0) {
                                    if ($img_size1 > 5000000) {
                                        $em = "Sorry, your file is too large.";
                                        header("Location: Parent-Enroll.php?error=$em");
                                    }else {
                                        $img_ex1 = pathinfo($img_name1, PATHINFO_EXTENSION);
                                        $img_ex_lc1 = strtolower($img_ex1);
                            
                                        $allowed_exs1 = array("jpg", "jpeg", "png", "pdf"); 
                            
                                        if (in_array($img_ex_lc1, $allowed_exs1)) {
                                            $new_img_name1 = uniqid("IMG-", true).'.'.$img_ex_lc1;
                                            $img_upload_path1 = '   '.$new_img_name1;
                                            move_uploaded_file($tmp_name1, $img_upload_path1);
                                
                                $dateOfBirth = $stud_DOB;
                                $today = date("Y-m-d");
                                $diff = date_diff(date_create($dateOfBirth), date_create($today));
                                $age = $diff->format('%y');
                                $stud_age = $age;
                                $en_status = "Pending for Payment";

                                $glevel = $_POST['year_level'];

                                $checkFee = "SELECT fee_totalcost FROM fees_ps 
                                    JOIN preschool on fees_ps.ps_id = preschool.ps_id
                                    WHERE fees_ps.ps_id = '$ps_id' AND fee_glevel = '$glevel' LIMIT 1";
                                    $query = mysqli_query($conn, $checkFee);
                                    $results = mysqli_fetch_assoc($query);
                                    $feeVal = $results['fee_totalcost'];

                                // Depending on the selected year level, insert the corresponding details
                                if ($glevel === 'Kindergarten 1') {
                                    $selectedDetails = $detailsK1;
                                } elseif ($glevel === 'Kindergarten 2') {
                                    $selectedDetails = $detailsK2;
                                } else {
                                    // Handle invalid year level selection
                                    // You may display an error message or take appropriate action
                                    exit("Invalid year level selection.");
                                }

                                if (isset($_POST['lrn']) && !empty($_POST['lrn'])) {
                                    $lrn_number = $_POST['lrn'];
                                } else {
                                    $lrn_number = null; // defaulty
                                }

                                if (isset($_POST['specify']) && !empty($_POST['specify'])) {
                                    $specify = $_POST['specify'];
                                } else {
                                    $specify = null; // defaulty
                                }

                                $sql = "INSERT INTO enroll (enrollID, stud_fname, stud_lname, ps_id, year_level, stud_DOB, sy, lrn_status, last_gradelevel, last_sy, last_school_name, stud_age, stud_sex, e_email, 
                                IP, SP, stud_address, father_name, f_contact, mother_name, m_contact, enrollment_date, PSA_file, prev_RepCard, user_id, details, en_status, fees, balance, lrn, specify)
                                        VALUES ( '". $_POST['enrollID'] . "',
                                                '". $_POST['stud_fname'] . "',
                                                '". $_POST['stud_lname'] . "',
                                                '$ps_id',
                                                '". $_POST['year_level'] . "',
                                                '". $_POST['stud_DOB'] . "',
                                                '". $_POST['sy'] . "',
                                                '". $_POST['lrn_status'] . "',
                                                '". $_POST['last_gradelevel'] . "',
                                                '". $_POST['last_sy'] . "',
                                                '". $_POST['last_school_name'] . "',
                                                '$stud_age',
                                                '". $_POST['stud_sex'] . "',
                                                '". $_POST['e_email'] . "',
                                                '". $_POST['IP'] . "',
                                                '". $_POST['SP'] . "',
                                                '". $_POST['stud_address'] . "',
                                                '". $_POST['father_name'] . "',
                                                '". $_POST['f_contact'] . "',
                                                '". $_POST['mother_name'] . "',
                                                '". $_POST['m_contact'] . "',
                                                '". $_POST['enrollment_date'] . "',
                                                '$new_img_name',
                                                '$new_img_name1',
                                                '$user_id',
                                                CASE 
                                                    WHEN '$glevel' = 'Kindergarten 1' THEN '$detailsK1' 
                                                    WHEN '$glevel' = 'Kindergarten 2' THEN '$detailsK2'  
                                                END,
                                                '$en_status', '$feeVal', '$feeVal', '$lrn_number', '$specify')";
                                    $res = mysqli_query($conn, $sql);         
                                    if ($res){
                                        $checkFee = "SELECT en_id FROM enroll 
                                        JOIN users on enroll.user_id = users.user_id
                                        JOIN preschool on enroll.ps_id = preschool.ps_id
                                        WHERE enroll.ps_id = '$ps_id'
                                        AND enroll.user_id ='$user_id'
                                        ORDER BY enroll.created_at desc
                                        LIMIT 1";
                                        $query = mysqli_query($conn, $checkFee);
                                        $results = mysqli_fetch_assoc($query);
                                        $e_id = $results['en_id'];
                                        sleep(3);
                                        echo "<script>window.location.href='Parent-PayEnroll.php?en_id=$e_id&ps_id=$ps_id';</script>";
                                    }              
                                   
                                    
                            }else {
                                $em = "You can't upload files of this type";
                                header("Location: Parent-Enroll.php");
                                die();
    }}}}}}}}
            ?>