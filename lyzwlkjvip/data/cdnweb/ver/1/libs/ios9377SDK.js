"use strict";
var SDKRuntime = (function(){
	var SDKRuntime = {};
		SDKRuntime.utils = ({
		getUrlParam:function(name){
			var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			var r = window.location.search.substr(1).match(reg);  //匹配目标参数
			if (r!=null) return unescape(r[2]); return null; //返回参数值
		},	
		makeUrlParams:function(params){
            if(params){
               var str = "";
                for(var i in params){
                    str = str + i + "=" + encodeURIComponent(params[i]) + "&";
                }
                str = str.substring(0,str.length-1);
                console.log(str);
                return str;
            }else{
                console.log("非法调用");
                return false;
            }
        },
		request: function(url, params, callback, method, content_type, timeout){
			if(!method){
				method = "POST";
			}

			if(!content_type){
				content_type = "application/x-www-form-urlencoded";
			}

			if(!timeout){
				timeout = 30000;//30s释放
			}

			var xhr = new XMLHttpRequest();
			xhr.timeout = timeout;
			xhr.ontimeout = function(){
				console.log('请求超时',url);
				var re = {
					ret: 0,
					msg: "失败",
					content: [],
				};
				re.msg = "请求超时";
				callback(re);
				return;
			};

			var query_params = SDKRuntime.utils.makeUrlParams(params);

            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4 && xhr.status == 200){
                    console.log(xhr.response);
                    if(xhr.response){
                        if(callback && (typeof(callback) === 'function')){
                        	if(typeof(xhr.response) === "string"){
                        		callback(JSON.parse(xhr.response));
                        		return;
                        	}
                        	callback(xhr.response);
                        	return;
                        }
                    }
                }
            };

            if(method === 'POST'){
            	xhr.open(method, url);
            	xhr.setRequestHeader("Content-type",content_type);
            	xhr.send(query_params);
            }else{
            	xhr.open(method, url + '?' + query_params);
            	xhr.send();
            }
		},
	});
	
	SDKRuntime.webkitInterface = window.webkit ? window.webkit.messageHandlers : {};	
	SDKRuntime.runtime =SDKRuntime.webkitInterface.runtime= {};
	SDKRuntime.postClientMsg = function(cmd , msg){
		try{
			SDKRuntime.webkitInterface[cmd].postMessage( msg );
		}
		catch(e){
			//console.error(e);
		}
		
	}
	SDKRuntime.initSdk = function (){
		SDKRuntime.runtime.onInit = function(success){
			console.log("SDK初始化成功！");
			SDKRuntime.sdk_login();
		};
		SDKRuntime.postClientMsg("CSGame_Init","" );
	}

	SDKRuntime.sdk_login = function (){
				console.log("sdk_login发起登陆请求");
				SDKRuntime.runtime.onSDKLogin = function(isSuccess , userName){
					userDataFromPublish = {};
					userDataFromPublish.user_id = userName;
					userDataFromPublish.game_channel_id = "9377_IOS";
					userDataFromPublish.game_id = "165";
					userDataFromPublish.channel_id = "8085";
					userDataFromPublish.token = "F9509BFBFE407F8DA03F0CF070FBCA90";
					userDataFromPublish.time = 1531304331;
					userDataFromPublish.l_h5_sign = "5a40aa3fc993b1b3a1a550691cefbf14";
					console.log("sdk_login登录成功："+isSuccess+"用户名："+userName);
					//
					fundebug.user.name = userDataFromPublish.user_id;
					var o = {};
					o.uid = fundebug.user.name;						

					if(SDKLoginCallback)
					{
						SDKLoginCallback.run();
					}
				};
				SDKRuntime.postClientMsg("CSGame_Login","" );						
			}

	SDKRuntime.initShareQzone = function (){
		/* 		var share_url = window.OPEN_DATA && window.OPEN_DATA.shareurl || window.location.href;
				var platform = window.OPEN_DATA.platform;
				if(platform == 2){
					var user_id = window.OPEN_DATA.openid + 'ios2';
				}else{
					var user_id = window.OPEN_DATA.openid;
				}
				var share_url = share_url + "&share_friend_userid=" + user_id;
				mqq.ui.setOnShareHandler(function(type){
					mqq.ui.shareMessage({
						title: config.shareinfo.title,//title,
						desc: config.shareinfo.message,//desc,
						share_type: parseInt(type),
						share_url: share_url,//window.OPEN_DATA && window.OPEN_DATA.shareurl || window.location.href,
						image_url: config.shareinfo.qzone_img_url,
						back: true,
					},function(result){
						if(result && (result.retCode == 0)){
							//分享成功
							SDKRuntime.postMessageCp("share",{result:"success"});
						}
					});
				}); */
			}	

	SDKRuntime.h5_getVipLevel = function (callback){
			
			}
    SDKRuntime.getBalance = function (callback){

	}
	SDKRuntime.h5_pay = function (orderInfo, extra, signature, onH5PayFailded){
		SDKRuntime.runtime.onSDK_IAP_Pay = function(isSuccess , error){
					alert("支付结果："+isSuccess+"消息："+error);
					if(isSuccess){
						SDKRuntime.postMessageCp("showMessage",{result:"success",msg:"支付成功"});
					}
					else{
						SDKRuntime.postMessageCp("showMessage",{result:"success",msg:"支付失败："+error});
					}
				};
		var datas = {};
		alert("serverID 4");
		datas["serverID"] = "4";
		datas["objectID"] = "com.shjj.6yuan.pay1";
		datas["amount"] = '6';
		datas["extraStr"] = orderInfo["product_id"];
		SDKRuntime.postClientMsg("CSGame_IAP", JSON.stringify( datas ) );
	}
  //充值星星币
	SDKRuntime.pay = function(defaultScore){
	 
	}
		
	SDKRuntime.check_h5_share = function(){		
		return false;
	}		
	
	SDKRuntime.h5_share =	function (){
				
	}	

		
	SDKRuntime.postMessageCp =	function(action , obj){
				var jh_event = document.createEvent("HTMLEvents");
				jh_event.initEvent("MIR_JH",false,false);
				jh_event.data = {
					action: action,
					channel_id: userDataFromPublish.channel_id,
					game_id: userDataFromPublish.game_id,
					game_channel_id: userDataFromPublish.game_channel_id,
					user_id: userDataFromPublish.user_id,
					result: obj.result,
					msg: obj.msg,
				};
				window.dispatchEvent(jh_event);
			}
	SDKRuntime.check_h5_desktop = function (){
			   if(window.OPEN_DATA.qua.app == 'SQ' || window.OPEN_DATA.qua.app == 'QZ'){
					return true;
				}else{
					return false;
				}
			}
	SDKRuntime.h5_desktop = function (){
				/* var url = window.location.href;

				if(window.OPEN_DATA && window.OPEN_DATA.jumpurl){
					url = window.OPEN_DATA.jumpurl;
				}

				mqq.ui.addShortcut({
					action: 'web',
					title: config.shareinfo.title,
					icon: window.OPEN_DATA.appicon,//config.shareinfo.qzone_img_url,
					url: url,
					callback: function(ret){
						console.log('创建快捷方式成功');
						// alert('创建快捷方式成功');
						SDKRuntime.postMessageCp("desktop",{result:"success"});
					}
				}); */
			}			
	
	return SDKRuntime;
})();