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
        <title>Parent Change Password</title>
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

                        if (isset($_POST['user_username'])) {
                            
                            $u_username=htmlentities($_POST['user_username']);
                            $f_name=htmlentities($_POST['first_name']);
                            $l_name=htmlentities($_POST['last_name']);
                            $email=htmlentities($_POST['email']);
                            $password = htmlentities($_POST['new_user_password']);
                
                            $sql = "SELECT * FROM users WHERE user_username='".$u_username."' AND first_name='".$f_name."' 
                            AND last_name='".$l_name."' AND email='".$email."' LIMIT 1;";
                
                        $results = mysqli_query($conn, $sql);
                
                        if (mysqli_num_rows($results)==1) {
                            $sql_2 = "UPDATE users SET user_password='$password' WHERE user_username='".$u_username."' AND first_name='".$f_name."' 
                            AND last_name='".$l_name."' AND email='".$email."'";
                            mysqli_query($conn, $sql_2);
                            echo "Your password has been changed. Redirecting to Login page";
                            header("Refresh:2; url=Parent-Login.php");  
                            exit();
                        } else {
                            echo "Incorrect details, can't change password. Redirecting to Login page";
                            header("Refresh:2; url=Parent-Login.php");  
                            exit();
                        } 
                        }
                    }
            
                ?>

                <form method="post">
                    <div class="reg-group">
                        <label for="user_username">Username</label>
                        <input type="text" name="user_username" id="user_username" placeholder="Enter your username" required>
                    </div>

                    <div class="reg-group">
                        <label for="first_name">First Name</label>
                        <input type="text" name="first_name" id="first_name" placeholder="Enter your first name" required>
                    </div>

                    <div class="reg-group">
                        <label for="last_name">Last Name</label>
                        <input type="text" name="last_name" id="last_name" placeholder="Enter your last name" required>
                    </div>

                    <div class="reg-group">
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email" placeholder="Enter your email" required>
                    </div>

                    <div class="reg-group">
                        <label for="new_user_password">New Password</label>
                        <input type="password" name="new_user_password" id="new_user_password" placeholder="Enter your new password"
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