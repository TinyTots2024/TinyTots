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

    //user information will be gathered
    $id = $_SESSION["user_id"];
    $info_sql = "SELECT * FROM users
                WHERE user_id='".$id."'";

    $info_results = mysqli_query($conn, $info_sql);

    // If there is a connection error, then echo the description of the error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($info_results === false) {
        echo mysqli_error($conn);
    } else {
        $info = mysqli_fetch_all($info_results, MYSQLI_ASSOC);
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Account Information</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

<div class="white-box">
    <body>
        <div class="main_content"> 
            <div class="info">
                <h2 class="header">Registered Parent Information</h2>

                <div class="form-row">
                    <div class="form-group"><br>
                            <?php
                                $stud = $_SESSION["user_id"];
                                $sql = "SELECT pp FROM users WHERE user_id='".$stud."'";
                                $res = mysqli_query($conn,  $sql);

                                if (mysqli_num_rows($res) > 0) {
                                    while ($users = mysqli_fetch_assoc($res)) {  ?>
                                    <img src="../uploaded-image/<?=$users['pp']?>" alt="Profile Picture" class="form-group profilepic">  
                            <?php } }?>   
                    </div>
                         
                    <div class="form-group"><br>
                        <?php foreach ($info as $data): ?>
                        <table class="DettblBorder">
                            <tr>
                                <td><strong>Name</strong></td>
                                <td><?= $data["first_name"] ?> <?= $data["last_name"] ?></td>
                            </tr>
                            <tr>
                                <td><strong>Sex</strong></td>
                                <td><?= $data["sex"] ?></td>
                            </tr>
                            <tr>
                                <td><strong>Email</strong></td>
                                <td><?= $data["email"] ?></td>
                            </tr>
                            <tr>
                                <td><strong>Phone Number</strong></td>
                                <td><?= $data["phone_number"] ?></td>
                            </tr>
                            <tr>
                                <td><strong>Username</strong></td>
                                <td><?= $data["user_username"] ?></td>
                            </tr>
                            <tr>
                                <td><strong>Registered Date</strong></td>
                                <td><?= $data["created_at"] ?></td>
                            </tr>
                           
                            <tr>
                                <td><strong>Action</strong></td>
                                <td><a href="Parent-EditAccInfo.php"><button class="additionalbutton"><i class="fa-solid fa-pen" style="color: #ffffff;"></i></button></a>
                                    <a href="Parent-DelAcc.php" ><button class="additionalbutton"><i class="fa-solid fa-trash" style="color: #ffffff;"></i></button></a>
                                 </td>
                            </tr>
                        </table>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
    </body>
</div>

</html>