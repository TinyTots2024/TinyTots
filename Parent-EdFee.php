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
$payment_id = htmlentities($_GET['payment_id']);

// Fetch payment details
$showFee = "SELECT * FROM payment 
            JOIN preschool ON payment.ps_id = preschool.ps_id
            JOIN users ON payment.user_id = users.user_id
            JOIN enroll ON payment.en_id = enroll.en_id
            WHERE payment.payment_id = '".$payment_id."'";
$showFee_results = mysqli_query($conn, $showFee);

// If there is a connection error, then echo the description of the error
// Else, store the results in a variable using mysqli_fetch_assoc
if ($showFee_results === false) {
    echo mysqli_error($conn);
    exit();
} else {
    $payment_details = mysqli_fetch_assoc($showFee_results);
}



// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the file has been uploaded
    if (!empty($_FILES['p_proof']['name'])) {
        $img_name = $_FILES['p_proof']['name'];
        $img_size = $_FILES['p_proof']['size'];
        $tmp_name = $_FILES['p_proof']['tmp_name'];
        $error = $_FILES['p_proof']['error'];

        if ($error === 0) {
            if ($img_size > 5000000) {
                $em = "Sorry, your file is too large.";
                header("Location: Parent-Fees.php?error=$em");
                exit();
            } else {
                $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
                $img_ex_lc = strtolower($img_ex);

                $allowed_exs = array("jpg", "jpeg", "png", "pdf");

                if (in_array($img_ex_lc, $allowed_exs)) {
                    $new_img_name = uniqid("IMG-PSA-", true) . '.' . $img_ex_lc;
                    $img_upload_path = '../uploaded-image/' . $new_img_name;
                    move_uploaded_file($tmp_name, $img_upload_path);
                }
            }
        }
    }

    // Calculate the remaining amount or excess payment
        $difference = $payment_details['due_amount'] -  $_POST['amount_paid'];

        // Find the next payment
        $next_payment_query = "SELECT * FROM payment 
                            WHERE user_id = '".$user_id."' 
                            AND payment_id > '".$payment_id."' 
                            ORDER BY payment_id ASC 
                            LIMIT 1";
        $next_payment_result = mysqli_query($conn, $next_payment_query);

        if ($next_payment_result && mysqli_num_rows($next_payment_result) > 0) {
            $next_payment = mysqli_fetch_assoc($next_payment_result);

            // Calculate the new due amount for the next payment
            $new_due_amount = $next_payment['due_amount'] + $difference;

            // Update the next payment's due amount in the database
            $update_next_payment_query = "UPDATE payment 
                                        SET due_amount = '".$new_due_amount."' 
                                        WHERE payment_id = '".$next_payment['payment_id']."'";
            mysqli_query($conn, $update_next_payment_query);
        }

    // Update the database with the form data
    $amount_paid = $_POST['amount_paid'];
    $fop = $_POST['FOP'];

    $remarks = isset($_POST['remarks']) ? $_POST['remarks'] : null; // Check if remarks is provided

    $sql = "UPDATE payment SET amount_paid='$amount_paid', FOP='$fop', payment_date=now(), remarks='$remarks'";

    // Add the transaction photo if it has been uploaded
    if (isset($new_img_name)) {
        $sql .= ", p_proof='$new_img_name'";
    }

    $sql .= " WHERE payment_id = '".$payment_id."'";
    mysqli_query($conn, $sql);

    echo "Your information has been changed. Redirecting...";
    echo "<script >window.location.href='Parent-Fees.php';</script >";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Payment</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>
<body>
    <div class="white-box">
        <div class="main_content">
            <div class="info">
                <h2 class="head2">Add Payment</h2>
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group full-width">
                        <label for="amount_paid">Due Date: </label>
                        <input type="text" name="deadline" id="deadline" value="<?php echo $payment_details["deadline"]; ?>" disabled>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="payment_for">Payment For: </label>
                            <input type="text" name="payment_for" id="payment_for" value="<?php echo $payment_details["payment_for"]; ?>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="amount_paid">Paying for amount: </label>
                            <input type="text" name="amount_paid" id="amount_paid" placeholder="Enter the total amount paid" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="FOP">Form of Payment: </label>
                            <select name="FOP" id="TransactNo">
                                <option value="Cash">Cash</option>
                                <option value="EPayment">EPayment/Gcash</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="p_proof">Transaction Photo: </label>
                            <input type="file" name="p_proof" id="p_proof">
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label for="remarks">Remarks: </label>
                        <textarea name="remarks" id="remarks" placeholder="Enter your remakrs or promissory note"></textarea>
                    </div>

                    <div>
                            <input class="input" type="checkbox" name="terms" value="Agree" required> I hereby certify that all information
                            given below are true and correct to the
                            best of my knowledge. And by completing the payment form with Tiny Tots, I understood and agree to the 
                            <a href="../include/Terms and Conditions for Payment Processing.pdf" target="_blank">TinyTots
                            Terms and Conditions for payment processing</a>.
                        </div><br>
                    <button class="submitBTN">Upload</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

