<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';


// Fetch departments and users for filters
try {
    $departments = $conn->query("SELECT * FROM departments")->fetchAll(PDO::FETCH_ASSOC);
    $users = $conn->query("SELECT id, username FROM users")->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching filters: " . $e->getMessage();
    exit();
}

// Initialize variables for filters
$departmentFilter = isset($_POST['department']) ? $_POST['department'] : '';
$userFilter = isset($_POST['user']) ? $_POST['user'] : '';

// Build query based on filters
$query = "SELECT st.*, d.name AS department_name, u.username AS assigned_user, t.task_name AS task_name 
          FROM sub_tasks st
          LEFT JOIN departments d ON st.assigned_to_department = d.department_id
          LEFT JOIN users u ON st.assigned_to = u.id
          LEFT JOIN tasks t ON st.main_task_id = t.task_id
          WHERE st.status != 'Completed'";


$params = [];

// Add filters to query
if (!empty($departmentFilter)) {
    $query .= " AND st.assigned_to_department = :department";
    $params[':department'] = $departmentFilter;
}

if (!empty($userFilter)) {
    $query .= " AND st.assigned_to = :user";
    $params[':user'] = $userFilter;
}

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
    <h1>View Sub-Tasks</h1>

    <form method="POST" action="">
        <label for="department">Filter by Department:</label>
        <select name="department" id="department">
            <option value="">All Departments</option>
            <?php foreach ($departments as $department): ?>
                <option value="<?= $department['department_id']; ?>" <?= $departmentFilter == $department['department_id'] ? 'selected' : ''; ?>>
                    <?= htmlspecialchars($department['name']); ?>
                </option>
            <?php endforeach; ?>
        </select>

        <label for="user">Filter by User:</label>
        <select name="user" id="user">
            <option value="">All Users</option>
            <?php foreach ($users as $user): ?>
                <option value="<?= $user['id']; ?>" <?= $userFilter == $user['id'] ? 'selected' : ''; ?>>
                    <?= htmlspecialchars($user['username']); ?>
                </option>
            <?php endforeach; ?>
        </select>

        <button type="submit">Filter</button>
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
                        <td><?= htmlspecialchars($subtask['delivery_date']); ?></td>
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