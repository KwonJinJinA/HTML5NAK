<?php
/* *
 * 功能：彩虹易支付异步通知页面
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 */

require_once("lib/epay.config.php");
require_once("lib/EpayCore.class.php");

//计算得出通知验证结果
$epay = new EpayCore($epay_config);
$verify_result = $epay->verifyNotify();

if($verify_result) {//验证成功

	//商户订单号
	$out_trade_no = $_GET['out_trade_no'];

	//彩虹易支付交易号
	$trade_no = $_GET['trade_no'];

	//交易状态
	$trade_status = $_GET['trade_status'];

	//支付方式
	$type = $_GET['type'];
	$name = $_GET['name'];

	//支付金额
	$money = $_GET['money'];

	if ($_GET['trade_status'] == 'TRADE_SUCCESS') {

$ip = "127.0.0.1";
$ur = "root";
$pd = "game10086...A123456...";
$showtime=date("Y-m-d");

$qu = 'account';

	$con=mysqli_connect($ip,$ur,$pd,$qu);
	if(!$con)
	{
		echo '连接数据库失败';
		return 0;
	}
	$row9 = $con->query("SELECT * FROM `xianshang_log` WHERE `danhao` = '$out_trade_no' LIMIT 1")->fetch_array();
	$pytype = $row9['type'];
	if($pytype != 1){
	    exit('订单已处理');
	}
	if($pytype == ''){
	    exit('订单不存在');
	}


	$row5 = $con->query("SELECT * FROM `account` WHERE `accsign` = '$name' LIMIT 1")->fetch_array();
	$ag = $row5['ag'];
	$zhang = $row5['username'];
	$rmbb = $money*1000;

	$query1 = "INSERT INTO `paylog` (sid,uid,money,ag,tid,name,time) VALUES ('0','$zhang','$money','$ag','0','平台币充值','$showtime')";
	$res=mysqli_query($con,$query1 );
	
	$sql_2 = "UPDATE `account`.`account` SET `money` = money + $rmbb WHERE `accsign` = '$name'";
	$result_2 = $con->query($sql_2);

if ($result_2) {
    $aaaa = 3;
    $sql_3 = "UPDATE `account`.`xianshang_log` SET `type` = $aaaa WHERE `danhao` = '$out_trade_no'";
    $result_9 = $con->query($sql_3);
	echo "success";
} else {
    echo "充值失败: " . $con->error;
}


	}

	//验证成功返回

}
else {
	//验证失败
	echo "fail";
}
?>