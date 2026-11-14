<?php
error_reporting(0);
include "config.php";
$user = $_GET['uid'];
$user = $_GET['uid'];
$ag = $_GET['ag'];

?>

<!DOCTYPE HTML>
<html style="font-size: 11px;">

<head>
    <meta name="applicable-device" content="mobile">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width, initial-scale=1,maximum-scale=1.0,user-scalable=no" name="viewport" />
    <!-- 游戏全屏 -->
    <meta content="true" name="full-screen" />
    <meta content="true" name="x5-fullscreen" />
    <meta content="true" name="360-fullscreen" />
    <!--iphone qq -->
    <meta name="x5-orientation" content="portrait">
    <meta name="x5-fullscreen" content="true">
    <meta name="x5-page-mode" content="app">
    <title>阴阳界</title>
    <meta name="description" content="" />
    <link rel="stylesheet" href="/static/css/index.css?v20161122v3">
    <link rel="stylesheet" href="/static/css/h5sdk.css?v20161122v3">
    <link rel="stylesheet" href="/static/css/game.css?v20161122v3">
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/static/js/layer.js"></script>    
    <script type="text/javascript" src="/static/js/gdh5.min.js?v13"></script>
    <script type="text/javascript" src="/static/js/h5slider.1.0.js"></script>
    <script type="text/javascript">
    function is_mobile() {
        var screen = '';
        if (screen == '1') {
            $(".iframe_box").css("max-width", $(window).width())
            return true
        }
        var mobileAgent = new Array("iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito",
            "webmate", "nokia", "ucweb", "skyfire");
        var ua = navigator.userAgent.toLowerCase();
        for (var i = 0; i < mobileAgent.length; i++) {
            if (ua.indexOf(mobileAgent[i]) != -1) {
                return true
            }
        };
        return false
    }
    var game_id = '1';
    var game_name = 'H5';
    var domain = "url";
    var channel = '1';
    var uid = '';
    var mid = '1';
    var weixin = 'h5wyxzx';
    var weixinurl = '/static/img/gz_weixin.png';
    var showIcon = 1;
    </script>
</head>

<body>
    <div>
        <div id="modal-button" class="modal-flag" style="display: block;">
            <img src="/static/img/fubiao.png">
        </div>
        <div class="moban" id="moban">
            <div class="modalframe">
                <div class="modal-content" id="modal-content">
                    <section class="modal-main" id="modal-main">

                        <div class="flex flex-x-between shortcut shortcut-head">
                            <div class="flex flex-list" id="user-info" >
                                <div class="tuxiang"><img class="uheadimg"
                                        src="//ucenter.gamedog.cn/avatar.php?uid=12668198&amp;size=big"></div>
                                <div class="zit zit1">
                                    <ul>
                                        <li><b id="username">昵称:未登陆</b><img width="72px" height="17px" class="loginbs"
                                                src="static/img/v1.jfif" id="vip">
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="flex-text" id="isvip">
                                <a href="javascript:;" onclick="xf_wxzs()"><img width="75px" height="37px"
                                        src="//files.gamedog.cn/game2013/h5sdk/static/v2/img/h5_floating2.png"></a>
                            </div>
                        </div>




                        <div class="xf_menu">
                            <ul>
                                <li class="t1 ">
                                    <a class="" href="javascript:;" onclick="getgifi()"><img
                                            src="//files.gamedog.cn/game2013/h5sdk/static/v2/img/h5_floating3.png">
                                        <b>礼包</b>
                                    </a>
                                </li>
                                <li class="t2">
                                    <a href="javascript:;" onclick="getBoxInfo3()"><img
                                            src="//files.gamedog.cn/game2013/h5sdk/static/v2/img/h5_floating4.png">
                                        <b>攻略</b>
                                    </a>
                                </li>
                                <li class="t3">
                                    <a href="javascript:;" onclick="getleichong()"><img
                                            src="//files.gamedog.cn/game2013/h5sdk/static/v2/img/h5_floating5.png">
                                        <b>待定</b>
                                    </a>
                                </li>
                                <li class="t4">
                                    <a href="javascript:;" onclick="getchoujiang()"><img
                                            src="//files.gamedog.cn/game2013/h5sdk/static/v2/img/h5_floating6.png">
                                        <b>激情</b>
                                    </a>
                                </li>
                            </ul>
                        </div>
 <div class="jingpyx list-item">
 <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;">
 <font style="vertical-align: inherit;">功能指引</font></font></b><i class="fr"></i></div> 
 <div class="wxklfl1_x"></div>    
 <div class="wxklfl3">        
 <div class="wxklfl3_bz1"><h2>一：游戏福利</h2></div>
 <div class="wxklfl3_bz2">1、注册即送188888平台币；</div>       
 <div class="wxklfl3_bz3">2、每日0点系统自动发放64800平台币福利；</div>
  <div class="wxklfl3_bz3">注：没有进入游戏购买过道具的账号将不会发放平台币；</div>
 </br>   
 <div class="wxklfl3_bz1"><h2>二：创角福利</h2></div>
 <div class="wxklfl3_bz2">1、进入游戏自动送VIP15；</div> 
 <div class="wxklfl3_bz2">2、进入游戏自动发放1000元真冲卡*5；</div>
 <div class="wxklfl3_bz2">3、进入游戏自动发放觉醒时装任选宝箱*1；</div>
 <div class="wxklfl3_bz2">4、游戏内签到 在线 关卡 送十万元真冲卡；</div> </br>
  <div class="wxklfl3_bz1"><h2>三：月卡福利</h2></div>
 <div class="wxklfl3_bz2">1、购买月卡立即到账10w平台币；</div> 
 <div class="wxklfl3_bz2">2、每日月卡自动发放13336平台币；</div>
 </br>
 <div class="wxklfl3_bz1"><h2>四：每日福利</h2></div>
 <div class="wxklfl3_bz2">1、每日管理定时发放福利CDK，共计5个；</div> 
 <div class="wxklfl3_bz2">2、每日直播间福利定时发放，共计5个；</div>
 </br>
  <div class="wxklfl3_bz1"><h2>五：冠名福利</h2></div>
 <div class="wxklfl3_bz2">1、冠名玩家享受专属定制称号；</div> 
 <div class="wxklfl3_bz2">2、冠名玩家享受专属礼包cdk；</div>
 <div class="wxklfl3_bz2">3、冠名后全服享受专属礼包cdk；</div>
 </br>
   <div class="wxklfl3_bz1"><h2>六：注意事项</h2></div>
 <div class="wxklfl3_bz2">1、由于福利太好，不要盲目挂机自动闯关卡，转生等级不够会无法熔炼装备；</div> 

 </br>
<input type="hidden" id="uuid" value="" />

<input type="hidden" id="sid" value="" />


                        



                    </section>
                </div>
            </div>
            <div id="modal-left" class="modal-left">
                <img src="/static/img/modalleft.png">
            </div>
        </div>
    </div>
    <div id="games-root" style="opacity: 1;">
        <div class="iframe_box" id="games-container">
            <iframe id="game_iframe" name="game_iframe" frameborder="no" src="http://122.51.27.223:99/play.php?ag=<?php echo $_GET['ag'];?>" scrolling="no" width='100%'
                height='100%'>
            </iframe>
        </div>
        <div class="left-tool-cont" id="leftbox" style="display: none;">
            <div id="slide-runner">
            </div>
            <div id="gifts-cont">
                <div class="users-comments" id="xglb_box">
                    <div class="u-l-title">
                        相关礼包
                    </div>
                    <div class="lb-cont" id="xglb">
                    </div>
                </div>
                <div id="game-comm">
                    <div class="users-comments">
                        <div class="u-r-title">
                            热门推荐
                        </div>
                        <div class="hot-com" id="rmtj">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        $(function() {
            $("#shouji").click(function() {
                $("#libaosaoma").hide();
                $("#shoujisaoma").slideToggle();
            });
            $("#libao").click(function() {
                $("#shoujisaoma").hide();
                $("#libaosaoma").slideToggle();
            });
        })
        </script>
    </div>
    <script language="javascript">
    //检测src
    $(document).ready(function() {
        pushHistory();
        var ismobile = is_mobile();
        if (ismobile) {} else {
            //$("#leftbox").show();
            $("#rightbox").show();
            //getBoxInfo2(game_name);
            //getRmtjBox();
            //getPicBox();
        }
    });

    function pushHistory() {
        var state = {
            title: document.title,
            url: location.href
        };
        window.history.pushState(state, document.title, location.href);
    };
    //相关礼包
    function getBoxInfo2(game_name) {
 
      


	$(".moban").css('display', 'block');
   	$('.list-item').remove();
   	$(".xf_menu ul li a").removeClass("current");
   	$(".modal-left a").removeClass("current");
   	$(".modal-left a.contro1").addClass("current");
	var uid = document.getElementById('uuid').value;
	var sid = document.getElementById('sid').value;

    var html = '';
   		html += '<div class="jingpyx list-item">';
	    html += '    <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">专属福利</font></font></b><i class="fr"></i></div>';

	    html += '    <div class="wxklfl1_x"></div>';
	
	    html += '        <iframe id="game_iframe" name="game_iframe"  frameborder="no" src="fuli.php?uid='+uid+'&sid='+sid+'" scrolling="auto" width="100%" height="460px">';
	    html += '        </iframe>';


	

	    html += '</div>';
 
      	$('#modal-main').append(html);
		

   
}

    //相关礼包
    function getBoxInfo3(game_name) {
 
      


	$(".moban").css('display', 'block');
   	$('.list-item').remove();
   	$(".xf_menu ul li a").removeClass("current");
   	$(".modal-left a").removeClass("current");
   	$(".modal-left a.contro1").addClass("current");


    var html = '';
   		html += '<div class="jingpyx list-item">';
	    html += '    <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">新手必看（下滑可查看更多）</font></font></b><i class="fr"></i></div>';

	    html += '    <div class="wxklfl1_x"></div>';
	
	    html += '        <iframe id="game_iframe" name="game_iframe"  frameborder="no" src="gl.php" scrolling="auto" width="100%" height="460px">';
	    html += '        </iframe>';


	

	    html += '</div>';
 
      	$('#modal-main').append(html);
		

   
}

    //相关礼包
    function getleichon(game_name) {
 
      


	$(".moban").css('display', 'block');
   	$('.list-item').remove();
   	$(".xf_menu ul li a").removeClass("current");
   	$(".modal-left a").removeClass("current");
   	$(".modal-left a.contro1").addClass("current");
	var uid = document.getElementById('uuid').value;
	var sid = document.getElementById('sid').value;

    var html = '';
   		html += '<div class="jingpyx list-item">';
	    html += '    <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">签到</font></font></b><i class="fr"></i></div>';
	    html += '    <div class="kefu2"><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><a>&gt每天送18888币&lt</a></font></font></b></div>';
	    html += '    <div class="wxklfl1_x"></div>';
	
	    html += '        <iframe id="game_iframe" name="game_iframe"  frameborder="no" src="pay/qd.php?uid='+uid+'&sid='+sid+'" scrolling="auto" width="100%" height="460px">';
	    html += '        </iframe>';


	

	    html += '</div>';
 
      	$('#modal-main').append(html);
		

   
}



    function getgifi(game_name) {
	var uid = document.getElementById('uuid').value;
	var sid = document.getElementById('sid').value; 
  var url = 'sdk/gifi.php' + '?uid=' + uid+ '&sid=' + sid;
     layer.open({
        type: 2,
        title: '福利礼包',
        content: url,
      area: ['80%', '80%']
    }); 
   
}



//累抽


    function getljcj(game_name) {
 
      


	$(".moban").css('display', 'block');
   	$('.list-item').remove();
   	$(".xf_menu ul li a").removeClass("current");
   	$(".modal-left a").removeClass("current");
   	$(".modal-left a.contro1").addClass("current");
	var uid = document.getElementById('uuid').value;
	var sid = document.getElementById('sid').value;

    var html = '';
   		html += '<div class="jingpyx list-item">';
		
	    //html += '    <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">激情抽奖</font></font></b><i class="fr"></i></div>';
		html += '    <div class="cps-nav"><a href="javascript:;" onclick="getchoujiang()" ><i class="rmtb"></i><span>抽奖</span><b></b></a> ';    	    

		html += '    <a href="javascript:;" onclick="getljcj()"class="current"><i class="hdtb"></i><span>累计抽奖奖励</span><b></b></a>';
		html += '    <a href="javascript:;" onclick="getmrljcj()"><i class="hdtb"></i><span>每日累抽排行</span><b></b></a>';
		html += '    <a href="javascript:;" onclick="getzljcj()"><i class="hdtb"></i><span>累抽总排行</span><b></b></a>';
		html += '</div>';		
		
		html += '    <div class="wxklfl1_x"></div>';



	
	    html += '        <iframe id="game_iframe" name="game_iframe"  frameborder="no" src="cj/userlj.php?uid='+uid+'&sid='+sid+'" scrolling="auto" width="100%" height="460px">';
	    html += '        </iframe>';


	

	    html += '</div>';
 
      	$('#modal-main').append(html);
		

   
}

//累抽


    function getmrljcj(game_name) {
 
      


	$(".moban").css('display', 'block');
   	$('.list-item').remove();
   	$(".xf_menu ul li a").removeClass("current");
   	$(".modal-left a").removeClass("current");
   	$(".modal-left a.contro1").addClass("current");
	var uid = document.getElementById('uuid').value;
	var sid = document.getElementById('sid').value;

    var html = '';
   		html += '<div class="jingpyx list-item">';
		
	    //html += '    <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">激情抽奖</font></font></b><i class="fr"></i></div>';
		html += '    <div class="cps-nav"><a href="javascript:;" onclick="getchoujiang()" ><i class="rmtb"></i><span>抽奖</span><b></b></a> ';    	    

		html += '    <a href="javascript:;" onclick="getljcj()"><i class="hdtb"></i><span>累计抽奖奖励</span><b></b></a>';
		html += '    <a href="javascript:;" onclick="getmrljcj()"class="current"><i class="hdtb"></i><span>每日累抽排行</span><b></b></a>';
		html += '    <a href="javascript:;" onclick="getzljcj()"><i class="hdtb"></i><span>累抽总排行</span><b></b></a>';
		html += '</div>';		
		
		html += '    <div class="wxklfl1_x"></div>';



	
	    html += '        <iframe id="game_iframe" name="game_iframe"  frameborder="no" src="cj/mrlj.php?uid='+uid+'&sid='+sid+'" scrolling="auto" width="100%" height="460px">';
	    html += '        </iframe>';


	

	    html += '</div>';
 
      	$('#modal-main').append(html);
		

   
}
    function getzljcj(game_name) {
 
      


	$(".moban").css('display', 'block');
   	$('.list-item').remove();
   	$(".xf_menu ul li a").removeClass("current");
   	$(".modal-left a").removeClass("current");
   	$(".modal-left a.contro1").addClass("current");
	var uid = document.getElementById('uuid').value;
	var sid = document.getElementById('sid').value;

    var html = '';
   		html += '<div class="jingpyx list-item">';
		
	    //html += '    <div class="kefu2"><i class="fl"></i><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">激情抽奖</font></font></b><i class="fr"></i></div>';
		html += '    <div class="cps-nav"><a href="javascript:;" onclick="getchoujiang()" ><i class="rmtb"></i><span>抽奖</span><b></b></a> ';    	    

		html += '    <a href="javascript:;" onclick="getljcj()"><i class="hdtb"></i><span>累计抽奖奖励</span><b></b></a>';
		html += '    <a href="javascript:;" onclick="getmrljcj()"><i class="hdtb"></i><span>每日累抽排行</span><b></b></a>';
		html += '    <a href="javascript:;" onclick="getzljcj()"class="current"><i class="hdtb"></i><span>累抽总排行</span><b></b></a>';
		html += '</div>';		
		
		html += '    <div class="wxklfl1_x"></div>';



	
	    html += '        <iframe id="game_iframe" name="game_iframe"  frameborder="no" src="cj/zlj.php?uid='+uid+'&sid='+sid+'" scrolling="auto" width="100%" height="460px">';
	    html += '        </iframe>';


	

	    html += '</div>';
 
      	$('#modal-main').append(html);
		

   
}
    //热门推荐游戏
    function getRmtjBox() {
        $.getJSON("http://h5.m." + domain +
            "/index.php?m=Apisdk&a=getGameList&pageSize=4&flag=d,a&isopen=sdk&order=weight&callback=?",
            function(data) {
                var str = "";
                if (data.lists !== '') {
                    $.each(data.lists, function(i, item) {
                        if (i <= 4) {
                            str += '<div class="swiper-wrapper">'
                            str += '<span><img src="' + item.icon + '" /></span><h2>' + item.title +
                                '</h2><p>' + item.description + '</p><a href="http://h5.' + domain +
                                '/games/' + item.id + '.html" target="_blank">开始游戏</a></div>';
                            str += '</div>';
                        }
                    })
                }
                $('#rmtj').empty().append(str);
            })
    }
    //轮播图
    function getPicBox() {
        $.getJSON("http://h5.m." + domain + "/index.php?m=Apisdk&a=getpiclists&callback=?", function(data) {
            var str = "";
            if (data.list !== '') {
                $.each(data.list, function(i, item) {
                    str += '<a href="' + item.arcurl + '" target="_blank"><img src="' + item.litpic +
                        '" style="width:350px;height:156px;"/></a>';
                })
            }
            $('#slide-runner').empty().append(str);
            slider.init({
                obj: '#slide-runner'
            });
        })
    }
    var ajaxstatuska = 0
    //领取礼包
    function getLibaopc(hid) {
        $("#hao-box").remove();
        if (ajaxstatuska == 1) {
            return false;
        }
        ajaxstatuska = 1;
        $.getJSON("http://ka." + domain + "/index.php?m=Ajax&a=linghao&type=mobile&callback=?&aid=" + hid +
            "&class=h5sdk",
            function(data) {
                ajaxstatuska = 0;
                var str = '';
                if (data.stater === "-3") {
                    alert("活动已经结束")
                } else if (data.stater === "-2") {
                    alert("您来晚了,号码没有了!")
                } else if (data.stater === "-1") {
                    alert("登录过期,请重新登录!")
                    oBoxHide();
                } else if (data.stater === "1") {
                    var str = '';
                    str += '<div class="fuchuangpc fk-boxpc" id="hao-box" style="z-index:3000;">';
                    str += '<dl>';
                    str += '    <dt class="k">礼包内容：</dt>';
                    str += '      <dt id="hao-con">' + data.body + '</dt>';
                    str += '      <dt class="k">兑换方式：</dt>';
                    str += '      <dt id="hao-cash" onmouseover="mouseOver()" onmouseout="mouseOut()">' + data
                        .introduction + '</dt>';
                    str += '      <dt class="l" id="hao-number"><span>' + data.number + '</span></dt>';
                    str += '      <dt class="f" id="wbk" style="display:none;">' + data.introduction + '</dt>';
                    str += '  </dl>';
                    str += '  <div class="ca"><a href="javascript:;" onclick="close_kapc()"></a></div>';
                    str += '</div>';
                    $('body').before(
                        '<div class="jqmOverlay" style="height: 100%; width: 100%; position: fixed; left: 0px; top: 0px; z-index: 1010; opacity: 0.5;background-color:#000;"></div>'
                    );
                    $('body').append(str);
                    return false;
                } else if (data.stater === '2') { //今天已经领过了
                    str += '<div class="fuchuangpc fk-boxpc" id="hao-box" style="z-index:3000;">';
                    str += '<dl>';
                    str += '    <dt class="k">礼包内容：</dt>';
                    str += '      <dt id="hao-con">' + data.body + '</dt>';
                    str += '      <dt class="k">兑换方式：</dt>';
                    str += '      <dt id="hao-cash">' + data.introduction + '</dt>';
                    str += '      <dt class="l" id="hao-number"><span>' + data.number + '</span></dt>';
                    str += '      <dt class="f"><a href="javascript:;">长按上方卡号复制</a></dt>';
                    str += '  </dl>';
                    str += '  <div class="ca"><a href="javascript:;" onclick="close_kapc()"></a></div>';
                    str += '</div>';
                    $('body').before(
                        '<div class="jqmOverlay" style="height: 100%; width: 100%; position: fixed; left: 0px; top: 0px; z-index: 1010; opacity: 0.5;background-color:#000;"></div>'
                    );
                    $('body').append(str);
                    return false;
                } else if (data.stater === "-4") {
                    alert("同IP一天只能领取3次")
                } else {
                    alert("非法操作")
                }
            });
    }

    function close_kapc() {
        $(".jqmOverlay").remove();
        $(".fk-boxpc").remove();
    }

    function mouseOver() {
        $("#wbk").show();
    }

    function mouseOut() {
        $("#wbk").hide();
    }

window.addEventListener('message', function(event) {
  var orderInfoJson = event.data;
  var jsonObject = JSON.parse(orderInfoJson);
  var productCode = jsonObject.productCode;
  var pay = jsonObject.pay;
  var uuid = jsonObject.uid; 
  var guanbi = jsonObject.guanbi;
// 获取属性值
console.log(guanbi);
  console.log(orderInfoJson);
// 将参数拼接到要打开的网页 URL 中
if (pay && pay !== '') {
  var url = 'pay/pay.php' + '?orderInfoJson=' + encodeURIComponent(orderInfoJson);
     layer.open({
        type: 2,
        title: '平台币支付（首次打开会自动绑定区服）',
        content: url,
      area: ['80%', '80%']
    });    
    
}

if (sid && sid !== '') {
var result = sid - 13000;
  document.getElementById("sid").value=result; 
}
if (uuid && uuid !== '') {
  document.getElementById("uuid").value=uuid; 
  var element=document.getElementById("username");
  element.innerHTML=uuid;  
}
if (guanbi && guanbi !== '') {
layer.closeAll('page'); 
}

});//////////////////////
    </script>
</body>

</html>