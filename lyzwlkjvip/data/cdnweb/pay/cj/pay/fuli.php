<?php
$data=json_decode(file_get_contents('php://input'), TRUE); 

/////////////////
$uid = $_GET['uid'];
$sid = $_GET['sid'];
$tid = $_GET['tid'];
////////////
$ip = "127.0.0.1";
$ur = "root";
$pd = "123456";

$url = 'http://127.0.0.1:89/center';
$gmuser = 'xiaowu';
$gmpass = 'a123456789';
$token = 'BEdspSE3Mu';

$showtime=date("Y-m-d");
$money = $data["amount"];

$qu = 'account';
$game = 'backstage';
$quu = "game_".$sid;
$user = "local_".$uid;
$prebs = "sf".$sid;
$title = "福利到账";
$content = "【直送500W星币（任意购）】<br/>【直送328无敌战力皮肤（100E战力）】<br/>【直送千万元宝 直送1998】<br/>【送主角光环·送至尊卡·超值月卡】<br/>【送仙玉投资·天帝特权·送砸蛋卡】<br/>【关注主播+加入粉丝群即可上车】";
//验证正确执行任务		
	if($sid == ''){
		die('请登录并进入游戏后再次点击礼包刷新领取');
	}

	$con=mysqli_connect($ip,$ur,$pd,$qu);
	if(!$con){
		echo '连接数据库失败';
		return 0;
	}
	$row5 = $con->query("SELECT COUNT(*) AS count FROM `fulilog` WHERE `uid`='$uid' and `tid`='$tid'")->fetch_array();
	$mai = $row5['count'];
	if(1 <= $mai){
		die('你已经领取过该礼包');
	}

	$query1 = "INSERT INTO `fulilog` (sid,uid,tid,time) VALUES ('$sid','$uid','$tid','$showtime')";
	$res=mysqli_query($con,$query1 );
    $row6 = $con->query("SELECT * FROM `fililibao` WHERE `id` = '$tid' LIMIT 1")->fetch_array();
	$money = $row6['money'];

    $item = json_decode($row6['item'], true);
    $time = time();
    $conn = mysqli_connect($ip,$ur,$pd,$qu) or back(1111, mysqli_connect_error());
    mysqli_select_db($conn, $quu);
    $conn->query('set names utf8');
    $sql = "SELECT * FROM $quu.ny_role WHERE account='{$user}'";
    $result = $conn->query($sql);
    $row = $result->fetch_array();
    
    if ($row['role_id'] != '') {
        $roleid = $row['role_id'];
        $account = $row['name'];
        $items = json_encode(array("source" => $item, "item" => array()));
      
        $sql = "INSERT INTO $game.`ny_mail` (`groups`, `admin`, `role_id`, `role_name`, `servers`, `sender`, `agreer`, `title`, `content`, `attach`, `send_type`, `book_time`, `status`, `is_send`, `create_time`, `send_time`, `msg`) VALUES ('1', 'GM', '{$roleid}', '{$account}', '{$prebs}', '系统', NULL, '{$title}', '{$content}', '{$items}', '0', '0', '1', '0', '{$time}', NULL, '');";
       
        $conn->query($sql);
        //echo $sql;
        $id = $conn->insert_id;
       
        $login_url = $url . "/admin.php?ctrl=index&act=login";
        //echo $login_url;
        $post_fields = array("username" => $gmuser, "password" => $gmpass, "login_token" => $token);
        $ch = curl_init($login_url); //初始化
        curl_setopt($ch, CURLOPT_HEADER, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_fields);
        $content = curl_exec($ch);
        preg_match('/Set-Cookie:(.*);/iU', $content, $str);
        $cookie = $str[1];
        $gifturl = $url . "/admin.php?ctrl=mail&act=send&id={$id}";

        $ch = curl_init($gifturl);
        curl_setopt($ch, CURLOPT_COOKIE, $cookie);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        $conn->close();
        if ($result == 0) {
die('领取成功！物品邮件发送至：'.$account);
         
        } else {
            die('物品发送失败！');
        }
    } else {
        $conn->close();
        return array("code" => 2, "msg" => "角色不存在");
    }


//语句	
	



















?>