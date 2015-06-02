<?php
## $Id$

require 'fx.inc.php';

ob_start('ob_tidyhandler');

httpheader();
echo htmlheader('travelrun -- css', usercss());

echo '<div class="cssnav">';
echo 'Go back to the <a href="index.php">start page</a>.';
echo '</div>';

echo '<div class="cssmain">';

echo 'Choose your css file:<br>';
echo '<a href="chcss.php?f=0">travelrun</a> estilo default<br>';
echo '<a href="chcss.php?f=1">torncentral</a> estilo torncentral<br>';

$dh = opendir('css');
if ($dh) {
  while (($fn = readdir($dh)) !== false) {
    if ($fn{0} == '#') {
      if (preg_match('/^#([a-z]+)-([0-9]{14})$/', $matches)) {
        if (!isset($ps[$matches[1]]) {
          $ps[$matches[1]] = array();
        }
        $ps[$matches[1]][] = $matches[2];
      }
    }
  }
}

echo '</div>';

echo htmlfooter();
?>
