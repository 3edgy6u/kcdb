<?php
$db = new mysqli("localhost", "root", "", "kancolle");
if ($db->connect_errno) die($db->connect_error);
if (!$db->set_charset("utf8")) die($db->error);
?>
