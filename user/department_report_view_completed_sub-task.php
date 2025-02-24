<?php
session_start();
$userId = $_SESSION['user_id']; // Assuming the user ID is stored in the session

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'department') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

// Fetch sub-tasks assigned to the logged-in user, excluding "Completed"
try {
    $stmt = $conn->prepare("
        SELECT st.sub_task_id, st.main_task_id, st.description, st.delivery_date, st.completed_at, st.status, t.client_name, t.task_name 
        FROM sub_tasks st 
        JOIN tasks t ON st.main_task_id = t.task_id
        WHERE st.status = 'Completed' AND st.assigned_to = :user_id
    ");
    $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
    $stmt->execute();
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
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

    <style>
        #status {
    width: auto !important;
    height: auto !important;
    position: relative !important;
    left: 0% !important;
    top: 0% !important;
    margin: 0 !important;
    display: block !important;
}
textarea {
    width: 100%;
}
    </style>
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
            <div class="container mt-5">
        <h1>My Completed Tasks</h1>

        <?php if (count($tasks) > 0): ?>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Task</th>
                        <th>Task Name</th>
                        <th>Description</th>
                        <th>Completed At</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($tasks as $task): ?>
                        <tr>
                            <td><?= htmlspecialchars($task['sub_task_id']); ?></td>
                            <td><?= htmlspecialchars($task['main_task_id']); ?></td>
                            <td><?= htmlspecialchars($task['task_name']); ?></td>
                            <td><?= htmlspecialchars($task['description']); ?></td>
                            <td><?= htmlspecialchars($task['completed_at']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No completed tasks found.</p>
        <?php endif; ?>
    </div>

  
    </div>
</div>


   
  <!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
        
        </body>
        
        </html>