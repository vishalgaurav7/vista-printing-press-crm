<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {
    header("Location: login.php");
    exit();
}

require 'db.php'; // Include your database connection file

// Get data from the form
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$role = $_POST['role'];
$department_id = isset($_POST['department_id']) && $_POST['department_id'] !== "" ? $_POST['department_id'] : null;

// Debugging - check POST data
echo "<pre>";
print_r($_POST); // Check if department_id is being submitted
echo "</pre>";

// If the user is creating a "Department" role, ensure the department ID is provided
if ($role == 'department' && !$department_id) {
    echo "Please select a department.";
    exit();
}

// Check if the username or email already exists in the database
$sql = "SELECT * FROM users WHERE username = :username OR email = :email";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->bindParam(':email', $email);
$stmt->execute();

$user = $stmt->fetch(PDO::FETCH_ASSOC);

if ($user) {
    // User already exists
    echo "Username or email already exists. Please choose a different one.";
    exit();
}

// Hash the password for security
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Insert the new user into the database
$sql = "INSERT INTO users (username, email, password, role, department_id) 
        VALUES (:username, :email, :password, :role, :department_id)";
$stmt = $conn->prepare($sql);

// Bind parameters and execute the query
$stmt->bindParam(':username', $username);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':password', $hashed_password);
$stmt->bindParam(':role', $role);
$stmt->bindParam(':department_id', $department_id, PDO::PARAM_INT); // Ensure it's treated as INT, even if NULL

// Execute the query and redirect
if ($stmt->execute()) {
    // Redirect based on the user's role
    switch ($_SESSION['role']) {
        case 'admin':
            header("Location: admin/admin_user_create.php");
            break;
        case 'manager':
            header("Location: manager/manager_dashboard.php");
            break;
        case 'department':
            header("Location: user/user_dashboard.php");
            break;
        default:
            session_destroy();
            header("Location: login.php");
            break;
    }

    exit();
} else {
    echo "Failed to create user.";
}
?>
