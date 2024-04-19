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

    // Events Table
    $en_id=htmlentities($_GET['en_id']);
    $ps_id=htmlentities($_GET['ps_id']);

    if (isset($_GET["en_id"])) {

        $showDF = "SELECT * from payment 
        join users on payment.user_id = users.user_id 
        join enroll on payment.en_id = enroll.en_id
        join preschool on payment.ps_id = preschool.ps_id
        WHERE payment.en_id='".$en_id."'
        GROUP BY payment.en_id;";
        $showDF_Result = $conn->query($showDF);

        // Retrieve the payment information only for the student
        $showFee = "SELECT * from payment 
        join users on payment.user_id = users.user_id 
        join enroll on payment.en_id = enroll.en_id
        join preschool on payment.ps_id = preschool.ps_id
        WHERE payment.en_id='".$en_id."';";
        $showFee_results = mysqli_query($conn, $showFee);

        // If there is an connection error, then echo the description of the  error
        // Else, store the results on a variable using mysqli_fetch_all
        if ($showFee_results === false) {
            echo mysqli_error($conn);
        } else {
            $showF = mysqli_fetch_all($showFee_results, MYSQLI_ASSOC);
        }

    }


?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fees - Billing Summary</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
        <div class="main_content"> 
            <div class="info">
                    <h2 class="header">Payment Details</h2>
                    <button onclick="window.print()" class="allbutton">Print Payment Form</button>


                    <div class="form-row">      
                        <div class="form-group">Student Details<br>
                       
                        <?php 
                        while ($DFRow = $showDF_Result->fetch_assoc()) :
                    
                            $s_f_name = $DFRow['stud_fname'];
                            $s_l_name = $DFRow['stud_lname'];
                            $s_enID_name = $DFRow['enrollID']; 
                            $s_record = $s_enID_name ." | ". $s_l_name .", ". $s_f_name; 
                            echo "Student: " . $s_record;
                            echo "</br>";
                            echo "Preschool: " . $DFRow['school_name'];
                            echo "</br>";
                            echo "Grade Level: " .$DFRow['year_level'];
                            echo "</br>";
                            echo "Mode of Payment: " .$DFRow['p_mode'];
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
                                    WHERE bd_fees_ps.ps_id = '$ps_id' and bd_fees_ps.bdf_glevel = '".$DFRow['year_level']."'";
                                    $bdfees_dataResult = mysqli_query($conn, $bdfees_dataQuery);

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
                                <td><strong>Total (Discount Applied)</strong></td>
                                <td><?php echo $DFRow['fees']; ?></td>
                            </tr>
                            </table>
                            <?php endwhile; ?>
                        </div>
                    </div>

                
                    <h2 class="head2">Payments</h2>
                    <table class="feetblBorder1">
                    
                        <tr>
                            <th>Payment For</th>
                            <th>Due Date</th>
                            <th>Payment Date</th>
                            <th>Due Amount</th>
                            <th>Amount Paid</th>
                            <th>Form of Payment</th>
                            <th>Status</th>
                            <th>Transaction Number</th>
                            <th>Proof</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                        <?php foreach ($showF as $fee): ?>
                            <td><?= $fee["payment_for"] ?></td>
                            <td><?= $fee["deadline"] ?></td>
                            <td><?= $fee["payment_date"] ?></td>
                            <td><?= $fee["due_amount"] ?></td>
                            <td><?= $fee["amount_paid"] ?></td>
                            <td><?= $fee["FOP"] ?></td>
                            <td><?= $fee["payment_status"] ?></td>
                            <td><?= $fee["transact_no"] ?></td>
                            
                            <?php 
                                        $stud = $_SESSION["user_id"];

                                        $sql = "SELECT * FROM users WHERE user_id='".$stud."'";
                                        $query = mysqli_query($conn, $sql);
                                        $results = mysqli_fetch_assoc($query);
                                        $payment_id = $fee['payment_id'];

                                        $sql1 = "SELECT p_proof FROM payment WHERE payment_id='".$payment_id."'";
                                        $res = mysqli_query($conn,  $sql1);

                                        if (mysqli_num_rows($res) > 0) {
                                            while ($DF = mysqli_fetch_assoc($res)) {  
                                ?>
                                
                            <td>
                                <div class="profile-picture">
                                    <?php if (!empty($fee['p_proof'])): ?> 
                                        <a href="Parent-transaction_photo.php?payment_id=<?= $fee["payment_id"] ?>" target="_blank">
                                            <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                        </a>
                                    <?php endif; ?>
                                </div>
                                
                                <?php } }?>
                            </td>
                            <td>
                                <?php if ($fee["payment_status"] !== 'Paid'): ?>
                                    <a href="Parent-EdFee.php?payment_id=<?= $fee["payment_id"] ?>">
                                        <button><i class="fa-solid fa-pen" style="color: #ffffff;"></i></button>
                                    </a>
                                <?php endif; ?>
                                <a href="Parent-DelFee.php?payment_id=<?= $fee["payment_id"] ?>">
                                    <button><i class="fa-solid fa-trash" style="color: #ffffff;"></i></button>
                                </a>
                            </td>
                        </tr>
                        <?php endforeach; ?>

                        <tr><td colspan="9"><strong>Total Payable Fee: </strong><?php echo $fee['fees'] ?></td></tr>
                        <tr>
                            <td colspan="9"><strong>Total Paid:</strong>
                            <?php 
                                $total_paid = 0;
                                foreach ($showF as $fee) {
                                    if ($fee['payment_status'] === 'Paid') {
                                        $total_paid += $fee['amount_paid'];
                                    }
                                }
                                echo $total_paid;
                            ?></td>
                        </tr>
                        <tr><td colspan="9"><strong>Total Balance: </strong><?php echo $fee['fees'] - $total_paid; ?></td></tr>
                    </table>
                </div>    
            </div>
        </body>
    </div>
</html>