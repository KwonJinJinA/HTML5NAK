<?php
include_once "../config.php";
header('Access-Control-Allow-Origin:*');
$url = 'http://127.0.0.1:9580?action=email&method=sendEmail&content={attachments=[{"bind":"0","count":5000000,"name":"伊始战剑","templateId":"dj1352"}], receiverUserIds=69063074422972, isGlobal=0, title=补偿, serverIds=1005, content=补偿}';
//action=email,method=sendEmail,content={attachments=[{"bind":"0","count":5000000,"name":"伊始战剑","templateId":"dj1352"}], receiverUserIds=69063074422972, isGlobal=0, title=补偿, serverIds=1005, content=补偿}
$spenData = [
	'action' => 'email',
	'method' => 'sendEmail',
	'content' => '{attachments=[{"bind":"0","count":5000,"name":"xiaowu","templateId":"dj1352"}], receiverUserIds=68788196214904, isGlobal=0, title=补偿, serverIds=1005, content=补偿}'
];



    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($curl, CURLOPT_HEADER, FALSE);
    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
    curl_setopt($curl, CURLOPT_POSTFIELDS, $spenData); // Post提交的数据包
    curl_setopt($curl, CURLOPT_TIMEOUT, 60);
    if (curl_errno($curl)) {
        return 'Errno' . curl_error($curl);
    } else {
        $result = curl_exec($curl);
    }
    curl_close($curl);
    return $result;

?>