<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';
  // Function to format the date in dd/mm/yyyy hh:mm tt
  function formatDate($date) {
    if ($date) {
        $dateTime = new DateTime($date);
        return $dateTime->format('d/m/Y h:i A'); // 'A' for AM/PM
    }
    return ''; // Return empty if no date
}

// Get the task ID from the URL
$taskId = isset($_GET['task_id']) ? intval($_GET['task_id']) : null;
$subtasks = [];
$showModal = false;

if ($taskId) {
    try {
        // Fetch all sub-tasks for the given task_id excluding "Completed"
        $stmt = $conn->prepare("
            SELECT 
                st.sub_task_id, 
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
            WHERE st.main_task_id = :task_id AND st.status != 'Completed'
        ");
        $stmt->bindParam(':task_id', $taskId, PDO::PARAM_INT);
        $stmt->execute();
        $subtasks = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($subtasks)) {
            $showModal = true; // Show modal if no sub-tasks found
        }
    } catch (PDOException $e) {
        echo "Error fetching sub-tasks: " . $e->getMessage();
        exit();
    }
} else {
    $showModal = true; // Show modal if task_id is not set
}



// Handle updates
if (isset($_POST['update_subtask'])) {
    $subtaskId = $_POST['subtask_id'];
    $description = $_POST['description'];
    $deliveryDate = $_POST['delivery_date'];
    $status = $_POST['status'];
    $admin_comment = $_POST['admin_comment'];  // Capture admin comment
    $adminupdatedOn = ($admin_comment) ? date('Y-m-d H:i:s') : NULL;  // Set the update timestamp if admin comment is provided
    
    try {
        $stmt = $conn->prepare("
            UPDATE sub_tasks 
            SET description = :description, delivery_date = :delivery_date, status = :status, admin_comment = :admin_comment,
            admin_updated_on = :admin_updated_on
            WHERE sub_task_id = :subtask_id
        ");
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':delivery_date', $deliveryDate);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':admin_comment', $admin_comment);
        $stmt->bindParam(':admin_updated_on', $adminUpdatedOn);
        $stmt->bindParam(':subtask_id', $subtaskId, PDO::PARAM_INT);
        $stmt->execute();
        
        $_SESSION['message'] = "Sub-task updated successfully.";
        
        // Get the main task ID from the subtask to pass it in the redirect URL
        $stmt = $conn->prepare("SELECT main_task_id FROM sub_tasks WHERE sub_task_id = :subtask_id");
        $stmt->bindParam(':subtask_id', $subtaskId, PDO::PARAM_INT);
        $stmt->execute();
        $mainTask = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($mainTask) {
            $main_task_id = $mainTask['main_task_id'];
            // Redirect with the task_id in the URL
            header("Location: admin_update_subtask_after_edit_main_task.php?task_id=" . $main_task_id);
            exit();
        } else {
            $_SESSION['error'] = "Main task not found.";
            header("Location: admin_update_subtask_after_edit_main_task.php");
            exit();
        }
    } catch (PDOException $e) {
        $_SESSION['error'] = "Error updating sub-task: " . $e->getMessage();
    }
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
   

<style>
        #editModal {
            display: none;
            background: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        #editModal .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            width: auto;
        }
    </style>
</head>

<body class="globle-page">
<header class="app-topbar-main">
<?php include 'admin_header.php'; ?>
</header>

        <div class="page-content">
            <div class="page-container">
                <h1 style="justify-self: center;">Manage Update Sub-Tasks</h1>

                <!-- Modal for no sub-tasks or invalid task_id -->
                <?php if ($showModal): ?>
                    <div id="errorModal" style="display: flex; justify-content: center; align-items: center;">
                        <div style="background: #fff; padding: 20px; border-radius: 10px; text-align: center;">
                            <h2>No Sub Tasks for Selected Main Task</h2>
                            <p>or</p>
                            <h2>Main Task not Selected</h2>
                            <p>Please Check Correct Value and Come Again!</p>
                            <button onclick="window.history.back()">Go Back</button>
                        </div>
                    </div>
                <?php else: ?>
                    <!-- Display Sub-Tasks -->
                    <table border="1" cellpadding="10" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Client</th>
                                <th>Task Name</th>
                                <th>Assigned To</th>
                                <th>Department</th>
                                <th>Description</th>
                                <th>Delivery Date</th>
                                <th>Status</th>
                                <th>Comments</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($subtasks as $subtask): ?>
                                <tr>
                                    <td><?= htmlspecialchars($subtask['sub_task_id']); ?></td>
                                    <td><?= htmlspecialchars($subtask['client_name']); ?></td>
                                    <td><?= htmlspecialchars($subtask['task_name']); ?></td>
                                    <td><?= htmlspecialchars($subtask['assigned_to']); ?></td>
                                    <td><?= htmlspecialchars($subtask['department']); ?></td>
                                    <td><?= htmlspecialchars($subtask['description']); ?></td>
                                    <?php
                                // Assuming the 'delivery_date' is a string or datetime object.
                                $deliveryDate = $subtask['delivery_date'];
                                // Convert the delivery date to the desired format (dd/mm/yyyy hh:mm tt).
                                $formattedDeliveryDate = '';
                                if ($deliveryDate) {
                                    // Create a DateTime object from the delivery date and format it.
                                    $dateTime = new DateTime($deliveryDate);
                                    $formattedDeliveryDate = $dateTime->format('d/m/Y h:i A'); // 'A' gives AM/PM
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
                        <td>
                                    <!-- Edit Button -->
                                    <button 
                                        type="button" 
                                        onclick='openEditModal(
                                            <?= json_encode($subtask['sub_task_id']); ?>, 
                                            <?= json_encode($subtask['description']); ?>,
                                            <?= json_encode($subtask['delivery_date']); ?>, 
                                            <?= json_encode($subtask['status']); ?>,
                                            <?= json_encode($subtask['admin_comment']) !== 'null' ? json_encode($subtask['admin_comment']) : '""'; ?>
                                        )'>
                                        Edit
                                    </button>

                                    <!-- Delete Form -->
                                    <form action="admin_update_subtask_after_edit_main_task.php" method="POST" style="display:inline;">
                                        <input type="hidden" name="subtask_id" value="<?= $subtask['sub_task_id']; ?>">
                                        <button type="submit" name="delete_subtask">Delete</button>
                                    </form>
                                </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php endif; ?>



               <!-- Edit Modal -->
               <div id="editModal">
                    <div class = "container">
                        <h2>Edit Sub-Task</h2>
                        <form action="admin_update_subtask_after_edit_main_task.php" method="POST">
                        <div class="task-cnt">
                            <input type="hidden" name="subtask_id" id="editSubtaskId">
                            <div class = "form-group w100">
                                <label for="editDescription">Description:</label>
                                <textarea rows = "5" id="editDescription" name="description"></textarea>
                            </div>
                            <div class = "form-group w48">
                                <label for="editDeliveryDate">Delivery Date:</label>
                                <input type="date" id="editDeliveryDate" name="delivery_date">
                            </div>
                            <div class = "form-group w48">
                                <label for="editStatus">Status:</label>
                                <select id="editStatus" name="status">
                                    <option value="Pending">Pending</option>
                                    <option value="In Progress">In Progress</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancel">Cancel</option>
                                </select>
                            </div>
                             <!-- Admin Comment Section -->
                             <div class = "form-group w100">
                                <label for="adminComment">Admin Comment:</label>
                                <textarea name="admin_comment" id="admin_comment" rows="4"></textarea>
                            </div>
                            <div>
                                <button type="submit" name="update_subtask">Update</button>
                                <button type="button" onclick="closeEditModal()">Cancel</button>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
    </div>
<!-- Javascript -->
 <!-- Javascript -->
 <script>
        function openEditModal(id, description, deliveryDate, status, admin_comment) {

               // Log all the passed data to the console
    // console.log("Subtask ID:", id);
    // console.log("Description:", description);
    // console.log("Delivery Date:", deliveryDate);
    // console.log("Status:", status);
    // console.log("Admin Comment:", admin_comment);
            document.getElementById('editSubtaskId').value = id;
            document.getElementById('editDescription').value = description.replace(/\\r\\n/g, '\n');
            document.getElementById('editDeliveryDate').value = deliveryDate;
            document.getElementById('admin_comment').value = admin_comment || ''; // Set the admin comment dynamicall
            document.getElementById('editStatus').value = status;
            
            document.getElementById('editModal').style.display = 'flex'; // Show modal
        }

        function closeEditModal() {
            document.getElementById('editModal').style.display = 'none'; // Hide modal
        }
    </script>
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>
</html>
