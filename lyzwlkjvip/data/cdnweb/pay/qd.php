

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
    <div class="lyear-wrapper" id="pjax">
                <div style="margin: 0 auto;">
            <div class="col-xs-12 col-sm-10 col-lg-8 center-block" style="float: none;">
                <div class="panel panel-primary">

                    <div class="panel-body">
                        <div class="input-group">
                            <span class="input-group-addon">游戏账号</span>
                            <input type="text" name="quname" class="form-control" value="<?php echo $uid;?>" disabled />
                        </div><br />
						<div>
                            <button type="button" id="formDemo" class="btn btn-info form-control" onclick="getshop()">签到已改为游戏内获得奖励</button>
                        </div><br />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        function getshop () {
            var uid = "<?php echo $uid;?>";
			$('#formDemo').attr("disabled",true).addClass("layui-btn-disabled");
            $.ajax({
                url: '../api.php?type=qd',
                type: 'post',
                dataType: 'json',
                data: {uid:uid},
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
                '<label>平台币充值（比例1RMB=500平台币）</label>' +
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

    </script>
</body>

</html>