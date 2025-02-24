<?php
require 'db.php';

if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    $sql = "SELECT id, username, email, role FROM users WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $userId);
    $stmt->execute();

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        echo json_encode(['success' => true, 'user' => $user]);
    } else {
        echo json_encode(['success' => false, 'message' => 'User not found.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request.']);
}
