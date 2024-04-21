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

    $wba_id = $_SESSION["wba_id"];
    $ps_id = htmlentities($_GET['ps_id']);

    $preschoolQuery = "SELECT * FROM preschool WHERE ps_id=$ps_id";
    $preschoolResult = $conn->query($preschoolQuery);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Information</title>
    <?php require 'include/WA-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">

</head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                <h2 class="header">Detailed Preschool Information</h2>

                <div class="form-row">
                    <div class="form-group"><br>
                        <?php while ($preschoolRow = $preschoolResult->fetch_assoc()) : ?>
                            <img src="../uploaded-image/<?=$preschoolRow['ps_profile']?>" alt="Profile Picture" class="form-group profilepic">
                    </div>

                    <div class="form-group"><br> 
                        <table class="DettblBorder">
                            <tr>
                                <td>Preschool ID</td>
                                <td><?php echo $preschoolRow['ps_id']; ?></td>
                            </tr>
                            <tr>
                                <td>School Name</td>
                                <td><?php echo $preschoolRow['school_name']; ?></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><?php echo $preschoolRow['address']; ?></td>
                            </tr>
                            <tr>
                                <td>Hours</td>
                                <td><?php echo $preschoolRow['hours']; ?></td>
                            </tr>
                            <tr>
                                <td>Phone Number</td>
                                <td><?php echo $preschoolRow['phone_number']; ?></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><?php echo $preschoolRow['email']; ?></td>
                            </tr>
                            <tr>
                                <td>Website</td>
                                <td><?php echo $preschoolRow['website']; ?></td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td><?php echo $preschoolRow['status']; ?></td>
                            </tr>
                            <tr>
                                <td>Zoom Links</td>
                                <td><?php echo $preschoolRow['ps_zoom']; ?></td>
                            </tr>
                            <tr>
                                <td>Registered Date</td>
                                <td><?php echo $preschoolRow['created_at']; ?></td>
                            </tr>
                            <?php endwhile; ?>
                        </table>
                    </div>
                </div>
                </div>
            </div>
        </body>
    </div>

</html>