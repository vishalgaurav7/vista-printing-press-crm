<?php
session_start();
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Validate required fields
        if (empty($_POST['client_name']) || empty($_POST['date_of_order']) || empty($_POST['date_of_delivery'])) {
            $_SESSION['error_message'] = "Please fill all required fields!";
            header("Location: task_create.php");
            exit();
        }

        // Prepare data
        $client_name = trim($_POST['client_name']);
        $client_mobile = trim($_POST['client_mobile']);
        $client_email = trim($_POST['client_email']);
        $client_address = trim($_POST['client_address']);
        $date_of_order = trim($_POST['date_of_order']);
        $date_of_delivery = trim($_POST['date_of_delivery']);
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

        $stmt = $conn->prepare("
    INSERT INTO tasks (
        client_id, client_name, client_mobile, client_email, client_address, date_of_order, 
        delivery_date, paper_quality, paper_size, paper_gsm, 
        paper_quantity, plate_type, cutting_size, cutting_size_quantity, 
        printing_type, color, lamination_type, notes, status, creator, uv, emboss, punching
    ) VALUES (
        :client_id, :client_name, :client_mobile, :client_email, :client_address,:date_of_order, 
        :delivery_date, :paper_quality, :paper_size, :paper_gsm, 
        :paper_quantity, :plate_type, :cutting_size, :cutting_size_quantity, 
        :printing_type, :color, :lamination_type, :notes, 'Pending', :creator, :uv, :emboss, :punching
    )
");

// Sample data array
$data = [
    ':client_id' => $client_id,  // You'll need to map client_name to client_id if needed
    ':client_name' => $client_name,
    ':client_mobile' => $client_mobile,
    ':client_email' => $client_email,
    ':client_address' => $client_address,
    ':date_of_order' => $date_of_order,
    ':delivery_date' => $date_of_delivery,
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
    ':uv' => $uv,
    ':emboss' => $emboss,
    ':punching' => $punching,
    ':notes' => $other_info,
    ':creator' => $creator_name  // Logged-in user

];

try {
    $stmt->execute($data);
    echo "Task created successfully!";
} catch (PDOException $e) {
    echo "Error while adding task: " . $e->getMessage();
}

        
        $_SESSION['success_message'] = "Task created successfully!";
        switch ($_SESSION['role']) {
            case 'admin':
                header("Location: admin/admin_task_create.php");
                break;
            case 'manager':
                header("Location: manager/admin_task_create.php");
                break;
            case 'department':
                header("Location: user/admin_task_create.php");
                break;
            default:
                session_destroy();
                header("Location: login.php");
                break;
        }
        exit();
    } catch (PDOException $e) {
        $_SESSION['error_message'] = "Database error: " . $e->getMessage();
        header("Location: task_create.php");
        exit();
    }
} else {
    header("Location: task_create.php");
    exit();
}
