<?php
header('Access-Control-Allow-Origin:*');
include_once "config.php";

global $gameConfig;
$ver = $gameConfig['clientVer'];
echo '{"rules":[[0,0,0]],"defaultVersion":'.$ver.',"helpInfo":"","miniGameOpenArr":[],"miniGameGuideType":0}';

?>