<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>正在为您跳转到支付页面，请稍候...</title>
	<style type="text/css">
body{margin:0;padding:0}
p{position:absolute;left:50%;top:50%;height:35px;margin:-35px 0 0 -160px;padding:20px;font:bold 16px/30px "宋体",Arial;text-indent:40px;border:1px solid #c5d0dc}
#waiting{font-family:Arial}
	</style>
</head>
<body>
<?php

require_once("lib/epay.config.php");
require_once("lib/EpayCore.class.php");

/**************************请求参数**************************/
$notify_url = "http://122.51.27.223:99/pay/notifyzd_url.php";
//需http://格式的完整路径，不能加?id=123这类自定义参数

//页面跳转同步通知页面路径
$return_url = "http://122.51.27.223:99/pay/return_url.php";
//需http://格式的完整路径，不能加?id=123这类自定义参数

//商户订单号
$out_trade_no = date("YmdHis").mt_rand(100,999);
//商户网站订单系统中唯一订单号，必填

//支付方式（可传入alipay,wxpay,qqpay,bank,jdpay）
$type = $_GET['pay'];
//商品名称
$name = $_GET['uid'];
//付款金额

$money = $_GET['km'];
if($money < 10){
	exit('最低充值金额10元');
}
if($name == ''){
	exit('没有找到角色信息，请稍后重试');
}
$servername = "127.0.0.1";
$username = "root";
$password = "game10086...A123456...";
$dbname = "account";

// 创建数据库连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接是否成功
if ($conn->connect_error) {
    die("数据库连接失败：" . $conn->connect_error);
}

$conn->query('set names utf8');
$current_time = date("Y-m-d H:i:s");
$sql = "INSERT INTO `xianshang_log` (`danhao`,`uid`, `num`, `time`, `type`) VALUES ('$out_trade_no','$name', '$money', '$current_time', '1')";
if ($conn->query($sql) !== TRUE) {
    die("订单创建失败：" . $conn->error);
}



/************************************************************/

//构造要请求的参数数组，无需改动
$parameter = array(
	"pid" => $epay_config['pid'],
	"type" => $type,
	"notify_url" => $notify_url,
	"return_url" => $return_url,
	"out_trade_no" => $out_trade_no,
	"name" => $name,
	"money"	=> $money,

);

//建立请求
$epay = new EpayCore($epay_config);
$html_text = $epay->pagePay($parameter);
echo $html_text;

?>
<p>正在为您跳转到支付页面，请稍候...</p>
</body>
</html>