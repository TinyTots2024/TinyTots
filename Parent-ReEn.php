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


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ps_id = $_POST['ps_id'];
    $stud_DOB = $_POST['stud_DOB'];
    $stud_fname = $_POST['stud_fname'];
    $stud_lname = $_POST['stud_lname'];
    $glevel = $_POST['year_level'];
    $detailsK1 = $_POST['details_k1'];
    $detailsK2 = $_POST['details_k2'];

    // Check if PSA_file is set in the POST data
    $PSA_file = isset($_FILES['PSA_file']) ? $_FILES['PSA_file'] : null;
    if ($PSA_file && $PSA_file['error'] === UPLOAD_ERR_OK) {
        $img_name = $PSA_file['name'];
        $img_size = $PSA_file['size'];
        $tmp_name = $PSA_file['tmp_name'];
        $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
        $img_ex_lc = strtolower($img_ex);
        $allowed_exs = array("jpg", "jpeg", "png", "pdf"); 

        if (in_array($img_ex_lc, $allowed_exs)) {
            $new_img_name = uniqid("IMG-", true).'.'.$img_ex_lc;
            $img_upload_path = '../uploaded-image/'.$new_img_name;
            move_uploaded_file($tmp_name, $img_upload_path);
        } else {
            $em = "You can't upload files of this type";
            header("Location: Parent-Enroll.php?error=$em");
            die();
        }
    } else {
        // If no new file is uploaded, set $new_img_name to null
        $new_img_name = null;
    }

    // Check if $ps_id exists in the preschool table
    $checkPsIdQuery = "SELECT ps_id FROM preschool WHERE ps_id = ?";
    $stmt = mysqli_prepare($conn, $checkPsIdQuery);
    mysqli_stmt_bind_param($stmt, "i", $ps_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if(mysqli_num_rows($result) == 0) {
        echo "Invalid ps_id";
        exit; // or handle the error accordingly
    }

     // Insert data into the database
     $dateOfBirth = $stud_DOB;
     $today = date("Y-m-d");
     $diff = date_diff(date_create($dateOfBirth), date_create($today));
     $age = $diff->format('%y');
     $stud_age = $age;
     $en_status = "Pending for Payment";
 
     $checkFee = "SELECT fee_totalcost FROM fees_ps 
                  JOIN preschool on fees_ps.ps_id = preschool.ps_id
                  WHERE fees_ps.ps_id = ? AND fee_glevel = ? LIMIT 1";
     $stmt = mysqli_prepare($conn, $checkFee);
     mysqli_stmt_bind_param($stmt, "is", $ps_id, $glevel);
     mysqli_stmt_execute($stmt);
     $result = mysqli_stmt_get_result($stmt);
     $results = mysqli_fetch_assoc($result);
     $feeVal = $results['fee_totalcost'];
 
     $enrollID = $_POST['enrollID'];                                    
 
     $sql = "INSERT INTO enroll (enrollID, stud_fname, stud_lname, ps_id, year_level, stud_DOB, sy, lrn_status, last_gradelevel, last_sy, last_school_name, stud_age, stud_sex, e_email, 
     IP, SP, stud_address, father_name, f_contact, mother_name, m_contact, enrollment_date, PSA_file, user_id, details, en_status, fees, balance)
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
                 ?,  -- Use placeholder for PSA_file
                 '$user_id',
                 CASE 
                     WHEN '$glevel' = 'Kindergarten 1' THEN '$detailsK1' 
                     WHEN '$glevel' = 'Kindergarten 2' THEN '$detailsK2'  
                 END,
                 '$en_status', '$feeVal', '$feeVal')";

        // Prepare the SQL statement
        $stmt = mysqli_prepare($conn, $sql);
        // Bind the PSA_file parameter
        mysqli_stmt_bind_param($stmt, "s", $new_img_name);
        // Execute the statement
        $res = mysqli_stmt_execute($stmt);
 
     if ($res){
         $checkFee = "SELECT en_id FROM enroll 
         JOIN users on enroll.user_id = users.user_id
         JOIN preschool on enroll.ps_id = preschool.ps_id
         WHERE enroll.ps_id = ?
         AND enroll.user_id =?
         ORDER BY enroll.created_at desc
         LIMIT 1";
         $stmt = mysqli_prepare($conn, $checkFee);
         mysqli_stmt_bind_param($stmt, "ii", $ps_id, $user_id);
         mysqli_stmt_execute($stmt);
         $result = mysqli_stmt_get_result($stmt);
         $results = mysqli_fetch_assoc($result);
         $e_id = $results['en_id'];
         echo "<script>window.location.href='Parent-PayEnroll.php?en_id=$e_id&ps_id=$ps_id';</script>";
     } else {
         $em = "You can't upload files of this type";
         header("Location: Parent-Enroll.php");
         die();
     }

} else {
    echo "There is an error.";
}
?>
