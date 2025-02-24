 <!-- Topbar Start -->
 <header class="app-topbar-main">
         <div class="app-topbar">
            <div class="page-container topbar-menu">
                <div class="d-flex align-items-center gap-2">

                    <!-- Brand Logo -->
                    <a href="index.html" class="logo">
                        <span class="logo-light">
                            <span class="logo-lg"><img src="../assets/images/logo-light.png" alt="logo"></span>
                            <span class="logo-sm"><img src="../assets/images/logo-sm-light.png" alt="small logo"></span>
                        </span>

                        <!-- <span class="logo-dark">
                            <span class="logo-lg"><img src="../assets/images/logo-dark.png" alt="dark logo"></span>
                            <span class="logo-sm"><img src="../assets/images/logo-sm.png" alt="small logo"></span>
                        </span> -->
                    </a>

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



<?php include 'admin/admin_sidenav.php'; ?>
            </div>
        </div>
        <!-- Sidenav Menu End -->
</header>
        <!-- Topbar End -->