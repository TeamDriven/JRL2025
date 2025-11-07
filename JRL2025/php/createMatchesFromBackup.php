<?php
include "databaseHelper.php";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname,3306);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "INSERT INTO matches (";

foreach ($_POST as $key => $value) {
    $sql .= $key.",";
}
$sql = rtrim($sql, ",");
$sql .= ") VALUES (";


foreach ($_POST as $key => $value) {
    if ($key == "position") {
        $sql .= "'".$value."',";
    } else {
        $sql .= $value. ",";
    }
}
$sql = rtrim($sql, ",");
$sql .= ")";
echo $sql;
if($conn->query($sql) == TRUE){
  echo "submit successful";
} else {
  echo "error for query: ".$sql;
}

$conn->close();

?>
