<?php
header('Access-Control-Allow-Origin:*');
$user = $_GET['user'];
$pass = $_GET['pass'];
$ss = $_GET['s'];
$servername = "localhost";
$username = "root";
$password = "game10086...A123456...";
$dbname = "account";
$key = 'xiaowu548465321541452215614!2##$@..';
$s = md5($key.$user.$pass);

if($s != $ss){
    exit('滚！');
}



//echo '{ "lastLogin": { }, "serverList": [{ "guo": "", "serverPath": "wss://gz.server.925box.com/wss/9587", "meng": "", "serverType": 0, "rechargeUrl": "", "serverName": "test", "weight": 0, "whiteList": false, "isNew": 0, "openTime": 1675872301000, "serverId": "1001", "status": 0 }] }';
//{"lastLogin":{"1001":{"lastLoginTime":1681721773599,"level":3,"roleId":68788213216765,"sex":0,"roleName":"s1.\u8d6b\u8fde\u9e3f\u8f69","job":"A"}},"serverList":[{"guo":"","serverPath":"wss:\/\/gz.server.925box.com\/wss\/9587","meng":"","serverType":0,"rechargeUrl":"","serverName":"\u53cc\u7ebf1\u533a","weight":0,"whiteList":false,"isNew":0,"openTime":1676822400000,"serverId":"1001","status":0}]}
$get = array_unique($_GET);//获取get过来的参数
$query = http_build_query($get);//将数组转化为get参数的格式
$url = "http://127.0.0.1:8089/center/gameserver/listForClient.php?".$query;
$getUrl = file_get_contents($url);
$json=json_decode($getUrl,true);  
//print_r($json) ;
foreach ($json['serverList'] as $k =>$v){
	//print_r($v);
	$parts = parse_url($_SERVER ['HTTP_HOST']);
    $host = $parts['host'];
    if($v[serverName] == 's16.西游16区'){
		$v[serverName] = 's16.妖界';
	}
    //if($v[serverName] == 's23.双线23区'){
	//	$v[serverName] = 's23.扶摇';
	//}	
    //if($v[serverName] == 's20.双线20区'){
	//	$v[serverName] = 's20.无敌每一天';
	//}		
	$newArr[$k] = $v;
	
	$a= explode(":",$newArr[$k]['serverPath']);
	$newArr[$k]['serverPath'] = "ws://".$host.":".$a[count($a)-1];


}
$json['serverList'] = $newArr;
print_r(json_encode($json,JSON_UNESCAPED_UNICODE));

?>