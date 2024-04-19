<?php

require '../include/Connection.php';
require '../include/PHPMailer/src/PHPMailer.php';
require '../include/PHPMailer/src/SMTP.php';
require '../include/PHPMailer/src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

session_start();
$conn = getDB();


?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Parent registration</title>
        <?php require 'include/index-header.php'; ?>
    </head>

    <body class="bodyLogin">
        <div class="form-row">
            <div class="form-group">
                <img src="../include/nameTT.png" class="loginnameLogo">
                <p class="loginText">Preschool Made Simple</p>
                <br><p class="signinText">Register</p>
                    <?php
                    
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {
                            

                            $username = $_POST['user_username'];
                            $email = $_POST['email'];

                            $sql_u = "SELECT * FROM users WHERE user_username='$username'";
                            $sql_e = "SELECT * FROM users WHERE email='$email'";
                            $res_u = mysqli_query($conn, $sql_u);
                            $res_e = mysqli_query($conn, $sql_e);

                            if (mysqli_num_rows($res_u) > 0) { 
                                echo "Username already taken";  
                            } elseif(mysqli_num_rows($res_e) > 0){
                                echo "Email already used";      
                            } else {
                                // Generate a verification token
                                $verification_token = md5(uniqid(rand(), true));

                                if (isset($_GET['ps_id'])) {
                                    $ps_id=htmlentities($_GET['ps_id']);
                                $verification_url = 'http://localhost/tinytots/parents/verify.php?email=' . urlencode($email) . '&token=' . urlencode($verification_token) . '&ps_id=' . urlencode($ps_id);
                                } else {
                                    $verification_url = 'http://localhost/tinytots/parents/verify.php?email=' . urlencode($email) . '&token=' . urlencode($verification_token);
   
                                }  

                                // Send verification email using PHPMailer
                                $mail = new PHPMailer();
                                $mail->isSMTP();
                                $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
                                $mail->SMTPAuth = true;          // Enable SMTP authentication
                                $mail->Username = 'Tinytotsphorg@gmail.com';   // SMTP username
                                $mail->Password = 'vgka flzq pgsv uegy';   // SMTP password
                                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption, `ssl` also accepted
                                $mail->Port = 587;  // TCP port to connect to

                                // Enable debugging

                                $mail->SMTPDebug = 2;
                                $mail->setFrom('Tinytotsphorg@gmail.com', 'TinyTots');
                                $mail->addAddress($email);     // Add recipient

                                $mail->isHTML(true);  // Set email format to HTML
                                $mail->Subject = 'Email Verification';
                                $mail->Body    = "Please click the link below to verify your email address:<br><a href=\"$verification_url\">Click here</a>";
                                
                                if ($mail->send()) {
                                    echo "Verification email sent successfully!";

                                    $img_name = $_FILES['pp']['name'];
                                    $img_size = $_FILES['pp']['size'];
                                    $tmp_name = $_FILES['pp']['tmp_name'];
                                    $error = $_FILES['pp']['error'];
                                            
                                    if ($error === 0) {
                                        if ($img_size > 5000000) {
                                            $em = "Sorry, your file is too large.";
                                            header("Location: Parent-Register.php?error=$em");
                                        }else {
                                            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
                                            $img_ex_lc = strtolower($img_ex);
                                            
                                            $allowed_exs = array("jpg", "jpeg", "png", "pdf"); 
                                            
                                            if (in_array($img_ex_lc, $allowed_exs)) {
                                                $new_img_name = uniqid("IMG-", true).'.'.$img_ex_lc;
                                                $img_upload_path = '../uploaded-image/'.$new_img_name;
                                                move_uploaded_file($tmp_name, $img_upload_path);
                                            
                                                // Insert into Database
                                                $sql = "INSERT INTO users (first_name, last_name, sex, email, phone_number, user_username, user_password, pp, verification_token, verified)
                                                VALUES ( '". $_POST['first_name'] . "',
                                                    '". $_POST['last_name'] . "',
                                                    '". $_POST['sex'] . "',
                                                    '". $_POST['email'] . "',
                                                    '". $_POST['phone_number'] . "',
                                                    '". $_POST['user_username'] . "',
                                                    '". $_POST['user_password'] . "',
                                                    '$new_img_name',
                                                    '$verification_token',
                                                    0)"; // Set verified status to 0 initially
                                                    mysqli_query($conn, $sql);
                                                            if (isset($_GET['ps_id'])) {
                                                                $ps_id=htmlentities($_GET['ps_id']);
                                                            echo "<script>window.location.href='Parent-Login.php?ps_id=$ps_id';</script>";   
                                                            } else {
                                                                echo '<script>window.location.href="Parent-Login.php";</script>';   
                                                            }                                        
                                            }else {
                                                    $em = "You can't upload files of this type";
                                                    echo "<script >window.location.href='Parent-Register.php?error=$em';</script >";
                                                }
                                            }
                                        }       
                                } else {
                                    echo "Failed to send verification email.";
                                    echo "Error: " . $mail->ErrorInfo;
                                }
                            }
                        }
                    ?>

            <form method="post" enctype="multipart/form-data">
                <div class="reg-group">
                    <label for="first_name">First Name</label>
                    <input type="text" class="form-control" name="first_name" id="first_name"
                        placeholder="Enter your first name" required>
                </div>

                <div class="reg-group">
                    <label for="last_name">Last Name</label>
                    <input type="text" class="form-control" name="last_name" id="last_name"
                        placeholder="Enter your last name" required>
                </div>

                <div class="reg-group">
                    <label class="form-check-label">Gender:</label>
                    <input type="radio" class="form-check-input" name="sex" value="Female">Female
                    <input type="radio" class="form-check-input" name="sex" value="Male">Male
                </div>

                <div class="reg-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" name="email" id="email" placeholder="Enter your email" required>
                </div>

                <div class="reg-group">
                    <label for="phone_number">Phone Number</label>
                    <input type="tel" pattern="[0-9]{11}" name="phone_number" id="phone_number"
                        placeholder="Enter your phone number" maxlength="11"  required inputmode="numeric">
                        <small>Format: 09XX-XXX-XXXX</small>
                </div>

                <div class="reg-group">
                    <label for="user_username">Username</label>
                    <input type="text" class="form-control" name="user_username" id="user_username"
                        placeholder="Enter your username" required>
                </div>

                <div class="reg-group">
                    <label for="user_password">Password</label>
                    <input type="password" class="form-control" name="user_password" id="user_password"
                        placeholder="Enter your password" required>
                </div>

                <div class="reg-group">
                    <label for="pp">Profile Picture</label>
                    <input type="file" class="form-control-file" name="pp" id="pp">
                </div>

                <div class="reg-group">
                    <input type="checkbox" class="form-check-input" name="terms" id="terms" value="Agree" required>
                    <label class="form-check-label" for="terms">By completing the registration, I understood and agree to
                        the <a href="../include/Terms of User and Privacy Statement.pdf" target="_blank">
                        TinyTots Terms of Use and Privacy Statement</a>.</label>
                </div>

                <input type="Submit" Value="Register" class="loginButton">
            </form>
            </div>
            <div class="form-group">
            <img src="../include/loginDS.png" class="loginDSReg">
            </div>
        </main>
    </body>
</html>

