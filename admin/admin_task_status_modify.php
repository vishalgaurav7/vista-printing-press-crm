<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}
require '../db.php';
// Fetch tasks that are not completed
try {
    $stmt = $conn->prepare("SELECT task_id, client_name, task_name FROM tasks WHERE status != 'Completed'");
    $stmt->execute();
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching tasks: " . $e->getMessage();
    exit();
}

// Initialize variables
$taskId = null;
$task = null;
$subTasks = [];
$allSubTasksCompleted = false;

// Fetch task details and associated sub-tasks status if a task is selected
if (isset($_POST['task_id']) && $_POST['task_id'] != '') {
    $taskId = $_POST['task_id'];

    try {
        // Fetch the main task details
        $stmt = $conn->prepare("SELECT * FROM tasks WHERE task_id = :task_id");
        $stmt->bindParam(':task_id', $taskId, PDO::PARAM_INT);
        $stmt->execute();
        $task = $stmt->fetch(PDO::FETCH_ASSOC);

        // Fetch all sub-tasks for the selected task and their status
        $stmt = $conn->prepare("SELECT * FROM sub_tasks WHERE main_task_id = :task_id");
        $stmt->bindParam(':task_id', $taskId, PDO::PARAM_INT);
        $stmt->execute();
        $subTasks = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Check if all sub-tasks are completed
        $allSubTasksCompleted = true;
        foreach ($subTasks as $subTask) {
            if ($subTask['status'] != 'Completed') {
                $allSubTasksCompleted = false;
                break;
            }
        }

        // If all sub-tasks are completed, provide the option to mark the main task as completed
        
        if ($allSubTasksCompleted) {
            if (isset($_POST['mark_complete'])) {
                try {
                    // Update the task to 'Completed'
                    $stmt = $conn->prepare("UPDATE tasks SET status = 'Completed', completed_at = NOW() WHERE task_id = :task_id");
                    $stmt->bindParam(':task_id', $taskId, PDO::PARAM_INT);
                    $stmt->execute();
        
                    // Redirect to reset the dropdown and form
                    $_SESSION['message'] = "Task marked as completed successfully!";
                    header("Location: admin_task_status_modify.php"); // Update the file name if necessary
                    exit();
                } catch (PDOException $e) {
                    echo "Error updating task status: " . $e->getMessage();
                }
            }
        }
        

    } catch (PDOException $e) {
        echo "Error fetching task or sub-task status: " . $e->getMessage();
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" data-layout="topnav"> -->

<head>
    <meta charset="utf-8" />
    <title>Dashboard | Uplon - Responsive Bootstrap 5 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- Vendor css -->
    <link href="../assets/css/vendor.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- App css -->
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <!-- Theme Config Js -->
    <script src="../assets/js/config.js"></script>
    <style>
        .app-topbar .topbar-menu {
    flex-flow: row-reverse !important;
}
    </style>
</head>

<body class="globle-page">
  
     

         <!-- Topbar Start -->
<header class="app-topbar-main">
<?php include 'admin_header.php'; ?>
</header>

        

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <div class="page-content">

            <div class="page-container"></div>

            <h2 style="align-self: center;">Submit / Complete Task</h2>
<!-- HTML Form to display tasks in a dropdown and mark the main task as completed -->
<form method="POST" action="">
    <label for="task_id">Select Task ID:</label>
    <select name="task_id" id="task_id" onchange="this.form.submit()">
        <option value="">-- Select a Task --</option>
        <?php 
        // Display the tasks in the dropdown (only tasks that are not completed)
        foreach ($tasks as $taskItem):
        ?>
            <option value="<?= $taskItem['task_id']; ?>" <?= isset($taskId) && $taskId == $taskItem['task_id'] ? 'selected' : ''; ?>>
                <?= $taskItem['task_id'] . ' - ' . $taskItem['client_name'] . " - " . $taskItem['task_name']; ?>
            </option>
        <?php endforeach; ?>
    </select>
</form>

<?php if (isset($task)): ?>
    <!-- Display task details -->
    <h2>Task Details</h2>
    <p><strong>Task ID:</strong> <?= $task['task_id']; ?></p>
    <p><strong>Client Name:</strong> <?= $task['client_name']; ?></p>
    <p><strong>Client Email:</strong> <?= $task['client_email']; ?></p>
    <p><strong>Client Address:</strong> <?= $task['client_address']; ?></p>
    <p><strong>Date of Order:</strong> <?= $task['date_of_order']; ?></p>
    <p><strong>Delivery Date:</strong> <?= $task['delivery_date']; ?></p>
    <p><strong>Task Status:</strong> <?= $task['status']; ?></p>

    <!-- Display sub-tasks with all fields -->
    <h3>Sub-Tasks:</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Sub-Task ID</th>
                <th>Main Task ID</th>
                <th>Assigned To</th>
                <th>Description</th>
                <th>Status</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Delivery Date</th>
                <th>Assigned Department</th>
                <th>Completed At</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($subTasks as $subTask): ?>
            <tr>
                <td><?= $subTask['sub_task_id']; ?></td>
                <td><?= $subTask['main_task_id']; ?></td>
                <td><?= $subTask['assigned_to']; ?></td>
                <td><?= $subTask['description']; ?></td>
                <td><?= $subTask['status']; ?></td>
                <td><?= $subTask['created_at']; ?></td>
                <td><?= $subTask['updated_at']; ?></td>
                <td><?= $subTask['delivery_date']; ?></td>
                <td><?= $subTask['assigned_to_department']; ?></td>
                <td><?= $subTask['completed_at']; ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Option to complete the main task if all sub-tasks are completed -->
    <?php if ($allSubTasksCompleted): ?>
        <form method="POST" action="">
            <input type="hidden" name="task_id" value="<?= $task['task_id']; ?>">
            <button type="submit" name="mark_complete">Mark Task as Completed</button>
        </form>
    <?php else: ?>
        <p style ="color:red;">Cannot mark the task as completed because there are pending sub-tasks.</p>
    <?php endif; ?>
<?php endif; ?>

<script>
    <script>
    window.onload = function() {
        // Check if the page was redirected after marking the task complete
        if (!window.location.search.includes("task_id")) {
            // Reset the dropdown and hide task details
            const taskDropdown = document.getElementById('task_id');
            const taskDetails = document.querySelector('.task-details');
            if (taskDropdown) taskDropdown.value = '-- Select a Task --'; // Reset dropdown
            if (taskDetails) taskDetails.style.display = 'none'; // Hide details
        }
    };
</script>
</script>
</div> <!-- end row -->
        
        </div> <!-- container -->

    
    
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>

</html>