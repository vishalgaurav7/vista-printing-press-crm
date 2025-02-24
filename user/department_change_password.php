<?php
session_start();
$userId = $_SESSION['user_id']; // Assuming the user ID is stored in the session

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'department') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

$userId = $_SESSION['user_id']; // Assuming session stores logged-in user's ID

$sql = "SELECT id, username, email FROM users WHERE id = :id";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':id', $userId);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    die("User not found.");
}


if (isset($_POST['change_password'])) {
    $userId = $_POST['user_id'];
    $currentPassword = $_POST['current_password'];
    $newPassword = $_POST['new_password'];
    $confirmPassword = $_POST['confirm_password'];

    if ($newPassword !== $confirmPassword) {
        die("Passwords do not match.");
    }

    // Fetch the user's current password hash
    $sql = "SELECT password FROM users WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $userId);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$user || !password_verify($currentPassword, $user['password'])) {
        die("Current password is incorrect.");
    }

    // Hash the new password and update it
    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
    $updateSql = "UPDATE users SET password = :password WHERE id = :id";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bindParam(':password', $hashedPassword);
    $updateStmt->bindParam(':id', $userId);
    $updateStmt->execute();

    echo '<script>alert("Password updated Sucessfully!")</script>';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Dashboard | printing Press CRM - Voniix Software</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured Printing Press CRM to Maintain Everything" name="description" />
    <meta content="Coderthemes" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- Vendor css -->
    <!-- <link href="../assets/css/vendor.min.css" rel="stylesheet" type="text/css" /> -->
    <link href="../assets/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- App css -->
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <!-- Theme Config Js -->
    <script src="../assets/js/config.js"></script>
    <style>
        #status {
    width: auto !important;
    height: auto !important;
    position: relative !important;
    left: 0% !important;
    top: 0% !important;
    margin: 0 !important;
}
textarea {
    width: 100%;
}
    </style>
</head>

<body class="globle-page">
<header class="app-topbar-main">
<?php include 'user_header.php'; ?>
</header>
        

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <div class="page-content">
            <div class="page-container">
            <div class="container mt-5">
        <h1>Change Password</h1>
        <form id="change-password-form" method="POST" action="department_change_password.php">
            <input type="hidden" name="user_id" value="<?= $user['id']; ?>" />
            <label for="current_password">Current Password:</label><br />
            <input type="password" name="current_password" id="current_password" required /><br /><br />

            <label for="new_password">New Password:</label><br />
            <input type="password" name="new_password" id="new_password" required /><br /><br />

            <label for="confirm_password">Confirm New Password:</label><br />
            <input type="password" name="confirm_password" id="confirm_password" required /><br /><br />

            <button type="submit" name="change_password">Change Password</button>
        </form>
    </div>

    <script src="../assets/js/app.js"></script>
</div>
</div>
        
           <!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
        
        </body>
        
        </html>