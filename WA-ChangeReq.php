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

    $info_sql = "SELECT * FROM webadmins
                WHERE wba_id='".$wba_id."'";

    $info_results = mysqli_query($conn, $info_sql);

    if ($info_results === false) {
        echo mysqli_error($conn);
    } else {
        $info= mysqli_fetch_all($info_results, MYSQLI_ASSOC);
    }

    $preschoolQuery = "SELECT * FROM preschool WHERE status ='Pending';";
    $preschoolResult = $conn->query($preschoolQuery);

?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Preschool Management</title>
        <?php require 'include/WA-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content"> 
                <div class="info">
                <h2 class="head2">Pending Preschool</h2>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>School Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <?php while ($preschoolRow = $preschoolResult->fetch_assoc()) : ?>
                    <tr>
                        <td><?php echo $preschoolRow['school_name']; ?></td>
                        <td>
                            <a style="text-decoration:none" href="WA-UpdPS.php?ps_id=<?= $preschoolRow["ps_id"] ?>">
                                <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                            </a>

                            <a  style="text-decoration:none" href="WA-DelPSR.php?ps_id=<?= $preschoolRow["ps_id"] ?>">
                                <button><i class="fa-solid fa-trash" style="color: #ffffff;"></i></button>
                            </a>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </table>
                </div>
            </div>
        </body>
    </div>

</html>