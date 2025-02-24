<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';


// Initialize variables for filters
$deliveryDateFrom = isset($_POST['delivery_date_from']) ? $_POST['delivery_date_from'] : '';
$deliveryDateTo = isset($_POST['delivery_date_to']) ? $_POST['delivery_date_to'] : '';

// Build query based on filters
$query = "SELECT task_id, client_name, task_name, delivery_date, status 
          FROM tasks
          WHERE status != 'Completed'";

$params = [];

// Add delivery date filter
if (!empty($deliveryDateFrom)) {
    $query .= " AND delivery_date >= :deliveryDateFrom";
    $params[':deliveryDateFrom'] = $deliveryDateFrom;
}

if (!empty($deliveryDateTo)) {
    $query .= " AND delivery_date <= :deliveryDateTo";
    $params[':deliveryDateTo'] = $deliveryDateTo;
}

// Fetch data
try {
    $stmt = $conn->prepare($query);
    $stmt->execute($params);
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching tasks: " . $e->getMessage();
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
<h1>View Completed Tasks</h1>

<!-- Filter Form -->
<form method="POST" action="">
    <label for="delivery_date_from">Delivery Date From:</label>
    <input type="date" name="delivery_date_from" id="delivery_date_from" value="<?= htmlspecialchars($deliveryDateFrom); ?>">

    <label for="delivery_date_to">Delivery Date To:</label>
    <input type="date" name="delivery_date_to" id="delivery_date_to" value="<?= htmlspecialchars($deliveryDateTo); ?>">

    <button type="submit">Filter</button>
</form>



<!-- Main Tasks Table -->
<h2>Completed Tasks</h2>
<?php if (empty($tasks)): ?>
    <p>No tasks found for the selected filters.</p>
<?php else: ?>
    <table>
    <thead>
        <tr>
            <th>Task ID</th>
            <th>Client Name</th>
            <th>Task Name</th>
            <th>Delivery Date</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <?php if (empty($tasks)): ?>
            <tr>
                <td colspan="5">No tasks found for the selected filters.</td>
            </tr>
        <?php else: ?>
            <?php foreach ($tasks as $task): ?>
                <tr>
                    <td><?= htmlspecialchars($task['task_id']); ?></td>
                    <td><?= htmlspecialchars($task['client_name']); ?></td>
                    <td><?= htmlspecialchars($task['task_name']); ?></td>
                    <td><?= htmlspecialchars($task['delivery_date']); ?></td>
                    <td><?= htmlspecialchars($task['status']); ?></td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
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