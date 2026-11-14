<?php
error_reporting(0);
include "../config.php";

$jsonData = $_GET['orderInfoJson']; // 获取 POST 请求的原始数据

$requestDat = json_decode($jsonData, true); // 解码 JSON 数据为 PHP 数组

// 可以通过以下方式访问解码后的数据
$pay = $requestDat['pay'];
$ext = $requestDat['ext'];
$requestDaa = base64_decode($ext);
$requestData = json_decode($requestDaa, true);

$gameArea = $requestData['extra']['game_area'];
$rgrade = $requestData['extra']['rgrade'];
$desc = $requestData['extra']['desc'];
$userID = $requestData['extra']['user_id'];
$rid = $requestData['order']['uid_in_game'];
$iapObjectID = $requestData['extra']['iapObjectId'];
$iapAmount = $requestData['extra']['iapAmount'];
$sid = $requestData['extra']['sid'];
$time = $requestData['extra']['time'];
$orderID = $requestData['order']['order_id'];
$uidInGame = $requestData['order']['uid_in_game'];
$userNameInGame = $requestData['order']['user_name_in_game'];
$level = $requestData['order']['level'];
$vipLevel = $requestData['order']['vipLevel'];
$power = $requestData['order']['power'];
$balance = $requestData['order']['balance'];
$tongban = $requestData['order']['tongban'];
$guildName = $requestData['order']['guildName'];
$feeID = $requestData['order']['feeid'];
$itemID = $requestData['order']['item_id'];
$callbackURL = $requestData['order']['callback_url'];
$productName = $requestData['order']['product_name'];
$remark = $requestData['order']['remark'];
$productID = $requestData['order']['product_id'];
$serverID = $requestData['order']['server_id'];
$serverName = $requestData['order']['serverName'];
$payMoney = $requestData['order']['pay_money'];
$productCount = $requestData['order']['product_count'];
$money = $payMoney*100;

if($ext == ''){
    exit('验签失败！');
}



        $conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME,DBPORT) or die('1112, 数据库错误');
        $conn->query('set names utf8');
        $sql = "select * from `account` where `accsign`='$userID'";
        $result = $conn->query($sql);
        if ($result) {
            $row = $result->fetch_array();
            $moneya = $row['money'];
            $qid = $row['quid'];
            if($qid == ''){


                $sql_2 = "UPDATE `account`.`account` SET `quid` = $serverID WHERE `accsign` = '$userID'";
			    $result_2 = $conn->query($sql_2);
			    $qid = $serverID;
            }
            if($qid != $serverID){
                $jis = $qid-1000;
                $xinxix = '该账号已绑定'.$jis.'区，无法在其他区支付';
                exit($xinxix);
            }            
            

        } else {
            $moneya = 0;
        }
        
        




?>

<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>阴阳界</title>
    <link rel="icon" href="http://58yx.top:81/images/favicon.ico" type="image/ico">
    <meta name="author" content="yinqi">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <!--对话框-->
    <link rel="stylesheet" href="css/jquery-confirm.min.css">
    <link href="css/style.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.5.6/css/layui.css">
<script src="https://cdn.staticfile.org/layui/2.5.6/layui.js"></script>	
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/layer.js"></script>
    <script type="text/javascript" src="js/jquery.pjax.min.js"></script>
    <script type="text/javascript" src="js/clwl.js?ver=1.0"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jconfirm/jquery-confirm.min.js"></script>
    <style>
        .lyear-wrapper {
            position: relative;
        }
    </style>
</head>

<body>
<script>
layer.alert('<span style="color:red;">任何-线下充值-卖号等-都是骗子，勿信！</span><br><br><span style="color:blue;">游戏活动每天送近1000代金券和典藏不要错过！</span><br><br><span style="color:red;">服务器定于8月29号下午更新修复个别问题！</span>', function(){
    layer.close(layer.index);
});
</script>
    <div class="lyear-wrapper" id="pjax">
                <div style="margin: 0 auto;">
            <div class="col-xs-12 col-sm-10 col-lg-8 center-block" style="float: none;">
                <div class="panel panel-primary">

                    <div class="panel-body">
					<div class="alert alert-danger" role="alert">任何-线下充值-卖号等-都是骗子，勿信！</div>
                        <div class="input-group">
                            <span class="input-group-addon">充值区服</span>
                            <input type="text" name="quname" class="form-control" value="<?php echo $serverName;?>" disabled />
                        </div><br />
                        <div class="input-group">
                            <span class="input-group-addon">账号余额</span>
                            <input type="text" name="user" class="form-control" value="<?php echo $moneya;?>" disabled />
                        </div><br />
                        <div class="input-group">
                            <span class="input-group-addon">消耗币额</span>
                            <input type="text" name="money" class="form-control" value="<?php echo $payMoney;?>" disabled />
                        </div><br />

                        <div class="input-group">
                            <span class="input-group-addon">角色名称</span>
                            <input type="text" name="name" class="form-control" value="<?php echo $userNameInGame;?>" disabled />
                        </div><br />
                        <div class="input-group">
                            <span class="input-group-addon">充值礼包</span>
                            <input type="text" name="pay" class="form-control" value="<?php echo $productName;?>" disabled />
                        </div><br />

						<div>
                            <button type="button" id="formDemo" class="btn btn-info form-control" onclick="getshop()">确认购买</button>
                        </div><br />

                        <table class="table table-bordered">
                            <tbody>
                                <tr height="50">
                                    <td>
                                        <!--<a href="/user/bind.php" class="btn btn-block btn-danger" pjax="exclude">换绑区服</a>-->
                                        <a  class="btn btn-block btn-warning" onclick="getpay()">平台币充值</a>
                                    </td>
                                     <td>
                                        <a  class="btn btn-block btn-warning" onclick="zdpay()">砸蛋充值</a>

                                    </td>
                                    
                                </tr>							
							
                                <tr height="50">
                                    <td>
                                        <!--<a href="/user/bind.php" class="btn btn-block btn-danger" pjax="exclude">换绑区服</a>-->
                                        <a  class="btn btn-block btn-danger" onclick="getvip()">特权购买</a>
                                    </td>
                                     <td>
                                        <a  class="btn btn-block btn-danger" onclick="getyu()">特权查询</a>

                                    </td>
                                    
                                </tr>
                                
                                <tr height="50">
                                    <td>
                                        <!--<a href="/user/bind.php" class="btn btn-block btn-danger" pjax="exclude">换绑区服</a>-->
                                        <a  class="btn btn-block btn-success" onclick="shop()">平台商城</a>
                                    </td>
                                     <td>
                                        <a  class="btn btn-block btn-success" onclick="zjd()">激情砸蛋</a>

                                    </td>
                                    
                                </tr>
                                <tr height="50">
                                    <td>
                                        <!--<a href="/user/bind.php" class="btn btn-block btn-danger" pjax="exclude">换绑区服</a>-->
                                        <a  class="btn btn-block btn-warning" onclick="leiji()">累充奖励</a>
                                    </td>
                                     <td>
                                        <a  class="btn btn-block btn-warning" onclick="getxxzd()">推广奖励</a>

                                    </td>
                                    
                                </tr>
                                
                                
                                
                              
                                
                                
                                
                                
                            </tbody>
                        </table>                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        function getshop () {
           
            
            var uid = "<?php echo $userID;?>";
			var data = '<?php echo $ext; ?>';
			$('#formDemo').attr("disabled",true).addClass("layui-btn-disabled");
            $.ajax({
                url: '../api.php?type=charge',
                type: 'post',
                dataType: 'json',
                data: {uid:uid,data:data},
        beforeSend: function() {
            // 发送请求前的操作，例如显示弹窗提示
            layer.msg('正在叫醒收银小姐姐，请稍后...', {icon: 16, area: ['600px', '600px']});
        },                
                
                
                success: function (data) {
                    console.log(data);
                    layer.closeAll('loading');
                    layer.msg(data.msg);
					setTimeout(function () {
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);   
					}, 800);
                },
                error: function (error) {
                    layer.closeAll('loading');
                    layer.msg('系统错误，联系管理！');
                }
            });
                        

        }

        function getpay () {
            var uid = "<?php echo $userID;?>";
            $.confirm({
                title: '温馨提示',
                content: '' +
                '<form class="formName">' +
                '<div class="form-group">' +
                '<label>平台币充值（比例1RMB=1000平台币）</label>' +
                '<input type="text" name="km" placeholder="请输入您要充值的金额" class="cdk form-control" required />' +
                '</div>' +
                '<div class="input-group">' +
                '<span class="input-group-addon">支付方式</span>' +
                '<select id="paytype" name="paytype" class="form-control">' +                
                '<option value="alipay">支付宝</option>' +
                '<option value="wxpay">微信</option>' +                  
                '</select></div><br />' +
               
                
                '</form>',
                buttons: {
                    formSubmit: {
                        text: '提交',
                        btnClass: 'btn-blue',
                        action: function () {
                            var km = $("input[name='km']").val();
							var selecta = document.getElementById("paytype");
							var pay = selecta.value;                            
                            if(!km){
                                $.alert('请输入您的充值金额');
                                return false;
                            }
                            layer.load(1);
			                    var $uaer = "epayapi.php?&" + "uid=" + uid + "&km=" + km+ "&pay=" + pay;
			                    window.location.href = $uaer;
                        }
                    },
                    cancel: {
                        text: '取消'
                    },
                },
                onContentReady: function () {
                    var jc = this;
                    this.$content.find('form').on('submit', function (e) {
                        e.preventDefault();
                        jc.$$formSubmit.trigger('click');
                    });
                }
            });
        }

        function zdpay () {
            var uid = "<?php echo $userID;?>";
            $.confirm({
                title: '温馨提示',
                content: '' +
                '<form class="formName">' +
                '<div class="form-group">' +
                '<label>砸蛋充值只获得砸蛋次数（比例5RMB=1次）</label>' +
                '<input type="text" name="km" placeholder="输入充值金额，自动转为次数" class="cdk form-control" required />' +
                '</div>' +
                '<div class="input-group">' +
                '<span class="input-group-addon">支付方式</span>' +
                '<select id="paytype" name="paytype" class="form-control">' +                
                '<option value="alipay">支付宝</option>' +
                '<option value="wxpay">微信</option>' +                  
                '</select></div><br />' +
               
                
                '</form>',
                buttons: {
                    formSubmit: {
                        text: '提交',
                        btnClass: 'btn-blue',
                        action: function () {
                            var km = $("input[name='km']").val();
							var selecta = document.getElementById("paytype");
							var pay = selecta.value;                            
                            if(!km){
                                $.alert('请输入您的充值金额');
                                return false;
                            }
                            layer.load(1);
			                    var $uaer = "epayapizd.php?&" + "uid=" + uid + "&km=" + km+ "&pay=" + pay;
			                    window.location.href = $uaer;
                        }
                    },
                    cancel: {
                        text: '取消'
                    },
                },
                onContentReady: function () {
                    var jc = this;
                    this.$content.find('form').on('submit', function (e) {
                        e.preventDefault();
                        jc.$$formSubmit.trigger('click');
                    });
                }
            });
        }
        function getvip () {
            var uid = "<?php echo $userID;?>";
            $.confirm({
                title: '特权购买',
                content: '' +
                '<form class="formName">' +
                '<div class="form-group">' +
                '<label>所有特权有效期为一个月</label>' +
				'<label><span style="color:red;">所有特权充值金额立即全额到账</label></span>' +
				'<label><span style="color:red;">比如黄金卡30元立即到账30000平台币</label></span>' +
				'<label>黄金卡每日送64800平台币和砸蛋5次</label>' +
				'<label>至尊卡每日送4w平台币和砸蛋15次</label>' +
				'<label>钻石卡每日送6w平台币和砸蛋25次</label>' +
				'<label>以上特权卡可以叠加购买</label>' +
                '</div>' +
                '<div class="input-group">' +
                '<span class="input-group-addon">选择特权</span>' +
                '<select id="payname" name="payname" class="form-control">' +                
                '<option value="1">黄金卡（30元）</option>' +
                '<option value="2">至尊卡（300元）</option>' +  
                '<option value="3">钻石卡（999元）</option>' + 
                '</select></div><br />' +                
                '<div class="input-group">' +
                '<span class="input-group-addon">支付方式</span>' +
                '<select id="paytype" name="paytype" class="form-control">' +                
                '<option value="alipay">支付宝</option>' +
                '<option value="wxpay">微信</option>' +                  
                '</select></div><br />' +
               
                
                '</form>',
                buttons: {
                    formSubmit: {
                        text: '提交',
                        btnClass: 'btn-blue',
                        action: function () {

							var selecta = document.getElementById("paytype");
							var pay = selecta.value;                            
							var selectb = document.getElementById("payname");
							var payname = selectb.value; 
                            layer.load(1);
			                    var $uaer = "epayapia.php?&" + "uid=" + uid + "&km=xiaowu&pay=" + pay + "&payname=" + payname;
			                    window.location.href = $uaer;
                        }
                    },
                    cancel: {
                        text: '取消'
                    },
                },
                onContentReady: function () {
                    var jc = this;
                    this.$content.find('form').on('submit', function (e) {
                        e.preventDefault();
                        jc.$$formSubmit.trigger('click');
                    });
                }
            });
        }
        
        function getyu () {
           
            
            var uid = "<?php echo $userID;?>";
			$('#formDemo').attr("disabled",true).addClass("layui-btn-disabled");
            $.ajax({
                url: '../api.php?type=yu',
                type: 'post',
                dataType: 'json',
                data: {uid:uid},
                success: function (data) {
                    console.log(data);
                    layer.closeAll('loading');
                    layer.msg(data.msg);
					setTimeout(function () {
					var index = parent.layer.getFrameIndex(window.name);
					  
					}, 800);
                },
                error: function (error) {
                    layer.closeAll('loading');
                    layer.msg('系统错误，联系管理！');
                }
            });
                        

        }        

        function zjd () {
            var uid = "<?php echo $userID;?>";
			var rid = '<?php echo $rid; ?>';
			var sid = '<?php echo $sid; ?>';
            var url = "cj/cj.php?uid=" + uid + "&rid=" + rid + "&sid=" + sid;
            window.location.href = url;
        }
        
        function shop () {
            var uid = "<?php echo $userID;?>";
			var rid = '<?php echo $rid; ?>';
			var sid = '<?php echo $sid; ?>';
            var url = "shop.php?uid=" + uid + "&rid=" + rid + "&sid=" + sid;
            window.location.href = url;
        }        
        function leiji () {
            var uid = "<?php echo $userID;?>";
			var rid = '<?php echo $rid; ?>';
			var sid = '<?php echo $sid; ?>';
            var url = "leiji.php?uid=" + uid + "&rid=" + rid + "&sid=" + sid;
            window.location.href = url;
        }  

         function getxxzd() {
            layer.confirm("<span style='color:red;'>推广要求：标题  #手游仙侠#这个游戏很好玩#九州#阴阳界</span><br/><br/>推广只需要将我们的视频发抖音或者快手（有兴趣直播的也算）<span style='color:red;'>必须我们统一视频，自制无效</span><br/><br/><span style='color: purple;'>推广完成后发截图找群主领取奖励每日推广赠送1000真充卡+10000玉币+红色随机注灵丹*5</span><br/>累计推广5天额外赠送=1000元真充卡*2+20000玉币+红色随机注灵丹*10<br/><span style='color: blue;'>累计推广10天额外赠送=1000元真充卡*3+20000玉币+红色随机注灵丹*20</span><br/><span style='color: green;'>累计推广20天额外赠送=1000元真充卡*5+50000玉币+红色随机注灵丹*30<br/><span style='color: orange;'>累计推广30天额外赠送=1000元真充卡*10+100000玉币+红色随机注灵丹*50</span><br/>" , { title: "推广说明" },function () {
                layer.closeAll();
            });
        } 		
    </script>
</body>

</html>