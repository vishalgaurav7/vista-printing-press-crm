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

// Initialize variables for form handling
$edit_id = '';
$edit_name = '';
$edit_description = '';

// Handle Add, Edit, and Delete requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['add_department'])) {
        // Add Department Logic
        $name = trim($_POST['name']);
        $description = trim($_POST['description']);
        
        // Check if department already exists
        try {
            $stmt = $conn->prepare("SELECT COUNT(*) FROM departments WHERE name = :name");
            $stmt->bindParam(':name', $name);
            $stmt->execute();
            $count = $stmt->fetchColumn();
    
            if ($count > 0) {
                $message = "Error: A department with this name already exists.";
            } else {
                // Proceed with inserting the department
                $stmt = $conn->prepare("INSERT INTO departments (name, description) VALUES (:name, :description)");
                $stmt->bindParam(':name', $name);
                $stmt->bindParam(':description', $description);
                $stmt->execute();
                $message = "Department added successfully!";
            }
        } catch (PDOException $e) {
            $message = "Error adding department: " . $e->getMessage();
        }
    } elseif (isset($_POST['edit_department'])) {
        // Edit Department Logic
        $id = $_POST['department_id']; // Use the correct column for the ID
        $name = trim($_POST['edit_name']);
        $description = trim($_POST['edit_description']);
    
        // Check if the department name already exists (excluding the current department)
        try {
            $stmt = $conn->prepare("SELECT COUNT(*) FROM departments WHERE name = :name AND department_id != :id");
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            $count = $stmt->fetchColumn();
    
            if ($count > 0) {
                $message = "Error: The department name already exists.";
            } else {
                // No duplicate, proceed with the update
                try {
                    $stmt = $conn->prepare("UPDATE departments SET name = :name, description = :description WHERE department_id = :id");
                    $stmt->bindParam(':name', $name);
                    $stmt->bindParam(':description', $description);
                    $stmt->bindParam(':id', $id);
                    $stmt->execute();
                    $message = "Department updated successfully!";
                } catch (PDOException $e) {
                    $message = "Error updating department: " . $e->getMessage();
                }
            }
        } catch (PDOException $e) {
            $message = "Error checking department name: " . $e->getMessage();
        }
    }
    
     elseif (isset($_POST['delete_department'])) {
        $department_id = $_POST['department_id']; // Get the department ID from the form submission
    
        // Delete the department based on its department_id
        try {
            $stmt = $conn->prepare("DELETE FROM departments WHERE department_id = :department_id");
            $stmt->bindParam(':department_id', $department_id);
            $stmt->execute();
            $message = "Department deleted successfully!";
        } catch (PDOException $e) {
            $message = "Error deleting department: " . $e->getMessage();
        }
    }
    
}

// Fetch all departments
try {
    $stmt = $conn->query("SELECT * FROM departments");
    $departments = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $message = "Error fetching departments: " . $e->getMessage();
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
            <div class="task-cnt">

            <h1>Manage Departments</h1>

<!-- Display Message -->
<?php if (!empty($message)): ?>
    <p style="color: green;"><?= $message; ?></p>
<?php endif; ?>

<!-- Add Department Form -->
<form method="POST">
    <h2>Add Department</h2>
    <div class = "form-group w50"> 
    <label for="name">Department Name:</label>
    <input type="text" name="name" id="name" required>
    </div>
    <br/>
    <div class = "form-group w50"> 
    <label for="description">Description:</label>
    <textarea name="description" id="description" rows="3"></textarea>
    </div>
    <br/>
    <button type="submit" name="add_department">Add Department</button>
</form>

<hr>

<!-- Edit/Delete Department Form -->
<h2>Edit or Delete Department</h2>
<form method="POST">
<div class = "form-group w50"> 
    <label for="department_id">Select Department:</label>
    <select name="department_id" id="department_id" required onchange="populateForm(this.value)">
    <option value="">Select a Department</option>
    <?php foreach ($departments as $department): ?>
        <option value="<?= $department['department_id']; ?>" 
                data-name="<?= htmlspecialchars($department['name'], ENT_QUOTES, 'UTF-8'); ?>" 
                data-description="<?= htmlspecialchars($department['description'], ENT_QUOTES, 'UTF-8'); ?>">
            <?= htmlspecialchars($department['name'], ENT_QUOTES, 'UTF-8'); ?>
        </option>
    <?php endforeach; ?>
</select>
</div>

    <div id="edit-fields" style="display: none;">
    <div class = "form-group w50"> 
        <label for="edit_name">Edit Name:</label>
        <input type="text" name="edit_name" id="edit_name">
</div>
<br/>
<div class = "form-group w50"> 
        <label for="edit_description">Edit Description:</label>
        <textarea name="edit_description" id="edit_description" rows="3"></textarea>
    </div>
    </div>

    <button type="submit" name="edit_department" id="edit_button" style="display: none;">Update Department</button>
    <button type="submit" name="delete_department" id="delete_button" style="display: none;" onclick="return confirm('Are you sure you want to delete this department?');">Delete Department</button>
</form>

<hr>

<!-- Display Department List -->
<h2>Department List</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Created At</th>
            <th>Updated At</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($departments as $department): ?>
        <tr>
            <td><?= $department['department_id']; ?></td>
            <td><?= htmlspecialchars($department['name']); ?></td>
            <td><?= htmlspecialchars($department['description']); ?></td>
            <td><?= $department['created_at']; ?></td>
            <td><?= isset($department['updated_at']) ? $department['updated_at'] : 'N/A'; ?></td>
        </tr>
    <?php endforeach; ?>
</tbody>

</table>

<script>
    function populateForm(departmentId) {
        const selectElement = document.getElementById('department_id');
        const selectedOption = selectElement.options[selectElement.selectedIndex];
        
        if (departmentId) {
            document.getElementById('edit_name').value = selectedOption.getAttribute('data-name');
            document.getElementById('edit_description').value = selectedOption.getAttribute('data-description');
            document.getElementById('edit-fields').style.display = 'block';
            document.getElementById('edit_button').style.display = 'inline-block';
            document.getElementById('delete_button').style.display = 'inline-block';
        } else {
            document.getElementById('edit-fields').style.display = 'none';
            document.getElementById('edit_button').style.display = 'none';
            document.getElementById('delete_button').style.display = 'none';
        }
    }
</script>
</div>
                    </div> <!-- end row -->
        
                </div> <!-- container -->
        
 
<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->            
        
        </body>
        
        </html>