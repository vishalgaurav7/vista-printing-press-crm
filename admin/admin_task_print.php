<?php
session_start();

// Ensure the user is logged in and has the appropriate role
if (!isset($_SESSION['user_logged_in']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require '../db.php';

// Fetch all tasks for the dropdown
$stmt = $conn->prepare("SELECT task_id, client_name, task_name FROM tasks WHERE status != 'Completed'");
$stmt->execute();
$tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Initialize variables
$task = null;
$subtasks = [];

// Fetch main task and subtasks if a task_id is provided
if (isset($_GET['task_id'])) {
    $task_id = $_GET['task_id'];

    // Fetch task details
    $stmt = $conn->prepare("SELECT * FROM tasks WHERE task_id = :task_id");
    $stmt->bindParam(':task_id', $task_id, PDO::PARAM_INT);
    $stmt->execute();
    $task = $stmt->fetch(PDO::FETCH_ASSOC);

    // Fetch associated subtasks with the additional fields
    $stmt = $conn->prepare("SELECT st.sub_task_id,  st.assigned_to, st.assigned_to_department , st.description, st.delivery_date, st.status, st.admin_comment , st.manager_comment, st.user_comment, t.client_name, t.task_name 
                            FROM sub_tasks st
                            JOIN tasks t ON st.main_task_id = t.task_id
                            WHERE st.main_task_id = :task_id");
    $stmt->bindParam(':task_id', $task_id, PDO::PARAM_INT);
    $stmt->execute();
    $subtasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Handle main task update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_task'])) {
    $task_name = $_POST['task_name'];
    $client_name = $_POST['client_name'];
    $status = $_POST['status'];
    $due_date = $_POST['due_date'];
    $description = $_POST['description'];

    try {
        $stmt = $conn->prepare("UPDATE tasks SET task_name = :task_name, client_name = :client_name, status = :status, due_date = :due_date, description = :description WHERE task_id = :task_id");
        $stmt->bindParam(':task_name', $task_name);
        $stmt->bindParam(':client_name', $client_name);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':due_date', $due_date);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':task_id', $task_id, PDO::PARAM_INT);
        $stmt->execute();
        $_SESSION['message'] = "Task updated successfully.";
        header("Location: admin_task_subtasks.php?task_id=$task_id");
        exit();
    } catch (PDOException $e) {
        $_SESSION['error'] = "Error updating task: " . $e->getMessage();
    }
}

// Handle subtask update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_subtask'])) {
    $subtask_id = $_POST['subtask_id'];
    $subtask_name = $_POST['subtask_name'];
    $assigned_to = $_POST['assigned_to'];
    $department = $_POST['department'];
    $description = $_POST['description'];
    $due_date = $_POST['due_date'];
    $status = $_POST['status'];
    $comments = $_POST['comments'];

    try {
        $stmt = $conn->prepare("UPDATE sub_tasks SET sub_task_name = :subtask_name, assigned_to = :assigned_to, department = :department, description = :description, due_date = :due_date, status = :status, comments = :comments WHERE sub_task_id = :subtask_id");
        $stmt->bindParam(':subtask_name', $subtask_name);
        $stmt->bindParam(':assigned_to', $assigned_to);
        $stmt->bindParam(':department', $department);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':due_date', $due_date);
        $stmt->bindParam(':status', $status);
        $stmt->bindParam(':comments', $comments);
        $stmt->bindParam(':subtask_id', $subtask_id, PDO::PARAM_INT);
        $stmt->execute();
        $_SESSION['message'] = "Subtask updated successfully.";
        header("Location: admin_task_subtasks.php?task_id=$task_id");
        exit();
    } catch (PDOException $e) {
        $_SESSION['error'] = "Error updating subtask: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task and Subtask Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container my-4">
    <h1>Manage Tasks and Subtasks</h1>

    <?php if (isset($_SESSION['message'])): ?>
        <div class="alert alert-success"><?= $_SESSION['message']; unset($_SESSION['message']); ?></div>
    <?php endif; ?>
    <?php if (isset($_SESSION['error'])): ?>
        <div class="alert alert-danger"><?= $_SESSION['error']; unset($_SESSION['error']); ?></div>
    <?php endif; ?>

    <!-- Dropdown to select task -->
    <form method="GET">
        <label for="task_id">Select Task:</label>
        <select id="task_id" name="task_id" class="form-select" onchange="this.form.submit()">
            <option value="">-- Select a Task --</option>
            <?php foreach ($tasks as $task_option): ?>
                <option value="<?= $task_option['task_id']; ?>" <?= isset($task_id) && $task_id == $task_option['task_id'] ? 'selected' : ''; ?>>
                    <?= htmlspecialchars($task_option['client_name'] . ' - ' . $task_option['task_name']); ?>
                </option>
            <?php endforeach; ?>
        </select>
    </form>

    <?php if ($task): ?>
        <!-- Main Task Edit Form -->
        <h2>Edit Task</h2>
        <form method="POST">
            <div class="mb-3">
                <label for="task_name">Task Name:</label>
                <input type="text" id="task_name" name="task_name" class="form-control" value="<?= htmlspecialchars($task['task_name']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="client_name">Client Name:</label>
                <input type="text" id="client_name" name="client_name" class="form-control" value="<?= htmlspecialchars($task['client_name']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="status">Status:</label>
                <select id="status" name="status" class="form-select">
                    <option value="Pending" <?= $task['status'] === 'Pending' ? 'selected' : ''; ?>>Pending</option>
                    <option value="In Progress" <?= $task['status'] === 'In Progress' ? 'selected' : ''; ?>>In Progress</option>
                    <option value="Completed" <?= $task['status'] === 'Completed' ? 'selected' : ''; ?>>Completed</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="due_date">Due Date:</label>
                <input type="date" id="due_date" name="due_date" class="form-control" value="<?= htmlspecialchars($task['due_date']); ?>" required>
            </div>
            <div class="mb-3">
                <label for="description">Description:</label>
                <textarea id="description" name="description" class="form-control"><?= htmlspecialchars($task['description']); ?></textarea>
            </div>
            <button type="submit" name="update_task" class="btn btn-primary">Update Task</button>
        </form>

        <!-- Subtasks Section -->
        <h2 class="mt-5">Subtasks</h2>
        <?php if ($subtasks): ?>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Client</th>
                        <th>Task Name</th>
                        <th>Assigned To</th>
                        <th>Department</th>
                        <th>Description</th>
                        <th>Delivery Date</th>
                        <th>Status</th>
                        <th>Comments</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($subtasks as $subtask): ?>
                        <tr>
                            <td><?= $subtask['sub_task_id']; ?></td>
                            <td><?= htmlspecialchars($subtask['client_name']); ?></td>
                            <td><?= htmlspecialchars($subtask['task_name']); ?></td>
                            <td><?= htmlspecialchars($subtask['assigned_to']); ?></td>
                            <td><?= htmlspecialchars($subtask['department']); ?></td>
                            <td><?= htmlspecialchars($subtask['description']); ?></td>
                            <td><?= htmlspecialchars($subtask['due_date']); ?></td>
                            <td><?= htmlspecialchars($subtask['status']); ?></td>
                            <td><?= htmlspecialchars($subtask['comments']); ?></td>
                            <td>
                                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editSubtaskModal<?= $subtask['sub_task_id']; ?>">Edit</button>
                            </td>
                        </tr>

                        <!-- Subtask Edit Modal -->
                        <div class="modal fade" id="editSubtaskModal<?= $subtask['sub_task_id']; ?>" tabindex="-1" aria-labelledby="editSubtaskModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form method="POST">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editSubtaskModalLabel">Edit Subtask</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="subtask_id" value="<?= $subtask['sub_task_id']; ?>">
                                            <div class="mb-3">
                                                <label for="subtask_name">Subtask Name:</label>
                                                <input type="text" id="subtask_name" name="subtask_name" class="form-control" value="<?= htmlspecialchars($subtask['sub_task_name']); ?>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="assigned_to">Assigned To:</label>
                                                <input type="text" id="assigned_to" name="assigned_to" class="form-control" value="<?= htmlspecialchars($subtask['assigned_to']); ?>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="department">Department:</label>
                                                <input type="text" id="department" name="department" class="form-control" value="<?= htmlspecialchars($subtask['department']); ?>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="description">Description:</label>
                                                <textarea id="description" name="description" class="form-control" required><?= htmlspecialchars($subtask['description']); ?></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="due_date">Due Date:</label>
                                                <input type="date" id="due_date" name="due_date" class="form-control" value="<?= htmlspecialchars($subtask['due_date']); ?>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="status">Status:</label>
                                                <select id="status" name="status" class="form-select">
                                                    <option value="Pending" <?= $subtask['status'] === 'Pending' ? 'selected' : ''; ?>>Pending</option>
                                                    <option value="In Progress" <?= $subtask['status'] === 'In Progress' ? 'selected' : ''; ?>>In Progress</option>
                                                    <option value="Completed" <?= $subtask['status'] === 'Completed' ? 'selected' : ''; ?>>Completed</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="comments">Comments:</label>
                                                <textarea id="comments" name="comments" class="form-control"><?= htmlspecialchars($subtask['comments']); ?></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" name="update_subtask" class="btn btn-primary">Save Changes</button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No subtasks found for this task.</p>
        <?php endif; ?>
    <?php else: ?>
        <p>Please select a task to view and edit its details.</p>
    <?php endif; ?>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
