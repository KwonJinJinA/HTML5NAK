<?php
include_once "../config.php";
header('Access-Control-Allow-Origin:*');

$spenData = [
	'user_id' => $_POST['user_id'],
	'game_id' => $_POST['game_id'],
	'time' => time(),
];
$sign=md5($spenData['user_id'].$spenData['time'].$spenData['game_id'].$xinwanConfig['GAME_SECRET']);
$spenData['sign']=$sign;

$res=post_curls($xinwanConfig['VERIFY_URL'],$spenData);
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
?>