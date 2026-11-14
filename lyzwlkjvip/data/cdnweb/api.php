<?php
error_reporting(0);
include "config.php";
$key = 'xy52782331134';
$type = $_GET['type'];



switch ($type) {
    case 'charge':{

        $ext = $_POST['data'];
        $data = base64_decode($ext);
        $sign = md5($key.$data);
        
        $requestData = json_decode($data, true); 
        $payMoney = $requestData['order']['pay_money'];
        $uid = $requestData['extra']['user_id'];
        $serverID = $requestData['order']['server_id'];
		$userNameInGame = $requestData['order']['user_name_in_game'];
            $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die('1112, 数据库错误');
			$conn->query('set names utf8');
            $sql = "select * from `account` where `accsign`='$uid'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            $money = $row['money'];
            $quid = $row['quid'];
        
            if($money < $payMoney){
                $data = array('code'=>100,'msg'=>"余额不足！");
				exit(json_encode($data));            
            }
            if($quid != $serverID){
                $data = array('code'=>100,'msg'=>"绑定的区服不符！");
				exit(json_encode($data));            
            }
            //if($serverID > 1001 && $serverID <= 1006){
			//	$serverID = 1002;
			//} 
            //if($serverID >= 1007 && $serverID <= 1011){
			//	$serverID = 1007;
			//}			
			$quname = 'xkm_server_'.$serverID;

            $conn_game = mysqli_connect(DBHOST,DBUSER,DBPASS,$quname,DBPORT) or die('1112, 数据库错误');
			$conn_game->query('set names utf8');
            $sql_a = "select * from `role` where `user_id`='$uid'";
            $resultqq = $conn_game->query($sql_a);
            $rowq = $resultqq->fetch_array();
            $uid_name = $rowq['name'];

            if($uid_name != $userNameInGame){
                $data = array('code'=>100,'msg'=>"该账号下没有此角色！<br/>第一次购买的新角色请等待几分钟再购买");
				exit(json_encode($data));            
            }












            $url = "http://127.0.0.1:88/center/callbackkkk.php";  // 


            $postFields = array(
                'sign' => $sign,
                'data' => $data
            );

            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($ch);
            curl_close($ch);        

            if($response != 'FAIL'){
                $sql_2 = "UPDATE `account`.`account` SET `money` = money - $payMoney WHERE `accsign` = '$uid'";
			    $result_2 = $conn->query($sql_2);

                $data = array('code'=>100,'msg'=>"充值成功！");
				exit(json_encode($data));
	
            }else {
                $data = array('code'=>100,'msg'=>"充值失败！");
				exit(json_encode($data));
		
            }  

        break;
        }

    case 'yu':{

        $uid = $_POST['uid'];
        
            $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die('1112, 数据库错误');
			$conn->query('set names utf8');
            $sql = "select * from `account` where `accsign`='$uid'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            $y = $row['card1'];
			$zz = $row['card2'];
			$zs = $row['card3'];
            $ea=date("Ymd");
			$shuom = '你未开通黄金卡';
			if($y != ''){
				$y_timestamp = strtotime($y);
				$ea_timestamp = strtotime($ea);
				$diff = ($y_timestamp - $ea_timestamp) / (60 * 60 * 24);
				$shuom = '你的黄金卡还剩【 '.$diff.' 】天';
			}
			$shuoz = '你未开通至尊卡';
			if($zz != ''){
				$y_timestamp = strtotime($zz);
				$ea_timestamp = strtotime($ea);
				$diff = ($y_timestamp - $ea_timestamp) / (60 * 60 * 24);
				$shuoz = '你的至尊卡还剩【 '.$diff.' 】天';
			} 
			$shuos = '你未开通钻石卡';
			if($zs != ''){
				$y_timestamp = strtotime($zs);
				$ea_timestamp = strtotime($ea);
				$diff = ($y_timestamp - $ea_timestamp) / (60 * 60 * 24);
				$shuos = '你的钻石卡还剩【 '.$diff.' 】天';
			} 			

			

                $data = array('code'=>100,'msg'=>$shuom."</br>".$shuoz." </br>".$shuos);
				exit(json_encode($data));


        break;
        }
               
    case 'shop':{

        $uid = $_POST['uid'];
		$rid = $_POST['rid'];
		$sid = $_POST['sid'];
		$tid = $_POST['tid'];
        
            $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die('112, 数据库错误');
			$conn->query('set names utf8');
            $sql = "select * from `account` where `accsign`='$uid'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            $money = $row['money'];
            $quid = $row['quid'];
        

            if($quid != $sid){
                $data = array('code'=>100,'msg'=>"绑定的区服不符！");
				exit(json_encode($data));            
            }
            //if($sid > 1001 && $sid <= 1006){
			//	$sid = 1002;
			//} 
            //if($sid >= 1007 && $sid <= 1011){
				//$sid = 1007;
			//}			
			$quname = 'xkm_server_'.$sid;

            $conn_game = mysqli_connect(DBHOST,DBUSER,DBPASS,$quname,DBPORT) or die('12, 数据库错误');
			$conn_game->query('set names utf8');
            $sql_a = "select * from `role` where `id`='$rid'";
            $resultqq = $conn_game->query($sql_a);
            $rowq = $resultqq->fetch_array();
            $uid_id = $rowq['user_id'];

            if($uid_id != $uid){
                $data = array('code'=>100,'msg'=>"该账号下没有此角色！");
				exit(json_encode($data));            
            }
            $sql_b = "select * from `shop` where `id`='$tid'";
            $result = $conn->query($sql_b);
            $rowab = $result->fetch_array();
            $tid_name = $rowab['name'];
			$tid_item = $rowab['item'];
			$tid_money = $rowab['money'];
			$tid_txt = $rowab['txt'];
			$tid_num = $rowab['num'];
			if($money < $tid_money  ){
                $data = array('code'=>100,'msg'=>"余额不足！");
				exit(json_encode($data));   					
			}
			
            if($tid_txt == ''){
                $data = array('code'=>100,'msg'=>"商品不存在！");
				exit(json_encode($data));          
            }
			
			$query = "SELECT COUNT(*) as count FROM shop_log WHERE tid = '$tid' AND uid = '$uid'";
			$result = mysqli_query($conn, $query);
			
			if ($result) {
				$row = mysqli_fetch_assoc($result);
				$count = $row['count'];
						if($tid_num < $count){
							$data = array('code'=>100,'msg'=>"你已达到限购数量！");
							exit(json_encode($data));          
						}	
				
			}			
			
			
			
			
            $sql_2 = "UPDATE `account` SET `money` = money - $tid_money WHERE `accsign` = '$uid'";

			$result_2 = $conn->query($sql_2);
			
			if(!$result_2){
                $data = array('code'=>100,'msg'=>"系统错误，联系管理！");
				exit(json_encode($data));				
			}
			
            $url = "http://127.0.0.1:88/center/sendMail.php";  // 

			$sign = md5($key.$rid);
            $postFields = array(
                'item' => $tid_item,
                'rid' => $rid,
				'sid' => $sid,
				'name' => $tid_name.'到账',
				'txt' => $tid_name.'到账，请查收',
				'sign' => $sign
            );

            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($ch);
			//exit($response);
            curl_close($ch);        
            $data = json_decode($response, true);
            $msg = $data['success'];
            if($msg == 'true'){
                $time = date("Y-m-d H:i:s");
                $sql = "INSERT INTO `shop_log` (`uid`, `tid`, `name`, `time`) VALUES ('$uid', '$tid', '$tid_name', '$time')";
                $result = $conn->query($sql);				
                $data = array('code'=>100,'msg'=>"购买成功！请邮件中查看！");
				exit(json_encode($data));
	
            }else {
                $data = array('code'=>100,'msg'=>"购买失败！");
				exit(json_encode($data));
		
            } 			
			
			
			

        break;
        }  

    case 'leiji':{

        $uid = $_POST['uid'];
		$rid = $_POST['rid'];
		$sid = $_POST['sid'];
		$tid = $_POST['tid'];
        
            $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die('112, 数据库错误');
			$conn->query('set names utf8');
            $sql = "select * from `account` where `accsign`='$uid'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            $money = $row['money'];
            $quid = $row['quid'];
			$user = $row['username'];

            $sql = "select * from `leiji_log` where `uid`='$user' and `tid`='$tid'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            $fuli_user = $row['uid'];
          
            if ($fuli_user != '') {
                $data = array('code'=>100,'msg'=>"你已经领取过该累计礼包！");
				exit(json_encode($data));            
            } 

            $sql_b = "select * from `leiji` where `id`='$tid'";
            $result = $conn->query($sql_b);
            $rowab = $result->fetch_array();
            $tid_name = $rowab['name'];
			$tid_item = $rowab['item'];
			$tid_money = $rowab['money'];
			$tid_txt = $rowab['txt'];
			$tid_num = $rowab['num'];

            if($tid_txt == ''){
                $data = array('code'=>100,'msg'=>"商品不存在2！");
				exit(json_encode($data));          
            }        
            $sqla = "SELECT uid, SUM(money) AS total_rmb FROM paylog WHERE uid = '$user';";
       
            $resul = mysqli_query($conn, $sqla);
            
            if ($resul) {
                $row = mysqli_fetch_assoc($resul);
                $rmb = $row['total_rmb'];
            } else {
                $rmb = 0;
            }            
            if($rmb < $tid_money){
                $cha = $tid_money-$rmb;
                $data = array('code'=>100,'msg'=>"该礼包你还需充值".$cha."元！");
				exit(json_encode($data));                
            }
			
			
            if($quid != $sid){
                $data = array('code'=>100,'msg'=>"绑定的区服不符！");
				exit(json_encode($data));            
            }
        //    if($sid > 1001 && $sid <= 1006){
		//		$sid = 1002;
		//	} 
        //    if($sid >= 1007 && $sid <= 1011){
		//		$sid = 1007;
		//	}			
			$quname = 'xkm_server_'.$sid;

            $conn_game = mysqli_connect(DBHOST,DBUSER,DBPASS,$quname,DBPORT) or die('12, 数据库错误');
			$conn_game->query('set names utf8');
            $sql_a = "select * from `role` where `id`='$rid'";
            $resultqq = $conn_game->query($sql_a);
            $rowq = $resultqq->fetch_array();
            $uid_id = $rowq['user_id'];

            if($uid_id != $uid){
                $data = array('code'=>100,'msg'=>"该账号下没有此角色！");
				exit(json_encode($data));            
            }


			
            $url = "http://127.0.0.1:88/center/sendMail.php";  // 

			$sign = md5($key.$rid);
            $postFields = array(
                'item' => $tid_item,
                'rid' => $rid,
				'sid' => $sid,
				'name' => $tid_name.'到账',
				'txt' => $tid_name.'到账，请查收',
				'sign' => $sign
            );

            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($ch);
			//exit($response);
            curl_close($ch);        
            $data = json_decode($response, true);
            $msg = $data['success'];
            if($msg == 'true'){
                $time = date("Y-m-d H:i:s");
                $sql = "INSERT INTO `leiji_log` (`uid`, `tid`, `name`, `time`) VALUES ('$user', '$tid', '$tid_name', '$time')";
                $result = $conn->query($sql);				
                $data = array('code'=>100,'msg'=>"领取成功！请邮件中查看！");
				exit(json_encode($data));
	
            }else {
                $data = array('code'=>100,'msg'=>"领取失败！");
				exit(json_encode($data));
		
            } 			
			
			
			

        break;
        }  
 
    case 'zdlj':{

        $uid = $_POST['uid'];
		$rid = $_POST['rid'];
		$sid = $_POST['sid'];
		$tid = $_POST['tid'];
        
            $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die('112, 数据库错误');
			$conn->query('set names utf8');
            $sql = "select * from `account` where `accsign`='$uid'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            $money = $row['zjzd'];
            $quid = $row['quid'];
        

            if($quid != $sid){
                $data = array('code'=>100,'msg'=>"绑定的区服不符！");
				exit(json_encode($data));            
            }
        //    if($sid > 1001 && $sid <= 1006){
		//		$sid = 1002;
		//	} 
        //    if($sid >= 1007 && $sid <= 1011){
		//		$sid = 1007;
		//	}			
			$quname = 'xkm_server_'.$sid;

            $conn_game = mysqli_connect(DBHOST,DBUSER,DBPASS,$quname,DBPORT) or die('12, 数据库错误');
			$conn_game->query('set names utf8');
            $sql_a = "select * from `role` where `id`='$rid'";
            $resultqq = $conn_game->query($sql_a);
            $rowq = $resultqq->fetch_array();
            $uid_id = $rowq['user_id'];

            if($uid_id != $uid){
                $data = array('code'=>100,'msg'=>"该账号下没有此角色！");
				exit(json_encode($data));            
            }
            $sql_b = "select * from `zdjl` where `id`='$tid'";
            $result = $conn->query($sql_b);
            $rowab = $result->fetch_array();
            $tid_name = $rowab['name'];
			$tid_item = $rowab['item'];
			$tid_money = $rowab['money'];
			$tid_txt = $rowab['txt'];
			$tid_num = $rowab['num'];
			if($money < $tid_money  ){
                $data = array('code'=>100,'msg'=>"积分不足！");
				exit(json_encode($data));   					
			}
			
            if($tid_txt == ''){
                $data = array('code'=>100,'msg'=>"商品不存在！");
				exit(json_encode($data));          
            }
            $sql_2 = "UPDATE `account` SET `zjzd` = zjzd - $tid_money WHERE `accsign` = '$uid'";

			$result_2 = $conn->query($sql_2);
			
			if(!$result_2){
                $data = array('code'=>100,'msg'=>"系统错误，联系管理！");
				exit(json_encode($data));				
			}
			
            $url = "http://127.0.0.1:88/center/sendMail.php";  // 

			$sign = md5($key.$rid);
            $postFields = array(
                'item' => $tid_item,
                'rid' => $rid,
				'sid' => $sid,
				'name' => $tid_name.'到账',
				'txt' => $tid_name.'到账，请查收',
				'sign' => $sign
            );

            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $postFields);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($ch);
			//exit($response);
            curl_close($ch);        
            $data = json_decode($response, true);
            $msg = $data['success'];
            if($msg == 'true'){
                $time = date("Y-m-d H:i:s");
                $sql = "INSERT INTO `zjzd_log` (`uid`, `tid`, `name`, `time`) VALUES ('$uid', '$tid', '$tid_name', '$time')";
                $result = $conn->query($sql);				
                $data = array('code'=>100,'msg'=>"兑换成功！请邮件中查看！");
				exit(json_encode($data));
	
            }else {
                $data = array('code'=>100,'msg'=>"兑换失败！");
				exit(json_encode($data));
		
            } 			
			
			
			

        break;
        }

 
//账号库

}//最后的结束
?>