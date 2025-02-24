<?php
session_start();
require '../db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];
    $table = $_POST['parameter_type'] ?? $_POST['edit_parameter_type'];
    $name = $_POST['parameter_name'] ?? null;
    $new_name = $_POST['new_name'] ?? null;
    $id = $_POST['edit_parameter_name'] ?? null;

    try {
        switch ($action) {
            case 'add':
                $stmt = $conn->prepare("INSERT INTO $table (name) VALUES (:name)");
                $stmt->bindParam(':name', $name);
                $stmt->execute();
                switch ($_SESSION['role']) {
                    case 'admin':
                        header("Location: admin_master.php");
                        break;
                    case 'manager':
                        header("Location: manager_master.php");
                        break;
                    case 'department':
                        header("Location: user_master.php");
                        break;
                    default:
                        session_destroy();
                        header("Location: login.php");
                        break;
                }
                echo "New entry added successfully!";
                break;

            case 'edit':
                $stmt = $conn->prepare("UPDATE $table SET name = :new_name WHERE id = :id");
                $stmt->bindParam(':new_name', $new_name);
                $stmt->bindParam(':id', $id, PDO::PARAM_INT);
                $stmt->execute();
                switch ($_SESSION['role']) {
                    case 'admin':
                        header("Location: admin_master.php");
                        break;
                    case 'manager':
                        header("Location: manager_master.php");
                        break;
                    case 'department':
                        header("Location: user_master.php");
                        break;
                    default:
                        session_destroy();
                        header("Location: login.php");
                        break;
                }
                echo "Entry updated successfully!";
                break;

            case 'delete':
                $stmt = $conn->prepare("DELETE FROM $table WHERE id = :id");
                $stmt->bindParam(':id', $id, PDO::PARAM_INT);
                $stmt->execute();
                switch ($_SESSION['role']) {
                    case 'admin':
                        header("Location: admin_master.php");
                        break;
                    case 'manager':
                        header("Location: manager_master.php");
                        break;
                    case 'department':
                        header("Location: user_master.php");
                        break;
                    default:
                        session_destroy();
                        header("Location: ../login.php");
                        break;
                }
                echo "Entry deleted successfully!";
                break;

            default:
                throw new Exception("Invalid action!");
        }
    } catch (PDOException $e) {
        echo "Database error: " . $e->getMessage();
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>
