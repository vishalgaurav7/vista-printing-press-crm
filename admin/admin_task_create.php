<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}
// Retrieve the username from the session
$users = $_SESSION['username']; // Access the stored user array

require '../db.php';
// Fetch all users to display in the dropdown
$sql = "SELECT id, username, email,role FROM users";
$stmt = $conn->prepare($sql);
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);


function fetchDropdownData($table, $conn) {
    $stmt = $conn->prepare("SELECT name FROM $table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_COLUMN);
}

$clients = fetchDropdownData('clients', $conn);
$paper_qualities = fetchDropdownData('paper_qualities', $conn);
$paper_sizes = fetchDropdownData('paper_sizes', $conn);
$plate_types = fetchDropdownData('plate_types', $conn);
$printing_types = fetchDropdownData('printing_types', $conn);
$colors = fetchDropdownData('colors', $conn);
$lamination_types = fetchDropdownData('lamination_types', $conn);
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
            <h1 style="justify-self: center;">Create New Task</h1>
            
        <form action="../task_create_process.php" method="POST">
        <div class="task-cnt">
        <section class = "group-section">
            <!-- client Section  -->
        <div class = "form-group w32">
        <label for="client_name">Client Name</label>
            <input type="text" id="client_name" name="client_name" placeholder="client_name" required>
         </div>
         <div class = "form-group w32">
           <label for="client_mobile">Client Mobile</label>   
            <input  type="text" id="client_mobile" name="client_mobile" placeholder="Client Mobile Number" >
            </div>
            <div class = "form-group w32">
           <label for="client_email">Client Email</label>
            <input type="email" id="client_email" name="client_email" placeholder="Client Email" >
            </div>
            <div class = "form-group w100">
           <label for="client_address">Client Address</label>
            <textarea id="client_address" name="client_address" placeholder="Client Address" rows="2" ></textarea>
            </div>
        </section>
        <section class = "group-section">
            <!-- Task Section  -->
        <div class = "form-group w12">
            <label for="date_of_order">Date of Order</label>
            <input type="date" id="date_of_order" name="date_of_order" required>
        </div>
        <div class = "form-group w12">
            <label for="date_of_delivery">Date of Delivery</label>
            <input type="date" id="date_of_delivery" name="date_of_delivery" required>
        </div>
        <div class = "form-group w60">
            <label for="Task Name">Task Name</label>
            <input type="text" id="task_name" name="task_name" required>
        </div>
        <div class = "form-group w12">
            <label for="Order Quantity">Order Quantity</label>
            <input type="text" id="order_quantity" name="order_quantity" required>
        </div>
        </section>
            
<br/>
        <section class = "group-section">
            <!-- Paper Section  -->
            <div class = "form-group w48"> 
            <label for="paper_quality">Paper Quality</label>
            <select id="paper_quality" name="paper_quality" required>
                <option value="">Select Paper Quality</option>
                <?php foreach ($paper_qualities as $quality): ?>
                    <option value="<?php echo htmlspecialchars($quality); ?>"><?php echo htmlspecialchars($quality); ?></option>
                <?php endforeach; ?>
            </select>
            </div>
            <div class = "form-group w48">        
            <label for="paper_size">Paper Size</label>
            <input type="text" id="paper_size" name="paper_size" placeholder="Enter Paper Size" required />
           
             </div>
             <div class = "form-group w48">
             <label for="paper_gsm">Paper GSM</label>           
            <input type="number" name="paper_gsm" placeholder="Paper GSM" required>
            </div>
             <div class = "form-group w48">
             <label for="paper_quantity">Paper Quantity</label>
            <input type="number" name="paper_quantity" placeholder="Paper Quantity" required>
             </div>
            </section>
            
            <section class = "group-section">
             <div class = "form-group w48">
             <label for="cutting_size">Cutting Size</label>           
            <input type="text" name="cutting_size" placeholder="Cutting Size" required>
            </div>
            <div class = "form-group w48">
             <label for="cutting_size_quantity">Printing Quantity</label>
            <input type="text" name="cutting_size_quantity" placeholder="Printing Quantity" required>
            </div>
            <div class = "form-group w48">        
            <label for="printing_type">Printing Type</label>
            <select id="printing_type" name="printing_type" required>
                <option value="">Select Printing Type</option>
                <?php foreach ($printing_types as $print): ?>
                    <option value="<?php echo htmlspecialchars($print); ?>"><?php echo htmlspecialchars($print); ?></option>
                <?php endforeach; ?>
            </select>
            </div>
            <div class = "form-group w48">        
            <label for="color">Color</label>
            <select id="color" name="color" required>
                <option value="">Select Color</option>
                <?php foreach ($colors as $color): ?>
                    <option value="<?php echo htmlspecialchars($color); ?>"><?php echo htmlspecialchars($color); ?></option>
                <?php endforeach; ?>
            </select>
            </div>
            </section>

            <section class = "group-section">        
             <div class = "form-group w48">       
            <label for="plate_type">Plate Type</label>
            <select id="plate_type" name="plate_type" required>
                <option value="">Select Plate Type</option>
                <?php foreach ($plate_types as $plate): ?>
                    <option value="<?php echo htmlspecialchars($plate); ?>"><?php echo htmlspecialchars($plate); ?></option>
                <?php endforeach; ?>
            </select>
            </div>
            <div class = "form-group w48"></div>
            </section>

            <section class = "group-section">  
            <div class = "form-group w32">        
            <label for="lamination">Lamination Type</label>
            <select id="lamination" name="lamination" required>
                <option value="">Select Lamination</option>
                <?php foreach ($lamination_types as $lamination): ?>
                    <option value="<?php echo htmlspecialchars($lamination); ?>"><?php echo htmlspecialchars($lamination); ?></option>
                <?php endforeach; ?>
            </select>
            </div>
            <div class = "form-group w32">   
                </div>
                <div class = "form-group w32">   
                    </div>
            <div class = "form-group w32">   
            <label for="uv">UV</label>
            <select id="uv" name="uv" required>
                <option value="normal">Normal</option>
                <option value="embossed">Embossed</option>
                <option value="no">No</option>
            </select>
            </div>
            <div class = "form-group w32">           
            <label for="emboss">Emboss</label>
            <select id="emboss" name="emboss" required>
                <option value="new">New</option>
                <option value="old">Old</option>
                <option value="no">No</option>
            </select>
            </div>
            <div class = "form-group w32">           
            <label for="punching">Punching</label>
            <select id="punching" name="punching" required>
            <option value="new">New</option>
            <option value="old">Old</option>
            <option value="no">No</option>
            </select>
            </div>
             </section>     
            <div class = "form-group w100">  
            <textarea name="other_info" placeholder="Other Information" rows="4"></textarea>
            </div>        
            <input type="hidden" name="creator_name" value="<?php echo htmlspecialchars($_SESSION['username']); ?>">

            <button type="submit">Create Task</button>
            </div>
        </form>
 </div>
                    
                    </div> <!-- end row -->

        
 
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
        </body>
        </html>