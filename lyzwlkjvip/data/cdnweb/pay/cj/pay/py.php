<?php
$url="https://pay.txhuyu.com/Pay/Create.aspx";  //提交地址
$PayMethod = $_GET['paytype'];//通道手机扫码  weixin1 微信H5  alipay1 支付宝H5  paytype
$Amount = $_GET['money'];//金额
$IsCard = "0";//
$pinjie = $_GET['uid'];
$GameUserID = $pinjie;//支付账号
$ReGameUserID = $pinjie;//确认账号
$GameUserContact = "1531366478";//支付联系方式
$GroupKey = "fdc36dbb9d12c60b11761f14d6b60ac2";//分区

$ServerKey = "fa72b72cad79d5a4e2665f5a10ead27c";//分组
$TemplateKey = "0ffaa172d92e08f0225d7ce633a86278";

echo "<form style='display:none;' id='form1' name='form1' method='POST' 
      action='{$url}'>
              <input name='PayMethod' type='text' value='{$PayMethod}' />
              <input name='Amount' type='text' value='{$Amount}'/>
              <input name='IsCard' type='text' value='{$IsCard}'/>
              <input name='GameUserID' type='text' value='{$GameUserID}'/>
              <input name='ReGameUserID' type='text' value='{$ReGameUserID}'/>
              <input name='GameUserContact' type='text' value='{$GameUserContact}'/>
			  <input name='GroupKey' type='text' value='{$GroupKey}'/>
			  <input name='ServerKey' type='text' value='{$ServerKey}'/>
              <input name='TemplateKey' type='text' value='{$TemplateKey}'/>		  
            </form>
            <script type='text/javascript'>function load_submit(){document.form1.submit()}load_submit();</script>";	

?>