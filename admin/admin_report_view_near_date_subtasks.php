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

// Fetch departments and users for the filter dropdowns
try {
    $departments = $conn->query("SELECT department_id, name FROM departments")->fetchAll(PDO::FETCH_ASSOC);
    $users = $conn->query("SELECT id, username FROM users")->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching data: " . $e->getMessage();
    exit();
}

// Initialize filter variables
$filterDepartment = $_GET['department'] ?? '';
$filterUser = $_GET['user'] ?? '';
$filterDays = $_GET['days'] ?? '';

// Initialize the base query
$query = "SELECT st.*, d.name AS department_name, u.username AS assigned_user, t.task_name AS task_name 
          FROM sub_tasks st
          LEFT JOIN departments d ON st.assigned_to_department = d.department_id
          LEFT JOIN users u ON st.assigned_to = u.id
          LEFT JOIN tasks t ON st.main_task_id = t.task_id
          WHERE st.status != 'Completed'";

$params = []; // Initialize parameters array

// Apply date filter
if ($filterDays !== '') {
    $endDate = date('Y-m-d', strtotime("+$filterDays days"));
    $query .= " AND st.delivery_date BETWEEN :currentDate AND :endDate";
    $params[':currentDate'] = $currentDate;
    $params[':endDate'] = $endDate;
}

// Apply department filter
if (!empty($filterDepartment)) {
    $query .= " AND st.assigned_to_department = :department";
    $params[':department'] = $filterDepartment;
}

// Apply user filter
if (!empty($filterUser)) {
    $query .= " AND st.assigned_to = :user";
    $params[':user'] = $filterUser;
}

// Execute the query
try {
    $stmt = $conn->prepare($query);
    $stmt->execute($params);
    $subtasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching sub-tasks: " . $e->getMessage();
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
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .overdue {
            color: red;
            font-weight: bold;
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
            <h1>Filtered Sub-Tasks</h1>

<!-- Filter Form -->
<form method="GET" action="">
    <label for="department">Filter by Department:</label>
    <select name="department" id="department">
        <option value="">All Departments</option>
        <?php foreach ($departments as $department): ?>
            <option value="<?= htmlspecialchars($department['department_id']); ?>" 
                <?= $filterDepartment == $department['department_id'] ? 'selected' : ''; ?>>
                <?= htmlspecialchars($department['name']); ?>
            </option>
        <?php endforeach; ?>
    </select>

    <label for="user">Filter by User:</label>
    <select name="user" id="user">
        <option value="">All Users</option>
        <?php foreach ($users as $user): ?>
            <option value="<?= htmlspecialchars($user['id']); ?>" 
                <?= $filterUser == $user['id'] ? 'selected' : ''; ?>>
                <?= htmlspecialchars($user['username']); ?>
            </option>
        <?php endforeach; ?>
    </select>

    <label for="days">Filter by Delivery Date (in days):</label>
    <select name="days" id="days">
        <option value="">All</option>
        <option value="0" <?= $filterDays === '0' ? 'selected' : ''; ?>>Today</option>
        <option value="1" <?= $filterDays === '1' ? 'selected' : ''; ?>>1 Day</option>
        <option value="2" <?= $filterDays === '2' ? 'selected' : ''; ?>>2 Days</option>
        <option value="3" <?= $filterDays === '3' ? 'selected' : ''; ?>>3 Days</option>
        <option value="4" <?= $filterDays === '4' ? 'selected' : ''; ?>>4 Days</option>
        <option value="5" <?= $filterDays === '5' ? 'selected' : ''; ?>>5 Days</option>
        <option value="6" <?= $filterDays === '6' ? 'selected' : ''; ?>>6 Days</option>
        <option value="7" <?= $filterDays === '7' ? 'selected' : ''; ?>>7 Days</option>
    </select>

    <button type="submit">Apply Filters</button>
</form>

<h2>Sub-Tasks</h2>
<?php if (empty($subtasks)): ?>
    <p>No sub-tasks found for the selected filters.</p>
<?php else: ?>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Task</th>
                <th>Task Name</th>
                <th>Description</th>
                <th>Delivery Date</th>
                <th>Status</th>
                <th>Department</th>
                <th>Assigned User</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($subtasks as $subtask): ?>
                <tr>
                    <td><?= htmlspecialchars($subtask['sub_task_id']); ?></td>
                    <td><?= htmlspecialchars($subtask['main_task_id']); ?></td>
                    <td><?= htmlspecialchars($subtask['task_name']); ?></td>
                    <td><?= htmlspecialchars($subtask['description']); ?></td>
                    <td class="<?= strtotime($subtask['delivery_date']) < strtotime($currentDate) ? 'overdue' : ''; ?>">
                        <?= htmlspecialchars($subtask['delivery_date']); ?>
                    </td>
                    <td><?= htmlspecialchars($subtask['status']); ?></td>
                    <td><?= htmlspecialchars($subtask['department_name']); ?></td>
                    <td><?= htmlspecialchars($subtask['assigned_user']); ?></td>
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