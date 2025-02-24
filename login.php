<?php
session_start(); // Ensure session is started

// Check if the license error session variable is set
$licenseError = isset($_SESSION['license_error']) && $_SESSION['license_error'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="login-container" style="margin-top: 100px; max-width: 400px; margin-left: auto; margin-right: auto;">
        <h2>Login</h2>
        <?php if (isset($_SESSION['login_error'])): ?>
            <div style="color: red; margin-bottom: 10px;">
                <?php echo $_SESSION['login_error']; unset($_SESSION['login_error']); ?>
            </div>
        <?php endif; ?>
        <form action="login_process.php" method="POST">
            <div class="form-group">
                <label for="user">Username</label>
                <input type="text" class="form-control" id="user" name="user" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
    </div>

    <!-- License Error Modal -->
    <?php if ($licenseError): ?>
        <div class="modal fade" id="licenseModal" tabindex="-1" role="dialog" aria-labelledby="licenseModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="licenseModalTitle">License Status</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        License is Not Valid! <br>
                        Please Contact the Developer <br>
                        Call @ +91 9334946120 <br>
                        Mail: vishal_ssc@yahoo.com
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // Trigger the modal when the page loads
            document.addEventListener('DOMContentLoaded', function () {
                $('#licenseModal').modal({
                    backdrop: 'static',
                    keyboard: false
                }).modal('show');
            });
        </script>
        <?php unset($_SESSION['license_error']); // Clear the session variable ?>
    <?php endif; ?>

    <!-- Bootstrap JS and Dependencies -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
