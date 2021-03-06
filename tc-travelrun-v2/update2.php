<?php
## $Id$

require '.config.php';
require 'fx.inc.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] != 'POST') die('No!');

$cch = 'm';
$prize = 0;

// open the database connection
$conn = mysql_connect(SQL_HOST, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DATA);

// save raw $_POST['data'] in the database
$utc = gmdate('Y-m-d H:i:s');
$pd = mysql_real_escape_string($_POST['data']);
$s = $_SERVER['REMOTE_ADDR'];
$ua = mysql_real_escape_string($_SERVER['HTTP_USER_AGENT']);
$r = mysql_real_escape_string($_SERVER['HTTP_REFERER']);
$sql = "insert into post (postid, postUTC, postdata, user_agent, referer, sender) values (NULL, '$utc', '$pd', '$ua', '$r', '$s')";
mysql_query($sql) or die(mysql_error());

// check for NaN and abort
if (preg_match('/\s+NaN\s+/', $_POST['data'])) {
  echo 'NaN detected. Cannot update. Go back, reload, copy and paste again.<br>';
  echo '<br>';
  exit('<a href="update.php">Update again</a><br>');
}

// process $_POST['data'] and save info to the database
$n = preg_match('/are in ([A-Z a-z]+) and have/', $_POST['data'], $matches);
if ($n == 1) {
  $country = $matches[1];
  $safe_country = mysql_real_escape_string($country);

  $sql2 = "select countryid, flower, letter, itemname from country, item where country.flower = item.itemid and countryname = '$safe_country'";
  $res2 = mysql_query($sql2) or die(mysql_error());
  $cid = $fid = 0;
  if (mysql_num_rows($res2) == 1) {
    $cid = mysql_result($res2, 0, 0);
    $fid = mysql_result($res2, 0, 1);
    $cch = mysql_result($res2, 0, 2);
    $fin = mysql_result($res2, 0, 3);
  }
  mysql_free_result($res2);
  if ($cid != 0) {
    $_SESSION['recent_update'] = array();
    $_SESSION['recent_update']['country'] = $country;
    $_SESSION['recent_update']['flower'] = $fin;
    $_SESSION['recent_update']['plushie'] = '';
    $gotflower = 0;
    $gotplushie = 0;
    $items = array();
    $sql_items = "select itemname, itemid from item";
    $res_items = mysql_query($sql_items) or die(mysql_error());
    while ($row_items = mysql_fetch_row($res_items)) {
      $items[$row_items[0]] = $row_items[1];
    }
    mysql_free_result($res_items);

    $t = array('Alcohol', 'Defensive', 'Drug', 'Enhancer', 'Flower', 'Medical', 'Melee', 'Other', 'Plushie', 'Primary', 'Secondary', 'Temporary');
    $rxt = implode('|', $t);
    #$rx = '@(?:' . $rxt . ')(?:\s+x[0-9,]+)?\s+([0-9A-Z &a-z-]+)\s+\$([0-9,]+)\s+([0-9,]+)@';
    $rx = '@Type:\s+(?:' . $rxt . ')\s+(?:x[0-9,]+\s+)?([0-9A-Z &a-z-]+)\s+Cost:\s+\$([0-9,]+)\s+In\s+stock:\s*([0-9,]+)@';
    if (preg_match_all($rx, $_POST['data'], $matches, PREG_SET_ORDER)) {
      foreach ($matches as $info) {
        $itemname = trim($info[1]);
        $itemcost = 1 * str_replace(',', '', $info[2]);
        $itemleft = 1 * str_replace(',', '', $info[3]);
        $itemid = 0;
        if (isset($items[$itemname])) $itemid = $items[$itemname];
        if ($itemid != 0) {
          $sql4 = "insert into stock (stockid, utctime, country, item, price, quantity, manual, sender) values (NULL, utc_timestamp(), $cid, $itemid, $itemcost, $itemleft, 0, '$s')";
          mysql_query($sql4) or die(mysql_error());
          if ($itemid == $fid) {
            $gotflower = 1;
            $_SESSION['recent_update']['qtd'] = $itemleft;
          }
        }
        if (preg_match('/ Plushie/', $itemname)) {
          $gotplushie = 1;
          $_SESSION['recent_update']['plushie'] .= $itemleft . ' ' . $itemname . '<br>';
        }
      }
    }
    if (!$gotflower) {
      $_SESSION['recent_update']['qtd'] = 0;
      $prices = array(0, 300, 4000, 600, 700, 5000, 500, 900, 500, 5000, 6000, 2000);
      $price = 0;
      if (isset($prices[$cid])) $price = $prices[$cid];
      $sql5 = "insert into stock (stockid, utctime, country, item, price, quantity, manual, sender) values (NULL, utc_timestamp(), $cid, $fid, $price, 0, 0, '$s')";
      mysql_query($sql5) or die(mysql_error());
    }
    if (!$gotplushie) {
      $_SESSION['recent_update']['plushie'] .= 'No plushies<br>';
    }
    if (mt_rand(0, 999999) < PRIZE_PER_MILLION) {
      $mindate = gmdate('Y-m-d H:i:s', time() - 25*60);
      $sqlprize = "select count(*) from post where sender='$s' and postUTC > '$mindate'";
      $resprize = mysql_query($sqlprize) or die(mysql_error());
      $recent = mysql_result($resprize, 0, 0);
      mysql_free_result($resprize);
      if (!$recent) $prize = 1;
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

if ($prize) {
  $prizedate = gmdate('Y-m-d H:i:s');
  $prizecode = md5(PRIZE_PREFIX . $prizedate);
  $sql = "insert into prize (pdate, pcode, puser, pcountry) values ('$prizedate', '$prizecode', 0, '$safe_country')";
  mysql_query($sql) or die(mysql_error());
  mysql_close($conn);
  httpheader();
  echo htmlheader('Travelrun: Prize', usercss());
  echo '<div class="prize">';
  echo '<h1>Congratulations!</h1>';
  echo '<h2>You have won a prize.</h2>';
  echo '<h3>send a in-game message to <a href="http://www.torn.com/profiles.php?XID=1757971">ebcdic</a> to reclaim it.</h3>';
  echo '<h3>include the prize date and code in the message</h3>';
  echo '<h3 style="text-align: center;"><pre>';
  echo 'date: ', $prizedate, "\n";
  echo 'code: ', $prizecode;
  echo '</pre></h3>';
  echo '<br><i>Prizes are in testing phase: they\'ll be small prizes :)</i>';
  echo '<br><br>';
  echo 'Back to <a href="index.php?c=', $cch, '">the regular travelrun page</a>.';
  echo '</div>';
  echo htmlfooter();
  exit(0);
}

// close the database connection
mysql_close($conn);

usleep(100000); // sleep 0.1 seconds: it's hardly noticeable and it, hopefully, gives time for image to be created

header('Location: index.php?c=' . $cch);
exit('Redirected to <a href="index.php?c=' . $cch . '">the start page</a>.');
?>
