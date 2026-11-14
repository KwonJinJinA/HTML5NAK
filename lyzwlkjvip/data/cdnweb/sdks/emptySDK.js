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
	
	SDKRuntime.sdk_login = function (){
		userDataFromPublish = {};
		var userId = SDKRuntime.utils.getUrlParam("uid");
		if(!userId){
			userId = "test888";
		}
		userDataFromPublish.user_id = userId;//
		var urlPlat = SDKRuntime.utils.getUrlParam("platform");
		userDataFromPublish.game_channel_id = urlPlat?urlPlat:global_obj.platform;
		userDataFromPublish.game_id = "";
		userDataFromPublish.channel_id = "";		
		userDataFromPublish.time = 0;
		userDataFromPublish.l_h5_sign = "";		

	
		//
		fundebug.user.name = userDataFromPublish.user_id;
		var o = {};
		o.uid = fundebug.user.name;						

		if(SDKLoginCallback)
		{
			SDKLoginCallback.run();
		}
	}
			
			
	SDKRuntime.createRole = function(info){
		
	}
			
	SDKRuntime.logout = function () {
		try{
			window.location.reload();
		}
		catch(e){
			
		}	
	}	
	
	SDKRuntime.initSdk = function (){

	}

	SDKRuntime.initShareQzone = function (){
			
	}	

	SDKRuntime.h5_getVipLevel = function (callback){
			
			}
    SDKRuntime.getBalance = function (callback){
		
	}
	SDKRuntime.h5_pay = function (order, extra, signature, onH5PayFailded){
				
			}
	//充值星星币
	SDKRuntime.pay = function(defaultScore){
	   
	}
		
		
		
	SDKRuntime.check_h5_share = function(){
		if(window.OPEN_DATA){
			return true;
		}
		return false;
	}		
	
	SDKRuntime.h5_share =	function (){
				
	}
	SDKRuntime.check_guanzhu = function(){
		
	}
	SDKRuntime.h5_follow =	function (data,callBack){
				
	}	

	SDKRuntime.sendUseInfo = function (info) {
		var action = info.action;
		switch(action){
			case "LOGIN":
				break;
			case "LEVEL_UP":
				break;
			case "ENTER_SERVER":
				break;
			case "ENTER_SCENE":
				break;
			case "CREATE_ROLE":
				break;
			
		}
	}
	SDKRuntime.postMessageCp =	function(action , obj){
				var jh_event = document.createEvent("HTMLEvents");
				jh_event.initEvent("SDK_MESSAGE",false,false);
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
				
			}			
	
	
	SDKRuntime.chechMsgIsLegal = function (ctx,callBack){
		if(callBack){
			callBack.runWith(true);
		}		
	}	
	return SDKRuntime;
})();