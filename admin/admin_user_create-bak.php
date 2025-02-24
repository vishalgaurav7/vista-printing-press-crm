<?php
session_start();

// Check if the user is logged in and has 'admin' role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

// Function to fetch dropdown data
function fetchDropdownData($table, $conn) {
    if ($table == 'clients') {
        $stmt = $conn->prepare("SELECT client_id, name FROM $table"); // Select both ID and name
    } else if ($table == 'departments') {
        $stmt = $conn->prepare("SELECT department_id, name FROM $table"); // Use department_id if that is the correct column name
    } else {
        $stmt = $conn->prepare("SELECT id, name FROM $table"); // For other tables, select 'id' and 'name'
    }

    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC); // Fetch both ID and Name
}

// Fetch dropdown data
$paper_qualities = fetchDropdownData('paper_qualities', $conn);
$paper_sizes = fetchDropdownData('paper_sizes', $conn);
$plate_types = fetchDropdownData('plate_types', $conn);
$printing_types = fetchDropdownData('printing_types', $conn);
$colors = fetchDropdownData('colors', $conn);
$lamination_types = fetchDropdownData('lamination_types', $conn);
$departments = fetchDropdownData('departments', $conn); // Fetch departments for dropdown

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

        <!-- Page Content -->
        <div class="page-content">
            <div class="page-container">
            <div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Create New User</h4>
        </div>
        <div class="card-body">
            <form action="../login_create_process.php" method="POST">
                <!-- Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Enter username" required>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Enter email address">
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>
                </div>

                <!-- Role -->
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select name="role" id="role" class="form-select" required>
                        <option value="">Select Role</option>
                        <option value="admin">Admin</option>
                        <option value="manager">Manager</option>
                        <option value="department">Department</option>
                    </select>
                </div>

                <!-- Department Dropdown (Initially hidden) -->
                <div class="mb-3" id="department-dropdown" style="display: none;">
                    <label for="department_id" class="form-label">Department</label>
                    <select name="department_id" id="department_id" class="form-select">
                        <option value="">Select a Department</option>
                        <?php
                        foreach ($departments as $department) {
                            echo "<option value='" . $department['department_id'] . "'>" . $department['name'] . "</option>";
                        }
                        ?>
                    </select>
                </div>

                <!-- Action Buttons -->
                <div class="d-flex">
                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">Create User</button>

                    <!-- Cancel Button -->
                    <a href="admin_dashboard.php" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.getElementById('role').addEventListener('change', function () {
        var role = this.value;
        var departmentDropdown = document.getElementById('department-dropdown');
        var departmentField = document.getElementById('department_id');

        if (role === 'department') {
            departmentDropdown.style.display = 'block'; // Show department dropdown when 'Department' role is selected
            departmentField.setAttribute('required', 'required'); // Make department selection required
        } else {
            departmentDropdown.style.display = 'none'; // Hide department dropdown for other roles
            departmentField.removeAttribute('required'); // Remove required attribute when hidden
            departmentField.value = ""; // Clear the value when hidden
        }
    });

    // Ensure department is selected before form submission
    document.querySelector("form").addEventListener("submit", function (event) {
        var role = document.getElementById('role').value;
        var departmentId = document.getElementById('department_id').value;

        if (role === 'department' && departmentId === "") {
            alert("Please select a department.");
            event.preventDefault(); // Stop form submission if no department is selected
        }
    });
</script>

            </div>
        </div>

<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>
</html>
