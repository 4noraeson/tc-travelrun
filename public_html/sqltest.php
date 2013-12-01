<?php
## $Id$
## $URL$

$conn = mysql_connect(FREE_HOST, FREE_USER, FREE_PASS) or die('Unable to connect');
mysql_select_db(FREE_DATA);

$sum = 0;
$sql = "select intvalue from temporary where keyfield like 'TEST%'";
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  $sum += 1 * $row[0];
}
mysql_free_result($res);

$key = 'TEST' . date('YmdHis');
$random = rand(100, 999);
$sql = "insert into temporary (keyfield, intvalue) values ('$key', $random);";
mysql_query($sql) or die(mysql_error());

mysql_close($conn);

echo 'The sum is ', $sum, '. Added ', $random, ' for next run.';
?>
