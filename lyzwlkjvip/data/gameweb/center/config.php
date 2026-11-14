<?php
//quick参数
$quickConfig = [
	'Callback_Key' => '25485227535427694791696521211744',
	'Md5_Key' => 'fsjo6cwdx22cmjacw9ma80inc0vpkytz',
];

//公告配置
$noticeVer = 3;  //版本号
$noticeConfig = [
	//标题  开始时间   结束时间
	['新服公告','2022-11-18 10:26:07','2100-11-18 10:26:07'],
	//['新服公告','2022-11-18 10:26:07','2025-11-18 10:26:07'],  这是第二行 单独的

];
//游戏配置杂项
$gameConfig = [
	'isWss' => true,
	'clientVer'  => 235,   //前段版本号
	'xieyiVer'   => 8,     //适龄提示,隐私协议,用户协议  版本号  
	'cdn'  => 'http://122.51.27.223:99/',    //cdn地址 要对应游戏地址所在位置
	//下面是充值通知接口  无需更改
	'payUrl'  => 'http://127.0.0.1:8089/center/xiyouuc/recharge',
	'payKey'  => 'f27e6d971e8e4dfd95572e6503a7ef17',
	'roleKey'  => 'cad7e22fb0ad44ae8da1e783dfed615c',
];

//mysql信息 一般不需要改动!
$mysqlConfig = array(
    'host' => '127.0.0.1',
    'port' => 3306,
    'username' => 'root',
    'password' => 'game10086...A123456...',
	'db' => 'game_manager'
);
$redisConfig = array(
	'host' => '127.0.0.1',
	'port' => 6379,
	'password' => 'game10086...A123456...',
	'centerdb' => 30
);

function addlog($filename = "log", $log = '')
{
    file_put_contents($filename.".log", $log . PHP_EOL, FILE_APPEND);
}
function doSign($_srcData,$_key) {
	ksort($_srcData);
	$signStr = "";
	foreach($_srcData as $k => $v) {
		if($k === 'notify_url' && strpos($v, '%')>-1)
		{
			$v = urldecode($v);
		}
		if("sign" != $k && "" != $v && !is_null($v)) {
			$signStr .= $k . "=" . $v . "&";
		}
	}      
	$signStr .= "key=" . $_key;
	//addlog("./log/sign-pay-",$curTime." ".$signStr);

	$sign = strtoupper(md5($signStr));
	return $sign;
}

?>