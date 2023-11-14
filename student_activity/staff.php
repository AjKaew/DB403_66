<?php
include 'connect.php';
if(isset($_GET['submit'])) {
  echo $_GET['start'];
$start= str_replace('T', ' ', $_GET['start']);
echo $start;
$end= str_replace('T', ' ', $_GET['end']);
$sql = "insert into activity(activityName, available, start, end) values('xxx', 10, '$start', '$end')";
echo $sql;
$conn->query($sql);
$conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
<form method="get">
  <input type="datetime-local" name="start">
  <input type="datetime-local" name="end">
  <input type="submit" name="submit">
</form>
</body>
</html>