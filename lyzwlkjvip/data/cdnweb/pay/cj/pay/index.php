<?php
if(!isset($_POST['roleid'])){
    $_POST = $_GET;
}
$money = $_POST['qid'];
$uid = $_POST['uid'];
$sid = $_POST['sid'];
$timea = date("Ymd");
$opena = "20230310";
if($opena < $timea){
  exit("【激情抽奖】活动已经结束，请等待下一轮活动!");
}
if($sid == ''){
  exit("没有检测到登陆区服，请进入游戏后重新点击【激情抽奖】参与活动!");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="UTF-8">
	<title>阴阳界</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
	<link rel="stylesheet" href="css/weui.css">
	<link rel="stylesheet" href="css/weuix.css">
</head>
<style type="text/css">
.page-bg{max-width:480px;}
.hongse{color:#F00}    
.lanse{color:#0000FF}
</style>
<body ontouchstart class="page-bg center">

    <form action="py.php" method="get">
    <div class="weui-cells weui-cells_form">
	  <div class="weui-cell">
		    <div class="weui-cell__hd"><label class="weui-label">账号ID：</label></div>
		    <div class="weui-cell__bd">
		      <strong class="lanse"><?php echo $uid;?></strong>
		  	</div>
	    </div>
      <div class="weui-cell weui-cells_form">
        <div class="weui-cell__hd"><label class="weui-label">游戏区服：</label></div>
        <div class="weui-cell__bd">
        <strong class="lanse"><?php echo $sid;?>区</strong>  
        </div>
      </div>
      <div class="weui-cell weui-cells_form">
        <div class="weui-cell__hd"><label class="weui-label">赞助金额：</label></div>
        <div class="weui-cell__bd">
        <strong class="hongse"><?php echo $money;?>.00元</strong>  
        </div>
      </div>
      
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label class="weui-label">支付方式：</label></div>
        <div class="weui-cell__bd">
          <select class="weui-select" name="paytype">
            <option  value="weixin11">微信支付</option>
			
			<option  value="alipay11">支付宝</option>
			
          </select>
        </div>
      </div>
                <input type='hidden' name='money' value ='<?php echo $money;?>'/>
				<input type='hidden' name='uid' value ='<?php echo $uid;?>'/>
                <input type='hidden' name='sid' value ='<?php echo $sid;?>'/>
                <input type='hidden' name='tid' value ='<?php echo $tid;?>'/>
        <button type="submit" class="weui-btn weui-btn_primary">立即支付</button>
	  
    </form>
    <script src="https://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        $("#alipaypc").remove();
        $("#weixinpc").remove();
    } else {//
        $("#weixinsj").remove();
        $("#alipaysj").remove();
    }
    </script>
</body>

</html>