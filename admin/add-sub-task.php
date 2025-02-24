<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';




// Fetch tasks excluding completed ones
try {
    $stmt = $conn->prepare("SELECT task_id, client_name, task_name FROM tasks WHERE status != 'Completed'");
    $stmt->execute();
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching tasks: " . $e->getMessage();
    exit();
}

// Check if tasks are fetched
if (empty($tasks)) {
    echo "No main tasks available.";
    exit();
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

            <div class="page-container">
            
   
   <?php
// Fetch data for dropdowns
$departments = $conn->query("SELECT * FROM departments")->fetchAll(PDO::FETCH_ASSOC);
$users = $conn->query("SELECT id, username FROM users")->fetchAll(PDO::FETCH_ASSOC);
?>

<h1>Assign Sub-Task with Deadline</h1>
<form action="../sub-task-process.php" method="POST">
<div class="task-cnt">
<div class = "form-group w50"> 
    <label for="main_task">Main Task:</label>
    <select name="main_task_id" id="main_task" required>
        <option value="">Select Main Task</option>
        <?php foreach ($tasks as $task): ?>
            <option value="<?= htmlspecialchars($task['task_id']); ?>">
                <?= htmlspecialchars($task['task_id'] . " - " . $task['client_name']. " - " . $task['task_name']); ?>
            </option>
        <?php endforeach; ?>
    </select>
    </div>
    <br/>
    <div class = "form-group w50">
    
        <label for="description">Sub-Task Description:</label>
        <textarea name="description" id="description" rows="4" required></textarea>
    </div>
        <br/>
    <div class = "form-group w50">
        <label for="delivery_date">Delivery Date:</label>
        <input type="date" name="delivery_date" id="delivery_date" required>
    </div>
    <br/>
    <div class = "form-group w50">
    <label for="assigned_to_department">Assign to Department:</label>
    <select name="assigned_to_department" id="assigned_to_department" onchange="fetchUsersByDepartment()" required>
        <option value="">Select Department</option>
        <?php foreach ($departments as $department): ?>
            <option value="<?= htmlspecialchars($department['department_id']); ?>">
                <?= htmlspecialchars($department['name']); ?>
            </option>
        <?php endforeach; ?>
    </select>
    </div>
    <br/>
    <div class = "form-group w50">
            <label for="assigned_to">Assign to User:</label>
    <select name="assigned_to" id="assigned_to" required>
        <option value="">Select User</option>
        <!-- Users will be dynamically populated here -->
    </select>
</div>
<br/>
    <button type="submit">Assign Sub-Task</button>
    </div>
</form>

<script>
    function fetchUsersByDepartment() {
        const departmentId = document.getElementById('assigned_to_department').value;
        const assignedToDropdown = document.getElementById('assigned_to');

        // Clear existing options
        assignedToDropdown.innerHTML = '<option value="">Select User</option>';

        if (departmentId) {
            fetch(`../fetch_users.php?department_id=${departmentId}`)
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        data.users.forEach(user => {
                            const option = document.createElement('option');
                            option.value = user.id;
                            option.textContent = user.username;
                            assignedToDropdown.appendChild(option);
                        });
                    } else {
                        alert(data.message || 'No users found for the selected department.');
                    }
                })
                .catch(error => console.error('Error fetching users:', error));
        }
    }
</script>

                    </div> <!-- end row -->
        
                </div> <!-- container -->
        
                </div>
        
                <!-- ============================================================== -->
                <!-- End Page content -->
                <!-- ============================================================== -->
        
            </div>
            <!-- END wrapper -->
        
            <!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
        
          
        </body>
        
        </html>