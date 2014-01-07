<?php
## $Id$

require '.config.php';
require 'fx.inc.php';

#connect to database
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

$prizes = array();
$sql = "select pdate, puser from prize order by pdate desc limit 10";
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  $prizes[] = array($row[0], $row[1]);
}
mysql_free_result($res);

httpheader();
echo htmlheader('travelrun -- prizes', usercss());

echo '<div class="prizenav">';
echo 'Go back to the <a href="index.php">start page</a>.';
echo '</div>';

echo '<div class="prizemain">';

echo 'Recent claimed prizes:<br>';
echo '<table border="1">';
echo '<tr><th>date</th><th>user</th></tr>';
foreach ($prizes as $p) {
  echo '<tr>';
  echo '<td>', $p[0], '</td>';
  echo '<td align="right">', $p[1], '</td>';
  echo '</tr>';
}
echo '</table>';

echo '</div>';

echo htmlfooter();
?>
