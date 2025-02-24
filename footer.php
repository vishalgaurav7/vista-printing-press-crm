<footer class="footer">

                        <div class="page-container">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                <?php echo date("Y"); ?> © Uplon - By <span class="fw-semibold text-decoration-underline text-primary">Voniix</span>
                                </div>
                            </div>
                        </div>
                        <!-- Vendor js -->
            <script src="../assets/js/vendor.min.js"></script> 
            <script>
    document.addEventListener("DOMContentLoaded", function () {
        // Select the toggle button and sidebar
        const toggleButton = document.getElementById("menuToggle");
        const sidebar = document.getElementById("sidebar");
        const body = document.body; // Reference the <body> element

        // Add event listener only if the button and sidebar exist
        if (toggleButton && sidebar) {
            toggleButton.addEventListener("click", function () {
                // Toggle the hidden class on the sidebar
                sidebar.classList.toggle("show-menu");

                // Add or remove a class on the <body> element
                body.classList.toggle("menu-active");
            });
        }
    });
</script>
<script src="../assets/js/app.js"></script>
                    </footer>