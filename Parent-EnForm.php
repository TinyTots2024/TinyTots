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
                $stud_fname = $_POST['stud_fname'];
                $stud_lname = $_POST['stud_lname'];
                $glevel = $_POST['year_level'];
                $detailsK1 = $_POST['details_k1'];
                $detailsK2 = $_POST['details_k2'];

                $sql_u = "SELECT * FROM enroll WHERE stud_fname='$stud_fname' 
                    AND stud_lname='$stud_lname' AND year_level='$glevel' 
                    AND user_id = '$user_id';";
                    $res_u = mysqli_query($conn, $sql_u);

                    if (mysqli_num_rows($res_u) > 0) { 
                        echo "<script>alert('The enrollment form for " . $stud_fname ." " . $stud_lname . " for the grade "
                        . $glevel ." already exists. Redirecting...')</script>";

                        sleep(5);
                        echo "<script>window.location.href='Parent-EnrollForm.php?ps_id=$ps_id';</script>";
                    } else {
                        
                        $img_name = $_FILES['PSA_file']['name'];
                        $img_size = $_FILES['PSA_file']['size'];
                        $tmp_name = $_FILES['PSA_file']['tmp_name'];
                        $error = $_FILES['PSA_file']['error'];

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

        
                                    $dateOfBirth = $stud_DOB;
                                    $today = date("Y-m-d");
                                    $diff = date_diff(date_create($dateOfBirth), date_create($today));
                                    $age = $diff->format('%y');
                                    $stud_age = $age;

                                    if (isset($_POST['specify']) && !empty($_POST['specify'])) {
                                        $specify = $_POST['specify'];
                                    } else {
                                        $specify = null; // defaulty
                                    }
    

                                    $en_status = "Pending for Payment";
                                    

                                        $checkFee = "SELECT fee_totalcost FROM fees_ps 
                                            JOIN preschool on fees_ps.ps_id = preschool.ps_id
                                            WHERE fees_ps.ps_id = '$ps_id' AND fee_glevel = '$glevel' LIMIT 1";
                                            $query = mysqli_query($conn, $checkFee);
                                            $results = mysqli_fetch_assoc($query);
                                            $feeVal = $results['fee_totalcost'];

                                            $enrollID = $_POST['enrollID'];  
                                                                          

                                    $sql = "INSERT INTO enroll (enrollID, stud_fname, stud_lname, ps_id, year_level, stud_DOB, sy, lrn_status, last_gradelevel, last_sy, last_school_name, stud_age, stud_sex, e_email, 
                                    IP, SP, stud_address, father_name, f_contact, mother_name, m_contact, enrollment_date, PSA_file, user_id, details, en_status, fees, balance, specify)
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
                                                    '$user_id',
                                                    CASE 
                                                        WHEN '$glevel' = 'Kindergarten 1' THEN '$detailsK1' 
                                                        WHEN '$glevel' = 'Kindergarten 2' THEN '$detailsK2'  
                                                    END,
                                                    '$en_status', '$feeVal', '$feeVal', '$specify')";
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
                                            echo "<script>window.location.href='Parent-PayEnroll.php?en_id=$e_id&ps_id=$ps_id';</script>";
                                        }              
                                    
                                }else {
                                    $em = "You can't upload files of this type";
                                    header("Location: Parent-Enroll.php");
                                    die();
                                }
                            }
                        }
                    }
            } else{
                echo "There is an error.";
            }
    }
?>