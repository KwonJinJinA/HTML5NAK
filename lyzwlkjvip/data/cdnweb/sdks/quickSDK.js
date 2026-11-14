"use strict";
var SDKRuntime = (function () {
    var SDKRuntime = {};
    SDKRuntime.utils = ({
        getUrlParam: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        },
        makeUrlParams: function (params) {
            if (params) {
                var str = "";
                for (var i in params) {
                    str = str + i + "=" + encodeURIComponent(params[i]) + "&";
                }
                str = str.substring(0, str.length - 1);
                console.log(str);
                return str;
            } else {
                console.log("非法调用");
                return false;
            }
        },
        request: function (url, params, callback, method, content_type, timeout) {
            if (!method) {
                method = "POST";
            }

            if (!content_type) {
                content_type = "application/x-www-form-urlencoded";
            }

            if (!timeout) {
                timeout = 30000;//30s释放
            }

            var xhr = new XMLHttpRequest();
            xhr.timeout = timeout;
            xhr.ontimeout = function () {
                console.log('请求超时', url);
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

            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    console.log(xhr.response);
                    if (xhr.response) {
                        if (callback && (typeof (callback) === 'function')) {
                            if (typeof (xhr.response) === "string") {
                                callback(JSON.parse(xhr.response));
                                return;
                            }
                            callback(xhr.response);
                            return;
                        }
                    }
                }
            };

            if (method === 'POST') {
                xhr.open(method, url);
                xhr.setRequestHeader("Content-type", content_type);
                xhr.send(query_params);
            } else {
                xhr.open(method, url + '?' + query_params);
                xhr.send();
            }
        },
    });

    SDKRuntime.sdk_login = function () {
        userDataFromPublish = {};
        userDataFromPublish.user_id = loginParams.qqesuid;
        userDataFromPublish.game_id = "";
        userDataFromPublish.channel_id = loginParams.channelid;
        userDataFromPublish.channeluid = loginParams.channeluid;
        userDataFromPublish.game_channel_id = global_obj.platform;
        userDataFromPublish.time = loginParams.qqestimestamp;
        userDataFromPublish.l_h5_sign = "";

        fundebug.user.name = userDataFromPublish.user_id;
        var o = {};
        o.uid = fundebug.user.name;

        if (SDKLoginCallback) {
            SDKLoginCallback.run();
        }
    }

    SDKRuntime.sendUseInfo = function (info) {
        var local = SDKRuntime.utils.getUrlParam("local");
        if (local) {
            return
        }
        var roleInfo = {};
        console.log("上报信息", info)
        roleInfo.isCreateRole = false;
        if (info.action == "CREATE_ROLE")
            roleInfo.isCreateRole = true;
        roleInfo.roleCreateTime = info.role_create_time; //attr[13];
        roleInfo.uid = loginParams.qqesuid;
        roleInfo.username = loginParams.qqesuid;
        roleInfo.serverId = info.serverId;
        roleInfo.serverName = info.serverName;
        roleInfo.userRoleName = info.roleName;
        roleInfo.userRoleId = info.roleId + '';
        roleInfo.userRoleBalance = info.gameMoney; //attr[6];
        roleInfo.vipLevel = info.vipLevel;
        roleInfo.userRoleLevel = info.level;
        roleInfo.partyId = 0;
        roleInfo.partyName = "";
        roleInfo.gameRoleGender = info.sex == 1 ? "女" : "男";
        // roleInfo.gameRoleGender = "男";
        roleInfo.gameRolePower = info.power;
        roleInfo.partyRoleId = 0;
        roleInfo.partyRoleName = "";
        roleInfo.professionId = "";
        roleInfo.profession = "";
        roleInfo.friendlist = "";
        var roleInfoJson = JSON.stringify(roleInfo);
        console.log("创建角色上报：", roleInfo);
        QuickSDK.uploadGameRoleInfo(roleInfoJson, function (response) {
            console.log(response);
        });
    }
    SDKRuntime.logout = function () {

    }


    var loginParams = {};
    SDKRuntime.initSdk = function () {
        var local = SDKRuntime.utils.getUrlParam("local");
        var uid = SDKRuntime.utils.getUrlParam("token");
        if (local && uid) {

            loginParams.qqesuid = uid;
            loginParams.channelid = "";
            loginParams.channeluid = uid;
            loginParams.qqestimestamp = "";
            window.initGame();
            return
        }
        loginParams.isLogin = false;
        QuickSDK.init(quick.ProductCode, quick.ProductKey, true, function () {
            QuickSDK.login(function (callbackData) {
                if (callbackData.status) {
                    if (loginParams.isLogin) {
                        console.log("重复登录");
                        QuickSDK.logout(function (logoutObject) {
                            console.log('Game:成功退出游戏');
                            loginParams.isLogin = false;
                            window.location.reload();
                        })
                    }
                    console.log("GameDemo:QuickSDK登录成功: uid=>", callbackData.data.uid);
                    var data = callbackData.data;
                    loginParams.qqesuid = data.uid;
                    loginParams.channelid = data.channelId;
                    loginParams.channeluid = data.uid;
                    loginParams.qqestimestamp = data.time;
                    loginParams.isLogin = true;
                    window.initGame();
                    QuickSDK.setLogoutNotification(function (logoutObject) {
                        loginParams.isLogin = false;
                        window.location.reload();
                        console.log("Game:玩家点击注销帐号");
                    });
                    QuickSDK.setSwitchAccountNotification(function (callbackData) {
                        loginParams.isLogin = false;
                        window.location.reload();
                        console.log("Game:玩家点击注销帐号");
                    });
                }
            });
        });
    }

    SDKRuntime.h5_pay = function (order, extra, signature, onH5PayFailded) {
        var local = SDKRuntime.utils.getUrlParam("local");
        if (local) {

			//console.log("充值信息", order, extra, signature, onH5PayFailded)
			var message = {
			pay: "xiaowu",
			extra: extra,
			signature: signature,
			onH5PayFailded: onH5PayFailded,
			order: order 
			};
			var jsonMessage = JSON.stringify(message);
			var utf8Bytes = new TextEncoder().encode(jsonMessage);
			var encodedData = btoa(String.fromCharCode.apply(null, utf8Bytes));
			
			var messagea = {
			pay: "xiaowu",
			ext: encodedData,
			};
			var jsonMessagea = JSON.stringify(messagea); 
			//window.parent.postMessage(jsonMessagea, "*");	

  var url = 'pay/pay.php' + '?orderInfoJson=' + encodeURIComponent(jsonMessagea);
     layer.open({
        type: 2,
        title: '自助中心（首次自动绑定区服）',
        content: url,
      area: ['360px', '90%']
    }); 

			
            return
        }
        var orderInfo = {};
        // console.log("充值信息", order, extra, signature, onH5PayFailded)
        orderInfo.productCode = quick.ProductCode;
        orderInfo.uid = loginParams.qqesuid;
        orderInfo.username = loginParams.qqesuid;
        orderInfo.userRoleId = order.uid_in_game + '';
        orderInfo.userRoleName = order.user_name_in_game + "";
        orderInfo.serverId = order.server_id;
        orderInfo.userServer = order.serverName; //tparams.selectedServer.server_id;
        orderInfo.userLevel = order.level;
        orderInfo.cpOrderNo = order.order_id;

        orderInfo.subject = order.product_name;
        orderInfo.desc = extra.desc;

        orderInfo.goodsId = extra.iapObjectId;
        orderInfo.count = 1;
        orderInfo.quantifier = "个";
        orderInfo.callbackUrl = "";
        var ext = {};
        ext.sid = extra.sid;
        ext.uid = extra.user_id;

        orderInfo.extrasParams = extra.sid + "-" + extra.user_id + "-" + order.uid_in_game;

        orderInfo.amount = (order.pay_money / 100).toFixed(2) + '';
        console.log("orderInfo:", orderInfo);
        var orderInfoJson = JSON.stringify(orderInfo);
        QuickSDK.pay(orderInfoJson, function (payStatusObject) {
            console.log("GameDemo:下单通知" + JSON.stringify(payStatusObject));
        });
    }

    return SDKRuntime;
})();