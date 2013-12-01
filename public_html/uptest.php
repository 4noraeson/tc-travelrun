<?php
## $Id$
## $URL$

require '.config.php';

$cch = 'm';
$pid = 1 * $_GET['p'];
if ($pid < 1) die('invalid access');
if ($pid > 1000000) die('invalid access');

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// get raw $_POST['data'] from the database
$sql = "select postUTC, postdata from post where postid = $pid";
$res = mysql_query($sql) or die(mysql_error());
if (mysql_num_rows($res) != 1) die('wrong parameter');
$utc = mysql_result($res, 0, 0);
$dat = mysql_result($res, 0, 1);
// close the database connection
mysql_close($conn);
echo 'data is <pre>', $dat, '</pre><br>~~~~~~~~<br>';

// process $dat and display info
$n = preg_match('/are in ([A-Z a-z]+) and have/', $dat, $matches);
echo 'First match returned: ', $n, '<br>';
if ($n == 1) {
  $country = $matches[1];
  echo 'Country is: ', $country, '<br>';

//  if (preg_match_all('@(?:\[?[0-9A-Z a-z-]+\]?)?\s*\t\s*([0-9A-Z a-z-]+)\s+\$([0-9,]+)\s+([0-9,]+) in stock\s+Buy@', $dat, $matches, PREG_SET_ORDER)) {
  if (preg_match_all('@\s*([0-9A-Z a-z-]+)\s+\$([0-9,]+)\s+([0-9,]+) in stock\s+Buy@', $dat, $matches, PREG_SET_ORDER)) {
    echo '2nd match all worked<br>';
    foreach ($matches as $info) {
      $itemname = trim($info[1]);
      $itemcost = 1 * str_replace(',', '', $info[2]);
      $itemleft = 1 * str_replace(',', '', $info[3]);
      echo "got $itemname, $itemcost, $itemleft<br>";
    }
  } else {
    echo '2nd match all failed<br>';
  }
  echo '<br>';
}
?>
