<?php
// Include necessary files and initialize database connection
require '../include/Connection.php';
require 'include/PHPMailer/src/PHPMailer.php';
require 'include/PHPMailer/src/SMTP.php';
require 'include/PHPMailer/src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

session_start();
$conn = getDB();

// Function to send email
function sendReminderEmail($email, $dueDate) {
    // Instantiate PHPMailer
    $mail = new PHPMailer();
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;          // Enable SMTP authentication
    $mail->Username = 'Tinytotsphorg@gmail.com';   // SMTP username
    $mail->Password = 'vgka flzq pgsv uegy';   // SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption, `ssl` also accepted
    $mail->Port = 587;  // TCP port to connect to

    // Set email parameters
    $mail->setFrom('Tinytotsphorg@gmail.com', 'TinyTots');
    $mail->addAddress($email);     // Add recipient

    $mail->isHTML(true);  // Set email format to HTML
    $mail->Subject = 'Reminder: Your Due Date is Approaching';
    $mail->Body = "Dear User,<br><br>Your due date is approaching. Please take necessary actions.<br><br>Due Date: $dueDate<br><br>Regards,<br>TinyTots.";

    // Send email
    if ($mail->send()) {
        echo "Reminder email sent successfully to $email";
    } else {
        echo "Failed to send reminder email to $email";
        echo "Error: " . $mail->ErrorInfo;
    }
}

// Get users whose due date is near (e.g., within 3 days)
$reminderDays = 3; // Change this value as needed
$currentDate = date('Y-m-d');
$dueDateThreshold = date('Y-m-d', strtotime("+$reminderDays days", strtotime($currentDate)));

$sql = "SELECT email, deadline FROM payment join users on payment.user_id = users.user_id
 WHERE deadline <= '$dueDateThreshold'";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // Loop through each user and send reminder email
    while ($row = mysqli_fetch_assoc($result)) {
        $email = $row['email'];
        $dueDate = $row['deadline'];
        sendReminderEmail($email, $dueDate);
    }
} else {
    echo "No users found with due date approaching.";
}
?>
