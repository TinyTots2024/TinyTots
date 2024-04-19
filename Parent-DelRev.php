<?php

session_start();

    // Check if the session variables are set
    if (!isset($_SESSION['user_id']) || !isset($_SESSION['user_username'])) {
        // Redirect the user if session variables are not set
        header("Location: Parent-Login.php"); // Change login.php to your login page
        exit();
    }
    $q1 = $q2 = $q3 = $q4 = $q5 = $q6 = $q7 = $q8 = $q9 = $q10 = "";

    require '../include/Connection.php';
    $conn = getDB();
    $user_id = $_SESSION["user_id"];
    $ratings_id=htmlentities($_GET['ratings_id']);

    // Ratings or Reviews Table
    $showRatings = "SELECT * from ratings 
                join users on ratings.user_id = users.user_id
                join preschool on ratings.ps_id = preschool.ps_id
                where ratings.ratings_id = '".$ratings_id."'";

    $showRatings_results = mysqli_query($conn, $showRatings);

    // If there is an connection error, then echo the description of the  error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($showRatings_results === false) {
        echo mysqli_error($conn);
    } else {
        $showR = mysqli_fetch_all($showRatings_results, MYSQLI_ASSOC);
    }

?>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedbacks</title>
        <?php require 'include/Parent-Header.php'; ?>
        <link rel="stylesheet" href="../css/contentStyle.css">
    </head>

    <div class="white-box">
        <body>
            <div class="main_content">
                <div class="info">
                <a href="Parent-ViewRev.php"><button class="cancelBTN">Back</button></a>
                <h2 class="head2">Review Information</h2>


                <?php foreach ($showR as $rate): ?>
                <table class="tblBorder">
                    <tr>
                        <th>Preschool Name</th>
                        <th>Rate Number</th>
                        <th>Comments</th>
                    </tr>
                    <tr>
                        <td><?= $rate["school_name"] ?></td>
                        <td><?= $rate["rating_number"] ?></td>
                        <td><?php if (empty($rate["comments"])): ?> No Comments found
                            <?php else: echo $rate["comments"]?></td>
                        <?php endif; ?>
                </table>
                <?php endforeach; ?>

                <form method="post" class="container">
                    <div class="edform">
                        <p>Are you sure that you want to delete this review?</p>
                        <button class="deletebutton1">Delete</button>
                        <a class="cancelBTN" href="Parent-ViewRev.php">Cancel</a>
                    </div>
                </form>

                <?php
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {

                        if (isset($_GET['ratings_id'])) {

                            $sql = "SELECT * FROM ratings WHERE ratings_id='".$ratings_id."' LIMIT 1;";

                        $results = mysqli_query($conn, $sql);

                        if (mysqli_num_rows($results)==1) {
                            $sql_2 = "DELETE FROM ratings WHERE ratings_id='".$ratings_id."'";
                            mysqli_query($conn, $sql_2);
                            echo "The` rating has been removed. Redirecting...";
                            echo "<script >window.location.href='Parent-ViewRev.php';</script >";
                            // header("Refresh:2; url=Parent-ViewRev.php");  
                            exit();
                        } else {
                            echo "Can't remove review. Redirecting...";
                            echo "<script >window.location.href='Parent-ViewRev.php';</script >";
                            // header("Refresh:2; url=Parent-ViewRev.php");  
                            exit();
                            } 
                            
                        }
                    }
                ?>

        </body>
    </div>

</html>