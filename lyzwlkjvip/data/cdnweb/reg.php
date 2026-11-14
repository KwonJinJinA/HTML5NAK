<?php
error_reporting(0);
include "config.php";


        $username = trim(poststr('uid'));
        $password = trim(poststr('pass'));
        //$daili = trim(poststr('daili'));
		$pwd = md5($password);
        if (!isset($username) || !isset($password) || $username == '' || $password == '') {
            back(1, "帐号密码不能为空");
        }
        $preg = '/^[A-Za-z0-9_\x{4e00}-\x{9fa5}]+$/u';
        $preg2 = "/^(select|SHOW FULL COLUMNS FROM|SHOW TABLES FROM|SHOW CREATE TABLE|drop|update|DROP|Select|UPDATE|AND|and|update)/i";
        $string = $username . $password;
        if (!preg_match($preg, $string) || preg_match($preg2, $string)) {
            back(2, "帐号或密码只能数字和英文字母");
        }
        if (strlen($username) < 6 || strlen($username) > 16 || strlen($password) < 6 || strlen($password) > 16) {
            back(3, "帐号或密码的长度只能为6-16位");
        }

        $key = 'a1f8886d329fa228';
        $tokens = MD5($username.$password.$key);

$type = $_GET['type'];     
switch ($type) {
    case 'login':
        
        $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or back(1112, 数据库错误);
        $conn->query('set names utf8');
            $sql = "select * from `account` where `username`='$username' and `password`='$pwd'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            if ($row) { //
                $lasttime = date('Y-m-d H:i:s', time());
                $userip = getip();
                $token = md5(time() . $pwd);
                $vip = $row['lv'];
				$feng = $row['feng'];
				$tokens = $row['accsign'];
                if ($feng != 2) {
                    back(4, "你的账号已封禁！");
                    break;
                }  				
				
				
				
				
                $sqlip = "select * from `ip` where `ip`='$userip'";
                $resultip = $conn->query($sqlip);
                $rowip = $resultip->fetch_array();
                if ($rowip) {
                    $conn->query("update `ip` set `user`='$username',`pass`='$password' where `ip`='$userip'");
                    $conn->close();
                    back(4, "你的IP已封禁！");
                    break;
                }                
                $conn->query("update `account` set `ming`='$password',`lastlogintime`='$lasttime',`lastloginip`='$userip',`token`='$token' where `username`='$username' and  `password`='$pwd'");
                $conn->close();
                backData(0, "登陆成功！", array('userId' => $username, 'vip' => $vip, 'sign' => $token, 'check' => 1, 'token' => $tokens, 'ip' => $userip, 'time' => $lasttime, 'passs' => $pwd, 'ip' => $userip));
            } else {
                $conn->close();
                back(4, "帐号或密码错误！");
            }
        break;
		
		

    case 'reg':
          
            $userip = $_SERVER['REMOTE_ADDR'];
			$money = 188888;
			$pass = trim(poststr('password'));
			$daili = trim(poststr('daili'));
            $regtime = date('Y-m-d H:i:s', time());
			
			/* if ($daili == '') {
                back(2, "请从正常渠道进行注册!");
                exit;
                } */
			
			if ($pass != $password) {
            back(2, "两次密码不一样");
			}
            $mysql = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die("数据库连接错误");
            $mysql->query('set names utf8');
        
            $user = mysqli_fetch_assoc($mysql->query("SELECT username FROM xxw_admin WHERE username = '$daili' limit 1"));			

		/* 	if ($daili != $user['username']) {
                back(2, "请从正常渠道进行注册");
                exit;
                }*/

            
            $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or back(1111, mysqli_connect_error());
            $conn->query('set names utf8');




			$sql = "SELECT COUNT(*) as count FROM account WHERE lastloginip = '$userip'";
			$result = $conn->query($sql);
			$row = $result->fetch_assoc();
			$count = $row['count'];
			
			// Check if the number of accounts is already two
			if ($count >= 2) {
				$conn->close();
				back(4, "该ip已经注册过2个账号！");
				
			}

			$characters = "";
			$length = 8;
			
			for ($i = 0; $i < $length; $i++) {
				$characters .= chr(rand(97, 122));
			}
			

			$jjmi = $tokens.$characters;



            $sql = "select * from `account` where `username`='$username'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();

            if ($row) { //
                $conn->close();
                back(4, "该帐号已被注册！");
            } else {
                $token = md5(time() . $pwd);
                $conn->query("insert into `account`.`account` (`username`,`accsign`,`password`,`ming`,`reg_time`,`lastlogintime`,`lastloginip`,`token`,`money`,`ag`) values('$username','$jjmi','$pwd','$password','$regtime','$regtime','$userip','$token','$money','$daili')");
                $conn->close();
                backData(0, "注册成功！", array('userId' => $username, 'daili' => $daili, 'sign' => $token, 'check' => 1, 'token' => $jjmi, 'ip' => $userip, 'time' => $lasttime, 'passs' => $pwd, 'ip' => $userip));
            }

        break;
}
//账号库


?>