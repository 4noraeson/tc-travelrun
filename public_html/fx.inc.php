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
