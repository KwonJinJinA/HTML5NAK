<?php
header('Access-Control-Allow-Origin:*');
include_once "quicksdkAsy.php";
include_once "config.php";
$key = 'xy52782331134';

$params = $_POST;
$jsonData = $_POST['data']; // 获取 POST 请求的原始数据
$sign = $_POST['sign']; // 获取 POST 请求的原始数据
$requestData = json_decode($jsonData, true); // 解码 JSON 数据为 PHP 数组
$sign1 = md5($key.$jsonData);


//{"pay":"xiaowu","extra":{"game_area":"微端测试区","rgrade":442,"desc":"来自VIP充值面板","user_id":"xiaowu1","iapObjectId":"200001","iapAmount":"1","iapExtraStr":"68788212990358","sid":"1001","time":1689261617100},"signature":"","order":{"uid_in_game":68788196238781,"user_name_in_game":"s1.遇见阳冰","level":442,"vipLevel":25,"power":295558671,"balance":406028494,"tongban":120788940,"guildName":"","order_id":"68788212990358","feeid":175,"item_id":0,"callback_url":"http://139.199.177.149:8001/centerserver/sdkCharge","product_name":"新1元抢购","remark":"新1元抢购","product_id":"175","server_id":"1001","serverName":"双线1区","pay_money":100,"product_count":1}}
// 可以通过以下方式访问解码后的数据
$pay = $requestData['pay'];
$gameArea = $requestData['extra']['game_area'];
$rgrade = $requestData['extra']['rgrade'];
$desc = $requestData['extra']['desc'];
$userID = $requestData['extra']['user_id'];
$iapObjectID = $requestData['extra']['iapObjectId'];
$iapAmount = $requestData['extra']['iapAmount'];
$sid = $requestData['extra']['sid'];
$time = $requestData['extra']['time'];
$orderID = $requestData['order']['order_id'];
$uidInGame = $requestData['order']['uid_in_game'];
$userNameInGame = $requestData['order']['user_name_in_game'];
$level = $requestData['order']['level'];
$vipLevel = $requestData['order']['vipLevel'];
$power = $requestData['order']['power'];
$balance = $requestData['order']['balance'];
$tongban = $requestData['order']['tongban'];
$guildName = $requestData['order']['guildName'];
$feeID = $requestData['order']['feeid'];
$itemID = $requestData['order']['item_id'];
$callbackURL = $requestData['order']['callback_url'];
$productName = $requestData['order']['product_name'];
$remark = $requestData['order']['remark'];
$productID = $requestData['order']['product_id'];
$serverID = $requestData['order']['server_id'];
$serverName = $requestData['order']['serverName'];
$payMoney = $requestData['order']['pay_money'];
$productCount = $requestData['order']['product_count'];

$rmb = $payMoney;
$randomNumber = rand(100000, 999999);
$order_no=$time.$randomNumber;//SDK方订单
$game_order=$orderID;//游戏在调用QuickSDK发起支付时传递的游戏方订单,这里会原样传回 
$curTime = date('Y-m-d H:i:s', time());
$date=date("Y-m-d",time());

$uid=$userID;
$roleId=$uidInGame;
$url = $gameConfig['payUrl'];

$currentTimestamp = round(microtime(true) * 1000);

//echo $currentTimestamp;
if($sign != $sign1){
    addlog("./log/callback-".$date,$curTime."执行结果:验证sign失败，带的参数".$jsonData);
    exit("FAIL");
}
//sign = MD5 "orderID" + order_no + "cpOrderID" + game_order + payKey
$sign = md5("orderID{$order_no}cpOrderID{$game_order}{$gameConfig['payKey']}");
$postdata=[
	'orderID' => (string)$order_no,
	'cpOrderID' => (string)$game_order,
	'money' => (int)$rmb/100,
	'userID' => (string)$uid,
	'roleID' => (string)$roleId,
	'appID' => '1',
	'serverID' => (string)$sid,
	'payTime' => (string)$time,
	'sign' => $sign,	
];
$ext=[
	'sid'=>(int)$sid,
	'uid'=>(string)$uid,
];

$postdata['remark'] = json_encode($ext);
addlog("./log/callback-".$date,$curTime."post参数:".json_encode($postdata));
$res = post_curls($url,$postdata);
addlog("./log/callback-".$date,$curTime."执行结果:".$res);
echo $res;
function post_curls($url, $post)
{
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($curl, CURLOPT_HEADER, FALSE);
    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
    curl_setopt($curl, CURLOPT_POSTFIELDS, $post); // Post提交的数据包
    curl_setopt($curl, CURLOPT_TIMEOUT, 60);
    if (curl_errno($curl)) {
        return 'Errno' . curl_error($curl);
    } else {
        $result = curl_exec($curl);
    }
    curl_close($curl);
    return $result;
}