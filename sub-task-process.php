<?php
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $main_task_id = $_POST['main_task_id'];
    $description = $_POST['description'];
    $delivery_date = $_POST['delivery_date'];
    $assigned_to_department = $_POST['assigned_to_department'];
    $assigned_to = $_POST['assigned_to'];

    try {
        $stmt = $conn->prepare("INSERT INTO sub_tasks (main_task_id, description, delivery_date, assigned_to_department, assigned_to) 
                                VALUES (:main_task_id, :description, :delivery_date, :assigned_to_department, :assigned_to)");
        $stmt->bindParam(':main_task_id', $main_task_id);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':delivery_date', $delivery_date);
        $stmt->bindParam(':assigned_to_department', $assigned_to_department);
        $stmt->bindParam(':assigned_to', $assigned_to);
        $stmt->execute();

        echo "Sub-task assigned successfully!";
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
