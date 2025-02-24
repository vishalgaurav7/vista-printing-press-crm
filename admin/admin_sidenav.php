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
                <a data-bs-toggle="collapse" href="#sidebarPages" aria-expanded="false" aria-controls="sidebarPages" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-file-document-outline"></i></span>
                    <span class="menu-text"> Task </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarPages">
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
                            <a href="admin_task_status_modify.php" class="side-nav-link">
                                <span class="menu-text">Comple Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="pages-invoice.html" class="side-nav-link">
                                <span class="menu-text">Invoice</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="add-sub-task.php" class="side-nav-link">
                                <span class="menu-text">Task Assign to User</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_update_subtask.php" class="side-nav-link">
                                <span class="menu-text">Update Sub-Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_completed_subtask.php" class="side-nav-link">
                                <span class="menu-text">Update Completed Sub-Task</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarPagesError" aria-expanded="false" aria-controls="sidebarPagesError" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-briefcase-outline"></i></span>
                    <span class="menu-text"> Dipartments </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarPagesError">
                    <ul class="sub-menu">
                        <li class="side-nav-item">
                            <a href="admin_department_manage.php" class="side-nav-link">
                                <span class="menu-text">Create Dipartments</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="error-404.html" class="side-nav-link">
                                <span class="menu-text">Modify Dipartments</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="side-nav-item">
            <a href="admin_master.php" class="side-nav-link">
            <span class="menu-icon"><i class="mdi mdi-puzzle-outline"></i></span>
                    <span class="menu-text"> Master </span>
                
                </a>
          </li>
            <li class="side-nav-item">
                <a data-bs-toggle="collapse" href="#sidebarBaseUI" aria-expanded="false" aria-controls="sidebarBaseUI" class="side-nav-link">
                    <span class="menu-icon"><i class="mdi mdi-puzzle-outline"></i></span>
                    <span class="menu-text"> Master Data </span>
                    <span class="menu-arrow"></span>
                </a>
                <div class="collapse" id="sidebarBaseUI">
                    <ul class="sub-menu">
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Paper Quality</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Paper Size</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Plate Type</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Printing Type</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Plate Type</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Printing Type</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Color Type</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_master.php" class="side-nav-link">
                                <span class="menu-text">Lamination Type</span>
                            </a>
                        </li>
                    </ul>
                </div>
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
                            <a href="extended-sweetalerts.html" class="side-nav-link">
                                <span class="menu-text">Task Report</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_report_view_subtasks.php" class="side-nav-link">
                                <span class="menu-text">Pending Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_report_view_completed_subtasks.php" class="side-nav-link">
                                <span class="menu-text">Completed Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_report_view_near_date_subtasks.php" class="side-nav-link">
                                <span class="menu-text">Near Delivery Task </span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="admin_report_view_overdue_subtasks.php" class="side-nav-link">
                                <span class="menu-text">Late Delivery Task</span>
                            </a>
                        </li>
                        <li class="side-nav-item">
                            <a href="extended-tour.html" class="side-nav-link">
                                <span class="menu-text">Dipartment Task Status</span>
                            </a>
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