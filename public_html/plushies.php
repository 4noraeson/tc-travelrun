<?php
## $Id: $

require '.config.php';
require 'fx.inc.php';

ob_start('ob_tidyhandler');

httpheader();
echo htmlheader('travelrun -- plushie information', usercss());

echo '<div class="drugnav">Go back to the <a href="index.php">start page</a>.</div>';

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// get the data
$plushies = array();
$sql = <<<SQL_PLUSHIES
select stock.item, item.itemname, stock.country, country.countryname, stock.utctime, stock.price, stock.quantity
from stock, lastplushies, item, country
where stock.item = lastplushies.item
  and stock.item = item.itemid
  and stock.country = country.countryid
  and stock.country = lastplushies.country
  and stock.utctime = lastplushies.lastutc
order by stock.utctime
SQL_PLUSHIES;
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  $flowers[] = array($row[0], $row[1], $row[2], $row[3], $row[4], $row[5], $row[6]);
}
mysql_free_result($res);
mysql_close($conn);

echo '<div class="drugdata">';
echo '<table border="1">';
echo '<tr><th>Plushie</th><th>Country</th><th>oldness</th><th>Quantity</th><th>Price</th><th>Airstrip</th></tr>';
$oddgroup = 0;
foreach ($plushies as $d) {
  $oddgroup = 1 - $oddgroup;

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

  echo '<tr class="', $oddgroup ? 'odd' : 'even', 'row" id="f', $d[0], '">';
  echo '<td>&nbsp;', $d[1], '&nbsp;</td>';
  echo '<td>&nbsp;', $d[3], '&nbsp;</td>';
  echo '<td class="timedata">&nbsp;', number_format($delta, 0), ' ', $deltaunits, (($delta >= 1.5) ? 's' : ''), ' ago&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;', number_format($d[6], 0, '', ','), '&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;$', number_format($d[5],0, '', ','), '&nbsp;</td>';
  $airstrip = '?????';
  if ($d[3] == 'Mexico') $airstrip = '00:18';
  if ($d[3] == 'Cayman Islands') $airstrip = '00:25';
  if ($d[3] == 'Canada') $airstrip = '00:29';
  if ($d[3] == 'Hawaii') $airstrip = '01:34';
  if ($d[3] == 'United Kingdom') $airstrip = '01:51';
  if ($d[3] == 'Argentina') $airstrip = '01:57';
  if ($d[3] == 'Switzerland') $airstrip = '02:03';
  if ($d[3] == 'Japan') $airstrip = '02:38';
  if ($d[3] == 'China') $airstrip = '02:49';
  if ($d[3] == 'UAE') $airstrip = '03:10';
  if ($d[3] == 'South Africa') $airstrip = '03:28';
  echo '<td align="center">&nbsp;', $airstrip, '&nbsp;</td>';
  echo '</tr>';
}
echo '</table>';
echo '</div>';

echo htmlfooter();
?>
