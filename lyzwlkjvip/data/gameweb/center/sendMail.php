<?php
include_once "./config.php";
header('Access-Control-Allow-Origin:*');
$rid = $_POST['rid'];
$sid = $_POST['sid'];
$item = $_POST['item'];
$sign = $_POST['sign'];
$name = $_POST['name'];
$txt = $_POST['txt'];
$servername = "localhost";
$username = "root";
$password = "game10086...A123456...";
$dbname = "game_manager";
$ip = $_SERVER['REMOTE_ADDR'];

if($ip != '127.0.0.1' && $ip != '122.51.27.223'){
    exit("失败");
}

            $conn_game = mysqli_connect($servername,$username,$password,$dbname) or die('132, 数据库错误');
			$conn_game->query('set names utf8');
            $sql_a = "select * from `server` where `server_id`='$sid'";
            $resultqq = $conn_game->query($sql_a);
            $rowq = $resultqq->fetch_array();
            $ooweb = $rowq['web_port'];


/* $url = 'http://127.0.0.1:'.$ooweb.'/email/sendEmail'; */
$url = 'http://127.0.0.1:9580/email/sendEmail';
#$url = 'http://127.0.0.1:9586?action=email&method=sendEmail&content={attachments=[{"bind":"0","count":5000000,"name":"伊始战剑","templateId":"dj1352"}]&receiverUserIds=68788196213049&isGlobal=0&title=补偿&serverIds=1001&content=补偿}';
//action=email,method=sendEmail,content={attachments=[{"bind":"0","count":5000000,"name":"伊始战剑","templateId":"dj1352"}], receiverUserIds=69063074422972, isGlobal=0, title=补偿, serverIds=1005, content=补偿}


$key = 'xy52782331134';
$signa = md5($key.$rid);
if($signa != $sign){
	exit("失败");
}
$item_array = explode(';', $item);

$items = array();

foreach ($item_array as $item) {
  // 将每个子字符串按逗号分割为模板ID和数量
  $item_data = explode(',', $item);
  
  $templateId = $item_data[0];
  $count = $item_data[1];
  
  // 创建一个包含模板ID、名称、数量和绑定状态的关联数组
  $item_arr = array(
    'templateId' => $templateId,
    'count' => $count,
    'bind' => 0
  );
  
  // 将关联数组添加到$items数组中
  $items[] = $item_arr;
}


$spenData = [
	'id' => time().mt_rand(100,999),
	'isGlobal' => 0,
	'receiverUserIds'=> $rid,
	'title' => $name,
	'content' => $txt,
	'jb' => 0,
	'yb' => 0,
	'exp' => 0,
	'attachments' =>$items,
];

$spenData = json_encode($spenData,JSON_UNESCAPED_UNICODE);
//print_r($spenData);
//die;
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
	print_r($result);
    //return $result;

?>