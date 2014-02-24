<?php
## $Id$

require '.config.php';
require 'fx.inc.php';

session_start();
$_SESSION['timecheck'] = date('YmdHis', time() + 1);

$cc = 'm';
if (isset($_GET['c'])) $cc = substr(trim($_GET['c']), 0, 1);
if (!in_array($cc, array('m', 'i', 'c', 'h', 'u', 'a', 's', 'j', 'x', 'e', 'z'))) $cc = 'm';

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// update count
$sql = "update counts set value = value + 1 where vkey = '$cc'";
mysql_query($sql) or die(mysql_error());

// delete old data
$sql = "delete from stock where utctime < now() - interval 32 day";
mysql_query($sql) or die(mysql_error());
$sql = "delete from post where postUTC < now() - interval 3 day";
mysql_query($sql) or die(mysql_error());

// get last update date/time from the database
$sql = <<<SQL_LAST
select country.countryname, max(stock.utctime)
from country, stock
where stock.country = country.countryid
  and stock.manual = 0
group by country.countryname
order by max(stock.utctime) desc
limit 1
SQL_LAST;
$res = mysql_query($sql) or die(mysql_error());
$lastcountry = mysql_result($res, 0, 0);
$lastupdate = mysql_result($res, 0, 1);
mysql_free_result($res);

$sql = "select max(stock.utctime) from stock, country where stock.country = country.countryid and country.letter = '$cc' and stock.manual = 0";
$res = mysql_query($sql) or die(mysql_error());
$lastlocalupdate = mysql_result($res, 0, 0);
mysql_free_result($res);

$sql = "select countryname, countryid from country where letter = '$cc'";
$res = mysql_query($sql) or die(mysql_error());
$cname = mysql_result($res, 0, 0);
$ccode = mysql_result($res, 0, 1);
mysql_free_result($res);

$extradata = array();
$sql =<<<SQL_EXTRADATA
select itemtype.itemtypename, item.itemname, stock.price, stock.quantity, itemtype.cssclass
from stock, item, itemtype
where stock.item = item.itemid
  and item.itemtype = itemtype.itemtypeid
  and stock.utctime = '$lastlocalupdate'
  and stock.country = $ccode
order by itemtype.itemtypename, item.itemname
SQL_EXTRADATA;
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  $extradata[] = array($row[0], $row[1], $row[2], $row[3], $row[4]);
}
mysql_free_result($res);

// get update frequency
$cvk = array();
$upk = $viewk = 0;
$sql = "select vkey, value from counts";
$res = mysql_query($sql) or die(mysql_error());
while ($row = mysql_fetch_row($res)) {
  if ($row[0] == 'update2') {
    $upk = $row[1];
  } else {
    $viewk += $row[1];
    $cvk[$row[0]] = $row[1];
  }
}
mysql_free_result($res);

// get first post of last page of flower thread
$sql = "select valint from config where configkey = 'LAST_FLOWER_PAGE'";
$res = mysql_query($sql) or die(mysql_error());
$lastflower = 30 * (mysql_result($res, 0, 0) - 1);
mysql_free_result($res);

// close the database connection
mysql_close($conn);

httpheader();
echo htmlheader('travelrun', usercss());

echo '<div class="timeinfo">';
echo 'Current time is ', gmdate('Y-m-d H:i:s'), ' GMT.<br>';
echo 'Last update was made at ', $lastupdate, ' GMT for ', $lastcountry, '.';
echo '</div>';

echo '<div class="updatelinks">';
$ratio = $upk / $viewk;
echo 'When you\'re in a foreign country, please <a href="update.php" title="update ratio: ';
if ($ratio < 0.0095) {
  echo number_format(1000 * $ratio, 2), '&permil;';
} else {
  echo number_format(100 * $ratio, 2), '%';
}
echo '">update the data</a>. Thank you.<br>';
echo '<span class="minor">There is also an <a href="manupdate.php">manual ';
echo 'update feature</a> for isolated data on the ';
echo '<a href="http://www.torn.com/forums.php?forumID=10&ID=14303015&start=', $lastflower, '">';
echo 'flower thread</a> (<i><a href="firstoflast.php">update</a></i>).</span>';
echo '</div>';

echo '<div class="nav">';
echo 'Choose a country: ';
if ($cc == 'm') echo '<b>';
echo '<a href="index.php?c=m" title="', $cvk['m'], ' views">Mexico</a>, ';
if ($cc == 'm') echo '</b>';

if ($cc == 'i') echo '<b>';
echo '<a href="index.php?c=i" title="', $cvk['i'], ' views">Cayman Islands</a>, ';
if ($cc == 'i') echo '</b>';

if ($cc == 'c') echo '<b>';
echo '<a href="index.php?c=c" title="', $cvk['c'], ' views">Canada</a>, ';
if ($cc == 'c') echo '</b>';

if ($cc == 'h') echo '<b>';
echo '<a href="index.php?c=h" title="', $cvk['h'], ' views">Hawaii</a>, ';
if ($cc == 'h') echo '</b>';

if ($cc == 'u') echo '<b>';
echo '<a href="index.php?c=u" title="', $cvk['u'], ' views">United Kingdom</a>, ';
if ($cc == 'u') echo '</b>';

if ($cc == 'a') echo '<b>';
echo '<a href="index.php?c=a" title="', $cvk['a'], ' views">Argentina</a>, ';
if ($cc == 'a') echo '</b>';

if ($cc == 's') echo '<b>';
echo '<a href="index.php?c=s" title="', $cvk['s'], ' views">Switzerland</a>, ';
if ($cc == 's') echo '</b>';

if ($cc == 'j') echo '<b>';
echo '<a href="index.php?c=j" title="', $cvk['j'], ' views">Japan</a>, ';
if ($cc == 'j') echo '</b>';

if ($cc == 'x') echo '<b>';
echo '<a href="index.php?c=x" title="', $cvk['x'], ' views">China</a>, ';
if ($cc == 'x') echo '</b>';

if ($cc == 'e') echo '<b>';
echo '<a href="index.php?c=e" title="', $cvk['e'], ' views">UAE</a>, ';
if ($cc == 'e') echo '</b>';

if ($cc == 'z') echo '<b>';
echo '<a href="index.php?c=z" title="', $cvk['z'], ' views">South Africa</a>';
if ($cc == 'z') echo '</b>';

echo '<br>';
echo 'or look at the <a href="drugs.php">most recent drug information</a> across all countries.';
echo '</div>';

if (isset($_SESSION['recent_update'])) {
  echo '<div class="pub"><br><i>';
  echo 'If you want to make a post in the ';
    echo '<a href="http://www.torn.com/forums.php?forumID=10&ID=14303015">';
    echo 'flower thread</a> and advertise travelrun, you can use the ';
    echo 'following code:</i><br>';
  echo '<pre style="margin:1em;padding:4px;background-color:#dadada">';
    echo "{$_SESSION['recent_update']['qtd']} ";
    echo "{$_SESSION['recent_update']['flower']} in ";
    echo "{$_SESSION['recent_update']['country']}\n\n";
    echo '[u][url=http://travelrun.torncentral.com/]travelrun[/url][/u] updated';
    echo '</pre>';
  echo '</div>';
  unset($_SESSION['recent_update']);
}

echo '<div class="itemdata">';
$gmnow = gmdate('Y-m-d H:i:s');
$unixlast = strtotime($lastlocalupdate);
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
echo 'Items in ', $cname, ' at ', $lastlocalupdate, ' GMT ';
      echo '<b>(', number_format($delta, 0), ' ', $deltaunits, (($delta >= 1.5) ? 's' : ''), ' ago)</b><br>';
echo '<table border="1">';
echo '<tr><th>Type</th><th>Item</th><th>Price</th><th>Quantity</th></tr>';
foreach ($extradata as $extra) {
  echo '<tr class="', $extra[4], '">';
  echo '<td>&nbsp;', $extra[0], '&nbsp;</td>';
  echo '<td>&nbsp;', $extra[1], '&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;$', number_format($extra[2], 0, '', ','), '&nbsp;</td>';
  echo '<td class="valuedata">&nbsp;', number_format($extra[3], 0, '', ','), '&nbsp;</td>';
  echo '</tr>';
}
echo '</table>';
echo '</div>';

echo '<div class="flowerchart">';
echo '<i><span class="info">If the graph does not appear, refresh the page</span></i><br>';
echo '<img alt="flower graph" src="fgraph.php?c=', $cc, '">';
echo '</div>';

echo '<div class="footer">';
echo '<i>Extra available options: <!-- <a href="css.php">css</a>, --><a href="prizes.php">prizes</a></i><br>';
echo '<i>Source code available on a <a href="http://code.google.com/p/tc-travelrun/">subversion repository</a>.</i><br>';
echo '<i>Travelrun writen by <a href="http://www.torn.com/profiles.php?XID=1757971" target="new">ebcdic</a>. If you like this page, please consider <a href="http://www.torn.com/sendcash.php?XID=1275358" target="new">donating</a> to the cause...</i>';
echo '</div>';

echo htmlfooter();
?>
