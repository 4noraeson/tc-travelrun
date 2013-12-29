<?php
function httpheader() {
  header('Content-Type: text/html; charset=utf-8');
  header('Cache-Control: private');
}

function htmlheader($title) {
  $retval = '';
  $retval .= '<!DOCTYPE html>';
  $retval .= '<html lang="en">';
  $retval .= '<head>';
  $retval .= '<meta http-equiv="Content-Type" content="text/html;charset=utf-8">';
  $retval .= '<title>' . $title . '</title>';
  $retval .= '<link rel="stylesheet" href="travelrun.css">';
  $retval .= '</head>';
  $retval .= '<body>';
  return $retval;
}

function htmlfooter() {
  $retval = '';
  $retval .= '</body></html>';
}
?>
