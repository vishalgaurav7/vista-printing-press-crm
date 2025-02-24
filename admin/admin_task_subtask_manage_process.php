<?php
session_start();
require '../db.php';
// Check if user is logged in
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {

    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get form data
    $task_id = $_POST['task_id'];
    $client_name = $_POST['client_name'];
    $client_mobile = $_POST['client_mobile'];
    $client_email = $_POST['client_email'];
    $client_address = $_POST['client_address'];
    $date_of_order = $_POST['date_of_order'];
    $delivery_date = $_POST['delivery_date'];
    $task_name = trim($_POST['task_name']);
    $order_quantity = intval($_POST['order_quantity']);
    $paper_quality = $_POST['paper_quality'];
    $paper_size = $_POST['paper_size'];
    $paper_gsm = $_POST['paper_gsm'];
    $paper_quantity = $_POST['paper_quantity'];
    $plate_type = $_POST['plate_type'];
    $cutting_size = $_POST['cutting_size'];
    $cutting_size_quantity = $_POST['cutting_size_quantity'];
    $printing_type = $_POST['printing_type'];
    $color = $_POST['color'];
    $lamination_type = $_POST['lamination_type'];
    $uv = $_POST['uv'];
    $emboss = $_POST['emboss'];
    $punching = $_POST['punching'];
    $other_info = $_POST['notes'];

    
    // Prepare the update query
    $stmt = $conn->prepare("UPDATE tasks SET 
        client_name = :client_name,
        client_mobile = :client_mobile,
        client_email = :client_email,
        client_address = :client_address,
        date_of_order = :date_of_order,
        delivery_date = :delivery_date,
        task_name = :task_name,
        order_quantity = :order_quantity,
        paper_quality = :paper_quality,
        paper_size = :paper_size,
        paper_gsm = :paper_gsm,
        paper_quantity = :paper_quantity,
        plate_type = :plate_type,
        cutting_size = :cutting_size,
        cutting_size_quantity = :cutting_size_quantity,
        printing_type = :printing_type,
        color = :color,
        lamination_type = :lamination_type,
        uv = :uv,
        emboss = :emboss,
        punching = :punching,
        notes = :notes
        WHERE task_id = :task_id");

    // Bind parameters
    $stmt->bindParam(':client_name', $client_name);
    $stmt->bindParam(':client_mobile', $client_mobile);
    $stmt->bindParam(':client_email', $client_email);
    $stmt->bindParam(':client_address', $client_address);
    $stmt->bindParam(':date_of_order', $date_of_order);
    $stmt->bindParam(':delivery_date', $delivery_date);
    $stmt->bindParam(':task_name', $task_name);
    $stmt->bindParam(':order_quantity', $order_quantity);
    $stmt->bindParam(':paper_quality', $paper_quality);
    $stmt->bindParam(':paper_size', $paper_size);
    $stmt->bindParam(':paper_gsm', $paper_gsm);
    $stmt->bindParam(':paper_quantity', $paper_quantity);
    $stmt->bindParam(':plate_type', $plate_type);
    $stmt->bindParam(':cutting_size', $cutting_size);
    $stmt->bindParam(':cutting_size_quantity', $cutting_size_quantity);
    $stmt->bindParam(':printing_type', $printing_type);
    $stmt->bindParam(':color', $color);
    $stmt->bindParam(':lamination_type', $lamination_type);
    $stmt->bindParam(':uv', $uv);
    $stmt->bindParam(':emboss', $emboss);
    $stmt->bindParam(':punching', $punching);
    $stmt->bindParam(':notes', $other_info);
    $stmt->bindParam(':task_id', $task_id, PDO::PARAM_INT);
    $main_task_id = $task_id = $_POST['task_id'];
    // Execute the query
    if ($stmt->execute()) {
        echo "Task updated successfully!";
        switch ($_SESSION['role']) {
            case 'admin':

                
                // Redirect with the task_id in the URL
                header("Location: admin_task_subtask_manage.php?task_id=" . $main_task_id);

                // header("Location: admin/admin_task_modify.php");
                break;
            case 'manager':
                // header("Location: manager/manager_task_modify.php");
                header("Location: manager/manager_task_subtask_manage.php?task_id=" . $main_task_id);
                break;
            case 'department':
                // header("Location: user/user_task_modify.php");
                header("Location: user/user_task_subtask_manage.php?task_id=" . $main_task_id);
                break;
            default:
                session_destroy();
                header("Location: login.php");
                break;
        }
        exit();
    } else {
        echo "Error updating task.";
    }
}
