<?php
// register_user.php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $role = $_POST['role'];
    $department_id = $_POST['department_id'] ?: null;

    $sql = "INSERT INTO users (username, password, role, department_id) VALUES (:username, :password, :role, :department_id)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $password);
    $stmt->bindParam(':role', $role);
    $stmt->bindParam(':department_id', $department_id);

    if ($stmt->execute()) {
        echo "User registered successfully!";
    } else {
        echo "Failed to register user.";
    }
}
?>
