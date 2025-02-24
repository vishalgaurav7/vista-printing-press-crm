<?php
session_start();
$user_role = $_SESSION['role'];

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'department') {
    header("Location: ../login.php");
    
    exit();
}
// echo '<pre>';
// print_r($_SESSION); // Prints the array in a human-readable format
// echo '</pre>';
// exit;

require '../db.php'; // Database connection

// Initialize variables
$subTasks = [];
$nearDeliverySubTasks = [];
$completedSubTasks = [];
$lateSubTasks = [];
$userId = $userId = $_SESSION['user_id']; // Assuming the user is logged in with ID 1 (this should be dynamic based on the logged-in user)

// Fetch pending sub-tasks
try {
    $stmt = $conn->prepare("SELECT * FROM sub_tasks WHERE assigned_to = :user_id AND status != 'Completed'");
    $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
    $stmt->execute();
    $subTasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching sub-tasks: " . $e->getMessage();
}

// Fetch completed sub-tasks
try {
    $stmt = $conn->prepare("SELECT * FROM sub_tasks WHERE assigned_to = :user_id AND status = 'Completed'");
    $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
    $stmt->execute();
    $completedSubTasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching completed sub-tasks: " . $e->getMessage();
}

// Fetch near delivery sub-tasks within a specific date range
$deliveryRanges = [7, 6, 5, 4, 3, 2, 1];
foreach ($deliveryRanges as $days) {
    try {
        $stmt = $conn->prepare("SELECT * FROM sub_tasks WHERE assigned_to = :user_id AND status != 'Completed' AND delivery_date = CURDATE() + INTERVAL :days DAY");
        $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
        $stmt->bindParam(':days', $days, PDO::PARAM_INT);
        $stmt->execute();
        $nearDeliverySubTasks[$days] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error fetching near delivery sub-tasks: " . $e->getMessage();
    }
}

// Fetch late sub-tasks (past delivery date)
try {
    $stmt = $conn->prepare("SELECT * FROM sub_tasks WHERE assigned_to = :user_id AND status != 'Completed' AND delivery_date < CURDATE()");
    $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
    $stmt->execute();
    $lateSubTasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching late sub-tasks: " . $e->getMessage();
}

// Update sub-task status or notes
if (isset($_POST['update_status'])) {
    try {
        $subTaskId = $_POST['sub_task_id'];
        $status = $_POST['status'];
        $notes = $_POST['notes'];

        $stmt = $conn->prepare("UPDATE sub_tasks SET status = :status, notes = :notes WHERE sub_task_id = :sub_task_id");
        $stmt->bindParam(':sub_task_id', $subTaskId, PDO::PARAM_INT);
        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
        $stmt->bindParam(':notes', $notes, PDO::PARAM_STR);
        $stmt->execute();

        echo "Sub-task updated successfully!";
    } catch (PDOException $e) {
        echo "Error updating sub-task: " . $e->getMessage();
    }
}

// Change user profile password
if (isset($_POST['change_password'])) {
    $newPassword = password_hash($_POST['new_password'], PASSWORD_BCRYPT); // Hash the new password
    try {
        $stmt = $conn->prepare("UPDATE users SET password = :new_password WHERE user_id = :user_id");
        $stmt->bindParam(':new_password', $newPassword, PDO::PARAM_STR);
        $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
        $stmt->execute();

        echo "Password changed successfully!";
    } catch (PDOException $e) {
        echo "Error changing password: " . $e->getMessage();
    }
}
?>

<!-- User Dashboard -->
<h1>User Dashboard</h1>

<!-- Pending Sub-Tasks -->
<h2>Pending Sub-Tasks</h2>
<table border="1">
    <thead>
        <tr>
            <th>Sub-Task ID</th>
            <th>Description</th>
            <th>Delivery Date</th>
            <th>Status</th>
            <th>Notes</th>
            <th>Update Status</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($subTasks as $subTask): ?>
        <tr>
            <td><?= $subTask['sub_task_id']; ?></td>
            <td><?= $subTask['description']; ?></td>
            <td><?= $subTask['delivery_date']; ?></td>
            <td><?= $subTask['status']; ?></td>
            <td><?= $subTask['notes']; ?></td>
            <td>
                <form method="POST" action="">
                    <input type="hidden" name="sub_task_id" value="<?= $subTask['sub_task_id']; ?>">
                    <select name="status">
                        <option value="Pending" <?= $subTask['status'] == 'Pending' ? 'selected' : ''; ?>>Pending</option>
                        <option value="In Progress" <?= $subTask['status'] == 'In Progress' ? 'selected' : ''; ?>>In Progress</option>
                        <option value="Completed" <?= $subTask['status'] == 'Completed' ? 'selected' : ''; ?>>Completed</option>
                    </select>
                    <textarea name="notes"><?= $subTask['notes']; ?></textarea>
                    <button type="submit" name="update_status">Update</button>
                </form>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<!-- Completed Sub-Tasks -->
<h2>Completed Sub-Tasks</h2>
<table border="1">
    <thead>
        <tr>
            <th>Sub-Task ID</th>
            <th>Description</th>
            <th>Delivery Date</th>
            <th>Status</th>
            <th>Notes</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($completedSubTasks as $subTask): ?>
        <tr>
            <td><?= $subTask['sub_task_id']; ?></td>
            <td><?= $subTask['description']; ?></td>
            <td><?= $subTask['delivery_date']; ?></td>
            <td><?= $subTask['status']; ?></td>
            <td><?= $subTask['notes']; ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<!-- Near Delivery Sub-Tasks -->
<h2>Near Delivery Sub-Tasks</h2>
<?php foreach ($nearDeliverySubTasks as $days => $tasks): ?>
    <h3><?= $days; ?> Days Before Delivery</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Sub-Task ID</th>
                <th>Description</th>
                <th>Delivery Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($tasks as $task): ?>
            <tr>
                <td><?= $task['sub_task_id']; ?></td>
                <td><?= $task['description']; ?></td>
                <td><?= $task['delivery_date']; ?></td>
                <td><?= $task['status']; ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php endforeach; ?>

<!-- Late Sub-Tasks -->
<h2>Late Sub-Tasks</h2>
<table border="1">
    <thead>
        <tr>
            <th>Sub-Task ID</th>
            <th>Description</th>
            <th>Delivery Date</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach ($lateSubTasks as $subTask): ?>
        <tr>
            <td><?= $subTask['sub_task_id']; ?></td>
            <td><?= $subTask['description']; ?></td>
            <td><?= $subTask['delivery_date']; ?></td>
            <td><?= $subTask['status']; ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>

<!-- Change Password -->
<h2>Change Password</h2>
<form method="POST" action="">
    <input type="password" name="new_password" placeholder="Enter new password" required>
    <button type="submit" name="change_password">Change Password</button>
</form>
