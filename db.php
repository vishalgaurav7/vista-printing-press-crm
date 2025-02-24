<?php
// db.php
$host = "localhost";
$db_name = "kzfmevjj_printcrm";
$username = "kzfmevjj_printcrm";
$password = "admin@009";

try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit;
}
?>
