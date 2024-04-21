<?php

session_start();

// Check if the session variables are set
if (!isset($_SESSION['wba_id']) || !isset($_SESSION['wba_username'])) {
    // Redirect the user if session variables are not set
    header("Location: WA-Login.php"); // Change login.php to your login page
    exit();
}

    require '../include/Connection.php';
    $conn = getDB();

    //Web Adminid will be collected using the session
    $wba_id = $_SESSION["wba_id"];

    //Get the user Id to provide the details of the specific user
    $user_id=htmlentities($_GET['user_id']);

    // Retrieve users/parents information
    $userQuery = "SELECT * FROM users WHERE user_id=$user_id";
    $userResult = $conn->query($userQuery);


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View User Information</title>
    <?php require 'include/WA-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <h2 class="header">Detailed User Information</h2>

                    <div class="form-row">
                        <div class="form-group"><br>
                            <?php while ($userRow = $userResult->fetch_assoc()) : ?>
                            
                                <!-- Profile picture container -->
                            <img src="../uploaded-image/<?=$userRow['pp']?>" alt="Profile Picture" class="form-group profilepic">
                        </div>

                        <div class="form-group"><br>                 
                            <table class="DettblBorder">
                                <br><br><br>
                                <tr>
                                    <td>User ID</td>
                                    <td><?php echo $userRow['user_id']; ?></td>
                                </tr>
                                <tr>
                                    <td>First Name</td>
                                    <td><?php echo $userRow['first_name']; ?></td>
                                </tr>
                                <tr>
                                    <td>Last Name</td>
                                    <td><?php echo $userRow['last_name']; ?></td>
                                </tr>
                                <tr>
                                    <td>Sex</td>
                                    <td><?php echo $userRow['sex']; ?></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><?php echo $userRow['email']; ?></td>
                                </tr>
                                <tr>
                                    <td>Phone Number</td>
                                    <td><?php echo $userRow['phone_number']; ?></td>
                                </tr>
                                <tr>
                                    <td>Username</td>
                                    <td><?php echo $userRow['user_username']; ?></td>
                                </tr>
                                <tr>
                                    <td>Registered Date</td>
                                    <td><?php echo $userRow['created_at']; ?></td>
                                </tr>
                                <?php endwhile; ?>
                            </table>
                        </div>
                </div>            
            </div>
        </body>
    </div>

</html>