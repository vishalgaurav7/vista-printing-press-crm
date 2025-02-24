<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

// Fetch all users to display in the dropdown
require '../db.php';
$sql = "SELECT id, username, email, role, department_id FROM users";
$stmt = $conn->prepare($sql);
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch all departments for the dropdown
$dept_sql = "SELECT department_id, name FROM departments";
$dept_stmt = $conn->prepare($dept_sql);
$dept_stmt->execute();
$departments = $dept_stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<?php
if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    $sql = "SELECT id, username, email, role, department_id FROM users WHERE id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $userId);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        echo json_encode(['success' => true, 'user' => $user]);
    } else {
        echo json_encode(['success' => false, 'message' => 'User not found.']);
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
<?php include 'admin_header.php'; ?>
</header>


        <!-- Page Content -->
        <div class="page-content">
            <div class="page-container">
<div class="task-cnt">                
        <h1>Edit or Delete User</h1>

<!-- User Selection Form -->
<form id="user-selection-form" method="POST">
    <label for="user_id">Select User:</label>
    <select name="user_id" id="user_id" required>
        <option value="">Select a user</option>
        <?php foreach ($users as $user): ?>
            <option value="<?= $user['id']; ?>"><?= $user['username']; ?> (<?= $user['role']; ?>)</option>
        <?php endforeach; ?>
    </select>
    <button type="button" id="fetch-user">Fetch Details</button>
</form>

<!-- Edit User Form (hidden initially) -->
<form id="edit-user-form" method="POST" action="../login_update.php" style="display:none;">
    <input type="hidden" name="user_id" id="edit_user_id">
    <div class = "form-group w50"> 
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required />
    </div>
    <br/>

    <div class = "form-group w50"> 
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required />
    </div>
    <br/>

    <div class = "form-group w50"> 
        <label for="role">Role:</label>
        <select name="role" id="role" required>
            <option value="admin">Admin</option>
            <option value="manager">Manager</option>
            <option value="department">Department</option>
        </select>
    </div>
    <br/>

    <!-- Department dropdown, hidden initially -->
    <p id="department-container" style="display:none;">
    <div class = "form-group w50">     
    <label for="department">Department:</label>
        <select name="department_id" id="department_id">
            <option value="">Select Department</option>
            <?php foreach ($departments as $department): ?>
                <option value="<?= $department['department_id']; ?>"><?= $department['name']; ?></option>
            <?php endforeach; ?>
        </select>
            </div>
            <br/>

            <div class = "form-group w50"> 
        <label for="password">Password (Leave blank to keep unchanged):</label>
        <input type="password" name="password" id="password" />
            </div>
            <br/>

    <button type="submit" name="update_user">Update User</button>
    <button type="button" id="delete-user">Delete User</button>
</form>
</div>
</div>
</div>

<script>
// Show/hide department dropdown based on role selection
document.getElementById('role').addEventListener('change', function () {
const role = this.value;
const departmentContainer = document.getElementById('department-container');

if (role === 'department') {
    departmentContainer.style.display = 'block'; // Show the department dropdown
} else {
    departmentContainer.style.display = 'none'; // Hide the department dropdown
}
});

// Fetch user details
document.getElementById('fetch-user').addEventListener('click', function () {
const userId = document.getElementById('user_id').value;
if (userId) {
    fetch(`../login_fetch_details.php?user_id=${userId}`)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('edit_user_id').value = data.user.id;
                document.getElementById('username').value = data.user.username;
                document.getElementById('email').value = data.user.email;
                document.getElementById('role').value = data.user.role;
                document.getElementById('department_id').value = data.user.department_id;

                // Trigger the change event to show/hide department dropdown
                document.getElementById('role').dispatchEvent(new Event('change'));

                document.getElementById('edit-user-form').style.display = 'block';
            } else {
                alert(data.message);
            }
        });
} else {
    alert('Please select a user first.');
}
});

// Handle delete user
document.getElementById('delete-user').addEventListener('click', function () {
const userId = document.getElementById('edit_user_id').value;
if (confirm('Are you sure you want to delete this user?')) {
    fetch(`../login_delete.php?user_id=${userId}`)
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            if (data.success) {
                window.location.reload();
            }
        });
}
});
</script>

    </div>

<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>
</html>
