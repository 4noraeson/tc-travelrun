<?php
## $Id$

require '.config.php';
require 'fx.inc.php';

httpheader();
echo htmlheader('travelrun -- drug information', $_GET['css']);

echo 'Go back to the <a href="index.php">start page</a>.<br><br>';

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// get the data
$drugs = array();
$sql = <<<SQL_DRUGS
select stock.item, item.itemname, stock.country, country.countryname, stock.utctime, stock.price, stock.quantity
from stock, lastdrugs, item, country
where stock.item = lastdrugs.item
  and stock.item = item.itemid
  and stock.country = country.countryid
  and stock.country = lastdrugs.country
  and stock.utctime = lastdrugs.lastutc
order by item.itemname, stock.price
SQL_DRUGS;
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  $drugs[] = array($row[0], $row[1], $row[2], $row[3], $row[4], $row[5], $row[6]);
}
mysql_free_result($res);
mysql_close($conn);

echo '<table border="1">';
echo '<tr><th>Drug</th><th>Country</th><th>oldness</th><th>Quantity</th><th>Price</th></tr>';
$bgcolors = array('#ededed', '#cbcbcb');
$olddrug = '';
$lastcolor = 0;
foreach ($drugs as $d) {
  if ($d[1] != $olddrug) $lastcolor = 1 - $lastcolor;
  $olddrug = $d[1];

  $gmnow = gmdate('Y-m-d H:i:s');
  $unixlast = strtotime($d[4]);
  $unixnow = strtotime($gmnow);
  $delta = $unixnow - $unixlast;
  if ($delta < 60) {
    $deltaunits = 'second';
  } else {
    $delta /= 60;
    if ($delta < 60) {
      $deltaunits = 'minute';
    } else {
      $delta /= 60;
      if ($delta < 24) {
        $deltaunits = 'hour';
      } else {
        $delta /= 24;
        $deltaunits = 'day';
      }
    }
  }

  echo '<tr style="background-color: ', $bgcolors[$lastcolor], '; color: black;">';
  echo '<td>&nbsp;', $d[1], '&nbsp;</td>';
  echo '<td>&nbsp;', $d[3], '&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;', number_format($delta, 0), ' ', $deltaunits, (($delta >= 1.5) ? 's' : ''), ' ago&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;', number_format($d[6], 0, '', ','), '&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;$', number_format($d[5],0, '', ','), '&nbsp;</td>';
  echo '</tr>';
}
echo '</table>';

echo htmlfooter();
?>
