<?php
## $Id: $

require '.config.php';
require 'fx.inc.php';

ob_start('ob_tidyhandler');

httpheader();
echo htmlheader('travelrun -- all items information', usercss());

echo '<div class="drugnav">Go back to the <a href="index.php">start page</a>.</div>';

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// get the data
$itemall = array();
$sql = <<<SQL_ITEMALL
select s.utctime, country.countryname, item.itemname, s.quantity, s.price

from stock s
   , (select max(utctime) as mt, country, item from stock where manual = 0 group by country, item) smax
   , country
   , item

where s.utctime = smax.mt
  and s.country = smax.country
  and s.item = smax.item
  and s.country = country.countryid
  and s.item = item.itemid
  and s.manual = 0
SQL_ITEMALL;

if (isset($_GET['f']) && (trim($_GET['f']) != '')) {
  $safefilter = mysql_real_escape_string($_GET['f']);
  $sql .= " and item.itemname like '%$safefilter%'";
}

$sql .= "order by 1 desc, 2, 3";
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  $itemall[] = array($row[0], $row[1], $row[2], $row[3], $row[4]);
}
mysql_free_result($res);
mysql_close($conn);

echo '<div class="itemalldata">';
echo '<table border="1">';
echo '<tr><th>date</th><th>country</th><th>item</th><th>quantity</th><th>price</th></tr>';
foreach ($itemall as $d) {
  echo '<tr>';
  echo '<td>&nbsp;', $d[0], '&nbsp;</td>';
  echo '<td>&nbsp;', $d[1], '&nbsp;</td>';
  echo '<td>&nbsp;', $d[2], '&nbsp;</td>';
  echo '<td align="right">&nbsp;', $d[3], '&nbsp;</td>';
  echo '<td align="right">&nbsp;', $d[4], '&nbsp;</td>';
  echo '</tr>';
}
echo '</table>';
echo '</div>';

echo htmlfooter();
?>
