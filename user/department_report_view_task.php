<?php
session_start();
$userId = $_SESSION['user_id']; // Assuming the user ID is stored in the session

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'department') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

// Handle deletion
if (isset($_POST['delete_subtask'])) {
    $subtaskId = $_POST['subtask_id'];
    try {
        $stmt = $conn->prepare("DELETE FROM sub_tasks WHERE sub_task_id = :subtask_id");
        $stmt->bindParam(':subtask_id', $subtaskId, PDO::PARAM_INT);
        $stmt->execute();
        $_SESSION['message'] = "Sub-task deleted successfully.";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Error deleting sub-task: " . $e->getMessage();
    }
    header("Location: department_dashboard.php");
    exit();
}

                                    // Function to format the date in dd/mm/yyyy hh:mm tt
                                    function formatDate($date) {
                                        if ($date) {
                                            $dateTime = new DateTime($date);
                                            return $dateTime->format('d/m/Y h:i A'); // 'A' for AM/PM
                                        }
                                        return ''; // Return empty if no date
                                    }
                                    
// Handle updates
if (isset($_POST['update_subtask'])) {
    $subtaskId = $_POST['subtask_id'];
    $description = $_POST['description'];
    $deliveryDate = $_POST['delivery_date'];
    $status = $_POST['status'];
    $user_comment = $_POST['user_comment'];  // Capture admin comment
    $userUpdatedOn = ($user_comment) ? date('Y-m-d H:i:s') : NULL;  // Set the update timestamp if admin comment is provided
    try {
        $stmt = $conn->prepare("
            UPDATE sub_tasks 
            SET description = :description, delivery_date = :delivery_date, status = :status,  user_comment = :user_comment,
    user_updated_on = :user_updated_on
         WHERE sub_task_id = :subtask_id 
        ");
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':delivery_date', $deliveryDate);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':user_comment', $user_comment);
        $stmt->bindParam(':user_updated_on', $userUpdatedOn);
        $stmt->bindParam(':subtask_id', $subtaskId, PDO::PARAM_INT);
        $stmt->execute();
        $_SESSION['message'] = "Sub-task updated successfully.";
    } catch (PDOException $e) {
        $_SESSION['error'] = "Error updating sub-task: " . $e->getMessage();
    }
    header("Location: department_dashboard.php");
    exit();
}

// Fetch all sub-tasks excluding "Completed"
try {
    $subtasks = $conn->query("
        SELECT 
            st.sub_task_id, 
            st.main_task_id,
            st.description, 
            st.delivery_date, 
            st.status, 
            t.client_name, 
            t.task_name, 
            u.username AS assigned_to, 
            d.name AS department,
            st.admin_comment, 
            st.admin_updated_on,
            st.manager_comment, 
            st.manager_updated_on,
            st.user_comment, 
            st.user_updated_on 

        FROM sub_tasks st 
        JOIN tasks t ON st.main_task_id = t.task_id
        LEFT JOIN users u ON st.assigned_to = u.id
        LEFT JOIN departments d ON st.assigned_to_department = d.department_id
        WHERE st.status != 'Completed' AND st.assigned_to = $userId 
    ")->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching sub-tasks: " . $e->getMessage();
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Dashboard | printing Press CRM - Voniix Software</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured Printing Press CRM to Maintain Everything" name="description" />
    <meta content="Coderthemes" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- Vendor css -->
    <!-- <link href="../assets/css/vendor.min.css" rel="stylesheet" type="text/css" /> -->
    <link href="../assets/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- App css -->
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <!-- Theme Config Js -->
    <script src="../assets/js/config.js"></script>
   
</head>

<body class="globle-page">
<header class="app-topbar-main">
<?php include 'user_header.php'; ?>
</header>

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <div class="page-content">
            <div class="page-container">
                <h1 style="justify-self: center;">View Pending Tasks</h1>

                <!-- Display Messages -->
                <?php if (isset($_SESSION['message'])): ?>
                    <div class="success"><?= $_SESSION['message']; unset($_SESSION['message']); ?></div>
                <?php endif; ?>

                <?php if (isset($_SESSION['error'])): ?>
                    <div class="error"><?= $_SESSION['error']; unset($_SESSION['error']); ?></div>
                <?php endif; ?>

                <!-- Table to Display Sub-Tasks -->
                <table border="1" cellpadding="10" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                             <th>Task</th> 
                            <th>Task Name</th>
                            <!-- <th>Assigned To</th> -->
                            <!-- <th>Department</th> -->
                            <th>Description</th>
                            <th>Delivery Date</th>
                            <th>Status</th>
                            <th>Comments</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($subtasks as $subtask): ?>
                            <tr>
                                <td><?= htmlspecialchars($subtask['sub_task_id']); ?></td>
                                 <td><?= htmlspecialchars($subtask['main_task_id']); ?></td> 
                                <td><?= htmlspecialchars($subtask['task_name']); ?></td>
                                <!-- <td><?= htmlspecialchars($subtask['assigned_to']); ?></td> -->
                                <!-- <td><?= htmlspecialchars($subtask['department']); ?></td> -->
                                <td><?= htmlspecialchars($subtask['description']); ?></td>
                                <?php
                                // Assuming the 'delivery_date' is a string or datetime object.
                                $deliveryDate = $subtask['delivery_date'];
                                // Convert the delivery date to the desired format (dd/mm/yyyy hh:mm tt).
                                $formattedDeliveryDate = '';
                                if ($deliveryDate) {
                                    // Create a DateTime object from the delivery date and format it.
                                    $dateTime = new DateTime($deliveryDate);
                                    $formattedDeliveryDate = $dateTime->format('d/m/Y'); // 'A' gives AM/PM
                                }
                                ?>
                                <td><?= htmlspecialchars($formattedDeliveryDate); ?></td>
                              
                                <td><?= htmlspecialchars($subtask['status']); ?></td>
                                <td>
                                

                                    <?php if ($subtask['admin_comment']): ?>
                                        <strong>Admin Comment:</strong><br>
                                        <?= htmlspecialchars($subtask['admin_comment']); ?><br>
                                        <strong>Updated On:</strong><br>
                                        <?= formatDate($subtask['admin_updated_on']); ?><br><br>
                                    <?php endif; ?>

                                    <?php if ($subtask['manager_comment']): ?>
                                        <strong>Manager Comment:</strong><br>
                                        <?= htmlspecialchars($subtask['manager_comment']); ?><br>
                                        <strong>Updated On:</strong><br>
                                        <?= formatDate($subtask['manager_updated_on']); ?><br><br>
                                    <?php endif; ?>

                                    <?php if ($subtask['user_comment']): ?>
                                        <strong>User Comment:</strong><br>
                                        <?= htmlspecialchars($subtask['user_comment']); ?><br>
                                        <strong>Updated On:</strong><br>
                                        <?= formatDate($subtask['user_updated_on']); ?><br><br>
                                    <?php endif; ?>    


                               
                            </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>

                

            </div>
        </div>

    
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>
</html>
