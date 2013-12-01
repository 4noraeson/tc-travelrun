<?php
## $Id$
## $URL$

require '.config.php';

$conn = mysqli_connect(FREE_HOST, FREE_USER, FREE_PASS, FREE_DATA) or die('Unable to connect');

$sum = 0;
$sql = "select intvalue from temporary where keyfield like 'TEST%'";
$res = mysqli_query($conn, $sql) or die(mysqli_error($conn));
while ($row = mysqli_fetch_row($res)) {
  $sum += 1 * $row[0];
}
mysqli_free_result($res);

$key = 'TEST' . date('YmdHis');
$random = rand(100, 999);
$sql = "insert into temporary (keyfield, intvalue) values ('$key', $random);";
mysqli_query($conn, $sql) or die(mysqli_error($conn));

mysqli_close($conn);

echo 'The sum is ', $sum, '. Added ', $random, ' for next run.';
?>
