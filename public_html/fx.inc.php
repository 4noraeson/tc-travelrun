<?php
function httpheader() {
  header('Content-Type: text/html; charset=utf-8');
  header('Cache-Control: private');
}

function htmlheader($title, $css) {
  $css = preg_replace('/[^a-zA-Z]/', '', $css);
  if (($css == '') || (!is_file($css . '.css'))) $css = 'travelrun';
  $retval = '';
  $retval .= '<!DOCTYPE html>';
  $retval .= '<html lang="en">';
  $retval .= '<head>';
  $retval .= '<meta http-equiv="Content-Type" content="text/html;charset=utf-8">';
  $retval .= '<title>' . $title . '</title>';
  $retval .= '<link rel="stylesheet" href="' . $css . '.css">';
  $retval .= '</head>';
  $retval .= '<body>';
  return $retval;
}

function htmlfooter() {
  $retval = '';
  $retval .= '</body></html>';
}
?>
