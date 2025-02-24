<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'department') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';


// Get current date
$currentDate = date('Y-m-d');

// Get logged-in user ID
$loggedInUserId = $_SESSION['user_id'];

// Initialize filter variables
$filterDays = $_GET['days'] ?? '';

// Base query to fetch tasks for logged-in user
$query = "SELECT DISTINCT st.*, mt.task_name, d.name AS department_name 
          FROM sub_tasks st
          LEFT JOIN tasks mt ON st.main_task_id = mt.task_id
          LEFT JOIN departments d ON st.assigned_to_department = d.department_id
          WHERE st.assigned_to = :user_id AND st.status != 'Completed'";

$params = [':user_id' => $loggedInUserId];

// Apply date filter
if ($filterDays !== '') {
    $endDate = date('Y-m-d', strtotime("+$filterDays days"));
    $query .= " AND st.delivery_date BETWEEN :currentDate AND :endDate";
    $params[':currentDate'] = $currentDate;
    $params[':endDate'] = $endDate;
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
 function formatDate($date) {
                                        if ($date) {
                                            $dateTime = new DateTime($date);
                                            return $dateTime->format('d/m/Y h:i A'); // 'A' for AM/PM
                                        }
                                        return ''; // Return empty if no date
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
<header class="app-topbar-main">
<?php include 'user_header.php'; ?>
</header>

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <div class="page-content">
            <div class="page-container">

            <h1>Near Delivery Task Filter</h1>

    <!-- Filter Form -->
    <form method="GET" action="">
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

        <button type="submit">Apply Filter</button>
    </form>

    <!-- <h2>Sub-Tasks</h2> -->
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
                    <th>Comments</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($subtasks as $subtask): ?>
                    <tr>
                        <td><?= htmlspecialchars($subtask['sub_task_id']); ?></td>
                        <td><?= htmlspecialchars($subtask['main_task_id']); ?></td>
                        <td><?= htmlspecialchars($subtask['task_name']); ?></td>
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
    <?php endif; ?>
    </div> <!-- end row -->
        
        </div> <!-- container -->

     <!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>

</html>