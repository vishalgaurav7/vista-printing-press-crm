<?php
session_start();
require 'db.php';

// Fetch users by department
function getUsersByDepartment($conn, $department_id) {
    try {
        $stmt = $conn->prepare("SELECT id, username FROM users WHERE department_id = :department_id");
        $stmt->execute([':department_id' => $department_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        return [];
    }
}

if (isset($_GET['task_id'])) {
    $task_id = intval($_GET['task_id']);
    
    $stmt = $conn->prepare("SELECT * FROM tasks WHERE task_id = :task_id");
    $stmt->execute([':task_id' => $task_id]);
    $main_task = $stmt->fetch(PDO::FETCH_ASSOC);

   
}
// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $main_task_id = intval($_POST['main_task_id']);
        $sub_tasks = [
            [
                'assigned_to' => intval($_POST['assigned_to_paper']),
                'description' => $_POST['paper_description'],
                'delivery_date' => $_POST['delivery_date_paper'],
                'department_id' => 1 // Paper Vendor department ID
            ],
            [
                'assigned_to' => intval($_POST['assigned_to_printer']),
                'description' => $_POST['printer_description'],
                'delivery_date' => $_POST['delivery_date_printer'],
                'department_id' => 2 // Printer department ID
            ],
            [
                'assigned_to' => intval($_POST['assigned_to_plate']),
                'description' => $_POST['plate_description'],
                'delivery_date' => $_POST['delivery_date_plate'],
                'department_id' => 3 // Plate Vendor department ID
            ],
            [
                'assigned_to' => intval($_POST['assigned_to_lamination']),
                'description' => $_POST['lamination_description'],
                'delivery_date' => $_POST['delivery_date_lamination'],
                'department_id' => 4 // Lamination department ID
            ],
        ];

        // Insert each sub-task into the database
        $stmt = $conn->prepare("
            INSERT INTO sub_tasks (
                main_task_id, assigned_to, description, status, delivery_date, assigned_to_department
            ) VALUES (
                :main_task_id, :assigned_to, :description, 'Pending', :delivery_date, :assigned_to_department
            )
        ");
        foreach ($sub_tasks as $task) {
            if (!empty($task['assigned_to'])) {
                $stmt->execute([
                    ':main_task_id' => $main_task_id,
                    ':assigned_to' => $task['assigned_to'],
                    ':description' => $task['description'],
                    ':delivery_date' => $task['delivery_date'],
                    ':assigned_to_department' => $task['department_id']
                ]);
            }
        }

        // Redirect after successful insertion
        $_SESSION['success_message'] = "Sub-tasks created successfully!";
        if ($_SESSION['role'] === 'admin') {
            header("Location: admin/admin_task_create.php");
        } elseif ($_SESSION['role'] === 'manager') {
            header("Location: manager/manager_task_create.php");
        } else {
            header("Location: user/admin_task_create.php");
        }
        exit();
    } catch (PDOException $e) {
        $_SESSION['error_message'] = "Database error: " . $e->getMessage();
        header("Location: add_sub_task_batch.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Sub Tasks</title>
</head>
<body>
    <h1>Create Sub-Tasks</h1>
    <form method="POST">
        <input type="hidden" name="main_task_id" value="<?php echo intval($_GET['task_id']); ?>" />

        <!-- Task for Paper -->
        <h3>Task for Paper</h3>
        <label for="assigned_to_paper">Assign to:</label>
        <select name="assigned_to_paper" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 1); // Paper Vendor department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_paper" required />
        <textarea name="paper_description">
            Paper Quality: <?php echo htmlspecialchars($main_task['paper_quality']); ?>
            Paper Size: <?php echo htmlspecialchars($main_task['paper_size']); ?>
            Paper GSM: <?php echo htmlspecialchars($main_task['paper_gsm']); ?>
            Paper Quantity: <?php echo htmlspecialchars($main_task['paper_quantity']); ?>
        </textarea>

        <!-- Task for Printer -->
        <h3>Task for Printer</h3>
        <label for="assigned_to_printer">Assign to:</label>
        <select name="assigned_to_printer" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 2); // Printer department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_printer" required />
        <textarea name="printer_description" readonly>
            Paper Quality: <?php echo htmlspecialchars($main_task['paper_quality']); ?>
            Paper Size: <?php echo htmlspecialchars($main_task['paper_size']); ?>
            Paper GSM: <?php echo htmlspecialchars($main_task['paper_gsm']); ?>
            Paper Quantity: <?php echo htmlspecialchars($main_task['paper_quantity']); ?>
            
            
            Cutting Size: <?php echo htmlspecialchars($main_task['cutting_size']); ?>
            Printing Quantity: <?php echo htmlspecialchars($main_task['cutting_size_quantity']); ?>
            Printing Type: <?php echo htmlspecialchars($main_task['printing_type']); ?>
            Color: <?php echo htmlspecialchars($main_task['color']); ?>
        </textarea>

        <!-- Task for Plate Vendor -->
        <h3>Task for Plate Vendor</h3>
        <label for="assigned_to_plate">Assign to:</label>
        <select name="assigned_to_plate" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 3); // Plate Vendor department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_plate" required />
        <textarea name="plate_description">
            Plate Type: <?php echo htmlspecialchars($main_task['plate_type']); ?>
            Printer Department: <?php echo htmlspecialchars($main_task['printer_department']); ?>
        </textarea>

        <!-- Task for Lamination -->
        <h3>Task for Lamination</h3>
        <label for="assigned_to_lamination">Assign to:</label>
        <select name="assigned_to_lamination" required>
            <option value="">Select User</option>
            <?php
            $users = getUsersByDepartment($conn, 4); // Lamination department ID
            foreach ($users as $user) {
                echo "<option value=\"" . $user['id'] . "\">" . htmlspecialchars($user['username']) . "</option>";
            }
            ?>
        </select>
        <label>Delivery Date:</label>
        <input type="date" name="delivery_date_lamination" required />
        <textarea name="lamination_description">
Lamination Type: <?php echo htmlspecialchars($main_task['lamination_type']); ?>&#13;
UV: <?php echo htmlspecialchars($main_task['uv']); ?>&#13;
Emboss: <?php echo htmlspecialchars($main_task['emboss']); ?>&#13;
Punching: <?php echo htmlspecialchars($main_task['punching']); ?>&#13;
</textarea>

        <!-- Submit button -->
        <button type="submit">Create Sub Tasks</button>
    </form>
</body>
</html>
