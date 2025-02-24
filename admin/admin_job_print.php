<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}



?>
<?php
require '../db.php';
// Fetch tasks for the dropdown (to select task)
$stmt = $conn->prepare("SELECT task_id, client_name, task_name FROM tasks");
$stmt = $conn->prepare("SELECT task_id, client_name, task_name FROM tasks WHERE status != 'Completed'");

$stmt->execute();
$tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);

// If a task_id is passed, fetch task details
$task = null;
if (isset($_GET['task_id'])) {
    $task_id = $_GET['task_id'];
    
    // Fetch the selected task details
    // $stmt = $conn->prepare("SELECT * FROM tasks WHERE task_id = :task_id");
    $stmt = $conn->prepare("SELECT * FROM tasks WHERE task_id = :task_id AND status != 'Completed'");
    $stmt->bindParam(':task_id', $task_id, PDO::PARAM_INT);
    $stmt->execute();
    $task = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if (!$task) {
        echo "Task not found!";
        exit();
    }


// Fetch all sub-tasks excluding "Completed"
try {
    $subtasks = $conn->query("
       SELECT 
    st.sub_task_id,
    st.main_task_id,
    st.description, 
    st.delivery_date, 
    st.status, 
    t.client_name, 
    t.task_name, 
    u.username AS assigned_to, 
    d.name AS department, 
    st.admin_comment, 
    MAX(st.admin_updated_on) AS admin_updated_on, 
    st.manager_comment, 
    MAX(st.manager_updated_on) AS manager_updated_on, 
    st.user_comment, 
    MAX(st.user_updated_on) AS user_updated_on
FROM 
    sub_tasks st
JOIN 
    tasks t ON st.main_task_id = $task_id
LEFT JOIN 
    users u ON st.assigned_to = u.id
LEFT JOIN 
    departments d ON st.assigned_to_department = d.department_id
WHERE 
    st.status != 'Completed'
GROUP BY 
    st.sub_task_id;
    ")->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching sub-tasks: " . $e->getMessage();
    exit();
}
// Handle updates
if (isset($_POST['update_subtask'])) {
    $subtaskId = $_POST['subtask_id'];
    $description = $_POST['description'];
    $deliveryDate = $_POST['delivery_date'];
    $status = $_POST['status'];
    $admin_comment = $_POST['admin_comment'];  // Capture admin comment
    $adminUpdatedOn = ($admin_comment) ? date('Y-m-d H:i:s') : NULL;  // Set the update timestamp if admin comment is provided
    try {
        $stmt = $conn->prepare("
            UPDATE sub_tasks 
            SET description = :description, delivery_date = :delivery_date, status = :status,  admin_comment = :admin_comment,
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
    } catch (PDOException $e) {
        $_SESSION['error'] = "Error updating sub-task: " . $e->getMessage();
    }
    header("Location: admin_job_print.php?task_id=" . $task_id);

    exit();
}

}
// Fetch dropdown values (Paper Size, Plate Types, etc.)
$paper_sizes = $conn->query("SELECT DISTINCT paper_size FROM tasks WHERE paper_size IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$plate_types = $conn->query("SELECT DISTINCT plate_type FROM tasks WHERE plate_type IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$printing_types = $conn->query("SELECT DISTINCT printing_type FROM tasks WHERE printing_type IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$colors = $conn->query("SELECT DISTINCT color FROM tasks WHERE color IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
// $lamination_types = $conn->query("SELECT DISTINCT lamination FROM tasks WHERE lamination IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$lamination_types = $conn->query("SELECT DISTINCT lamination_type FROM tasks WHERE lamination_type IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
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
   <style>.form-group {
    margin-bottom: 0rem !important;
}
.print-btn{place-self:center;}
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
            
            <h2 style="justify-self: center;">Task Details</h2>
<div class = "task-sel">
<!-- Task Selection Dropdown -->
<form method="GET" action="admin_job_print.php">
    <label for="task_id">Select Task</label>
    <select name="task_id" id="task_id" onchange="this.form.submit()">
        <option value="">Select a Task</option>
        <?php foreach ($tasks as $task_option): ?>
            <option value="<?php echo $task_option['task_id']; ?>" <?php if (isset($task['task_id']) && $task['task_id'] == $task_option['task_id']) echo 'selected'; ?>>
                <?php echo $task_option['task_id'] . " - " . $task_option['client_name'] . " - " . $task_option['task_name']; ?>
            </option>
        <?php endforeach; ?>
    </select>
</form>
</div>
<?php if ($task): ?>

    <!-- Task Edit Form -->
    <form method="POST" action="../task_update_process.php">
    <div class="task-cnt">
    
        <input type="hidden" name="task_id" value="<?php echo $task['task_id']; ?>">
    
        <div class = "form-group w30">
        <label for="client_name"><strong>Client Name</strong></label>
        <label for="client_name"><?php echo $task['client_name']; ?> 
        </div>
        <div class = "form-group w30">
        <label for="client_mobile"><strong>Mobile</strong></label>
        <label for="client_name"><?php echo $task['client_mobile']; ?> 
        </div>
        <div class = "form-group w30">
        <label for="client_email"><strong>Email</strong></label>
        <label for="client_name"><?php echo $task['client_email']; ?>
        </div>
        <div class = "form-group w100">
        <label for="client_address"><strong>Client Address</strong></label>
        <label for="client_name"><?php echo $task['client_address']; ?>
        </div>
        <div class="form-group-line w100"></div>
        <div class = "form-group w60">
            <label for="Task Name"><strong>Task Name</strong></label>
            <label for="client_name"><?php echo $task['task_name']; ?>
        </div>
        <div class = "form-group w12">
            <label for="Order Quantity"><strong>Order Quantity</strong></label>
            <label for="client_name"><?php echo $task['order_quantity']; ?>
        </div>
        <div class="form-group-line w100"></div>
        <div class = "form-group w30">
            
        <label for="date_of_order"><strong>Date of Order</strong></label>
        <?php   $dateoforder = $task['date_of_order'];
                $formattedateoforder = '';
                if ($dateoforder) {
                    $dateTime = new DateTime($dateoforder);
                    $formatteddateoforder = $dateTime->format('d/m/Y'); // 'A' gives AM/PM
                }
                ?>
        <label for="client_name"><?php echo $formatteddateoforder; ?>
        </div>
        <div class = "form-group w30">
        <label for="delivery_date"><strong>Delivery Date</strong></label>
        <?php   $dateofdelivery = $task['delivery_date'];
                $formattedateofdelivery = '';
                if ($dateofdelivery) {
                    $dateTime = new DateTime($dateofdelivery);
                    $formatteddateofdelivery = $dateTime->format('d/m/Y'); // 'A' gives AM/PM
                }
                ?>
        <label for="client_name"><?php echo $formatteddateofdelivery; ?>
        </div>
        <div class = "form-group w30"></div>
        <div class="form-group-line w100"></div>
        <div class = "form-group w30">
        <label for="paper_quality"><strong>Paper Quality</strong></label>
        <label for="client_name"><?php echo $task['paper_quality']; ?>
        </div>
        <div class = "form-group w30">
        <label for="paper_size"><strong>Paper Size</strong></label>
        <label for="client_name"><?php echo $task['paper_size']; ?>
        </div>
        <div class = "form-group w30">        
        <label for="paper_gsm"><strong>Paper GSM</strong></label>
        <label for="client_name"><?php echo $task['paper_gsm']; ?>
        </div>        
        <div class = "form-group w30">
        <label for="paper_quantity"><strong>Paper Quantity</strong></label>
        <label for="client_name"><?php echo $task['paper_quantity']; ?>
        </div>
        <div class = "form-group w30">        
        <label for="plate_type"><strong>Plate Type</strong></label>
        <label for="client_name"><?php echo $task['plate_type']; ?>
        </div>
        <div class = "form-group w30">        
        <label for="cutting_size"><strong>Cutting Size</strong></label>
        <label for="client_name"><?php echo $task['cutting_size']; ?>
        </div>
         <div class = "form-group w30">       
        <label for="cutting_size_quantity"><strong>Printing Quantity</strong></label>
        <label for="client_name"><?php echo $task['cutting_size_quantity']; ?>
        </div> 
        <div class = "form-group w30">       
        <label for="printing_type"><strong>Printing Type</strong></label>
        <label for="client_name"><?php echo $task['printing_type']; ?>
        </div>
        <div class = "form-group w30">        
        <label for="color"><strong>Color</strong></label>
        <label for="client_name"><?php echo $task['color']; ?>
        </div>
        <div class="form-group-line w100"></div>
        <div class = "form-group w24">        
        <label for="lamination_type"><strong>Lamination Type</strong></label>
        <label for="client_name"><?php echo $task['lamination_type']; ?>
        </div>   
        <div class = "form-group w24">    
        <label for="uv"><strong>UV</strong></label>
        <label for="client_name"><?php echo $task['uv']; ?>
        </div>
        <div class = "form-group w24">        
        <label for="emboss"><strong>Emboss</strong></label>
        <label for="client_name"><?php echo $task['emboss']; ?>
        </div>
        <div class = "form-group w24">        
        <label for="punching"><strong>Punching</strong></label>
        <label for="client_name"><?php echo $task['punching']; ?>
        </div>
        <div class = "form-group w100">      
        <label for="notes"><strong>Other Information</strong></label>
        <label for="client_name"><?php echo $task['notes']; ?>
        </div>
        </div>
      
       
        <!-- <button type="submit">Update Task</button> -->
    </form>

<?php endif; ?>




                    <h1 style="justify-self: center;"> Sub-Tasks</h1>

<!-- Display Messages -->
<?php if (isset($_SESSION['message'])): ?>
    <div class="success"><?= $_SESSION['message']; unset($_SESSION['message']); ?></div>
<?php endif; ?>

<?php if (isset($_SESSION['error'])): ?>
    <div class="error"><?= $_SESSION['error']; unset($_SESSION['error']); ?></div>
<?php endif; ?>

<!-- Table to Display Sub-Tasks -->
<table border="1" cellpadding="10" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>Assigned To</th>
            <th>Department</th>
            <th>Description</th>
            <th>Delivery Date</th>
            <!-- <th>Status</th> -->
        </tr>
    </thead>
    <tbody>
        <?php foreach ($subtasks as $subtask): ?>
            <tr>
                <td><?= htmlspecialchars($subtask['sub_task_id']); ?></td>
                <td><?= htmlspecialchars($subtask['assigned_to']); ?></td>
                <td><?= htmlspecialchars($subtask['department']); ?></td>
                <td><?= htmlspecialchars($subtask['description']); ?></td>
                <?php
                // Assuming the 'delivery_date' is a string or datetime object.
                $deliveryDate = $subtask['delivery_date'];
                $formattedDeliveryDate = '';
                if ($deliveryDate) {
                    $dateTime = new DateTime($deliveryDate);
                    $formattedDeliveryDate = $dateTime->format('d/m/Y'); // 'A' gives AM/PM
                }
                ?>
                <td><?= htmlspecialchars($formattedDeliveryDate); ?></td>
                <!-- <td><?= htmlspecialchars($subtask['delivery_date']); ?></td> -->
                <!-- <td><?= htmlspecialchars($subtask['status']); ?></td> -->
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<div class = "print-btn">
<button id="printButton">Print</button>
</div>
                    </div> <!-- end row -->
                   
  </div> <!-- container -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#printButton').click(function() {
        // Hide the .app-topbar
        // $('.wrapper').hide();
        // $('.task-sel').hide();
        $('.menu-toggle-btn').hide();
        // $('.sidenav-menu').hide();

        // Trigger the print dialog
        window.print();

        // Show the .app-topbar again after printing
        // $('.app-topbar').show();
      });
    });

    // Plain JavaScript version (uncomment if needed)
    // document.getElementById('printButton').addEventListener('click', function() {
    //   var topbar = document.querySelector('.app-topbar');
    //   topbar.style.display = 'none'; // Hide the top bar
    //   window.print(); // Trigger print
    //   topbar.style.display = ''; // Restore the top bar after print
    // });
  </script>
  <style>
      .task-cnt label strong {
    font-weight: 900;
}
.task-cnt label {font-weight: 300;}
.task-cnt {
    display: flex;
    flex-wrap: wrap;
    row-gap: 0px;
    border: 1px solid;
    width: 100%;
}
.form-group-line.w100 {
    border-bottom: 1px solid;
    margin: 5px 0;
}
.form-group-line.w100 {
    border-bottom: 1px solid;
    margin: 5px 0;
}
.task-cnt .form-group {
    padding-left: 10px;
    padding-top: 1px;
}
.task-cnt .w100 {
    width: 100%;
    padding-right: 6px;
}
label {
    margin-bottom: 0.5px;
}
table {
    margin-top: 0px !important;
}
  </style>
 
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->        
        </body>
        
        </html>