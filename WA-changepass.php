<?php
session_start();
require '../include/Connection.php';
$conn = getDB();

if (isset($_SESSION['wba_id']) && isset($_SESSION['wba_username'])){
    $wba_id = $_SESSION["wba_id"];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Admin Change Password</title>
    <?php require 'include/index-header.php'; ?>
</head>

<body class="bodyLogin">
        <div class="form-row">
            <div class="form-group">
                <img src="../include/nameTT.png" class="loginnameLogo">
                <p class="loginText">Preschool Made Simple</p>
                <br><p class="justText1">Change Password</p>

                <?php
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                        if (isset($_POST['wba_username'])) {
                            $wba_username = htmlentities($_POST['wba_username']);
                            $wba_first_name = htmlentities($_POST['wba_first_name']);
                            $wba_last_name = htmlentities($_POST['wba_last_name']);
                            $password = htmlentities($_POST['new_wba_password']);

                            $sql = "SELECT * FROM webadmins WHERE wba_username='$wba_username' 
                            AND wba_first_name='$wba_first_name' 
                            AND wba_last_name='$wba_last_name' LIMIT 1;";

                            $results = mysqli_query($conn, $sql);

                            if (mysqli_num_rows($results) == 1) {
                                $sql_2 = "UPDATE webadmins SET wba_password='$password' WHERE wba_username='$wba_username' 
                                AND wba_first_name='$wba_first_name'
                                AND wba_last_name='$wba_last_name';";
                                mysqli_query($conn, $sql_2);
                                echo "Your password has been changed. Redirecting to Login page";
                                echo "<script>window.location.href='WA-Login.php';</script>";
                                exit();
                            } else {
                                echo "Incorrect details, can't change password. Redirecting to Login page";
                                echo "<script>window.location.href='WA-Login.php';</script>";
                                exit();
                            } 
                        }
                    }
                ?>

                <form method="post" class="password-change-form">
                <div class="reg-group">
                        <label for="wba_username">Username</label>
                        <input type="text" name="wba_username" id="wba_username" type="text" placeholder="Enter your username" required>
                    </div>

                    <div class="reg-group">
                        <label for="wba_first_name">First Name</label>
                        <input type="text" name="wba_first_name" id="wba_first_name" placeholder="Enter your first name" required>
                    </div>

                    <div class="reg-group">
                        <label for="wba_last_name">Last Name</label>
                        <input type="text" name="wba_last_name" id="wba_last_name" placeholder="Enter your last name" required>
                    </div>

                    <div class="reg-group">
                        <label for="new_wba_password">New Password</label>
                        <input type="password" name="new_wba_password" id="new_wba_password" placeholder="Enter your new password"
                            required>
                    </div>

                    <input type="Submit" Value="Change" class="loginButton">
                    </form>
                </div>
                <div class="form-group">
                <img src="../include/loginDS.png" class="loginDSReg">
            </div>
        </div>
    </body>
</html>