<?php
## $Id$

require 'fx.inc.php';

httpheader();
echo htmlheader('travelrun -- css', usercss());

echo '<div class="cssnav">';
echo 'Go back to the <a href="index.php">start page</a>.';
echo '</div>';

echo '<div class="cssmain">';

$ipbasedname = 'IP' . md5($_SERVER['REMOTE_ADDR']);
if (!is_file('css/' . $ipbasedname . '.css')) {
  copy('css/travelrun.css', 'css/' . $ipbasedname . '.css');
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  setcookie('css', $ipbasedname, time()+60*60*24*30);
  file_put_contents('css/' . $ipbasedname . '.css', $_POST['css']);
  echo 'Cookie set, file saved.<br><br>';
}

echo '<form method="post" action="">';
echo 'Edit your personal css (', $ipbasedname, ')<br>';
echo '<textarea name="css" rows="48" cols="132">';
echo file_get_contents('css/' . $ipbasedname . '.css');
echo '</textarea><br>';
echo '<input type="submit" value="save file">';
echo '</form>';

echo '</div>';

echo htmlfooter();
?>
