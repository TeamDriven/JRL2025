<?php
include "databaseHelper.php";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname,3306);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$qualification_score = 0;
$auto_score = 0;
$tele_score = 0;
$matches_played = 0;
$teamFound = false;

$sql = "SELECT * FROM teams
WHERE team_num='".$_POST['team_num']."'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    $teamFound = true;
    while($row = $result->fetch_assoc()) {
        $qualification_score = intval($row['qualification_score']) + intval($_POST['qualification_score']);
        $auto_score = intval($row['auto_score']) + intval($_POST['auto_score']);
        $tele_score = intval($row['tele_score']) + intval($_POST['tele_score']);
        $matches_played = intval($row['matches_played']) + intval($_POST['matches_played']);
        break;
    }
} else {
    echo "0 results for query: ".$sql;
}

if($_POST["clear"]== "1") {
    $tele_score = 0;
    $auto_score = 0;
    $qualification_score = 0;
    $matches_played = 0;
}

if ($teamFound) {
  $sql = "UPDATE teams
  SET tele_score=".strval($tele_score).",
      auto_score=".strval($auto_score).",
      qualification_score=".strval($qualification_score).",
      matches_played=".strval($matches_played)."
  WHERE team_num=".$_POST['team_num'];
  if($conn->query($sql) == TRUE){
      echo "submit successful";
  } else {
      echo "error for query: ".$sql;
  }
}

$conn->close();

?>
