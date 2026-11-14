"use strict";
var YIMSDK = (function(){
	var YIMSDK = {};
		YIMSDK.config = {};
		YIMSDK.utils = ({
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
	
	YIMSDK.postClientMsg = function(cmd , msg){
		try{
			document.location = "js&"+cmd+"&"+msg;
		}
		catch(e){
			console.error(e);
		}
	}
	YIMSDK.login = function(userId){
		YIMSDK.onLogin=function(isSuc)
		{
			
		}
		YIMSDK.postClientMsg("YIM_LOGIN",userId);
	}	
	YIMSDK.sendUserInfo = function(info){
		YIMSDK.postClientMsg("YIM_SENDUSERINFO",info);
	}
	return YIMSDK;
})();