<?php
header('Access-Control-Allow-Origin:*');
include_once "quicksdkAsy.php";
include_once "config.php";

$params = $_POST;
$Callback_Key=$quickConfig["Callback_Key"];
$Md5_Key=$quickConfig["Md5_Key"];
$sdk = new quickAsy();
$curTime = date('Y-m-d H:i:s', time());
$date=date("Y-m-d",time());
addlog("./log/callback-".$date,$curTime."===============================");
if ($sdk->getSign($params, $Md5_Key) != $params['md5Sign']) {
    echo 'md5Sign error';
	addlog("./log/callback-".$date,$curTime."md5Sign error");
    exit();
}
$xml=simplexml_load_string($sdk->decode($params['nt_data'],$Callback_Key));
$data=json_decode(json_encode($xml),true);
$params=$data['message'];
$rtJson=json_encode($params);
$curDate=date('Ymd',time());
$order_no=$params['order_no'];//SDK方订单
$game_order=$params['game_order'];//游戏在调用QuickSDK发起支付时传递的游戏方订单,这里会原样传回 
$channel_uid=$params['channel_uid'];//SDK方订单
$time=$params['pay_time'];//支付完成时间
$rmb=((double)$params['amount']);//订单金额（单位：元）
$status=$params['status'];//订单状态
// 获取额外参数中的数据
addlog("./log/callback-".$date,$curTime."本次请求的数据{$rtJson}");
$extras=$params['extras_params'];//MyData.user.id+"@"+t+"@"+MyData.serverID+"@gh";
$allext=explode("-",$extras);
$sid=$allext[0];
$uid=$allext[1];
$roleId=$allext[2];
$url = $gameConfig['payUrl'];

//sign = MD5 "orderID" + order_no + "cpOrderID" + game_order + payKey
$sign = md5("orderID{$order_no}cpOrderID{$game_order}{$gameConfig['payKey']}");
$postdata=[
	'orderID' => (string)$order_no,
	'cpOrderID' => (string)$game_order,
	'money' => (int)$rmb,
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