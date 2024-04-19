<?php
    session_start();
    require '../include/Connection.php';
    $conn = getDB();  

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Account Information</title>
    <?php require 'include/index-header.php'; ?>
</head>

<body class="bodyLogin">
    
   
    <div class="form-row">
        <div class="form-group">
            <img src="../include/nameTT.png" class="loginnameLogo">
            <p class="loginText">Preschool Made Simple</p>
            <br><p class="signinText">Sign In</p>
            <?php
                if (isset($_GET['ps_id'])) {

                    $ps_id=htmlentities($_GET['ps_id']);

                        if ($_SERVER["REQUEST_METHOD"] == "POST") {

                            if (isset($_POST['user_username'])) {
                        
                                $u_username=$_POST['user_username'];
                                $u_password=$_POST['user_password'];
                        
                                $sql = "SELECT * FROM users WHERE user_username='$u_username' 
                                AND user_password='$u_password' AND verified = '1' LIMIT 1;";
                        
                                $re = mysqli_query($conn, $sql);
                        
                                if (mysqli_num_rows($re) === 1) {
                                    $row = mysqli_fetch_assoc($re);
                                    if ($row['user_username'] === $u_username && $row['user_password'] === $u_password){
                                        $_SESSION['user_username'] = $row['user_username'];
                                        $_SESSION['user_id'] = $row['user_id'];
                                        if (isset($_GET['ps_id'])) {
                                            $ps_id=htmlentities($_GET['ps_id']);
                                        echo "<script>window.location.href='Parent-EnrollForm.php?ps_id=$ps_id';</script>";   
                                        } else {
                                            echo '<script>window.location.href="Parent-EnrollForm.php";</script>';   
                                        }  
                                    }
                                } else { ;?>
                                    <p class="error-message"><?php echo "Incorrect Login Credentials" ?></p>
                                    <?php
                                } 
                            }
                        }
                } else {
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {

                        if (isset($_POST['user_username'])) {
                    
                            $u_username=$_POST['user_username'];
                            $u_password=$_POST['user_password'];
                    
                            $sql = "SELECT * FROM users WHERE user_username='".$u_username."' 
                            AND user_password='".$u_password."' AND verified = '1' LIMIT 1;";
                    
                            $re = mysqli_query($conn, $sql);
                    
                            if (mysqli_num_rows($re) === 1) {
                                $row = mysqli_fetch_assoc($re);
                                if ($row['user_username'] === $u_username && $row['user_password'] === $u_password){
                                    $_SESSION['user_username'] = $row['user_username'];
                                    $_SESSION['user_id'] = $row['user_id'];
                                    echo '<script>window.location.href="Parent-Home.php";</script>';   
                                    exit();
                                }
                            } else {  ?>
                                    <p class="error-message"><?php echo "Incorrect Login Credentials" ?></p>
                            <?php
                            } 
                        }
                    }
                }
                
            ?>
                <?php if (!empty($error)): ?>
                <p><?= $error ?></p>
                <?php endif; ?>

                <form method="post" class="login-form">
                    <div>
                        <input name="user_username" id="user_username" placeholder="username"  class="loginTextBox">
                    </div>
                    <div>
                        <input type="password" name="user_password" id="user_password" placeholder="password" class="loginTextBox">
                    </div>
                    <input type="Submit" Value="Login" class="loginButton">
                </form>
            <a href="Parent-Changepass.php" class="forgotPass">Forgot Password?</a>
        </div>

        <div class="form-group">
        <p class="justText">Not registered yet?</p>
            <?php if (isset($_GET['ps_id'])) { ?>
                <a href='Parent-Register.php?ps_id=<?= $ps_id ?>' class="registerBTN">Create Account</a>
                <?php } else { ?>
                    <a href='Parent-Register.php' class="registerBTN">Create Account</a>
                    <?php } ?>
            <img src="../include/loginDS.png" class="loginDS">
        </div>

    </div>
</body>

</html>