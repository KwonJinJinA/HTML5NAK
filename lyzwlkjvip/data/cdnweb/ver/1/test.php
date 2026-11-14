<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>越甲天下</title>
	</head>
	<body>
		<script>
		var YoojarNativeRuntime = window.webkit.messageHandlers;
		function enter()
		{
			var runtime =
			{
				onInit: function( ret ) 
				{ 
					alert( "init: " + ret );
					YoojarNativeRuntime.login.postMessage( "" );
				},
				
				onLogin: function( data )
				{
					// data.token
					// data.userId
					alert( "login: " + data.userId );
				},
				
				onLogout: function( ret )
				{
					alert( "logout: " + ret );
				},
				
				onAddProduct: function( product )
				{
					if ( typeof( product ) === "object" )
					{
						//product.productIdentifier
						//product.price
						//product.localizedTitle
						//product.localizedDescription
						alert( product.productIdentifier + "\n" + product.localizedTitle + "\n" + product.price + "\n" + product.localizedDescription );
					}
					else if ( product == "" )
					{
						// 完成添加
						alert( "添加商品完成" )
					}
					else
					{
						// 不可用的商品ID
					}
				},
				
				onPay: function( code, billno, productID )
				{
					// 100 支付相关参数错误 
					// 101 支付成功 
					// 102 支付失败 
					// 103 支付取消 
					// 104 下单成功 
					// 105 下单失败 
					// 106 解析支付协议失败 
					// 107 当前支付方式不可用
					alert( "pay: " + code );
				}
			};
			
			/*
			var name = prompt( "please enter your name", "masefee" );
			var ret = confirm( name );
			if ( ret )
				alert( "yes" );
			else
				alert( "no" );
			*/
			
			YoojarNativeRuntime.runtime = runtime;
			YoojarNativeRuntime.init.postMessage( "" );
		}
		
		function report()
		{
			// 1 注册 2 上报登录 3 角色升级 4 实名认证 5 公告 6 进入场景
			var datas = 
			{
				reportType: 1,
				serverName: "",
				serverID: 1,
				playerID: 0,
				playerName: "",
				troopsName: "",
				playerLevel: 100,
				vipLevel: 1,
				gameMoney: 0,
				createTime: 0,
				levelUPTime: 0,
			};
			
			YoojarNativeRuntime.report.postMessage( JSON.stringify( datas ) );
		}
		
		function pay()
		{
			var datas = 
			{
				serverID: 0,
				serverName: "",
				playerID: 0,
				playerName: "",
				playerLevel: 100,
				vipLevel: 10,
				productID: "yuanbao_60",
				productName: "60元宝",
				productDesc: "60元宝，聚划算",
				currencyType: 1,
				gameURL: "",
				price: 10,
				count: 1,
				extraParams: "",
				time: 0
			};
			
			YoojarNativeRuntime.pay.postMessage( JSON.stringify( datas ) );
		}
		
		alert( "ddddddd" );
		</script>
		
		<input type="button" style="width: 300px; height: 50px; font-size: 20px;" onclick="enter()" value="进入游戏"/><br>
		<input type="button" style="width: 300px; height: 50px; font-size: 20px;" onclick="pay()" value="充值"/>
	</body>
</html>