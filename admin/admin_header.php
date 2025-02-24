 <!-- Topbar Start -->
 <header class="app-topbar-main">
    
 <style>
        .app-topbar .topbar-menu {
    flex-flow: row-reverse !important;
}

.topbar{display: -webkit-box;
    /* display: -ms-flexbox; */
    /* display: flex; */
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    height: var(--bs-topbar-height);
    padding: 0 6px;
    color: #fff;
}
    </style>
         <div class="app-topbar">
            <div class="page-container topbar-menu">
                <div class="d-flex align-items-center gap-2">
                    <div class="topbar">
                    <?php
require '../db.php'; // Assuming this is your connection file

// SQL query to select the Name column
$query = "SELECT Name FROM company"; // Replace 'your_table_name' with the actual table name

try {
    $stmt = $conn->query($query);
    $names = $stmt->fetchAll(PDO::FETCH_ASSOC); // Fetch all records
    
    // Loop through each record and echo the Name
    foreach ($names as $row) {
        echo "<strong>" . htmlspecialchars($row['Name']) . "</strong>"; 
    }
} catch (PDOException $e) {
    echo "Error fetching names: " . $e->getMessage();
}
?>

                    </div>
                    <!-- User Dropdown -->
                    <div class="topbar-item nav-user">
                        
                        <div class="dropdown">
                            <a class="topbar-link dropdown-toggle drop-arrow-none px-2" data-bs-toggle="dropdown" data-bs-offset="0,25" type="button" aria-haspopup="false" aria-expanded="false">
                                <img src="../assets/images/users/avatar-1.jpg" width="32" class="rounded-circle me-lg-2 d-flex" alt="user-image">
                                <span class="d-lg-flex flex-column gap-1 d-none">
                                
                                <h6 class="my-0"><?php echo "Hi, " . $_SESSION['username']; ?></h6>
                                <!-- $_SESSION['user_logged_in']; -->
                                </span>
                                <i class="mdi mdi-chevron-down d-none d-lg-block align-middle ms-2"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                               
                                <a href="../logout.php" class="dropdown-item notify-item">
                                    <i class="mdi mdi-logout-variant"></i>
                                    <span>Logout</span>
                                </a>

                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>
            </div>
            <div class="wrapper">

        
<!-- Sidenav Menu Start -->
<button id="menuToggle" class="menu-toggle-btn">
    <i class="mdi mdi-menu"></i> <!-- Icon for the button -->
</button>
<div id="sidebar" class="sidenav-menu">


<?php
// sidenav.php
?>

<!-- Brand Logo -->
<a href="../index.php" class="logo">

<span class="logo-dark">
    <span class="logo-lg"><img src="../assets/images/logo-dark.png" alt="dark logo"></span>
    <span class="logo-sm"><img src="../assets/images/logo-sm.png" alt="small logo"></span>
</span>
</a>

<!-- Sidebar Hover Menu Toggle Button -->
<button class="button-sm-hover">
<i class="ti ti-circle align-middle"></i>
</button>

<!-- Full Sidebar Menu Close Button -->
<button class="button-close-fullsidebar">
<i class="ti ti-x align-middle"></i>
</button>

    <div data-simplebar>

        <!--- Sidenav Menu -->
        <ul class="side-nav">
            <li class="side-nav-item">
                <a href="../index.php" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-view-dashboard"></i></span>
                    <span class="menu-text"> Dashboard </span>
                </a>
            </li>


            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarPagesAuth" aria-expanded="false" aria-controls="sidebarPagesAuth" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-lock-outline"></i></span>
                    <span class="menu-text"> Users </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarPagesAuth">
                    <ul class="sub-menu">
                        <li class="side-nav-item">
                            <a href="admin_user_create.php" class="side-nav-link">
                                <span class="menu-text">Create Users</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_user_modify.php" class="side-nav-link">
                                <span class="menu-text">Modify Users</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
           
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarPagestask" aria-expanded="false" aria-controls="sidebarPagestask" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-file-document-outline"></i></span>
                    <span class="menu-text"> Task </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarPagestask">
                    <ul class="sub-menu">
                        <li class="side-nav-item">
                            <a href="admin_task_create.php" class="side-nav-link">
                                <span class="menu-text">Create Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_task_modify.php" class="side-nav-link">
                                <span class="menu-text">Modify Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_task_subtask_manage.php" class="side-nav-link">
                                <span class="menu-text">Manage Task</span>
                            </a>
                        </li>
                        
                        <li class="side-nav-item">
                            <a href="admin_job_print.php" class="side-nav-link">
                                <span class="menu-text">Print Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_task_status_modify.php" class="side-nav-link">
                                <span class="menu-text">Complete Task</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarPages" aria-expanded="false" aria-controls="sidebarPages" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-file-multiple"></i></span>
                    <span class="menu-text"> Sub-Task </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarPages">
                    <ul class="sub-menu">
                        <li class="side-nav-item">
                            <a href="add-sub-task.php" class="side-nav-link">
                                <span class="menu-text">Create Sub-Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_update_subtask.php" class="side-nav-link">
                                <span class="menu-text">Update Sub-Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_completed_subtask.php" class="side-nav-link">
                                <span class="menu-text">Modify Completed Sub-Task</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

            
            <li class="side-nav-item">
            <a href="admin_department_manage.php" class="side-nav-link">
            <span class="menu-icon"><i class="mdi mdi-briefcase-outline"></i></span>
                    <span class="menu-text"> Department </span>
                
                </a>
            </li>

            <li class="side-nav-item">
            <a href="admin_master.php" class="side-nav-link">
            <span class="menu-icon"><i class="mdi mdi-puzzle-outline"></i></span>
                    <span class="menu-text"> Master </span>
                
                </a>
            </li>
            

          
          <li class="side-nav-item">
                        <a data-bs-toggle="collapse" href="#sidebarMultiLevel" aria-expanded="false" aria-controls="sidebarMultiLevel" class="side-nav-link">
                        <span class="menu-icon"><i class="mdi mdi-chart-pie-outline"></i></span>
                        <span class="menu-text"> Reports </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarMultiLevel">
                            <ul class="sub-menu">
                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="#sidebarSecondLevel" aria-expanded="false" aria-controls="sidebarSecondLevel" class="side-nav-link">
                                        <span class="menu-icon"><i class="mdi mdi-file-document-outline"></i></span>   
                                        <span class="menu-text"> Task Reports </span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="sidebarSecondLevel">
                                        <ul class="sub-menu">
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_tasks.php" class="side-nav-link">
                                                    <span class="menu-text">All Running Task</span>
                                                </a>
                                            </li>
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_completed_tasks.php" class="side-nav-link">
                                                    <span class="menu-text">Completed Task Date Wise</span>
                                                </a>
                                            </li>
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_near_delivery_tasks.php" class="side-nav-link">
                                                    <span class="menu-text">Near Delivery Task</span>
                                                </a>
                                            </li>
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_late_tasks.php" class="side-nav-link">
                                                    <span class="menu-text">Late Task</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="#sidebarThirdLevel" aria-expanded="false" aria-controls="sidebarSecondLevel" class="side-nav-link">
                                        <span class="menu-icon"><i class="mdi mdi-file-document-outline"></i></span>   
                                        <span class="menu-text"> Sub-Task Reports </span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="sidebarThirdLevel">
                                        <ul class="sub-menu">
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_subtasks.php" class="side-nav-link">
                                                    <span class="menu-text">All Running Sub-Task</span>
                                                </a>
                                            </li>
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_completed_subtasks.php" class="side-nav-link">
                                                    <span class="menu-text">Completed Sub-Task</span>
                                                </a>
                                            </li>
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_near_date_subtasks.php" class="side-nav-link">
                                                    <span class="menu-text">Near Delivery Sub-Task</span>
                                                </a>
                                            </li>
                                            <li class="side-nav-item">
                                                <a href="admin_report_view_overdue_subtasks.php" class="side-nav-link">
                                                    <span class="menu-text">Late Sub-Task</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>


            <li class="side-nav-item">
            <a href="../logout.php" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-logout"></i></span>
                    <span class="menu-text"> Logout </span>
                
                </a>
          </li>

                </div>
            </li>
        </ul>

        <div class="clearfix"></div>

            </div>
        </div>
        <!-- Sidenav Menu End -->

        <!-- Topbar End -->