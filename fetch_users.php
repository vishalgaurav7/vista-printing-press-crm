<?php
require 'db.php';

header('Content-Type: application/json');

if (isset($_GET['department_id'])) {
    $departmentId = $_GET['department_id'];

    try {
        $stmt = $conn->prepare("SELECT id, username FROM users WHERE department_id = :department_id");
        $stmt->bindParam(':department_id', $departmentId, PDO::PARAM_INT);
        $stmt->execute();
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($users) {
            echo json_encode(['success' => true, 'users' => $users]);
        } else {
            echo json_encode(['success' => false, 'message' => 'No users found for the selected department.']);
        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Error fetching users: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Department ID is required.']);
}
?>
