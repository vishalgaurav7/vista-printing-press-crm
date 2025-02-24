<?php 
session_start();
$user_role = $_SESSION['role'];
require 'db.php'; 

if (isset($_POST['update_user'])) {
    // Retrieve form data
    $user_id = $_POST['user_id'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $role = $_POST['role'];
    $department_id = ($role === 'department') ? $_POST['department_id'] : NULL;
    $password = $_POST['password'];

    // Update query (make sure it's correct)
    $query = "UPDATE users SET username = ?, email = ?, role = ?, department_id = ?, password = ? WHERE id = ?";
    $stmt = $conn->prepare($query);

    // If password is provided, hash it before updating
    $passwordHash = !empty($password) ? password_hash($password, PASSWORD_DEFAULT) : null;

    // Execute query with the new values
    $stmt->execute([$username, $email, $role, $department_id, $passwordHash, $user_id]);

    // Check if the update was successful
    if ($stmt->rowCount() > 0) {
        
    // Redirect based on role
    if ($user_role === 'admin') {
        header("Location: admin/admin_dashboard.php");
        
    } elseif ($user_role === 'manager') {
         header("Location: manager/manager_user_modify.php");
    } else {
        header("Location: user/department_user_modify.php");
    }
    exit();
       
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update user.']);
    }
}
?>