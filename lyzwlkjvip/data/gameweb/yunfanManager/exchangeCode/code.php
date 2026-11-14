<?php
date_default_timezone_set('Asia/Shanghai');
include_once "../../center/config.php";
global $mysqlConfig;
global $redisConfig;

$param=$_GET;
$account=$param["gmUser"];
$pwd=$param["gmPass"];
//连接数据库
$db = new mysqli($mysqlConfig["host"],$mysqlConfig["username"],$mysqlConfig["password"],$mysqlConfig["db"]);
$db->query("SET NAMES UTF8");
$sql = "select * from user where user_name = \"{$account}\"";
$result = $db->query($sql);
$user = $result->fetch_row();
if(empty($user) || md5($pwd) != $user[2]){
    $data=["stat"=>0,"msg"=>"用户异常"];
	die(json_encode($data,JSON_UNESCAPED_UNICODE));
}

$str="cdk名称,cdk,道具,cdk类型,使用等级,添加时间,操作用户\n";
$redis = new Redis();
$redis->connect($redisConfig["host"],$redisConfig["post"]);
if(!$redis->auth($redisConfig["password"])){
	$data=["stat"=>0,"msg"=>"连接异常"];
	die(json_encode($data,JSON_UNESCAPED_UNICODE));
}
$platId = $param["platId"];
$allext=explode("-",$param["codeInfo1"]);
$codeName=$allext[0];
$codeLevel=$allext[2];
$codeType=$allext[3];
$codeItem=$param["codeInfo2"];
$redis->select($redisConfig["centerdb"]);
$arr=$redis->hgetall("ExchangeCode:{$platId}:{$codeName}");
if (count($arr)<1){
	$data=["stat"=>0,"msg"=>"无礼包数据"];
	die(json_encode($data,JSON_UNESCAPED_UNICODE));
}

if( (int)$codeType == 0 ){
	$type = "通用码";
}else{
	$type = "一码一用";
}
foreach($arr as $k => $v){
	//echo $k;
	$str .= "{$codeName},{$k},{$codeItem},{$type},{$codeLevel},{$param["applyTime"]},{$account}\n";
}

//print_r($redis->hgetall('ExchangeCode:xiyou_uc:昨晚'));
//print_r($redis->keys('ExchangeCode:xiyou_uc'));
$date=date('Y-m-d-H-i-s');
$csvName="{$platId}-{$codeName}-{$date}.csv";

$data=["stat"=>1,"msg"=>$str,"csvname"=>$csvName];
echo json_encode($data,JSON_UNESCAPED_UNICODE);
$redis->close();





