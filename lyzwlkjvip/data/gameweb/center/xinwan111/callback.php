<?php
header('Access-Control-Allow-Origin:*');
include_once "../config.php";

$params = $_POST;
$curTime = date('Y-m-d H:i:s', time());
$date=date("Y-m-d",time());
addlog("./log/callback-".$date,$curTime."===============================");
addlog("./log/callback-".$date,$curTime.json_encode($params));
$user_id = $params['user_id'];
$order_no=$params['out_trade_no'];//SDK方订单
$game_order=$params['trade_id'];//游戏在调用QuickSDK发起支付时传递的游戏方订单,这里会原样传回 
$time=time();//支付完成时间
$rmb=((double)$params['total_fee']);//订单金额（单位：元）

$signData=[
	'user_id' => $user_id,
	'game_server' => $params['game_server'],
	'total_fee' => $params['total_fee'],
	'trade_id' => $game_order,
	'out_trade_no' => $order_no,
	'nonce_str' => $params['nonce_str'],
	'attach' => $params['attach'],
];
$sign = doSign($signData,$xinwanConfig['GAME_SECRET']);
if ($sign != $params['sign']){
	
	addlog("./log/callback-".$date,$curTime."sign校验失败");
	addlog("./log/callback-".$date,$curTime."sign:".$sign."  POSTsign:".$params['sign']);
	die("sign err");
}

// 获取额外参数中的数据
$extras=$params['attach'];//MyData.user.id+"@"+t+"@"+MyData.serverID+"@gh";
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