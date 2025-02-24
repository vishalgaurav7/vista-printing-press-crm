<?php
session_start();

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';




// Fetch tasks excluding completed ones
try {
    $stmt = $conn->prepare("SELECT task_id, client_name FROM tasks WHERE status != 'Completed'");
    $stmt->execute();
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching tasks: " . $e->getMessage();
    exit();
}

// Check if tasks are fetched
if (empty($tasks)) {
    echo "No main tasks available.";
    exit();
}
?>


<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" data-layout="topnav"> -->

<head>
    <meta charset="utf-8" />
    <title>Dashboard | Uplon - Responsive Bootstrap 5 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico">

    <!-- Vendor css -->
    <link href="../assets/css/vendor.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- App css -->
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <!-- Theme Config Js -->
    <script src="../assets/js/config.js"></script>
    <style>
        .app-topbar .topbar-menu {
    flex-flow: row-reverse !important;
}
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
            <?php
require '../db.php';
?>
   
   <?php
// Fetch data for dropdowns
$departments = $conn->query("SELECT * FROM departments")->fetchAll(PDO::FETCH_ASSOC);
$users = $conn->query("SELECT id, username FROM users")->fetchAll(PDO::FETCH_ASSOC);
?>

<h1>Assign Sub-Task with Deadline</h1>
<form action="../sub-task-process.php" method="POST">
    <p>
    <label for="main_task">Main Task:</label>
    <select name="main_task_id" id="main_task" required>
        <option value="">Select Main Task</option>
        <?php foreach ($tasks as $task): ?>
            <option value="<?= htmlspecialchars($task['task_id']); ?>">
                <?= htmlspecialchars($task['task_id'] . " - " . $task['client_name']); ?>
            </option>
        <?php endforeach; ?>
    </select>
    </p>
    <p>
        <label for="description">Sub-Task Description:</label>
        <textarea name="description" id="description" rows="4" required></textarea>
    </p>
    <p>
        <label for="delivery_date">Delivery Date:</label>
        <input type="date" name="delivery_date" id="delivery_date" required>
    </p>
    <p>
        <label for="assigned_to_department">Assign to Department:</label>
        <select name="assigned_to_department" id="assigned_to_department">
            <option value="">Select Department</option>
            <?php foreach ($departments as $department): ?>
                <option value="<?= $department['department_id']; ?>"><?= $department['name']; ?></option>
            <?php endforeach; ?>
        </select>
    </p>
    <p>
        <label for="assigned_to">Assign to User:</label>
        <select name="assigned_to" id="assigned_to">
            <option value="">Select User</option>
            <?php foreach ($users as $user): ?>
                <option value="<?= $user['id']; ?>"><?= $user['username']; ?></option>
            <?php endforeach; ?>
        </select>
    </p>
    <button type="submit">Assign Sub-Task</button>
</form>


                    </div> <!-- end row -->
        
                </div> <!-- container -->
        
                    <!-- Footer Start -->
                    <footer class="footer">
                        <div class="page-container">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <script>document.write(new Date().getFullYear())</script> © Uplon - By <span class="fw-semibold text-decoration-underline text-primary">Coderthemes</span>
                                </div>
                            </div>
                        </div>
                    </footer>
                    <!-- end Footer -->
        
                </div>
        
                <!-- ============================================================== -->
                <!-- End Page content -->
                <!-- ============================================================== -->
        
            </div>
            <!-- END wrapper -->
        
            <!-- Theme Settings -->
            <div class="offcanvas offcanvas-end" tabindex="-1" id="theme-settings-offcanvas" style="width: 260px;">
                <div class="bg-primary d-flex align-items-center gap-2 p-4 offcanvas-header">
                    <h5 class="flex-grow-1 text-white mb-0">Theme Settings</h5>
        
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
        
                <div class="offcanvas-body p-4 h-100" data-simplebar>
                    <div class="mb-3">
                        <h5 class="mb-3 font-16 fw-bold">Color Scheme</h5>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-light" value="light">
                            <label class="form-check-label" for="layout-color-light">Light</label>
                        </div>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-bs-theme" id="layout-color-dark" value="dark">
                            <label class="form-check-label" for="layout-color-dark">Dark</label>
                        </div>
                    </div>
        
        
                    <div class="mb-3">
                        <h5 class="mb-3 font-16 fw-bold">Topbar Color</h5>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-light" value="light">
                            <label class="form-check-label" for="topbar-color-light">Light</label>
                        </div>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-dark" value="dark">
                            <label class="form-check-label" for="topbar-color-dark">Dark</label>
                        </div>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-topbar-color" id="topbar-color-brand" value="brand">
                            <label class="form-check-label" for="topbar-color-brand">Brand</label>
                        </div>
                    </div>
        
                    <div class="mb-3">
                        <h5 class="mb-3 font-16 fw-bold">Menu Color</h5>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-menu-color" id="sidenav-color-light" value="light">
                            <label class="form-check-label" for="sidenav-color-light">Light</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-menu-color" id="sidenav-color-dark" value="dark">
                            <label class="form-check-label" for="sidenav-color-dark">Dark</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-menu-color" id="sidenav-color-brand" value="brand">
                            <label class="form-check-label" for="sidenav-color-brand">Brand</label>
                        </div>
                    </div>
        
                    <div class="mb-3" id="sidebarSize">
                        <h5 class="mb-3 font-16 fw-bold">Sidebar Size</h5>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-sidenav-size" id="sidenav-size-default" value="default">
                            <label class="form-check-label" for="sidenav-size-default">Default</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-sidenav-size" id="sidenav-size-compact" value="compact">
                            <label class="form-check-label" for="sidenav-size-compact">Compact</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-sidenav-size" id="sidenav-size-small" value="condensed">
                            <label class="form-check-label" for="sidenav-size-small"> Condensed</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-sidenav-size" id="sidenav-size-small-hover" value="sm-hover">
                            <label class="form-check-label" for="sidenav-size-small-hover">Hover View</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-sidenav-size" id="sidenav-size-full" value="full">
                            <label class="form-check-label" for="sidenav-size-full">Full Layout</label>
                        </div>
        
                        <div class="form-check sidebar-setting">
                            <input class="form-check-input" type="radio" name="data-sidenav-size" id="sidenav-size-fullscreen" value="fullscreen">
                            <label class="form-check-label" for="sidenav-size-fullscreen">Hidden</label>
                        </div>
                    </div>
        
                    <div class="mb-3">
                        <h5 class="mb-3 font-16 fw-bold">Layout Mode</h5>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-fluid" value="fluid">
                            <label class="form-check-label" for="layout-mode-fluid">Fluid</label>
                        </div>
        
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="data-layout-mode" id="layout-mode-boxed" value="boxed">
                            <label class="form-check-labe" for="layout-mode-boxed">Boxed</label>
                        </div>
                    </div>
                </div>
        
                <div class="d-flex align-items-center gap-2 px-3 py-2 offcanvas-header border-top border-dashed">
                    <button type="button" class="btn w-50 btn-soft-danger" id="reset-layout">Reset</button>
                    <a href="https://1.envato.market/XY7j5" class="btn w-50 btn-soft-info" target="_blank">Buy Now</a>
                </div>
        
            </div>
        
            <!-- Vendor js -->
            <script src="../assets/js/vendor.min.js"></script>
        
            <!-- App js -->
            <script src="../assets/js/app.js"></script>
        
            <!--Morris Chart-->
            <script src="../assets/libs/morris.js/morris.min.js"></script>
            <script src="../assets/libs/raphael/raphael.min.js"></script>
        
            <!-- Projects Analytics Dashboard App js -->
            <script src="../assets/js/pages/dashboard-sales.js"></script>
        
        </body>
        
        </html>