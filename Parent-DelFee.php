<?php
session_start();

// Check if the session variables are set
if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_username'])) {
    // Redirect the user if session variables are not set
    header("Location: Parent-Login.php"); // Change login.php to your login page
    exit();
}
    $user_id = $_SESSION["user_id"];
    require '../include/Connection.php';
    $conn = getDB();

    $payment_id=htmlentities($_GET['payment_id']);

    // Payment Table
    $DelFees = "SELECT * from payment 
    join preschool on payment.ps_id = preschool.ps_id
    join users on payment.user_id = users.user_id
    join enroll on payment.en_id = enroll.en_id
    WHERE payment.payment_id = '".$payment_id."'";

    $DelFees_results = mysqli_query($conn, $DelFees);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($DelFees_results === false) {
        echo mysqli_error($conn);
    } else {
        $showDF = mysqli_fetch_all($DelFees_results, MYSQLI_ASSOC);  
         
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

    <div class="white-box">
        <body>
        <div class="main_content"> 
            <div class="info">
                <h2 class="head2">Delete Payment Form Information</h2>
                <form method="post">
                    <div class="container">
                        <div class="edform">
                            <p>Are you sure that you want to delete this payment form?</p>
                            <button class="deletebutton1">Delete</button>
                            <a href="Parent-Fees.php" class="cancelBTN" style="text-decoration:none">Cancel</a>
                        </div>
                    </div>
                </form>

                <?php
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {

                            $sql = "UPDATE payment SET amount_paid=null, FOP=null, p_proof=null, payment_status='Unpaid', payment_date=null";

                            $sql .= " WHERE payment_id = '".$payment_id."'";
                            mysqli_query($conn, $sql);
                            echo "Your information has been changed. Redirecting...";
                            echo "<script >window.location.href='Parent-Fees.php';</script >";
                            // header("Refresh:2; url=Parent-Fees.php");
                            exit();
                        }
                    ?>
            </div>
        </body>
    </div>

</html>