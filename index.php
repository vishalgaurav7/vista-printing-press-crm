<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {

    header("Location: login.php");
    exit();
}

// Redirect based on user role
switch ($_SESSION['role']) {
    case 'admin':
        header("Location: admin/admin_dashboard.php");
        break;
    case 'manager':
        header("Location: manager/manager_dashboard.php");
        break;
    case 'department':
        header("Location: user/department_dashboard.php");
        break;
    default:
        session_destroy();
        header("Location: login.php");
        break;
}

exit();
?>