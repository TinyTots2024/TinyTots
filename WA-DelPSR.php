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

    //Web Admin information will be gathered
    $wba_id = $_SESSION["wba_id"];

    //Preschool ID will be gathered
    $ps_id=htmlentities($_GET['ps_id']);

    $info_sql = "SELECT * FROM webadmins
                WHERE wba_id='".$wba_id."'";

    $info_results = mysqli_query($conn, $info_sql);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($info_results === false) {
        echo mysqli_error($conn);
    } else {
        $info= mysqli_fetch_all($info_results, MYSQLI_ASSOC);
    }

    // Retrieve preschool information
    $preschoolQuery = "SELECT * FROM preschool WHERE ps_id =$ps_id;";
    $preschoolResult = $conn->query($preschoolQuery);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Preschool</title>
    <?php require 'include/WA-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>


    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                    <h2 class="head2">Delete Preschool</h2>
                        
                    <form method="post" enctype="multipart/form-data">
                        <div class="edform">
                            <p>Are you sure that you want to delete this Preschool Information?</p>
                            <button type="submit" name="delete" class="deletebutton1">Delete</button>
                            <a href="WA-ChangeReq.php" class="cancelBTN">Cancel</a>
                        </div>
                    </form>
                        

                            <div class="form-row">
                                <div class="form-group"><br>
                                <?php while ($preschoolRow = $preschoolResult->fetch_assoc()) : ?>
                                    <img src="../uploaded-image/<?php echo $preschoolRow['ps_profile']; ?>" alt="Profile Picture" class="form-group profilepic">
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

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (isset($_GET['ps_id'])) {

        $sql = "SELECT * FROM preschool WHERE ps_id='".$ps_id."' LIMIT 1;";

    $results = mysqli_query($conn, $sql);

    if (mysqli_num_rows($results)==1) {
        $sql_2 = "DELETE FROM preschool WHERE ps_id='".$ps_id."'";
        mysqli_query($conn, $sql_2);
        echo "The preschool information has been removed. Redirecting...";
        header("Refresh:2; url=WA-ChangeReq.php");  
        exit();
    } else {
        echo "Can't remove preschool. Redirecting...";
        header("Refresh:2; url=WA-ChangeReq.php");  
        exit();
        } 
        
    }
}

?>