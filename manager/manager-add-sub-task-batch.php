<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'manager') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';


// Fetch users by department
function getUsersByDepartment($conn, $department_id) {
    try {
        $stmt = $conn->prepare("SELECT id, username FROM users WHERE department_id = :department_id");
        $stmt->execute([':department_id' => $department_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}

if (isset($_GET['task_id'])) {
    $task_id = intval($_GET['task_id']);
    
    $stmt = $conn->prepare("SELECT * FROM tasks WHERE task_id = :task_id");
    $stmt->execute([':task_id' => $task_id]);
    $main_task = $stmt->fetch(PDO::FETCH_ASSOC);

   
}
// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $main_task_id = intval($_POST['main_task_id']);
        $sub_tasks = [
            [
                'assigned_to' => intval($_POST['assigned_to_paper']),
                'description' => $_POST['paper_description'],
                'delivery_date' => $_POST['delivery_date_paper'],
                'department_id' => 1 // Paper Vendor department ID
            ],
            [
                'assigned_to' => intval($_POST['assigned_to_printer']),
                'description' => $_POST['printer_description'],
                'delivery_date' => $_POST['delivery_date_printer'],
                'department_id' => 2 // Printer department ID
            ],
            [
                'assigned_to' => intval($_POST['assigned_to_plate']),
                'description' => $_POST['plate_description'],
                'delivery_date' => $_POST['delivery_date_plate'],
                'department_id' => 3 // Plate Vendor department ID
            ],
            [
                'assigned_to' => intval($_POST['assigned_to_lamination']),
                'description' => $_POST['lamination_description'],
                'delivery_date' => $_POST['delivery_date_lamination'],
                'department_id' => 4 // Lamination department ID
            ],
        ];

        // Insert each sub-task into the database
        $stmt = $conn->prepare("
            INSERT INTO sub_tasks (
                main_task_id, assigned_to, description, status, delivery_date, assigned_to_department
            ) VALUES (
                :main_task_id, :assigned_to, :description, 'Pending', :delivery_date, :assigned_to_department
            )
        ");
        foreach ($sub_tasks as $task) {
            if (!empty($task['assigned_to'])) {
                $stmt->execute([
                    ':main_task_id' => $main_task_id,
                    ':assigned_to' => $task['assigned_to'],
                    ':description' => $task['description'],
                    ':delivery_date' => $task['delivery_date'],
                    ':assigned_to_department' => $task['department_id']
                ]);
            }
        }

        // Redirect after successful insertion
        $_SESSION['success_message'] = "Sub-tasks created successfully!";
        if ($_SESSION['role'] === 'admin') {
            header("Location: admin_task_create.php");
        } elseif ($_SESSION['role'] === 'manager') {
            header("Location: manager_dashboard.php");
        } else {
            header("Location: user/admin_task_create.php");
        }
        exit();
    } catch (PDOException $e) {
        $_SESSION['error_message'] = "Database error: " . $e->getMessage();
        header("Location: add_sub_task_batch.php");
        exit();
    }
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
<?php include 'manager_header.php'; ?>
</header>

        

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <div class="page-content">

            <div class="page-container">
            
            <div class="task-cnt sub-task">
            <h1 style="text-align: center;">Create Sub-Tasks</h1>
    <form method="POST">
        <input type="hidden" name="main_task_id" value="<?php echo intval($_GET['task_id']); ?>" />
    <section class = "group-section">
        <!-- Task for Paper -->
        <h3>Task for Paper</h3>
        <div class = "form-group w48">
        <label for="assigned_to_paper">Assign to:</label>
        <select name="assigned_to_paper" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 1); // Paper Vendor department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        </div>
        <div class = "form-group w32">
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_paper" required />
        </div>
        
        <div class = "form-group w100">
        <textarea rows="6" name="paper_description">
Paper Quality: <?php echo htmlspecialchars($main_task['paper_quality']); ?>&#13;
Paper Size: <?php echo htmlspecialchars($main_task['paper_size']); ?>&#13;
Paper GSM: <?php echo htmlspecialchars($main_task['paper_gsm']); ?>&#13;
Paper Quantity: <?php echo htmlspecialchars($main_task['paper_quantity']); ?>&#13;
        </textarea>
        </div>
    </section>
    <section class = "group-section">        
        <!-- Task for Printer -->
        <h3>Task for Printer</h3>
        <div class="form-group w48">
    <label for="assigned_to_printer">Assign to:</label>
    <select name="assigned_to_printer" id="assigned_to_printer" required>
        <option value="">Select User</option>
        <?php
        $users = getUsersByDepartment($conn, 2); // Printer department ID
        foreach ($users as $user) {
            echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
        }
        ?>
    </select>
</div>
        <div class = "form-group w32">
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_printer" />
        </div>
        <div class = "form-group w100">
        <textarea  rows="6" name="printer_description" >
Cutting Size: <?php echo htmlspecialchars($main_task['cutting_size']); ?>&#13;
Printing Quantity: <?php echo htmlspecialchars($main_task['cutting_size_quantity']); ?>&#13;
Printing Type: <?php echo htmlspecialchars($main_task['printing_type']); ?>&#13;
Color: <?php echo htmlspecialchars($main_task['color']); ?>&#13;
        </textarea>
        </div>
    </section>
    <section class = "group-section">        
        <!-- Task for Plate Vendor -->
        <h3>Task for Plate Vendor</h3>
        <div class = "form-group w48">
        <label for="assigned_to_plate">Assign to:</label>
        <select name="assigned_to_plate" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 3); // Plate Vendor department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        </div>
        <div class = "form-group w32">
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_plate" required />
        </div>
        <div class="form-group w100">
    <textarea rows="6" name="plate_description" id="plate_description">
Plate Type: <?php echo htmlspecialchars($main_task['plate_type']); ?>&#13;
Deliver to Printer: <?php echo isset($_POST['assigned_to_printer']) ? htmlspecialchars($_POST['assigned_to_printer']) : ''; ?>
    </textarea>
</div>
    </section>
    <section class = "group-section">        
        <!-- Task for Lamination -->
        <h3>Task for Lamination</h3>
        <div class = "form-group w48">
        <label for="assigned_to_lamination">Assign to:</label>
        <select name="assigned_to_lamination" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 4); // Lamination department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        </div>
        <div class = "form-group w32">
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_lamination" required />
        </div>
        <div class = "form-group w100">
        <textarea  rows="6" name="lamination_description">
Lamination Type: <?php echo htmlspecialchars($main_task['lamination_type']); ?>&#13;
UV: <?php echo htmlspecialchars($main_task['uv']); ?>&#13;
Emboss: <?php echo htmlspecialchars($main_task['emboss']); ?>&#13;
Punching: <?php echo htmlspecialchars($main_task['punching']); ?>&#13;
        </textarea>
    </section>
        <!-- Submit button -->
        <button type="submit">Create Sub Tasks</button>
    </form>
    <div class="task-cnt">
                    </div> <!-- end row -->
        
                </div> <!-- container -->
                <script>
    document.addEventListener('DOMContentLoaded', function () {
        var selectPrinter = document.getElementById('assigned_to_printer');
        var textarea = document.getElementById('plate_description');
        
        // Function to update textarea with selected user's name
        function updateTextarea() {
            var selectedUser = selectPrinter.options[selectPrinter.selectedIndex].text;
            // Update the textarea content dynamically
            textarea.value = "Plate Type: <?php echo htmlspecialchars($main_task['plate_type']); ?>\r\n" +
                             "Deliver to Printer: " + selectedUser;
        }

        // Add change event listener to the select element
        selectPrinter.addEventListener('change', updateTextarea);

        // Initialize textarea content in case there's a pre-selected value
        if (selectPrinter.value) {
            updateTextarea();
        }
    });
</script>
                    
        
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