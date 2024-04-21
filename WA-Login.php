<?php

require '../include/Connection.php';
session_start();
$conn = getDB();


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Admin Login Page</title>
    <?php require 'include/index-header.php'; ?>
</head>


<body class="bodyLogin">
    <div class="form-row">
            <div class="form-group">
                <img src="../include/nameTT.png" class="loginnameLogo">
                <p class="loginText">Preschool Made Simple</p>
                <br><p class="signinText">Sign In</p>
                <?php 
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {

                        if (isset($_POST['wba_username'])) {

                            $wba_username = $_POST['wba_username'];
                            $wba_password = $_POST['wba_password'];

                            $sql = "SELECT * FROM webadmins WHERE wba_username='" . $wba_username . "' 
                            AND wba_password='" . $wba_password . "' LIMIT 1;";

                            $re = mysqli_query($conn, $sql);

                            if (mysqli_num_rows($re) == 1) {
                                $row = mysqli_fetch_assoc($re);
                                if ($row['wba_username'] === $wba_username &&
                                    $row['wba_password'] === $wba_password) {
                                    $_SESSION['wba_username'] = $row['wba_username'];
                                    $_SESSION['wba_id'] = $row['wba_id'];
                                    header("Location: WA-Home.php");
                                    exit();
                                } 
                        
                            } else {
                                ?>
                                <p class="error-message"><?php echo "Incorrect Login Credentials" ?></p>
                                <?php                            }
                        }
                    }
                ?>

            <?php if (!empty($error)): ?>
            <p class="error"><?= $error ?></p>
            <?php endif; ?>

        <form method="post" class="login-form">
            <div class="form-group">
                <input name="wba_username" id="wba_username" type="text" placeholder="Enter your username" class="loginTextBox" required>
            </div>

            <div class="form-group">
                <input type="password" name="wba_password" id="wba_password" placeholder="Enter your password" class="loginTextBox" required>
            </div>

            <input type="Submit" Value="Login" class="loginButton">
        </form>
        <a href="WA-changepass.php" class="forgotPass">Forgot Password?</a>
        </div>

        <div class="form-group">
        <img src="../include/loginDS.png" class="loginDSWeb">
        </div>
</body>

</html>