<?php
## $Id$

require '.config.php';

if ($_SERVER['REQUEST_METHOD'] != 'POST') die('No!');

$cch = 'm';

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// save raw $_POST['data'] in the database
$utc = gmdate('Y-m-d H:i:s');
$pd = mysql_real_escape_string($_POST['data']);
$s = 'web';
if (isset($_POST['sender'])) {
  $s = mysql_real_escape_string($_POST['sender']);
}
$ua = mysql_real_escape_string($_SERVER['HTTP_USER_AGENT']);
$r = mysql_real_escape_string($_SERVER['HTTP_REFERER']);
$sql = "insert into post (postid, postUTC, postdata, user_agent, referer, sender) values (NULL, '$utc', '$pd', '$ua', '$r', '$s')";
mysql_query($sql) or die(mysql_error());

// process $_POST['data'] and save info to the database
$n = preg_match('/are in ([A-Z a-z]+) and have/', $_POST['data'], $matches);
if ($n == 1) {
  $country = $matches[1];
  $safe_country = mysql_real_escape_string($country);

  $sql2 = "select countryid, flower, letter from country where countryname = '$safe_country'";
  $res2 = mysql_query($sql2) or die(mysql_error());
  $cid = $fid = 0;
  if (mysql_num_rows($res2) == 1) {
    $cid = mysql_result($res2, 0, 0);
    $fid = mysql_result($res2, 0, 1);
    $cch = mysql_result($res2, 0, 2);
  }
  mysql_free_result($res2);
  if ($cid != 0) {
    $gotflower = 0;

    if (preg_match_all('@\s*([0-9A-Z &a-z-]+)\s+\$([0-9,]+)\s+([0-9,]+) in stock\s+Buy@', $_POST['data'], $matches, PREG_SET_ORDER)) {
      foreach ($matches as $info) {
        $itemname = trim($info[1]);
        $safe_itemname = mysql_real_escape_string($itemname);
        $itemcost = 1 * str_replace(',', '', $info[2]);
        $itemleft = 1 * str_replace(',', '', $info[3]);
        $sql3 = "select itemid from item where itemname = '$safe_itemname'";
        $res3 = mysql_query($sql3) or die(mysql_error());
        $itemid = 0;
        if (mysql_num_rows($res3) == 1) {
          $itemid = mysql_result($res3, 0, 0);
        }
        mysql_free_result($res3);
        if ($itemid != 0) {
          $sql4 = "insert into stock (stockid, utctime, country, item, price, quantity, manual, sender) values (NULL, utc_timestamp(), $cid, $itemid, $itemcost, $itemleft, 0, '$s')";
          mysql_query($sql4) or die(mysql_error());
          if ($itemid == $fid) $gotflower = 1;
        }
      }
    }
    if ($gotflower == 0) {
      $sql5 = "insert into stock (stockid, utctime, country, item, price, quantity, manual) values (NULL, utc_timestamp(), $cid, $fid, 0, 0, 0)";
      mysql_query($sql5) or die(mysql_error());
    }
  }

  // update count
  $sql = "update counts set value = value + 1 where vkey = 'update2'";
  mysql_query($sql) or die(mysql_error());

  # delete files starting with $cch
  $files = glob('images/' . $cch . '*');
  foreach ($files as $file) {
    if (is_file($file)) unlink($file);
  }
}

// close the database connection
mysql_close($conn);

usleep(100000); // sleep 0.1 seconds: it's hardly noticeable and it, hopefully, gives time for image to be created

header('Location: default.php?c=' . $cch);
exit('Redirected to <a href="default.php?c=' . $cch . '">the start page</a>.');
?>
