<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';


// Initialize variables for filters
$orderDateFrom = isset($_POST['order_date_from']) ? $_POST['order_date_from'] : '';
$orderDateTo = isset($_POST['order_date_to']) ? $_POST['order_date_to'] : '';
$deliveryDateFrom = isset($_POST['delivery_date_from']) ? $_POST['delivery_date_from'] : '';
$deliveryDateTo = isset($_POST['delivery_date_to']) ? $_POST['delivery_date_to'] : '';


// Build query with filters
$query = "SELECT task_id, client_name, task_name, date_of_order AS order_date, delivery_date, status
          FROM tasks
          WHERE status != 'Completed'"; // Exclude completed tasks

$params = [];

// Add filters for order date range
if (!empty($orderDateFrom)) {
    $query .= " AND date_of_order >= :order_date_from";
    $params[':order_date_from'] = $orderDateFrom;
}

if (!empty($orderDateTo)) {
    $query .= " AND date_of_order <= :order_date_to";
    $params[':order_date_to'] = $orderDateTo;
}

// Add filters for delivery date range
if (!empty($deliveryDateFrom)) {
    $query .= " AND delivery_date >= :delivery_date_from";
    $params[':delivery_date_from'] = $deliveryDateFrom;
}

if (!empty($deliveryDateTo)) {
    $query .= " AND delivery_date <= :delivery_date_to";
    $params[':delivery_date_to'] = $deliveryDateTo;
}

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
<h1>View All Runing Tasks</h1>

<!-- Filter Form -->
<form method="POST" action="">
    <label for="order_date_from">Order Date (From):</label>
    <input type="date" name="order_date_from" id="order_date_from" value="<?= htmlspecialchars($orderDateFrom); ?>">

    <label for="order_date_to">Order Date (To):</label>
    <input type="date" name="order_date_to" id="order_date_to" value="<?= htmlspecialchars($orderDateTo); ?>">

    <label for="delivery_date_from">Delivery Date (From):</label>
    <input type="date" name="delivery_date_from" id="delivery_date_from" value="<?= htmlspecialchars($deliveryDateFrom); ?>">

    <label for="delivery_date_to">Delivery Date (To):</label>
    <input type="date" name="delivery_date_to" id="delivery_date_to" value="<?= htmlspecialchars($deliveryDateTo); ?>">

    <button type="submit">Filter</button>
</form>

<!-- Main Tasks Table -->
<h2>Main All Runing Tasks</h2>
<?php if (empty($tasks)): ?>
    <p>No tasks found for the selected filters.</p>
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
        // Compare delivery date with today's date
        $dueDate = new DateTime($task['delivery_date']);
        $today = new DateTime();
        $isOverdue = $dueDate < $today;
        ?>
        <tr style="<?= $isOverdue ? 'background-color: #ffcccc;' : ''; ?>"> <!-- Mark row red if overdue -->
            <td><?= htmlspecialchars($task['task_id']); ?></td>
            <td><?= htmlspecialchars($task['client_name']); ?></td>
            <td><?= htmlspecialchars($task['task_name']); ?></td>
            <td><?= htmlspecialchars($task['order_date']); ?></td>
            <td><?= htmlspecialchars($task['delivery_date']); ?></td>
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