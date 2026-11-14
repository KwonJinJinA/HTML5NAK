<?php
include "config.php";

$ip = $_SERVER['REMOTE_ADDR']; 
$startIP = ip2long('116.30.132.0');
$endIP = ip2long('116.30.143.255');
$visitorIP = ip2long($ip);
if ($visitorIP >= $startIP && $visitorIP <= $endIP) {
    header('Location: https://www.gov.cn/');
    exit;
}

$startIP = ip2long('183.17.0.0');
$endIP = ip2long('183.17.255.255');
$visitorIP = ip2long($ip);
if ($visitorIP >= $startIP && $visitorIP <= $endIP) {
    header('Location: https://www.gov.cn/');
    exit;
}

$g=$_GET;
$user = $g['uid'];
$pass = $g['pass'];

$key = 'xiaowu548465321541452215614!2##$@..';
$s = md5($key.$user.$pass);



        $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or back(1112, 数据库错误);
        $conn->query('set names utf8');
            $sql = "select * from `account` where `username`='$user' and `password`='$pass'";
            $result = $conn->query($sql);
            $row = $result->fetch_array();
            if ($row) { //
                $lasttime = date('Y-m-d H:i:s', time());
                $userip = getip();
                $token = md5(time() . $pwd);
                $vip = $row['lv'];
				$feng = $row['feng'];
                if ($feng != 2) {
                    exit("你的账号已封禁！");
                    break;
                }  				
				
				
				
				
                $sqlip = "select * from `ip` where `ip`='$userip'";
                $resultip = $conn->query($sqlip);
                $rowip = $resultip->fetch_array();
                if ($rowip) {
                    $conn->query("update `ip` set `user`='$username',`pass`='$password' where `ip`='$userip'");
                    $conn->close();
                    exit("你的IP已封禁！");
                   
                    break;
                }                
                $conn->query("update `account` set `ming`='$password',`lastlogintime`='$lasttime',`lastloginip`='$userip',`token`='$token' where `username`='$username' and  `password`='$pwd'");
                $conn->close();
            } else {
                $conn->close();
                exit("帐号或密码错误！");
            }



if ($row['feng'] != 2){
    header("Location: http://122.51.27.223:99/no.html");
    exit;
}
?>
<html>

<head>
	<meta charset='utf-8' />
	<title>阴阳界</title>
	<meta name='renderer' content='webkit'>
	<meta name='viewport'
		content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover' />
	<meta name='apple-mobile-web-app-capable' content='yes' />
	<meta name='full-screen' content='true' />
	<meta name='x5-fullscreen' content='true' />
	<meta name='360-fullscreen' content='true' />
	<meta http-equiv='expires' content='0' />
	<meta name='laya' screenorientation='landscape' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'>
	<meta http-equiv='expires' content='0' />
	<meta http-equiv='Cache-Control' content='no-siteapp' />
	<!-- <script src="https://unpkg.com/vconsole@latest/dist/vconsole.min.js"></script> -->
	<script type="text/javascript">
		var quick = {
			ProductCode: "70208646420050741307882276107804",
			ProductKey: "82578943",
			channel: "tttt",
			server: "http://122.51.27.223",
			cdn: "http://122.51.27.223:99/",
			version: "",
		}
		window['pass']="<?php echo $_GET['pass']; ?>";
		window['ss']="<?php echo $s; ?>";
		window['user']="<?php echo $user; ?>";
		// var vConsole = new window.VConsole();
	</script>
	<script type="text/javascript" src="jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="pay/js/layer.js"></script>
	
	<script type="text/javascript" src="libs/errorTrace0.3.2.js"></script>
	<script type="text/javascript" src="gameConfig/libQuickSDK_v2.js"></script>
	<!-- <script type="text/javascript" src="gameConfig/globalConfig_quick.js?ver="></script> -->
	<script type="text/javascript">
		document.write('<script src="gameConfig/globalConfig_quick.js?ver=' + new Date().getTime() + '" type="text/javascript" charset="utf-8"><\/script>');
		document.write('<script src="libs/start2.0.js?ver=' + new Date().getTime() + '" type="text/javascript" charset="utf-8"><\/script>');
	</script>
	<!-- <script type="text/javascript" src="libs/start2.0.js?ver=20220428"></script> -->
	<script type="text/javascript" src="libs/dexie.min.js"></script>
	<script type="text/javascript" src="libs/idb.js"></script>
	<script type="text/javascript" src="libs/fonts.js"></script>
	<script type="text/javascript" src="libs/jszip.min.js"></script>
	<script type="text/javascript" src="libs/jszip-utils.js"></script>
	<script type="text/javascript" src="libs/md5.min.js"></script>
	<script type="text/javascript" src="libs/report_1.0.0.js"></script>
	<script type="text/javascript" src="libs/zlib.min.js"></script>
	<script type="text/javascript" src="libs/easysax.js"></script>
	<script type="text/javascript" src="libs/simpleDomParser.js"></script>
	<!-- <script type="text/javascript" src="sdks/quickSDK.js"></script> -->
	<script type="text/javascript">
		document.write('<script src="sdks/quickSDK.js?ver=' + new Date().getTime() + '" type="text/javascript" charset="utf-8"><\/script>');
	
	</script>


	<link rel="stylesheet" href="css/style.css">
	<style type="text/css">
		#__vconsole {
			display: none;
		}

		.show {
			display: block !important;
		}
	</style>
	<script type="text/javascript">

		changeProContent("开始加载...");

		var tipTimer = setTimeout("changetip()", 1500);
		WorkerStart();
		// initGame();
		window.SDKRuntime.initSdk();
		listenSDK();
	</script>

</head>

<body style='margin:0;overflow:none;overflow-x:hidden;overflow-y:hidden;background-color: #000000;height:100%;'>
	<div id="divCopy"></div>
	<img id="loadingImg" src="loading/riding.gif" class='loader-ring' />
	<div id="loading" class='loader-ring'>
		<div id="infoDiv" style="width:240px;margin-top:230px">
			<font color="#FFFFFF">正在进入游戏....如果长时间未进入，请</font><a href="javascript:window.location.reload()"
				style='color:#FFFFFF;'>关闭浏览器再次进入</a>
		</div>
	
		<!--<div id="infoDiv" style="width:240px;margin-top:230px"><font color="#FFFFFF">正在进入游戏...如果长时间未进入，请点击</font><a href="javascript:location.reload()" style='color:#FFFFFF;'>刷新游戏</a></div>	-->
		<div id="loadDiv" style="width:240px;color:#FFFFFF;size:10px"></div>
	</div>

</body>

</html>