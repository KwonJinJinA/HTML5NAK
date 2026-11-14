<?php
error_reporting(0);
include "config.php";

$ag = $_GET['ag'];

?>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <meta name="author" content="yinqi">
    <title>登录-注册</title>
	<!--(PC&Mp)顶部、PC进入游戏、PC用户中心-->
    <link rel="stylesheet" type="text/css" href="css/sdk.css?v=1668589629">
     <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/layer.js"></script>
    <script type="text/javascript" src="js/jquery.pjax.min.js"></script>
    <script type="text/javascript" src="js/clwl.js?ver=1.0"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="h5_common.js"></script>
    <script type="text/javascript" src="js/jconfirm/jquery-confirm.min.js"></script>
    <style>
        .lyear-wrapper {
            position: relative;
        }
    </style>
    <script>
window.addEventListener('DOMContentLoaded', function() {
  var uidInput = document.getElementById('username');
  var passInput = document.getElementById('pass');

  var uid = getCookieValue('uid');
  var pass = getCookieValue('pass');

  if (uid && pass) {
    uidInput.value = uid;
    passInput.value = pass;
  }
});

function getCookieValue(name) {
  var cookies = document.cookie.split('; ');

  for (var i = 0; i < cookies.length; i++) {
    var cookie = cookies[i].split('=');

    if (cookie[0] === name) {
      return decodeURIComponent(cookie[1]);
    }
  }

  return '';
}

    </script>		
</head>
  <style>
    .class_body_iframe {
      background: #333 url(./img/20220310093046_24665.jpg) no-repeat center top;
      background-size: auto 100vh;
    }
  </style>
<!-- 如果有背景显示背景 -->
<body  class="class_body_iframe" ">
<!-- 如果有内容显示内容 -->

<div class="conent-play">

<form id="frmLogin" method="post">

    <!-- 非微信平台 -->

    <!--内容框-->
    <div class="content_box content_box_pc login">
        <p class="con_tit">登录-阴阳界</p>
        <ul>
            <li class="inp">
                <span class="user"></span>
                <p><input type="text" id="username" name="username" class="input_1" value="" placeholder="请输入账号"></p>
            </li>
            <li class="inp">
                <span class="password"></span>
                <p><input type="password" id="pass" name="pass" class="input_1"  value="" placeholder="请输入密码"></p>
            </li>
        </ul>

        <p class="button">
            <a onclick="btnlogin()"  id="btnlogin" class="LG">登录</a>

        </p>
        <p class="button2">
            <a href="javascript:void(0);" onclick="regShow()">没有账号？去注册</a>
        </p>



    </div>
    </form>
    <form id="frmReg" method="post">
    <div class="content_box content_box_pc reg">
        <p class="con_tit">账号注册</p>
        <ul>
            <li class="inp">
                <span class="user"></span>
                <p><input type="text" id="uid" name="uid" class="input_1" value="" placeholder="请输入账户，勿使用中文"></p>
                <input type="hidden" name="extend" class="extend" value="">

            </li>

            <li class="inp">
                <span class="password"></span>
                <p><input type="password" id="pas" name="pas" class="input_1"  value="" placeholder="请输入6-15位字母或数字"></p>
            </li>

            <li class="inp">
                <span class="password"></span>
                <p><input type="password" id="password" name="password" class="input_1"  value="" placeholder="再次输入密码"></p>
				<p><input type="hidden" id="daili" name="daili" class="input_1" value="<?php echo $_GET['ag'];?>"></p>
            </li>

  
        </ul>

        <p class="button">
            <a onclick="btnreg()"  id="btnreg" class="LG" id="btnreg">注册</a>
        </p>
		<p class="button2">
            <a href="javascript:void(0);" onclick="Show()">有账号？去登录</a>
        </p>


    </div>
</form>
</div>
<script> 
function regShow(){
    $(".content_box").hide();
    $(".reg").show();
}
function Show(){
    $(".content_box").hide();
    $(".login").show();
} 
		function btnlogin() {
            var user = $("input[name='username']").val();
			var pass = $("input[name='pass']").val();
			var ag = $("input[name='daili']").val();
            layer.load(1);
            $.ajax({
                url: '../reg.php?type=login',
                type: 'post',
                dataType: 'json',
                data: {uid:user,pass:pass},
                success: function (data) {
                    if (data.code == 0) {
					var uidd = data.data.userId;
var message = {
  uid: uidd,
  payload: "port_data" // 替换为传递给父页面的数据
};
var jsonMessage = JSON.stringify(message); // 将消息对象转换为 JSON 字符串
window.parent.postMessage(jsonMessage, "*");					
					console.log("kankanxinxi");
					 console.log(data.data);
						document.cookie = "uid=" + uidd + "; expires=" + new Date(Date.now() + (365 * 24 * 60 * 60 * 1000)).toUTCString();
						document.cookie = "pass=" + pass + "; expires=" + new Date(Date.now() + (365 * 24 * 60 * 60 * 1000)).toUTCString();	

					window.location.href="http://122.51.27.223:99/game.php?uid=" + uidd + "&time=" + data.data.time + data.data.token + "&sign=" + data.data.sign + "&pass=" + data.data.passs + "&local=1&token=" + data.data.token; 
                    }
                    console.log(data);
                    layer.closeAll('loading');
                    layer.msg(data.msg);

                },
                error: function (error) {
                    layer.closeAll('loading');
                    layer.msg('系统错误，联系管理！');
                }
            });
                        
        }

		function btnreg() {
            var user = $("input[name='uid']").val();
			var pass = $("input[name='pas']").val();
			var password = $("input[name='password']").val();
			var daili = $("input[name='daili']").val();
			
			
			
        if (user == "") {
            alert("请输入用户名！");
        } else if (user.length < 4) {
            alert("用户名长度不得小于4位！");
        } else if (!funcChina(user)) {
            alert("用户名不能含有汉字！");
        } else if (checkUserName(user)) {
            alert("用户名只能是字母和数字！");
        }else {	
            layer.load(1);
            $.ajax({
                url: '../reg.php?type=reg',
                type: 'post',
                dataType: 'json',
                data: {uid:user,pass:pass,password:password,daili:daili},
                success: function (data) {
                    if (data.code == 0) {
					var uidd = data.data.userId;
var message = {
  uid: uidd,
  payload: "port_data" // 替换为传递给父页面的数据
};
var jsonMessage = JSON.stringify(message); // 将消息对象转换为 JSON 字符串
window.parent.postMessage(jsonMessage, "*");

					window.location.href="http://122.51.27.223:99//game.php?local=1&uid=" + uidd + "&time=" + data.data.time + data.data.loginURL + "&sign=" + data.data.sign + "&pass=" + data.data.passs + "&token=" + data.data.token; 
                    }

                    layer.closeAll('loading');
                    layer.msg(data.msg);

                },
                error: function (error) {
                    layer.closeAll('loading');
                    layer.msg('系统错误，联系管理！');
                }
            });
                        
        }}
		
</script>
</body>
</html>