<?php
include_once "../config.php";
header('Access-Control-Allow-Origin:*');

$spenData = [
	'body' => $_POST['body'],
	'total_fee' => $_POST['total_fee'],
	'user_id' => $_POST['user_id'],
	'role_id' => $_POST['role_id'],
	'game_id' => $_POST['game_id'],
	'trade_id' => (int)$_POST['trade_id'],
	'game_server' => $_POST['game_server'],
	'role_level' => $_POST['role_level'],
	'attach' => $_POST['attach'],
	'notify_url' => $_POST['notify_url'],
	'nonce_str'	=> (string)time().$_POST['role_id'].$_POST['user_id'],
];
//addlog("./log/sign-pay-".$date,$curTime." ".json_encode($spenData));
//addlog("./log/sign-pay-".$date,$curTime." ".$xinwanConfig['GAME_SECRET']);
$sign=doSign($spenData,$xinwanConfig['GAME_SECRET']);
$spenData['sign']=$sign;
echo json_encode($spenData,JSON_UNESCAPED_UNICODE );

?>