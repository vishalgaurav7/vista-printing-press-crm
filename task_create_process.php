<?php
session_start();
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Validate required fields
        if (empty($_POST['client_name']) || empty($_POST['date_of_order']) || empty($_POST['date_of_delivery'])) {
            $_SESSION['error_message'] = "Please fill all required fields!";
            header("Location: admin/admin_task_create.php");
            exit();
        }

        // Prepare data
        $client_name = trim($_POST['client_name']);
        $client_mobile = trim($_POST['client_mobile']);
        $client_email = trim($_POST['client_email']);
        $client_address = trim($_POST['client_address']);
        $date_of_order = trim($_POST['date_of_order']);
        $date_of_delivery = trim($_POST['date_of_delivery']);
        $task_name = trim($_POST['task_name']);
        $order_quantity = trim($_POST['order_quantity']);
        $paper_quality = trim($_POST['paper_quality']);
        $paper_size = trim($_POST['paper_size']);
        $paper_gsm = intval($_POST['paper_gsm']);
        $paper_quantity = intval($_POST['paper_quantity']);
        $plate_type = trim($_POST['plate_type']);
        $cutting_size = trim($_POST['cutting_size']);
        $cutting_size_quantity = intval($_POST['cutting_size_quantity']);
        $printing_type = trim($_POST['printing_type']);
        $color = trim($_POST['color']);
        $lamination = trim($_POST['lamination']);
        $uv = trim($_POST['uv']);
        $emboss = trim($_POST['emboss']);
        $punching = trim($_POST['punching']);
        $other_info = trim($_POST['other_info']);
        $creator_name = $_SESSION['username'];

        // Prepare SQL query
        $stmt = $conn->prepare("
            INSERT INTO tasks (
                client_name, client_mobile, client_email, client_address, date_of_order, 
                delivery_date, task_name, order_quantity, paper_quality, paper_size, paper_gsm, 
                paper_quantity, plate_type, cutting_size, cutting_size_quantity, 
                printing_type, color, lamination_type, notes, status, creator, uv, emboss, punching
            ) VALUES (
                :client_name, :client_mobile, :client_email, :client_address, :date_of_order, 
                :delivery_date, :task_name, :order_quantity, :paper_quality, :paper_size, :paper_gsm, 
                :paper_quantity, :plate_type, :cutting_size, :cutting_size_quantity, 
                :printing_type, :color, :lamination_type, :notes, 'Pending', :creator, :uv, :emboss, :punching
            )
        ");

        // Execute the query
        $stmt->execute([
            ':client_name' => $client_name,
            ':client_mobile' => $client_mobile,
            ':client_email' => $client_email,
            ':client_address' => $client_address,
            ':date_of_order' => $date_of_order,
            ':delivery_date' => $date_of_delivery,
            ':task_name' => $task_name,
            ':order_quantity' => $order_quantity,
            ':paper_quality' => $paper_quality,
            ':paper_size' => $paper_size,
            ':paper_gsm' => $paper_gsm,
            ':paper_quantity' => $paper_quantity,
            ':plate_type' => $plate_type,
            ':cutting_size' => $cutting_size,
            ':cutting_size_quantity' => $cutting_size_quantity,
            ':printing_type' => $printing_type,
            ':color' => $color,
            ':lamination_type' => $lamination,
            ':notes' => $other_info,
            ':creator' => $creator_name,
            ':uv' => $uv,
            ':emboss' => $emboss,
            ':punching' => $punching
        ]);

        // Get the last inserted task ID
        $task_id = $conn->lastInsertId();

        // Redirect to the appropriate sub-task creation page based on user role
        switch ($_SESSION['role']) {
            case 'admin':
                header("Location: admin/admin-add-sub-task-batch.php?task_id=" . $task_id);
                break;
            case 'manager':
                header("Location: manager/manager-add-sub-task-batch.php?task_id=" . $task_id);
                break;
            case 'department':
                header("Location: user/user-add-sub-task-batch.php?task_id=" . $task_id);
                break;
            default:
                session_destroy();
                header("Location: login.php");
                break;
        }
        exit();

    } catch (PDOException $e) {
        // Handle database errors
        $_SESSION['error_message'] = "Database error: " . $e->getMessage();
        header("Location: admin_task_create.php");
        exit();
    }
} else {
    // Redirect if accessed without POST method
    header("Location: admin_task_create.php");
    exit();
}
?>
