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
                        <th>Current Rate Number</th>
                        <th>Current Comments</th>
                    </tr>
                    <tr>
                        <td><?= $rate["school_name"] ?></td>
                        <td><?= $rate["rating_number"] ?></td>
                        <td><?php if (empty($rate["comments"])): ?> No Comments found
                            <?php else: echo $rate["comments"]?></td>
                        <?php endif; ?>
                    </tr>
                </table>
                <?php endforeach; ?><br>


                <form method="post">

                    <div class="survey">
                    1. Do you find our parent communication channels easy to use?
                        <br><input type="radio" name="q1" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q1" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q1" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    2. Do you feel your thoughts, opinions, and suggestions are well-valued by the Preschool?
                        <br><input type="radio" name="q2" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q2" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q2" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    3. Do you believe your child gets enough attention from their teachers?
                        <br><input type="radio" name="q3" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q3" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q3" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    4. How well does the Preschool support your child’s development?
                        <br><input type="radio" name="q4" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q4" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q4" value=1 class="surveyOpt" required>Disagree
                    </div><br>
                    
                    <div class="survey">
                    5. How well does the Preschool consider the needs of
                    your child when planning distance learning activities?
                        <br><input type="radio" name="q5" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q5" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q5" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    6. From 1 to 10, how easy to use is our payment system?
                        <br><input type="radio" name="q6" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q6" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q6" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    7. Do you find it easy to communicate with the Preschool employees?
                        <br><input type="radio" name="q7" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q7" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q7" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    
                    <div class="survey">
                    8. Do you feel you have a good understanding of Preschool's policies?
                        <br><input type="radio" name="q8" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q8" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q8" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    9. Are you satisfied with the quality of service at the Preschool?
                        <br><input type="radio" name="q9" value=5 class="surveyOpt" required>Agree
                        <br><input type="radio" name="q9" value=3 class="surveyOpt" required>Neutral
                        <br><input type="radio" name="q9" value=1 class="surveyOpt" required>Disagree
                    </div><br>

                    <div class="survey">
                    10. Do you have any suggestions for improvement?
                    <br><textarea name="q10" class="surveyOpt"></textarea>
                    </div> <br>
                    <button class="print">Submit Changes</button>
                </form>
        </body>
    </div>

</html>

<?php

function test_input($data) {
$data = trim($data);
$data = stripslashes($data);
$data = htmlspecialchars($data);
return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (isset($_GET['ratings_id'])) {
        
    $q1 = test_input($_POST["q1"]);
    $q2 = test_input($_POST["q2"]);
    $q3 = test_input($_POST["q3"]);
    $q4 = test_input($_POST["q4"]);
    $q5 = test_input($_POST["q5"]);
    $q6 = test_input($_POST["q6"]);
    $q7 = test_input($_POST["q7"]);
    $q8 = test_input($_POST["q8"]);
    $q9 = test_input($_POST["q9"]);
    $q10 = test_input($_POST["q10"]);

    echo "<h2>Your Input:</h2>";

    $int_cast1 = (int)$q1;
    $int_cast2 = (int)$q2;
    $int_cast3 = (int)$q3;
    $int_cast4 = (int)$q4;
    $int_cast5 = (int)$q5;
    $int_cast6 = (int)$q6;
    $int_cast7 = (int)$q7;
    $int_cast8 = (int)$q8;
    $int_cast9 = (int)$q9;

    $val1 = $int_cast1 + $int_cast2 + $int_cast3 + $int_cast4 + 
    $int_cast5 + $int_cast6 + $int_cast7 + $int_cast8 + $int_cast9;

    $val2 = round($val1 / 9, 2);
    
    echo $val2;
    echo '<br>';
    if (empty($q10)){
        echo "No Comments found";
    }
    else{
        echo $q10;
    } 
    echo '<br>';
    echo '<br>';

    $sql = "UPDATE ratings SET rating_number = '$val2', comments = '$q10'
    WHERE ratings.ratings_id = '".$ratings_id."'";

    mysqli_query($conn, $sql);

    echo "Your review changes has been submitted. Redirecting...";
    echo "<script>window.location.href='Parent-ViewRev.php';</script>";
    exit();
    }
}
?>