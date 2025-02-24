<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

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
            <?php
require '../db.php';

// Fetch all options for the dropdowns
$paper_qualities = $conn->query("SELECT * FROM paper_qualities")->fetchAll(PDO::FETCH_ASSOC);
$paper_sizes = $conn->query("SELECT * FROM paper_sizes")->fetchAll(PDO::FETCH_ASSOC);
$plate_types = $conn->query("SELECT * FROM plate_types")->fetchAll(PDO::FETCH_ASSOC);
$printing_types = $conn->query("SELECT * FROM printing_types")->fetchAll(PDO::FETCH_ASSOC);
$colors = $conn->query("SELECT * FROM colors")->fetchAll(PDO::FETCH_ASSOC);
$lamination_types = $conn->query("SELECT * FROM lamination_types")->fetchAll(PDO::FETCH_ASSOC);
?>
   
<h1>Manage Printing Parameters</h1>
<div class="task-cnt">
<form id="manage-parameters-form" method="POST" action="manage_parameters_process.php">
   
<h2>Add New Entry</h2>
    <p>
    <div class = "form-group w33"> 
        <label for="parameter_type">Parameter Type:</label>
        <select name="parameter_type" id="parameter_type" required>
            <option value="">Select Parameter</option>
            <option value="paper_qualities">Paper Quality</option>
            <option value="paper_sizes">Paper Size</option>
            <option value="plate_types">Plate Type</option>
            <option value="printing_types">Printing Type</option>
            <option value="colors">Color</option>
            <option value="lamination_types">Lamination Type</option>
        </select>
        </div>
    <br/>
    <div class = "form-group w33"> 
        <label for="parameter_name">Name:</label>
        <input type="text" name="parameter_name" id="parameter_name" required>
    </div>
    <br/>
    <button type="submit" name="action" value="add">Add</button>


</form>

<hr>

<h2>Edit or Delete Entry</h2>

<form id="edit-delete-form" method="POST" action="manage_parameters_process.php">
<div class = "form-group w33">
        <label for="edit_parameter_type">Parameter Type:</label>
        <select name="edit_parameter_type" id="edit_parameter_type" required>
            <option value="">Select Parameter</option>
            <option value="paper_qualities">Paper Quality</option>
            <option value="paper_sizes">Paper Size</option>
            <option value="plate_types">Plate Type</option>
            <option value="printing_types">Printing Type</option>
            <option value="colors">Color</option>
            <option value="lamination_types">Lamination Type</option>
        </select>
    </div>
    <br/>
    <div class = "form-group w33">
        <label for="edit_parameter_name">Select Existing Name:</label>
        <select name="edit_parameter_name" id="edit_parameter_name">
            <!-- Values will be dynamically populated using JavaScript -->
        </select>
    </div>
    <br/>
    <div class = "form-group w33">
        <label for="new_name">New Name (For Edit):</label>
        <input type="text" name="new_name" id="new_name">
    </div>
    <br/>
    
    <button type="submit" name="action" value="edit">Edit</button>
    <button type="submit" name="action" value="delete" onclick="return confirm('Are you sure you want to delete this entry?');">Delete</button>
</form>
</div>
<script>
    // JavaScript to dynamically populate values based on selected parameter type
    const parameterData = {
        paper_qualities: <?= json_encode($paper_qualities); ?>,
        paper_sizes: <?= json_encode($paper_sizes); ?>,
        plate_types: <?= json_encode($plate_types); ?>,
        printing_types: <?= json_encode($printing_types); ?>,
        colors: <?= json_encode($colors); ?>,
        lamination_types: <?= json_encode($lamination_types); ?>
    };

    document.getElementById('edit_parameter_type').addEventListener('change', function () {
        const selectedType = this.value;
        const nameDropdown = document.getElementById('edit_parameter_name');
        nameDropdown.innerHTML = '<option value="">Select Name</option>'; // Clear previous options

        if (selectedType && parameterData[selectedType]) {
            parameterData[selectedType].forEach(item => {
                const option = document.createElement('option');
                option.value = item.id; // Assuming the table has an `id` column
                option.textContent = item.name; // Assuming the table has a `name` column
                nameDropdown.appendChild(option);
            });
        }
    });
</script>


                    </div> <!-- end row -->
        
                </div> <!-- container -->
        
                  
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->        
        </body>
        
        </html>