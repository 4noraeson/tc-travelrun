<?php
require '.config.php';

$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

$sql = "select max(postUTC) from post";
$res = mysql_query($sql) or die(mysql_error());
$last = mysql_result($res, 0, 0);

$sql = "delete from post where postUTC < now() - interval 30 day";
mysql_query($sql) or die(mysql_error());
$sql = "delete from stock where utctime < now() - interval 30 day";
mysql_query($sql) or die(mysql_error());

mysql_free_result($res);
mysql_close($conn);

echo '<!DOCTYPE html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />';
echo '<title>Travel Run</title>';
echo '<!-- link rel="stylesheet" type="text/css" href="http://www.000webhost.com/images/index/styles.css" -->';
echo '</head>';
echo '<body>';
echo '<b>The information here needs to be updated by you to be correct and up-to-date.<br>';
echo 'When you\'ve reached your destination, please <a href="update.php">update</a> the information. Thank you!</b><br>';
echo '<br>';
echo 'UTC time when this page was transferred ', gmdate('Y-m-d H:i:s'), '<br>';
echo 'Last update was done at <b>', $last, '</b><br>';
echo '<br>';
echo 'You can see info about <a href="flower.php">flowers</a> (with a graph), <s>countries</s>, <s>drugs</s>, <s>plushies</s>.<br>';
echo '<br>', "\n\n";
echo '<!-- contact ebcdic at torn.com for more info -->', "\n\n";
echo '</body>';
echo '</html>';
?>
