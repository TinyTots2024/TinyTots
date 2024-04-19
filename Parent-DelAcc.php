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

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Parent - Delete Account</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

<body>
    <div class="white-box">
        <div class="main_content">
            <div class="info">
                <h2 class="head2">Delete Your Account</h2>

                <form method="post">
                    <div style="text-align: center;">
                        <p>Are you sure that you want to delete your account?</p>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" name="email" id="email" placeholder="Enter your email" required>
                            </div>

                            <div class="form-group">
                                <label for="user_password">Password</label>
                                <input type="password" name="user_password" id="user_password" placeholder="Enter your password"
                                    required>
                            </div>
                        </div>

                        <button type="submit" name="delete" class="deletebutton1">Delete</button>
                        <a href="Parent-AccInfo.php"><button type="button" class="cancelBTN">Cancel</button></a>

                </form>

                <?php 

                if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["delete"])) {

                    $email = htmlentities($_POST['email']);
                    $password = htmlentities($_POST['user_password']);

                    $sql = "SELECT email, user_password FROM users WHERE email='$email' AND user_password='$password'";

                    $results = mysqli_query($conn, $sql);

                    if (mysqli_num_rows($results) == 1) {
                        $sql1 = "DELETE FROM users WHERE user_id='$user_id'";
                        mysqli_query($conn, $sql1);
                        // Logout the user after account deletion
                        session_destroy();
                        echo "Your account has been deleted. Redirecting...";
                        header("Refresh:2; url=../index.php?success=Your account has been removed.");
                        exit;
                    } else {
                        echo "Incorrect details, can't delete account. Redirecting..";
                        header("Refresh:2; url=Parent-AccInfo.php");
                        exit();
                    }
                }

                ?>
            </div>
        </div>
    </div>
</body>

</html>
