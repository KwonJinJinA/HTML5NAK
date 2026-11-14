
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<meta name="apple-mobile-web-app-title" content="H5游戏盒">
<link rel="apple-touch-icon" href="http://files.gamedog.cn/game2013/img/h5_boxicon.png"/>
<title>战天下（冰雪高爆版）进阶礼包</title>
<meta name="description" content="" />
<link href="http://mfiles.gamedog.cn/H5/openv9/style/h5_common2019.css?v20221206v2" rel="stylesheet">
<link href="http://mfiles.gamedog.cn/H5/openv9/style/h5_lbinfo2019.css?v20221206v2" rel="stylesheet">
<script type="text/javascript" src="http://mfiles.gamedog.cn/H5/openv9/js/jquery.min.js?v20221206v2" >
</script>
<script type="text/javascript" src="http://files.gamedog.cn/mobile/ismobilesystem.js"></script>
<script type="text/javascript" src="http://mfiles.gamedog.cn/H5/openv9/js/clipboard.min.js?v20221206v2" ></script>
<script type="text/javascript" src="http://mfiles.gamedog.cn/H5/v2/js/h5.js?v20221206v2" ></script>
<script type="text/javascript">var domain=".gamedog.cn";</script>
</head>
<body>
<div class="wrap">
<!--<div class="sontop">--><!--  <a href="javascript:history.back(-1);" class="backhome">返回</a>--><!--  <span>礼包</span>--><!--  <a href="javascript:void(0);" onclick="gotourl()" class="usercenter" id="useravatar"></a>--><!--</div>-->

<script type="text/javascript">
	function gotourl(){
		var url = '//sdkh5.gamedog.cn/users/?channel=2&ReturnUrl='+window.location.href;
		window.location.href = url;
	}
	
	$.getJSON("http://pass"+domain+"/user/loginstatus/?callback=?", function(data){
		if(data!=null){
			$("#useravatar").addClass("login");
			$("#useravatar").html('<img src="http://ucenter.gamedog.cn/avatar.php?uid='+data.uid+'&size=small" />');
		}
	});
</script>

<div class="kfbox">
<ul class="lblist">

<?php

error_reporting(0);
include "../config.php";
$uid = $_GET['uid'];//$_GET['user'];
$sid = $_GET['sid'];

// 创建连接
$con =mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME, DBPORT);

// 检测连接
mysqli_set_charset($con, "utf8");

//echo $u_row['lv'];
$sql = "SELECT * FROM fililibao";
$result = mysqli_query($con,$sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}

if($result){
    while($row = mysqli_fetch_assoc($result)){
        


                switch ($row['open']) {
                    case 1: {
                            $xiangou = "无限购";
                            //echo '<div class="d1" onClick="paynumonc('.$row['id'].','.$row['name'].',' .$row['txt'].',' .$row['money'].')"><strong>' . $row['name'] .'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp价格：'.$row['money']. '</p><span style="font-size:10px">'.$row['txt'].'</span></strong></div>';
                            
							//echo '<div class="toushao"><div class="lgico"><img src="' .$row['icon'].'" /></div><p class="lgtit"><span>' .$row['name'].'</span></p><p>礼包售价：' .$row['money'].'</p><a href="/spxx.php?uid=' .$uid.'&sid=' .$sid.'&tid=' .$row['id'].'&txt=' .$row['txt'].'&money=' .$row['money'].'&name=' .$row['name'].'&icon=' .$row['icon'].'" class="star-btn"  >详细</a></div>';
							echo '<li><div class="new"><img src="'.$row['icon'].'" /></div><p class="title"><span>'.$row['name'].'</span></p><span class="get"><b><i style="width: '.$row['yu'].';"></i></b><em>剩余：'.$row['yu'].'</em></span><a href="../pay/fuli.php?uid=' .$uid.'&sid=' .$sid.'&tid=' .$row['id'].'&txt=' .$row['txt'].'&money=' .$row['money'].'&name=' .$row['name'].'&icon=' .$row['icon'].'" class="ling-btn">详细</a></li>';
							break;
						}
                    case 2: {
							$time = $row['time'];
							$wenzi = '限购至:';
                            $xiangou =$wenzi.$time;
                            echo '<div class="d1" onClick="paynumonc('.$row['id'].','.$row['name'].',' .$row['txt'].',' .$row['money'].')"><strong>' . $row['name'] .'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp价格：'.$row['money']. '</p>'.$row['txt'].'</strong></div>';
                            break;
                        }
                
            }



    }

}

?>




</ul>
</div>

<style>
	.load-app-module { height: 60px; margin-bottom:
	4px; } .load-app-module.has-bg { position: fixed; width:
	100%; top: 0; background: rgba(0,0,0,.6); color: #fff; z-index: 180; max-width:480px}
	.icon-2 { background-image: url(http://mfiles.gamedog.cn/H5/img/vipicon.png);
	} .icon-close-hp { width: 16px; height: 16px; background-position:0 0;
	background-size:70px auto; } .load-app-module.has-bg .icon-close-hp
	{ position: absolute; top: 22px; left: 12px; } .icon-logo-l { display:block;
	float:left; width: 44px; height: 44px; background-position: 0 -13px; background-size:100%
	auto; } .load-app-module .icon-logo-l { margin: 8px 0
	0 42px; } .load-app-module .begin-load { float:right;
	width: 71px; height: 30px; margin: 15px 15px 0 0; } .load-app-module .info-box
	{ float:left; font-size: 16px; line-height: 22px; padding: 11px 0 0 14px;
	overflow: hidden; } .ellipsis { overflow: hidden; -o-text-overflow: ellipsis;
	text-overflow: ellipsis; white-space: nowrap; } .load-app-module .info-box
	.intro { font-size: 11px; line-height: 16px; }
	
	
	#iconBox{width:56%;height:62px;max-width:190px;background:rgba(0,0,0,.6);position:fixed;bottom:10px;left:50%;-o-transform:rotate(0deg) translateX(-50%);-moz-transform:rotate(0deg) translateX(-50%);-webkit-transform:rotate(0deg) translateX(-50%);transform:rotate(0deg) translateX(-50%);transform-origin:0 72px;-o-transform-origin:0 72px;-moz-transform-origin:0 72px;-webkit-transform-origin:0 72px;-o-border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;color:#fff;opacity:1;-o-transition:all .3s;-moz-transition:all .3s;-webkit-transition:all .3s;transition:all .3s;z-index:999;}#iconBox > strong{position:absolute;right:5px;top:0;font-size:20px;height:20px;line-height:1;color:#fff;}#iconBox > span.close{display:inline-block;width:30px;height:30px;position:absolute;right:0;top:0;z-index:1000;}#iconBox > img{width:50px;height:50px;position:absolute;left:10px;top:6px;-o-border-radius:10px;-moz-border-radius:10px;-webkit-border-radius:10px;border-radius:10px}#iconBox > div{font-size:13px;position:relative;left:70px;line-height:20px;top:11px}#iconBox > div > img{width:14px;position:relative;top:s0px}#iconBox:after{width:0;height:0;content:"";border-top:10px solid rgba(0,0,0,.6);border-left:10px solid transparent;border-right:10px solid transparent;position:absolute;bottom:-10px;left:50%;margin-left:-10px}

</style><div id="iconBox" style="display:none"><strong>×</strong><span class="close"></span><img src="http://files.gamedog.cn/game2013/img/h5_boxicon.png"><div>先点击 <img src="http://files.gamedog.cn/game2013/img/add_screen_icon.png"><br>再"添加到主屏幕"
		</div></div>
		<script>
	
	function  h5HfHdClick(url){
		window.location.href= url+'?channel=2'
	}		

		
	function getNowFormatDate() {
			var date = new Date();
			var seperator1 = "-";
			var month = date.getMonth() + 1;
			var strDate = date.getDate();
			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}
			var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
			return currentdate;
		}
		
	


//获取本地存储对象
var windowlocalStorage=window.localStorage;
	
function  h5ZdyFunc(){

	var checkkey = 0;
	//获取当前时间戳
	var nowstamp = getNowFormatDate();

	
	var addIcontoScreenStorage = windowlocalStorage.getItem('gamedog_prefix_AddIconToScreen_xf');
			  
	if(!addIcontoScreenStorage || (addIcontoScreenStorage != nowstamp)){
		
			checkkey = 1;
	}else{
			checkkey = 0;
	}
  
	//获取最新状态  checkkey  0  关闭  1  开启
	//判断弹框关闭状态
	if(checkkey == 1){
		document.getElementById('H5-dcnBanner').style.display='block';
	}else{
		document.getElementById('H5-dcnBanner').style.display='none';
		h5ShowIcon();
	}

      	
	$('.h5close').bind('click', function (e) {
	    
		e.stopPropagation();
		windowlocalStorage.setItem("gamedog_prefix_AddIconToScreen_xf",nowstamp);
		//关闭弹框
		document.getElementById('H5-dcnBanner').style.display='none';
		h5ShowIcon();

	});
}
	//console.log("外"+windowlocalStorage.getItem('gamedog_AddIconToScreen_Date'));


	function    h5ShowIcon(){
		var inconBoxFlage = false;
		var inconBoxisClose = false;
		var nowstamp = getNowFormatDate();
	//	alert(navigator.standalone)
        console.log(navigator.standalone);
    	if(navigator.standalone)
		 console.log(windowlocalStorage.getItem('gamedog_AddIconToScreen_Date'));
		 var icontoScreenStorage =  windowlocalStorage.getItem('gamedog_AddIconToScreen_Date');


		 if(!icontoScreenStorage || (icontoScreenStorage != nowstamp)){
			if((/iPhone|mac|iPod|iPad/i.test(navigator.userAgent)) && (navigator.userAgent.indexOf("Safari")>-1) ) {
						
				$('#iconBox').show();
					inconBoxFlage = true;
					 
				}
				
				$('#iconBox>span.close').click(function(e){
						e.preventDefault();
						$('#iconBox').hide();
						inconBoxisClose = true;
						windowlocalStorage.setItem('gamedog_AddIconToScreen_Date',nowstamp)
				})
			}
					
			/* 为iconBox添加动画 */
			var iconBoxObj = {
				iconBox:document.querySelector('#iconBox'),
				iconBoxCloseBtn:document.querySelector('#iconBox .close'),
				animentArr:['rotate(-6deg) translateX(-50%)','rotate(6deg) translateX(-50%)','rotate(0deg) translateX(-50%)'],
				count:0
			};
			if(inconBoxFlage&&!inconBoxisClose){
				setTimeout(function(){
					if(inconBoxisClose)
						return false;
					if(document.querySelector('#iconBox')){
						iconBoxObj.timer = setInterval(function () {
							if(inconBoxisClose)
								return false;
							iconBoxObj.iconBox.style.cssText = '-o-transform:'+iconBoxObj.animentArr[iconBoxObj.count%2]+';-moz-transform:'+iconBoxObj.animentArr[iconBoxObj.count%2]+';-webkit-transform:'+iconBoxObj.animentArr[iconBoxObj.count%2]+';transform:'+iconBoxObj.animentArr[iconBoxObj.count%2]+';';
							iconBoxObj.count++;
							if(iconBoxObj.count>8){
								clearInterval(iconBoxObj.timer);
								iconBoxObj.timer = null;
								iconBoxObj.iconBox.style.cssText = '-o-transform:'+iconBoxObj.animentArr[2]+';-moz-transform:'+iconBoxObj.animentArr[2]+';-webkit-transform:'+iconBoxObj.animentArr[2]+';transform:'+iconBoxObj.animentArr[2]+';';
								setTimeout(function(){
									if(inconBoxisClose)
										return false;
									iconBoxObj.iconBox.style.cssText = '-o-transform:'+iconBoxObj.animentArr[2]+' translateY(75px);-moz-transform:'+iconBoxObj.animentArr[2]+' translateY(75px);-webkit-transform:'+iconBoxObj.animentArr[2]+' translateY(75px);transform:'+iconBoxObj.animentArr[2]+' translateY(75px);';
									setTimeout(function () {
										if(inconBoxisClose)
											return false;
										iconBoxObj.iconBox.style.display = 'none';
									},500)
								},5000)
							}
						},300)
					}
				},3000);
			}

	}
	
		


</script><div style="display:none"></div></div></body></html>