<?php
function httpheader() {
  header('Content-Type: text/html; charset=utf-8');
  header('Cache-Control: private');
}

function htmlheader($title, $css) {
  $css = preg_replace('/[^a-zA-Z0-9]/', '', $css);
  if (($css == '') || (!is_file('css/' . $css . '.css'))) $css = 'travelrun';
  $retval = '';
  $retval .= '<!DOCTYPE html>';
  $retval .= '<html lang="en">';
  $retval .= '<head>';
  $retval .= '<meta http-equiv="Content-Type" content="text/html;charset=utf-8">';
  $retval .= '<title>' . $title . '</title>';
  $retval .= '<link rel="stylesheet" href="css/' . $css . '.css">';
  $retval .= '</head>';
  $retval .= '<body>';
  $retval .= '<div id="page">';
  $retval .= '<div id="header">';
  $retval .= '<div>';
  $retval .= '<a href="index.php" id="logo"><img src="images/logo.png"></a>';
  $retval .= '<ul id="navigation">';
  $retval .= '<li>';
  $retval .= '<a href="index.php">Home</a>';
  $retval .= '</li>';
  $retval .= '<li>';
  $retval .= '<a href="flowers.php">Flowers</a>';
  $retval .= '</li>';
  $retval .= '<li>';
  $retval .= '<a href="plushies.php">Plushies</a>';
  $retval .= '</li>';
  $retval .= '<li>';
  $retval .= '<a href="drugs.php">Drugs</a>';
  $retval .= '</li>';
  $retval .= '<li>';
  $retval .= '<a href="firstoflast.php">Last Forum Page</a>';
  $retval .= '</li>';
  $retval .= '<li>';
  $retval .= '<a href="update.php">Update Data</a>';
  $retval .= '</li>';
  $retval .= '</ul>';
  $retval .= '</div>';
  $retval .= '<span class="shadow"></span>';
  $retval .= '</div>';
  return $retval;
}

function htmlfooter() {

  $retval = '';
  $retval .= '</body></html>';
}

function usercss() {
  $retval = 'travelrun';
  if (isset($_GET['css'])) {
    $retval = $_GET['css'];
  } else {
    if (isset($_COOKIE['css'])) {
      $retval = $_COOKIE['css'];
    } else {
      $ipbasedname = 'IP' . md5($_SERVER['REMOTE_ADDR']);
      if (is_file('css/' . $ipbasedname . '.css')) {
        $retval = $ipbasedname;
      }
    }
  }
  $retval = preg_replace('/[^a-zA-Z0-9]/', '', $retval);
  return $retval;
}
?>
