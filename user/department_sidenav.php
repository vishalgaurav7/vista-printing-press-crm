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
            <li class="side-nav-title">Navigation</li>

            <li class="side-nav-item">
                <a href="../index.php" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-view-dashboard"></i></span>
                    <span class="menu-text"> Dashboard </span>
                </a>
            </li>


           

            
            <li class="side-nav-item">
                        <a href="department_dashboard.php" class="side-nav-link">
                            <span class="menu-icon"><i class="mdi mdi-file-document-outline"></i></span>
                            <span class="menu-text"> View and Update Sub-Task </span>
                        </a>
                    </li>


            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarExtendedUI" aria-expanded="false" aria-controls="sidebarExtendedUI" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-chart-pie-outline"></i></span>
                    <span class="menu-text"> Reports </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarExtendedUI">
                    <ul class="sub-menu">
                        <li class="side-nav-item">
                            <a href="department_report_view_completed_sub-task.php" class="side-nav-link">
                                <span class="menu-text">Completed Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="department_report_view_near_date_subtasks.php" class="side-nav-link">
                                <span class="menu-text">Near Delivery Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="department_report_view_overdue_subtasks.php" class="side-nav-link">
                                <span class="menu-text">Late Task</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="side-nav-item">
                        <a href="department_change_password.php" class="side-nav-link">
                            <span class="menu-icon"><i class="mdi mdi-lock-outline"></i></span>
                            <span class="menu-text"> Change Password </span>
                        </a>
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