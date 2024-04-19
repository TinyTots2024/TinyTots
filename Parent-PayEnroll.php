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

    
    if (isset($_GET['ps_id'])) {
        $ps_id=htmlentities($_GET['ps_id']);
    }

    // Retrieve enrollment records
    $en_dataQuery = "SELECT * FROM enroll 
    JOIN preschool ON enroll.ps_id = preschool.ps_id
    JOIN users ON enroll.user_id = users.user_id
    WHERE en_id = '$en_id' LIMIT 1";
    $en_dataResult = $conn->query($en_dataQuery);

    while ($EDRow = $en_dataResult->fetch_assoc()) { 
                        
        if ($EDRow['fees'] == '0'){
            echo $EDRow['school_name'] . " " . "offers a free school program.";
            echo "<br>Please wait for the school admin to confirm the enrollment.";
            echo "<br>System has processed the receipt.";
            $psid=$EDRow['ps_id'];

                $deadlineVal = date('Y-m-d', strtotime('+30 days'));

                $changeStat = "UPDATE enroll SET balance = 0, en_status = 'Pending with Admin'
                WHERE en_id = $en_id LIMIT 1;";
                mysqli_query($conn, $changeStat);   

                $addReceipt = "INSERT INTO payment (ps_id, user_id, en_id, FOP, p_mode, payment_for, payment_status, amount_paid, deadline, payment_date)
                VALUES ('$psid', '$user_id', '$en_id', 'System Generated', 'Full Payment', 'Tuition', 'Paid', '0', '$$deadlineVal', now());";
                mysqli_query($conn, $addReceipt);  

                echo "<br>Redirecting...";
                sleep(5);
                echo "<script>window.location.href='Parent-CheckNewEnroll.php?ps_id=$psid';</script>";
            
        } else {  

                if ($_SERVER["REQUEST_METHOD"] == "POST") {

                        $f_name=$EDRow['stud_fname'];
                        $l_name=$EDRow['stud_lname'];
                        $ps_id=$EDRow['ps_id'];
                        $deadlineVal = date('Y-m-d', strtotime('+30 days'));  

                        $originalTotal = $EDRow['fees'];
                        $discountedTotal = isset($_POST['discountedTotal']) ? $_POST['discountedTotal'] : null;
                        
                        // Check if discountedTotal is not null or empty
                        if ($discountedTotal !== null && $discountedTotal !== '') {
                            // Update enroll table with the discounted total
                            $updateQuery = "UPDATE enroll SET fees = $discountedTotal, balance = $discountedTotal WHERE en_id = $en_id";
                            mysqli_query($conn, $updateQuery);
                        }


                        // Process the file upload if a file is selected
                        if (isset($_FILES['p_proof']) && !empty($_FILES['p_proof']['name'])) {
                            $img_name = $_FILES['p_proof']['name'];
                            $img_size = $_FILES['p_proof']['size'];
                            $tmp_name = $_FILES['p_proof']['tmp_name'];
                            $error = $_FILES['p_proof']['error'];

                            // Check for file upload errors
                            if ($error === 0) {
                                if ($img_size > 5000000) { // Check file size
                                    $em = "Sorry, your file is too large.";
                                    header("Location: Parent-Fees.php?error=$em");
                                    exit(); // Terminate script execution after redirection
                                } else {
                                    $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
                                    $img_ex_lc = strtolower($img_ex);
                                    $allowed_exs = array("jpg", "jpeg", "png", "pdf");

                                    // Check if the file extension is allowed
                                    if (in_array($img_ex_lc, $allowed_exs)) {
                                        $new_img_name = uniqid("IMG-PSA-", true) . '.' . $img_ex_lc;
                                        $img_upload_path = '../uploaded-image/' . $new_img_name;

                                        // Move the uploaded file to the destination directory
                                        if (move_uploaded_file($tmp_name, $img_upload_path)) {
                                            // File uploaded successfully
                                        } else {
                                            echo "Failed to move uploaded file.";
                                        }
                                    } else {
                                        echo "Invalid file extension.";
                                    }
                                }
                            } else {
                                echo "File upload error: $error";
                            }
                        } else {
                            $new_img_name = null; // No file selected
                        }

                        $remarks = isset($_POST['remarks']) ? $_POST['remarks'] : null; // Check if remarks is providedx
                        
                        $sql = "INSERT INTO payment (ps_id, user_id, en_id, FOP, p_mode, payment_for, payment_status, 
                                amount_paid, deadline, p_proof, payment_date, remarks)
                                VALUES ('$ps_id',
                                    '$user_id', '$en_id',
                                    '". $_POST['FOP'] . "',
                                    '". $_POST['p_mode'] . "',
                                    'Down payment/Enrollment Fee',
                                    'Pending',
                                    '". $_POST['amount_paid'] . "',
                                    '$deadlineVal', '$new_img_name', now(), '$remarks')";
                                mysqli_query($conn, $sql);

                        $paid = $_POST['amount_paid']; 
                        $balValue = $EDRow['fees'] - $paid;
                                            
                            if (($_POST['p_mode'])  == "Monthly"){

                                $distriAmount = round($balValue / 9);
                                $n = 0;
                                $deadlineVal1 = date('Y-m-d', strtotime('+60 days'));
                                                
                                while ($n != 9){
                                                    
                                    $addFeeForms = "INSERT INTO payment (ps_id, user_id, en_id, p_mode, payment_for, payment_status, due_amount, deadline)
                                                    VALUES ('$ps_id',
                                                    '$user_id', '$en_id',
                                                    'Monthly', 'Tuition', 'Unpaid', '$distriAmount', '$deadlineVal1');";
                                    mysqli_query($conn, $addFeeForms);  
                                    
                                    $n +=1;
                                    $deadlineVal1 = date ("Y-m-d", strtotime("+30 days", strtotime($deadlineVal1)));
                                }
                                echo "<script>window.location.href='Parent-CheckNewEnroll.php?ps_id=$ps_id';</script>";

                            } else if (($_POST['p_mode'])  == "Partial Payment"){

                                $distriAmount = round($balValue / 2);
                                $n = 0;
                                $deadlineVal1 = date('Y-m-d', strtotime('+150 days'));

                                while ($n != 2){

                                    $addFeeForms = "INSERT INTO payment (ps_id, user_id, en_id, p_mode, payment_for, payment_status, due_amount, deadline)
                                                    VALUES ('$ps_id',
                                                    '$user_id', '$en_id',
                                                    'Partial Payment', 'Tuition', 'Unpaid', '$distriAmount', '$deadlineVal1');";
                                    mysqli_query($conn, $addFeeForms);  
                                                    
                                    $n +=1;
                                    $deadlineVal1 = date ("Y-m-d", strtotime("+120 days", strtotime($deadlineVal1)));
                                                        
                                }                                                    
                                echo "<script>window.location.href='Parent-CheckNewEnroll.php?ps_id=$ps_id';</script>";

                            } else if (($_POST['p_mode'])  == "Quarterly"){

                                $distriAmount = round($balValue / 4);
                                $n = 0;
                                $deadlineVal1 = date('Y-m-d', strtotime('+120 days'));

                                while ($n != 4){

                                    $addFeeForms = "INSERT INTO payment (ps_id, user_id, en_id, p_mode, payment_for, payment_status, due_amount, deadline)
                                                    VALUES ('$ps_id',
                                                    '$user_id', '$en_id',
                                                    'Quarterly', 'Tuition', 'Unpaid', '$distriAmount', '$deadlineVal1');";
                                    mysqli_query($conn, $addFeeForms);  
                                                    
                                    $n +=1;
                                    $deadlineVal1 = date ("Y-m-d", strtotime("+90 days", strtotime($deadlineVal1)));
                                                        
                                }                                                    
                                echo "<script>window.location.href='Parent-CheckNewEnroll.php?ps_id=$ps_id';</script>";

                            } 
                            
                            else {

                                echo "<script>window.location.href='Parent-CheckNewEnroll.php?ps_id=$ps_id';</script>";

                            }
                                        }
                                



?>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Form</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
    <body>
        <div class="main_content">
            <div class="info">
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                    <script type="text/javascript">
                          $(function () {
                            $("#TransactNo").change(function () {
                                if ($(this).val() == "EPayment") {
                                    $("#WithTransactPh").show();
                                } else {
                                    $("#WithTransactPh").hide();
                                }
                            });

                            // Call the calculateDiscountedTotal() function whenever p_mode or discount change
                            $("#p_mode, #discount").change(function () {
                                calculateDiscountedTotal();
                            });

                            function calculateDiscountedTotal() {
                                var selectedDiscount = parseFloat(document.getElementById("discount").value);
                                var originalTotal = <?php echo $EDRow['fees']; ?>; // PHP variable passed to JavaScript

                                var discountedTotal = originalTotal * (1 - (selectedDiscount / 100));

                                // If Full Payment is selected, reduce the discounted total by an additional 5 percent
                                if (document.getElementById("p_mode").value === "Full Payment") {
                                    discountedTotal *= 0.95; // Apply additional 5 percent reduction
                                }

                                // Update the input field with the calculated discounted total
                                document.getElementById("discountedTotal").value = discountedTotal.toFixed(2);
                            }
                        });
                    </script>               
        
                    <h2 class="head2">New Payment Form</h2>

                    <div class="form-row">      
                        <div class="form-group">Student Details<br>
                        
                        <?php 
                            $s_f_name = $EDRow['stud_fname'];
                            $s_l_name = $EDRow['stud_lname'];
                            $s_enID_name = $EDRow['enrollID']; 
                            $s_record = $s_enID_name ." | ". $s_l_name .", ". $s_f_name; 
                            echo "Student: " . $s_record;
                            echo "</br>";
                            echo "Preschool: " . $EDRow['school_name'];
                            echo "</br>";
                            echo "Grade Level: " .$EDRow['year_level'];
                        ?>
                        </div>
                        <div class="form-group">Payment Summary<br>
                            <table class="tblBorder">

                            <tr>
                                <th>Fee Description</th>
                                <th>Amount</th>
                            </tr>

                            <tr>
                                <?php 
                                    // Retrieve fee breakdown records
                                    $bdfees_dataQuery = "SELECT * FROM bd_fees_ps 
                                    JOIN preschool ON bd_fees_ps.ps_id = preschool.ps_id
                                    WHERE bd_fees_ps.ps_id = '$ps_id' and bd_fees_ps.bdf_glevel = '".$EDRow['year_level']."'";
                                    $bdfees_dataResult = mysqli_query($conn, $bdfees_dataQuery);

                                    $query = "SELECT * FROM bd_fees_ps 
                                    JOIN preschool ON bd_fees_ps.ps_id = preschool.ps_id
                                    WHERE bd_fees_ps.ps_id = '$ps_id' and bd_fees_ps.bdf_glevel = '".$EDRow['year_level']."' AND fee_desc = 'Registration Fee'";
                                    $queryResult = mysqli_query($conn, $query);
                                    $results = mysqli_fetch_assoc($queryResult);
                                    $registration_fee = $results['amount'];

                                    $getDiscount = "SELECT * FROM discounts 
                                    JOIN preschool ON discounts.ps_id = preschool.ps_id
                                    WHERE discounts.ps_id = '$ps_id'";
                                    $discountResult = mysqli_query($conn, $getDiscount);
                                    

                                    // Fetch available discounts from the database
                                    $isQualified = false;
                                    $enrollmentCountQuery = "SELECT COUNT(*) as count FROM enroll WHERE user_id='$user_id'";
                                    $enrollmentCountResult = $conn->query($enrollmentCountQuery);
                                    $enrollmentCount = $enrollmentCountResult->fetch_assoc()['count'];

                                    $currentMonth = date('m');
                                    if ($enrollmentCount > 1 || ($currentMonth >= 3 && $currentMonth <= 4)) {
                                        $isQualified = true;
                                    }

                                    $discountOptions = array();
                                    if ($isQualified) {
                                        $discountQuery = "SELECT * FROM discounts WHERE ps_id='$ps_id'";
                                        $discountResult = mysqli_query($conn, $discountQuery);
                                        while ($row = mysqli_fetch_assoc($discountResult)) {
                                            $discountOptions[$row['discount_id']] = $row['discount_name'] . " - " . $row['percent'] . "%";
                                            $percent = $row['percent'];
                                        }
                                    }

                                    

                                    // If there is a connection error, then echo the description of the  error
                                    // Else, store the results on a variable using mysqli_fetch_all
                                    if ($bdfees_dataResult === false) {
                                        echo mysqli_error($conn);
                                    } else {
                                        $showBDF = mysqli_fetch_all($bdfees_dataResult, MYSQLI_ASSOC);
                                    }
                                
                                    foreach ($showBDF as $BDFRow): 
                                ?>
                                    <td><?= $BDFRow["fee_desc"] ?></td>
                                    <td><?= $BDFRow["amount"] ?></td>
                            </tr>
                            <?php endforeach; ?>

                            <tr>
                                <td><strong>Total</strong></td>
                                <td><?php echo $EDRow['fees']; ?></td>
                            </tr>
                            </table>
                        </div>
                    </div>

                                <form method="post" enctype="multipart/form-data"><br>
                                    
                                    <div class="form-row">      
                                        <div class="form-group">
                                            <label for="payment_for">Payment For: </label>
                                            <input type="text" name="payment_for" id="payment_for" value="Down payment/Enrollment Fee" style="width: 300px;" disabled>
                                        </div>  

                                        <div class="form-group">
                                            Payment Mode:
                                            <select name="p_mode" id="p_mode">
                                            <option value="" disabled selected>Select Mode of Payment</option>
                                                <option value="Full Payment">Full Payment</option>
                                                <option value="Partial Payment">Partial Payment</option>
                                                <option value="Quarterly">Quarterly</option>
                                                <option value="Monthly">Monthly</option>
                                            </select><br>
                                        </div>  
                                    </div>  

                                    <div class="form-row">      
                                        <div class="form-group">
                                            <label for="fees">Total Cost: </label>
                                            <input type="text" value="<?php echo $EDRow['fees'] . " " . "Pesos"; ?>" disabled />
                                        </div>

                                        <div class="form-group">
                                            <label>Balance: </label>
                                            <input type="text" value="<?php echo $EDRow['balance'] . " " . "Pesos"; ?>" disabled />
                                        </div>        
                                    </div>            

                                    <div class="form-row">      
                                        <div class="form-group">
                                            <label for="amount_paid">Paying for amount: </label>
                                            <input type="text" name="amount_paid" id="amount_paid" placeholder="Enter the total amount paid"  value="<?php echo $registration_fee; ?>" required>
                                        </div>

                                        <div class="form-group">
                                            Form of Payment:
                                            <select name="FOP" id="TransactNo">
                                                <option value="" disabled selected>Select Form of Payment</option>
                                                <option value="Cash">Cash</option>
                                                <option value="EPayment">EPayment/Gcash</option>
                                                
                                            </select>
                                        </div>  
                                    </div> 

                                    <div class="form-row"> 
                                        <div class="form-group">
                                            <label for="remarks">Remarks: </label>
                                            <textarea name="remarks" id="remarks" placeholder="Enter your remakrs or promissory note"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label for="discount">Discount/Promo: </label>
                                            <select name="discount" id="discount" onchange="calculateDiscountedTotal()">
                                                <option value="">Select Discount</option>
                                                <?php foreach ($discountOptions as $discountId => $discountName): ?>
                                                    <option value="<?php echo $percent; ?>"><?php echo $discountName; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group full-width">
                                        <label for="discountedTotal">Total Cost After Discount: </label>
                                        <input type="text" id="discountedTotal" name="discountedTotal" readonly />
                                    </div>

                                        <div id="WithTransactPh" style="display: none" class="form-group full-width">
                                            <label for="p_proof">Transaction Photo: </label>
                                            <input type="file" name="p_proof" id="p_proof">
                                        </div>
                                    

                                        <div>
                                            <input class="input" type="checkbox" name="terms" value="Agree" required> I hereby certify that all information
                                            given below are true and correct to the
                                            best of my knowledge. And by completing the payment form with Tiny Tots, I understood and agree to the 
                                            <a href="../include/Terms and Conditions for Payment Processing.pdf" target="_blank">TinyTots
                                            Terms and Conditions for payment processing</a>.
                                        </div><br>
                                    <button class="submitBTN">Process Payment</button>
                                </form>

                        <?php }; };     ?>
                </div>
            </div>
       
    </body>
    </div>
</html>