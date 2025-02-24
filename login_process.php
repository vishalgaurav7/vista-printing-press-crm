<?php
session_start();
require 'db.php';

// License Validation
$query = "SELECT Valid FROM company WHERE id = 1";
try {
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $validDate = $result['Valid'];
} catch (PDOException $e) {
    die("Error fetching valid date: " . $e->getMessage());
}



$currentDate = date('Y-m-d');
if ($validDate < $currentDate) {
    // License is expired
    $_SESSION['license_error'] = true;
    header("Location: login.php");
    exit();
} else {
    // License is valid
    unset($_SESSION['license_error']);
}


// $currentDate = date('Y-m-d');
// if ($validDate > $currentDate) {
//     $_SESSION['license_error'] = true;
//     header("Location: login.php");
//     exit();
// }

// User Login
$username = htmlspecialchars(trim($_POST['user']));
$password = htmlspecialchars(trim($_POST['password']));

$sql = "SELECT * FROM users WHERE username = :username";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->execute();

$user = $stmt->fetch(PDO::FETCH_ASSOC);
if ($user && password_verify($password, $user['password'])) {
    $_SESSION['user_logged_in'] = true;
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['username'] = $user['username'];
    $_SESSION['role'] = $user['role'];

    if ($user['role'] === 'admin') {
        header("Location: admin/admin_dashboard.php");
    } elseif ($user['role'] === 'manager') {
        header("Location: manager/manager_dashboard.php");
    } else {
        header("Location: user/department_dashboard.php");
    }
    exit();
} else {
    $_SESSION['login_error'] = 'Invalid username or password';
    header("Location: login.php");
    exit();
}
?>
