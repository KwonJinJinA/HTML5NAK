<?php
$data=json_decode(file_get_contents('php://input'), TRUE); 
$md5key ="704beb52fb86a341b3fac4c1c96186a1";//网关密钥
$sign = tksign($data, $md5key);//验证签名
/////////////////

$uid=$data["game_user_id"];
$sid="1";

////////////
$ip = "127.0.0.1";
$ur = "root";
$pd = "123456";
$tid = "8888888";


$showtime=date("Y-m-d");
$money = $data["amount"];

$qu = 'account';
$game = 'backstage';
$it = "砸金蛋次数充值";
//验证正确执行任务		
if ($sign == $data["sign"]) {
	
	$con=mysqli_connect($ip,$ur,$pd,$qu);
	if(!$con)
	{
		echo '连接数据库失败';
		return 0;
	}

	$row5 = $con->query("SELECT * FROM `account` WHERE `username` = '$uid' LIMIT 1")->fetch_array();
	$ag = $row5['ag'];
	$query1 = "INSERT INTO `paylog` (sid,uid,money,ag,tid,name,time) VALUES ('$sid','$uid','$money','$ag','$tid','$it','$showtime')";
	$res=mysqli_query($con,$query1 );
	
	
$uip = "127.0.0.1";
$uur = "xiaowu2023";
$upd = "xiaowu123456";
$uqu = 'choujiang';
//判断抽奖权限
	$conn=mysqli_connect($uip,$uur,$upd,$uqu);
	if(!$conn){
		echo '连接数据库失败';
		return 0;
	}	
	$nnu = 5;
	if($money == 490){
		$money = 540;
	}
	if($money == 990){
		$money = 1115;
	}	
	if($money == 1990){
		$money = 2265;
	}
	if($money == 3240){
		$money = 3665;
	}	
	
	
	
	$rmbb = $money/$nnu;



	$row56 = $conn->query("SELECT * FROM user WHERE `uid` = '$uid'")->fetch_array();
	$user = $row56['uid'];

	if($user == ''){


		$sql_3 = "INSERT INTO `choujiang`.`user` (`id`, `uid`, `jf`, `zong`, `ling`) VALUES (NULL, '$uid', '$rmbb', '', '');";
		$result_3 = $conn->query($sql_3);

	} else {
		$sql_2 = "UPDATE `choujiang`.`user` SET `jf` = jf + $rmbb WHERE `uid` = '$uid'";
		$result_2 = $conn->query($sql_2);

			
	}


//语句	
	
  exit("success");








}
else{
   exit("商户密钥不正确!请检查tkconfig.php里的miyao 是否正确!");
}








//😋😋固定验证签名参数不用修改😋😋
function tksign($data, $md5key) {
	$para = array_splice($data, 0, -1);
	ksort($para);
    reset($para);
	$arg  = "";
	foreach ($para as $key => $val) {
		    if($key == "order_amount") {
		    $val=number_format($val,2,".","");
	        }
            $arg = $arg . $key . "=" . $val . "&";
    }
	$arg = substr($arg,0,count($arg)-2);
	$sign = strtolower(md5($arg.$md5key)); 
	return $sign;
}
?>