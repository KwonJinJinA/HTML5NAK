"use strict";
var SDKRuntime = (function () {
    var SDKRuntime = {};
    SDKRuntime.utils = ({
        getUrlParam: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg); //匹配目标参数
            if (r != null)
                return unescape(r[2]);
            return null; //返回参数值
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
                timeout = 30000; //30s释放
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
                        if (callback && (typeof(callback) === 'function')) {
                            if (typeof(xhr.response) === "string") {
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
        userDataFromPublish.token = loginParams.sdkToken;
        userDataFromPublish.game_id = loginParams.cpgameid;
        userDataFromPublish.channel_id = loginParams.channelid;
        userDataFromPublish.channeluid = loginParams.channeluid;
        userDataFromPublish.game_channel_id = global_obj.platform;
        userDataFromPublish.time = loginParams.qqestimestamp;
        userDataFromPublish.l_h5_sign = "";
        global_obj.subPlatformId = "xiyou_uch5_" + loginParams.channelType;
        //
        fundebug.user.name = userDataFromPublish.user_id;
        var o = {};
        o.uid = fundebug.user.name;

        if (userDataFromPublish.user_id && userDataFromPublish.token && SDKLoginCallback) {
            SDKLoginCallback.run();
            TXReport.reportStep(12, {
                "uid": userDataFromPublish.user_id
            });
        }
    }

    SDKRuntime.sendUseInfo = function (info) {
        var roleParams = {
            roleVip: info.vipLevel,
            roleID: info.roleId,
            roleName: info.roleName,
            rolePower: info.power || 0,
            roleLevel: info.level,
            serverID: info.serverId,
            serverName: info.serverName,
            gold: info.gameMoney
        }
        var serverParam = {
            serverID: info.serverId,
            serverName: info.serverName
        }
        var type = -1;
        var action = info.action;
        switch (action) {
        case "LOGIN":
            break;
        case "LEVEL_UP":
            type = 1; //"updateRole";
            break;
        case "ENTER_SERVER":
            break;
        case "ENTER_SCENE":
            type = 2; //"enterGame";
            break;
        case "CREATE_ROLE":
            type = 0; //"creatRole";

            break;

        }
        if (type != -1) {
            roleParams.type = type;
            zjsdk.reportRoleInfo(roleParams, function (code, data) {
                console.log("type:" + type + "   " + code + ":sdk更新角色信息失败:" + data);
            });
            serverParam.type = type;
            zjsdk.chooseServer(serverParam);
        }
    }
    SDKRuntime.logout = function () {
        zjsdk.logout(function () {
            try {
                window.location.reload();
            } catch (e) {}
            console.log("cz-sdk登出成功");
        });
    }
    //实名认证
    SDKRuntime.getPartnerVerifyState = function (callbackHandler) {
        var ext = JSON.parse(loginParams.ext);
        var iscertificationshow = ext.iscertificationshow;
        if (iscertificationshow == 1) {
            /*zjsdk.certification(function(data){
            if(callbackHandler){
            if(data.iscertified == "success"){
            if(data.isAdult == 1){//成年
            callbackHandler.runWith(4);
            }else{//未成年
            callbackHandler.runWith(1);
            }
            data.result = "success";
            SDKRuntime.postMessageCp("shimingrenzheng",data);
            }else{
            callbackHandler.runWith(0);
            }

            }
            }) */
        } else {
            callbackHandler.runWith(4);
        }
    }

    var loginParams = {};
    SDKRuntime.initSdk = function () {
        loginParams.qqesuid = SDKRuntime.utils.getUrlParam("uid");
        loginParams.sdkToken = SDKRuntime.utils.getUrlParam("sdkToken");
        loginParams.channelType = SDKRuntime.utils.getUrlParam("channelType");
        /*loginParams.channelid = SDKRuntime.utils.getUrlParam("channelid");
        loginParams.channeluid = SDKRuntime.utils.getUrlParam("channeluid");
        loginParams.qqesnickname = SDKRuntime.utils.getUrlParam("qqesnickname");
        loginParams.qqesavatar = SDKRuntime.utils.getUrlParam("qqesavatar");
        loginParams.cpgameid = SDKRuntime.utils.getUrlParam("cpgameid");
        loginParams.ext = SDKRuntime.utils.getUrlParam("ext");
        loginParams.qqestimestamp = SDKRuntime.utils.getUrlParam("qqestimestamp");
        loginParams.sign = SDKRuntime.utils.getUrlParam("sign");*/
        loginParams.ext = "{}";
        if (!loginParams.qqesuid) {
            zjsdk.login();
            console.log("cz-sdk获取uid参数失败");
            TXReport.reportStep(19, {})
        } else {

            console.log("cz-sdk获取uid参数成功", loginParams.qqesuid);
        }
    }
    SDKRuntime.reLogin = function () {
        zjsdk.login();
        console.log("重新登录SDK");
    }
    SDKRuntime.check_guanzhu = function () {
        var ext = JSON.parse(loginParams.ext);
        var isfollowshow = ext.isfollowshow || 0;
        if (isfollowshow == 1) {
            var isfocus = ext.isfocus || 0;
            if (isfocus == 1) {
                var data = {};
                data.result = "success";
                SDKRuntime.postMessageCp("guanzhu", data);
                trace("检测到已关注");
            } else {
                zjsdk.follow(function (data) {
                    if (data.isfollow == "success") {
                        var data = {};
                        data.result = "success";
                        SDKRuntime.postMessageCp("guanzhu", data);
                        trace("检测到已关注");
                    }
                })
            }
            return true;
        } else {
            trace("isfollowshow 不为1 ，不需要处理关注逻辑");
        }
        return false;
    }
    SDKRuntime.h5_follow = function (data, callBack) {
        zjsdk.follow(function (data) {
            if (data.isfollow == "success") {
                var data = {};
                data.result = "success";
                SDKRuntime.postMessageCp("guanzhu", data);
                trace("检测到已关注");
                if (callBack)
                    callBack.run();
            }
        })
    }
    SDKRuntime.initShareQzone = function () {}

    SDKRuntime.h5_getVipLevel = function (callback) {
        /*zjsdk.checkSVIP(function(data){
        var d = {};
        d.isShowVipIcon = (data.isShow == "success");
        d.iconUrl = data.icon;
        d.ptId = data.id;
        callback(d);
        });*/
        /*var d = {};
        d.isShowVipIcon = false;//ios新包暂时不展示 平台vip特权icon
        d.iconUrl = "";
        d.ptId = loginParams.channelid;
        callback(d);*/
    }
    SDKRuntime.clickVipIcon = function (callback) {
        if (loginParams.svip_add == 0) {
            zjsdk.addSVIP()
        } else if (loginParams.svip_add == 1) {
            zjsdk.openSVIP();
        }
    }

    SDKRuntime.getBalance = function (callback) {}
    SDKRuntime.h5_pay = function (order, extra, signature, onH5PayFailded) {
        var cpPayParams = {};
        cpPayParams.money = (order.pay_money / 100).toFixed(2);
        cpPayParams.roleID = order.uid_in_game;
        cpPayParams.roleName = order.user_name_in_game;
        cpPayParams.serverID = order.server_id;
        cpPayParams.serverName = order.serverName;
        cpPayParams.productName = order.product_name;
        cpPayParams.productDesc = order.product_name;
        cpPayParams.productID = extra.iapObjectId;
        cpPayParams.vip = order.vipLevel;
        cpPayParams.rolePower = order.power;
        cpPayParams.extension = order.order_id;

        var ext = {};
        ext.uid = extra.user_id;
        ext.sid = extra.sid;
        cpPayParams.ext = JSON.stringify(ext);
        //czGameParam.timestamp = (extra.time/1000).toFixed(0);
        zjsdk.loadPayBox(cpPayParams, function (code, data) {
            console.log(code + "支付回调：" + data);
        });

    }

    //充值星星币
    SDKRuntime.pay = function (defaultScore) {}

    SDKRuntime.check_h5_share = function () {
        var ext = JSON.parse(loginParams.ext);
        var isshareshow = ext.isshareshow;
        if (isshareshow == 1) {
            trace("检测到需要分享");
            return true;
        }
        trace("检测到不用分享");
        return false;
    }

    SDKRuntime.h5_share = function (data) {
        var param = {};
        param.title = "阴阳界";
        param.img_url = "http://xk-cdn.zhijiangames.com/xkm/data/icon/yyj.png";
        param.content = "古风武侠奇幻巨作";
        param.shareExt = data.server_id + "_" + data.role_id;
        zjsdk.share(param, function (result) {
            trace("分享回调：" + result);
            var data = {};
            data.result = "success";
            SDKRuntime.postMessageCp("share", data);
        })
    }

    /*function sign(info){
    var keysSorted = Object.keys(info).sort(function(a,b){return a-b});
    var str = "";
    for(var i=0;i<keysSorted.length;i++){
    str += keysSorted[i];
    str += "=";
    str += info[keysSorted[i]];
    str += (i == keysSorted.length - 1)?"":"&";
    }
    return md5(str);
    }*/
    SDKRuntime.postMessageCp = function (action, obj) {
        var jh_event = document.createEvent("HTMLEvents");
        jh_event.initEvent("SDK_MESSAGE", false, false);
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
    SDKRuntime.check_h5_desktop = function () {
        if (window.OPEN_DATA.qua.app == 'SQ' || window.OPEN_DATA.qua.app == 'QZ') {
            return true;
        } else {
            return false;
        }
    }
    SDKRuntime.h5_desktop = function () {}
    SDKRuntime.chechMsgIsLegal = function (msg, callBack, msgType) {
        zjsdk.checkMsg({
            "msg": msg,
            "msgType": msgType
        }, function (data) {
            if (data.errcode) {
                callBack && callBack.runWith(true);
            } else {
                callBack && callBack.runWith(false);
            }
            console.log(data.errmsg);
        });
    }
    return SDKRuntime;
})();