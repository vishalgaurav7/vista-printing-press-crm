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
}

// Fetch dropdown values (Paper Size, Plate Types, etc.)
$paper_sizes = $conn->query("SELECT DISTINCT paper_size FROM tasks WHERE paper_size IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$plate_types = $conn->query("SELECT DISTINCT plate_type FROM tasks WHERE plate_type IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$printing_types = $conn->query("SELECT DISTINCT printing_type FROM tasks WHERE printing_type IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$colors = $conn->query("SELECT DISTINCT color FROM tasks WHERE color IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
// $lamination_types = $conn->query("SELECT DISTINCT lamination FROM tasks WHERE lamination IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);
$lamination_types = $conn->query("SELECT DISTINCT lamination_type FROM tasks WHERE lamination_type IS NOT NULL")->fetchAll(PDO::FETCH_ASSOC);

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
            <h2>Edit Task</h2>

<!-- Task Selection Dropdown -->
<form method="GET" action="admin_task_modify.php">
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

<?php if ($task): ?>

    <!-- Task Edit Form -->
    <form method="POST" action="../task_update_process.php">
    <div class="task-cnt">
    
        <input type="hidden" name="task_id" value="<?php echo $task['task_id']; ?>">
    
        <div class = "form-group w33">
        <label for="client_name">Client Name</label>
        <input type="text" name="client_name" value="<?php echo $task['client_name']; ?>" required>
        </div>
        <div class = "form-group w33">
        <label for="client_mobile">Mobile</label>
        <input type="text" name="client_mobile" value="<?php echo $task['client_mobile']; ?>">
        </div>
        <div class = "form-group w33">
        <label for="client_email">Email</label>
        <input type="email" name="client_email" value="<?php echo $task['client_email']; ?>" >
        </div>
        <div class = "form-group w100">
        <label for="client_address">Client Address</label>
        <input type="client_address" name="client_address" value="<?php echo $task['client_address']; ?>">
        </div>
        <div class = "form-group w60">
            <label for="Task Name">Task Name</label>
            <input type="text" id="task_name" name="task_name" value="<?php echo $task['task_name']; ?>">
        </div>
        <div class = "form-group w12">
            <label for="Order Quantity">Order Quantity</label>
            <input type="text" id="order_quantity" name="order_quantity" value="<?php echo $task['order_quantity']; ?>">
        </div>
        <div class = "form-group w33">
        <label for="date_of_order">Date of Order</label>
        <input type="date" name="date_of_order" value="<?php echo $task['date_of_order']; ?>" required>
        </div>
        <div class = "form-group w33">
        <label for="delivery_date">Delivery Date</label>
        <input type="date" name="delivery_date" value="<?php echo $task['delivery_date']; ?>" required>
        </div>
        <div class = "form-group w33"></div>
        <div class = "form-group w33">
        <label for="paper_quality">Paper Quality</label>
        <input type="text" name="paper_quality" value="<?php echo $task['paper_quality']; ?>" required>
        </div>
        <div class = "form-group w33">
        <label for="paper_size">Paper Size</label>
        <input type="text" name="paper_size" value="<?php echo $task['paper_size']; ?>"    required >

        </div>
        <div class = "form-group w33">        
        <label for="paper_gsm">Paper GSM</label>
        <input type="number" name="paper_gsm" value="<?php echo $task['paper_gsm']; ?>" required>
        </div>        
        <div class = "form-group w33">
        <label for="paper_quantity">Paper Quantity</label>
        <input type="number" name="paper_quantity" value="<?php echo $task['paper_quantity']; ?>" required>
        </div>
        <div class = "form-group w33">        
        <label for="plate_type">Plate Type</label>
        <select name="plate_type" required>
            <option value="">Select Plate Type</option>
            <?php foreach ($plate_types as $type): ?>
                <option value="<?php echo $type['plate_type']; ?>" <?php if ($type['plate_type'] == $task['plate_type']) echo 'selected'; ?>>
                    <?php echo $type['plate_type']; ?>
                </option>
            <?php endforeach; ?>
        </select>
        </div>
        <div class = "form-group w33">        
        <label for="cutting_size">Cutting Size</label>
        <input type="text" name="cutting_size" value="<?php echo $task['cutting_size']; ?>" required>
         </div>
         <div class = "form-group w33">       
        <label for="cutting_size_quantity">Printing Quantity</label>
        <input type="number" name="cutting_size_quantity" value="<?php echo $task['cutting_size_quantity']; ?>" required>
        </div> 
        <div class = "form-group w33">       
        <label for="printing_type">Printing Type</label>
        <select name="printing_type" required>
            <option value="">Select Printing Type</option>
            <?php foreach ($printing_types as $type): ?>
                <option value="<?php echo $type['printing_type']; ?>" <?php if ($type['printing_type'] == $task['printing_type']) echo 'selected'; ?>>
                    <?php echo $type['printing_type']; ?>
                </option>
            <?php endforeach; ?>
        </select>
        </div>
        <div class = "form-group w33">        
        <label for="color">Color</label>
        <select name="color" required>
            <option value="">Select Color</option>
            <?php foreach ($colors as $color): ?>
                <option value="<?php echo $color['color']; ?>" <?php if ($color['color'] == $task['color']) echo 'selected'; ?>>
                    <?php echo $color['color']; ?>
                </option>
            <?php endforeach; ?>
        </select>
        </div>
        <div class = "form-group w33">        
        <label for="lamination_type">Lamination Type</label>
        <select name="lamination_type">
            <option value="">Select Lamination</option>
            <?php foreach ($lamination_types as $type): ?>
                <option value="<?php echo $type['lamination_type']; ?>" <?php if ($type['lamination_type'] == $task['lamination_type']) echo 'selected'; ?>>
                    <?php echo $type['lamination_type']; ?>
                </option>
            <?php endforeach; ?>
        </select>
        </div>   
        <div class = "form-group w33"></div>
        <div class = "form-group w33"></div> 
        <div class = "form-group w33">    
        <label for="uv">UV</label>
        <select name="uv">
            <option value="normal" <?php if ($task['uv'] == 'normal') echo 'selected'; ?>>Normal</option>
            <option value="embossed" <?php if ($task['uv'] == 'embossed') echo 'selected'; ?>>Embossed</option>
            <option value="no" <?php if ($task['uv'] == 'no') echo 'selected'; ?>>No</option>
        </select>
        </div>
        <div class = "form-group w33">        
        <label for="emboss">Emboss</label>
        <select name="emboss">
            <option value="new" <?php if ($task['emboss'] == 'new') echo 'selected'; ?>>New</option>
            <option value="old" <?php if ($task['emboss'] == 'old') echo 'selected'; ?>>Old</option>
            <option value="no" <?php if ($task['emboss'] == 'no') echo 'selected'; ?>>No</option>
        </select>
        </div>
        <div class = "form-group w33">        
        <label for="punching">Punching</label>
        <select name="punching">
            <option value="new" <?php if ($task['punching'] == 'new') echo 'selected'; ?>>New</option>
            <option value="old" <?php if ($task['punching'] == 'old') echo 'selected'; ?>>Old</option>
            <option value="no" <?php if ($task['punching'] == 'no') echo 'selected'; ?>>No</option>
        </select>
        </div>
        <div class = "form-group w100">      
        <label for="notes">Other Information</label>
        <textarea name="notes" required><?php echo $task['notes']; ?></textarea>
        </div>
        </div>
      

        <button type="submit">Update Task</button>
    </form>

<?php endif; ?>


            </div>
        </div>
    </div>

    <script>
        // JavaScript for dynamic navigation and content loading (if needed)
        document.querySelectorAll('.sidebar a').forEach(link => {
            link.addEventListener('click', (event) => {
                event.preventDefault();
                document.querySelectorAll('.content > div').forEach(section => {
                    section.style.display = 'none';
                });
                const target = event.target.getAttribute('href').substring(1);
                document.getElementById(target).style.display = 'block';
            });
        });
    </script>

    <script>
        function fetchClientDetails() {
    var client_id = document.getElementById('client_name').value;

    if (client_id) {
        // Send AJAX request to get client details
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'get_client_details.php?client_id=' + client_id, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var clientDetails = JSON.parse(xhr.responseText);
                // Populate the form fields with the client details
                document.getElementById('client_mobile').value = clientDetails.client_mobile;
                document.getElementById('client_email').value = clientDetails.client_email;
                document.getElementById('client_address').value = clientDetails.client_address;
            }
        };
        xhr.send();
    } else {
        // Clear fields if no client is selected
        document.getElementById('client_mobile').value = '';
        document.getElementById('client_email').value = '';
        document.getElementById('client_address').value = '';
    }
}

    </script>
                    
                    </div> <!-- end row -->
        
                </div> <!-- container -->
        
 
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->        
        </body>
        
        </html>