<?php
date_default_timezone_set('Asia/Shanghai');
include_once "../../center/config.php";
global $mysqlConfig;
global $redisConfig;

$redis = new Redis();
$redis->connect($redisConfig["host"],$redisConfig["post"]);
if(!$redis->auth($redisConfig["password"])){
	$data=["stat"=>0,"msg"=>"连接异常"];
	die(json_encode($data,JSON_UNESCAPED_UNICODE));
}
$redis->select($redisConfig["centerdb"]);
$key="ExchangeCodeUse:all:mrlb";
$arr=$redis->hgetall($key);
if (count($arr)<1){
	$data=["stat"=>0,"msg"=>"无礼包数据"];
	die(json_encode($data,JSON_UNESCAPED_UNICODE));
}

foreach($arr as $row => $v){
	//print_r($row);
	if ($row == "canUseNum"){
		continue;
	}
	$redis ->hDel($key,$row);
}

