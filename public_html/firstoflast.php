<?php
## $Id$

require '.config.php';
require 'fx.inc.php';

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

$sql = "select valint from config where configkey = 'LAST_FLOWER_PAGE'";
$res = mysql_query($sql) or die(mysql_error());
$last1st = mysql_result($res, 0, 0);
mysql_free_result($res);

mysql_close($conn);
httpheader();
echo htmlheader('travelrun -- update first of last', usercss());

echo '<div class="updatenav">';
echo 'Go back to the <a href="index.php">start page</a>.';
echo '</div><br><br>';

echo '<div class="updateform">';
echo '<form method="post" action="firstoflast2.php">';
echo '<label>Last page in the flower thread: <input type="text" value="', $last1st, '" name="last1st"></label>';
echo '<input type="submit" value="UPDATE"><br>';
echo '</form>';
echo '</div>';

echo htmlfooter();
?>
