<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';


// Get current date
$currentDate = date('Y-m-d');

// Build query to fetch only overdue tasks
$query = "SELECT task_id, client_name, task_name, date_of_order AS order_date, delivery_date, status
          FROM tasks
          WHERE status != 'Completed' AND delivery_date < :currentDate"; // Exclude completed tasks and show only overdue

$params = [':currentDate' => $currentDate];

try {
    $stmt = $conn->prepare($query);
    $stmt->execute($params);
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching main tasks: " . $e->getMessage();
    exit();
}
?>


<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" data-layout="topnav"> -->

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
    <!-- Topbar Start -->
<header class="app-topbar-main">
<?php include 'admin_header.php'; ?>
</header>

        

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <div class="page-content">

            <div class="page-container">

<body>
<h1>Overdue Tasks</h1>

            <?php if (empty($tasks)): ?>
                <p>No overdue tasks found.</p>
            <?php else: ?>
                <table>
                    <thead>
                        <tr>
                            <th>Task ID</th>
                            <th>Client Name</th>
                            <th>Task Name</th>
                            <th>Order Date</th>
                            <th>Delivery Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tasks as $task): ?>
                            <?php
                            // Convert dates to dd-mm-yyyy format
                            $orderDateFormatted = date('d-m-Y', strtotime($task['order_date']));
                            $deliveryDateFormatted = date('d-m-Y', strtotime($task['delivery_date']));
                            ?>
                            <tr style="background-color: #ffcccc;"> <!-- Mark row red for overdue -->
                                <td><?= htmlspecialchars($task['task_id']); ?></td>
                                <td><?= htmlspecialchars($task['client_name']); ?></td>
                                <td><?= htmlspecialchars($task['task_name']); ?></td>
                                <td><?= htmlspecialchars($orderDateFormatted); ?></td>
                                <td><?= htmlspecialchars($deliveryDateFormatted); ?></td>
                                <td><?= htmlspecialchars($task['status']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
    </div> <!-- end row -->
        
        </div> <!-- container -->
   
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>

</html>