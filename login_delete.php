<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {

    header("Location: login.php");
    exit();
}
require 'db.php';

if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    $sql = "DELETE FROM users WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $userId);

    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'User deleted successfully.']);
    // Redirect based on user role
    switch ($_SESSION['role']) {
        case 'admin':
            header("Location: admin/admin_user_modify.php");
            break;
        case 'manager':
            header("Location: manager/manager_user_modify.php");
            break;
        case 'department':
            header("Location: user/user_user_modify.php");
            break;
        default:
            session_destroy();
            header("Location: login.php");
            break;
    }
    
    exit();
    
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to delete the user.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request.']);
}
?>
