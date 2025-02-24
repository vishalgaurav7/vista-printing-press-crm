<?php
session_start();

// Check if the user is logged in and has 'admin' role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $role = $_POST['role'];
    $department_id = isset($_POST['department_id']) && $_POST['department_id'] !== "" ? $_POST['department_id'] : null;

    try {
        // Validate role and department
        if ($role == 'department' && !$department_id) {
            throw new Exception("Please select a department.");
        }

        // Check if the username or email already exists
        $sql = "SELECT * FROM users WHERE username = :username OR email = :email";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        if ($stmt->fetch(PDO::FETCH_ASSOC)) {
            throw new Exception("Username or email already exists. Please choose a different one.");
        }

        // Hash the password for security
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        // Insert the new user
        $sql = "INSERT INTO users (username, email, password, role, department_id) 
                VALUES (:username, :email, :password, :role, :department_id)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $hashed_password);
        $stmt->bindParam(':role', $role);
        $stmt->bindParam(':department_id', $department_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            $successMessage = "User created successfully!";
        } else {
            throw new Exception("Failed to create user. Please try again.");
        }
    } catch (Exception $e) {
        $errorMessage = $e->getMessage();
    }
}

// Fetch dropdown data
function fetchDropdownData($table, $conn) {
    $stmt = $conn->prepare("SELECT department_id, name FROM $table");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

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
    <style>
        /* Inline styles for popup */
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background: white;
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 1000;
        }
        .popup.show {
            display: block;
        }
        .popup .close {
            position: absolute;
            top: 5px;
            right: 10px;
            cursor: pointer;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }
        .overlay.show {
            display: block;
        }
        .page-container {
    place-items: center;
 }
    </style>
   
</head>

<body class="globle-page">
  
     

         <!-- Topbar Start -->
<header class="app-topbar-main">
<?php include 'admin_header.php'; ?>
</header>

        <!-- Page Content -->
        <div class="page-content">
            <div class="page-container">
    
    <?php if (!empty($successMessage) || !empty($errorMessage)): ?>
        <div class="overlay show"></div>
        <div class="popup show">
            <span class="close" onclick="closePopup()">&times;</span>
            <?php if (!empty($successMessage)): ?>
                <p style="color: green;"><?php echo htmlspecialchars($successMessage); ?></p>
            <?php endif; ?>
            <?php if (!empty($errorMessage)): ?>
                <p style="color: red;"><?php echo htmlspecialchars($errorMessage); ?></p>
            <?php endif; ?>
        </div>
    <?php endif; ?>

    <div class="container">
        <h1>Create New User</h1>
        <form method="POST">
            <!-- Username -->
            <div class="task-cnt">
            <div class = "form-group w30">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" required>
            </div>
<br/>
            <!-- Email -->
            <div class = "form-group w30">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" >
            </div>
<br/>
            <!-- Password -->
           <div class = "form-group w30">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required>
            </div>
<br/>
            <!-- Role -->
            <div class = "form-group w30">
                <label for="role">Role:</label>
                <select name="role" id="role" required>
                    <option value="">Select Role</option>
                    <option value="admin">Admin</option>
                    <option value="manager">Manager</option>
                    <option value="department">Department</option>
                </select>
            </div>
<br/>
            <!-- Department Dropdown -->
            <div id="department-container" style="display: none;">
                <label for="department_id">Department:</label>
                <select name="department_id" id="department_id">
                    <option value="">Select Department</option>
                    <?php foreach ($departments as $department): ?>
                        <option value="<?php echo htmlspecialchars($department['id']); ?>">
                            <?php echo htmlspecialchars($department['name']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <!-- Submit -->
            <button type="submit">Create User</button>
            </div>
        </form>
    </div>

    <script>
        // Show/Hide Department Dropdown
        document.getElementById('role').addEventListener('change', function () {
            const departmentContainer = document.getElementById('department-container');
            departmentContainer.style.display = this.value === 'department' ? 'block' : 'none';
        });

        // Close popup
        function closePopup() {
            document.querySelector('.popup').classList.remove('show');
            document.querySelector('.overlay').classList.remove('show');
        }
    </script>
    </div>
        </div>

<!-- Footer Start -->       
<?php include '../footer.php'; ?>                       
<!-- end Footer -->
</body>
</html>