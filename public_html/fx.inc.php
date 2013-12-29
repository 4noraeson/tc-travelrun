<?php
function htmlheader($title) {
  $retval = '';
  $retval .= '<!DOCTYPE html>';
  $retval .= '<html lang="en">';
  $retval .= '<head>';
  $retval .= '<title>', $title, '</title>';
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
