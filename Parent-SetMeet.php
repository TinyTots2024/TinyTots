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
$user_id = $_SESSION["user_id"];

// Fetch faculty members associated with the parent's preschool
$sql = "SELECT * FROM enroll 
        JOIN preschool ON enroll.ps_id = preschool.ps_id
        JOIN users ON enroll.user_id = users.user_id
        WHERE enroll.user_id = '$user_id'";

$query = mysqli_query($conn, $sql);
$results = mysqli_fetch_assoc($query);
$sca_ps_id = $results['ps_id'];

// Get all the list of the faculty member that is registered on the preschool
$sql1 = "SELECT * FROM faculty 
         WHERE ps_id = '$sca_ps_id'";

$sql1_results = mysqli_query($conn, $sql1);

// If there is a connection error, echo the description of the error
// Else, store the results in a variable using mysqli_fetch_all
if ($sql1_results === false) {
    echo mysqli_error($conn);
} else {
    $showFL = mysqli_fetch_all($sql1_results, MYSQLI_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Set New Meeting</title>
    <?php require 'include/Parent-Header.php'; ?>
    <link rel="stylesheet" href="../css/contentStyle.css">
</head>

<body>
    <div class="white-box">
        <div class="main_content">
            <div class="info">
                <form method="POST" class="edit-form">
                    <h2 class="header">Schedule New Meeting</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="meet_topic">Topic </label>
                            <input type="text" name="meet_topic" id="meet_topic" placeholder="Enter the topic for the meeting"
                                required>
                        </div>

                        <div class="form-group">
                            <label>Meeting Setup </label>
                            <select name="setup">
                                <option value="Online">Online</option>
                                <option value="Personal/Face to Face">Personal/Face to Face</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label for="meet_desc">Description: </label>
                        <input type="text" name="meet_desc" id="meet_desc" placeholder="Enter the description for the meeting"
                            required>
                    </div>

                    <div class="form-group full-width">
                        <label>Faculty: </label>
                        <select name="faculty_id" id="faculty_id">
                            <?php foreach ($showFL as $faculty) : ?>
                                <option value="<?= $faculty["faculty_id"] ?>" data-ps-id="<?= $faculty["ps_id"] ?>">
                                    <?= $faculty["f_fname"] ?> <?= $faculty["f_lname"] ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="meeting_date">Meeting Date</label>
                            <input type="date" name="meeting_date" id="meeting_date" placeholder="Select the Meeting Date"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="meeting_time">Meeting Time</label>
                            <input type="time" name="meeting_time" id="meeting_time" placeholder="Select the Meeting Time"
                                required>
                        </div>
                    </div>
                    <button class="print" type="submit">Schedule Meeting</button>
                </form>
            </div>
        </div>
    </div>
</body>

</html>

<?php 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the selected faculty id and its associated ps_id
    $selected_faculty_id = $_POST['faculty_id'];
    $selected_ps_id = $_POST['faculty_ps_id']; // Assuming you set the data attribute correctly in the option tag
    
    // Other meeting details
    $meetstatus = "Requested by Parent"; 

    // Insert into the meetings table including ps_id
    $sql = "INSERT INTO meetings (user_id, ps_id, meet_topic, meet_desc, faculty_id, 
    meeting_date, meeting_time, setup, meetstatus)
        VALUES ('$user_id', '$selected_ps_id', '". $_POST['meet_topic'] . "',
                '". $_POST['meet_desc'] . "',
                '$selected_faculty_id',
                '". $_POST['meeting_date'] . "',
                '". $_POST['meeting_time'] . "',
                '". $_POST['setup'] . "', '$meetstatus')";
                
    // Execute the SQL query
    mysqli_query($conn, $sql);
    
    // Redirect after successful insertion
    echo "Your meeting request has been submitted. Redirecting...";
    echo "<script>window.location.href='Parent-Meetings.php';</script>";
} 
?>
