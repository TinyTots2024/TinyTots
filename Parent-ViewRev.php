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

    // Ratings or Reviews Table
    $showRatings = "SELECT * from ratings 
                join users on ratings.user_id = users.user_id
                join preschool on ratings.ps_id = preschool.ps_id
                where ratings.user_id = '".$user_id."'";

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
                <?php if (empty($showR)): ?>
                <h2 class="header">No Submitted Reviews found</h2><br>
                <a href="Parent-SubRev.php"><button class="allbutton"><i class="fa-solid fa-plus" style="color: #ffffff;"></i> Submit New Reviews</button></a>

                <?php else: ?>
                <h2 class="header">Submitted Reviews</h2>
                <a href="Parent-SubRev.php"><button class="allbutton"><i class="fa-solid fa-plus" style="color: #ffffff;"></i> Submit New Reviews</button></a>

                <table class="tblBorder">
                    <tr>
                        <th>Preschool Name</th>
                        <th>Rate Number</th>
                        <th>Comments</th>
                        <th>Actions</th>
                    </tr>
                    <tr>
                    <?php foreach ($showR as $rate): ?>
                        <td><?= $rate["school_name"] ?></td>
                        <td><?= $rate["rating_number"] ?></td>
                        <td>
                            <?php if (empty($rate["comments"])): ?> No Comments found
                            <?php else: echo $rate["comments"]?>
                        </td>
                        <?php endif; ?>
                        <td>
                            <a href="Parent-EdRev.php?ratings_id=<?= $rate[
                                        "ratings_id"
                                    ] ?>"><button><i class="fa-solid fa-pen" style="color: #ffffff;"></i></button></a>
                            <a href="Parent-DelRev.php?ratings_id=<?= $rate[
                                        "ratings_id"
                                    ] ?>"><button><i class="fa-solid fa-trash" style="color: #ffffff;"></i></button></a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </table>
                <?php endif; ?>
            </div>
        </div>
    </body>
</div>

</html>