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

// Web Admin information will be gathered
$wba_id = $_SESSION["wba_id"];

$info_sql = "SELECT * FROM webadmins
            WHERE wba_id='" . $wba_id . "'";

$info_results = mysqli_query($conn, $info_sql);

// If there is a connection error, then echo the description of the error
// Else, store the results on a variable using mysqli_fetch_all
if ($info_results === false) {
    echo mysqli_error($conn);
} else {
    $info = mysqli_fetch_all($info_results, MYSQLI_ASSOC);
}

// Search functionality
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Retrieve users/parents information
$userQuery = "SELECT * FROM users";
if (!empty($search)) {
    $userQuery .= " WHERE first_name LIKE '%$search%' OR last_name LIKE '%$search%'";
}
$userResult = $conn->query($userQuery);

// Retrieve preschool information
$preschoolQuery = "SELECT * FROM preschool WHERE status ='Registered'";
if (!empty($search)) {
    $preschoolQuery .= " AND school_name LIKE '%$search%'";
}
$preschoolResult = $conn->query($preschoolQuery);

// Retrieve student records
$studentQuery = "SELECT * FROM StudRec JOIN enroll ON StudRec.en_id = enroll.en_id";
if (!empty($search)) {
    $studentQuery .= " WHERE stud_fname LIKE '%$search%' OR stud_lname LIKE '%$search%'";
}
$studentResult = $conn->query($studentQuery);

// Retrieve faculty records
$facultyQuery = "SELECT * FROM faculty JOIN preschool ON faculty.ps_id = preschool.ps_id";
if (!empty($search)) {
    $facultyQuery .= " WHERE f_fname LIKE '%$search%' OR f_lname LIKE '%$search%'";
}
$facultyResult = $conn->query($facultyQuery);

// Retrieve enrollment information
$enrollQuery = "SELECT * FROM enroll";
if (!empty($search)) {
    $enrollQuery .= " WHERE en_status LIKE '%$search%'";
}
$enrollQuery .= " ORDER BY en_status ASC";
$enrollResult = $conn->query($enrollQuery);
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

<body>
    <div class="white-box">
        <div class="main_content">
            <div class="info">
                <h2 class="head2">Registered Users</h2>
                <a href="WA-ArchiveStudList.php"><button class="cButton">Archive</button></a>
                <form method="GET">
                    <div class="search-form">
                        <input type="text" name="search" placeholder="Search...">
                        <button class="searchButton">Search</button>
                    </div>
                </form>

                <h3 class="header">Users/Parents Information</h3>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>Name of the User/Parent</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($userResult->num_rows === 0) : ?>
                            <tr>
                                <td colspan="2">No information found in Users/Parents Information</td>
                            </tr>
                        <?php else : ?>
                            <?php while ($userRow = $userResult->fetch_assoc()) : ?>
                                <tr>
                                    <td><?php echo $userRow['first_name']; ?> <?php echo $userRow['last_name']; ?></td>
                                    <td>
                                        <a href="WA-ViewDetUser.php?user_id=<?= $userRow["user_id"] ?>">
                                            <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </tbody>
                </table>

                <br>
                <h3 class="header">Preschool Information</h3>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>School Name</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($preschoolResult->num_rows === 0) : ?>
                            <tr>
                                <td colspan="3">No information found in Preschool Information</td>
                            </tr>
                        <?php else : ?>
                            <?php while ($preschoolRow = $preschoolResult->fetch_assoc()) : ?>
                                <tr>
                                    <td><?php echo $preschoolRow['school_name']; ?></td>
                                    <td><?php echo $preschoolRow['status']; ?></td>
                                    <td>
                                        <a href="WA-ViewDetPS.php?ps_id=<?= $preschoolRow["ps_id"] ?>">
                                            <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </tbody>
                </table>

                <br>
                <h3 class="header">Enrollment List</h3>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($enrollResult->num_rows === 0) : ?>
                            <tr>
                                <td colspan="3">No information found in Enrollment List</td>
                            </tr>
                        <?php else : ?>
                            <?php while ($enrollRow = $enrollResult->fetch_assoc()) : ?>
                                <tr>
                                    <td><?php echo $enrollRow['stud_fname']; ?> <?php echo $enrollRow['stud_lname']; ?></td>
                                    <td><?php echo $enrollRow['en_status']; ?></td>
                                    <td>
                                        <a href="WA-ViewDetEN.php?en_id=<?= $enrollRow["en_id"] ?>">
                                            <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </tbody>
                </table>

                <br>
                <h3 class="header">Student Records</h3>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($studentResult->num_rows === 0) : ?>
                            <tr>
                                <td colspan="2">No information found in Student Records</td>
                            </tr>
                        <?php else : ?>
                            <?php while ($studentRow = $studentResult->fetch_assoc()) : ?>
                                <tr>
                                    <td><?php echo $studentRow['stud_fname']; ?> <?php echo $studentRow['stud_lname']; ?></td>
                                    <td>
                                        <a href="WA-ViewDetSR.php?SR_ID=<?= $studentRow["SR_ID"] ?>">
                                            <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </tbody>
                </table>

                <br>
                <h3 class="header">Faculty Records</h3>
                <table class="tblBorder">
                    <thead>
                        <tr>
                            <th>Faculty Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($facultyResult->num_rows === 0) : ?>
                            <tr>
                                <td colspan="2">No information found in Faculty Records</td>
                            </tr>
                        <?php else : ?>
                            <?php while ($facultyRow = $facultyResult->fetch_assoc()) : ?>
                                <tr>
                                    <td><?php echo $facultyRow['f_fname']; ?> <?php echo $facultyRow['f_lname']; ?></td>
                                    <td>
                                        <a href="WA-ViewDetFac.php?faculty_id=<?= $facultyRow["faculty_id"] ?>">
                                            <button><i class="fa-solid fa-eye" style="color: #ffffff;"></i></button>
                                        </a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>
