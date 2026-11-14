//全局配置
var global_obj = {};
global_obj.userDataFromPublish; 
global_obj.isStartPublishLogin = true;
global_obj.logoUrl = ""; //
global_obj.isUseLibDB = true; //使用index库
global_obj.platform = "xiyou_uc"; //
global_obj.subPlatformId = "xiyou_uc_changwei";
global_obj.payChannelId = "";//支付价格模板ID（充值表相关）
global_obj.publishLogo = "";//
global_obj.publishInfo = "";
global_obj.wxPK = "11";
global_obj.majiaID = ""; //
global_obj.versionInfo = "为了您的健康，请合理控制游戏时间，本游戏适合16周岁以上用户使用\n出版单位：杭州群游科技有限公司 登记号：2017SR414554\n著作权人：广州苍明信息科技有限公司 审批文号：新广出审[2017]10594号\n出版物号：ISBN 978-7-498-03383-3 ";
global_obj.res = "res2/"; //
global_obj.config = "config/"; //
global_obj.serverPath = "http://192.168.101.31:8082/center/gameserver/listForClient?";
global_obj.userLoginPath = "http://192.168.101.31:8082/center/gameserver/userLogin?";
global_obj.noticeInfoPath = "http://192.168.101.31/getNewNotice.html?game=tmh5&platform=xiyou_uc&%22"; //"192.168.101.31/xiyou/data/notice/notice_xiyou_changwei.json";
global_obj.res2Root = "http://192.168.101.31/xiyou/";
global_obj.routeJson = "http://192.168.101.31/center/gameConfig/getFiles?id=xiyou_route_uch5";
global_obj.miniGameOpenArr = [];//内置小游戏开启类型

global_obj.isMiniGame = true;

global_obj.needShiMingRenZheng = false;
global_obj.isShowQHBtn = true; //是否显示切换账号按钮
global_obj.isShowGongGao = true; //是否显示公告按钮
global_obj.isHideYaoQing = true; //是否屏蔽【邀请有奖】
global_obj.isShowProgressBar = true;//是否显示加载进度条
global_obj.isDebugger = false; //是否是debugger模式，这个模式可以开启GM快捷键，可以开启快速充值功能,所以外网不能开启
global_obj.ifShowAgeRemind = true;
global_obj.ageRemindPath = "http://192.168.101.31/xiyou/data/ageRemind/ageRemind.json";

global_obj.isAutoCreate = false; //自动创角
global_obj.isOpenPC = true;
global_obj.userTipType = 1;
global_obj.ifShowYinSi = true;
global_obj.showPrivacyOnce = true;
global_obj.hideServer = [""];
global_obj.serverMaxNum = 10;
global_obj.advertising = "亲爱的侠士，如果您在游戏过程中遇到任何疑问，欢迎随时反馈，我们将及时为您解决！";
global_obj.userArgeementPath = "http://192.168.101.31/xiyou/data/privacy/protocol_uc.json";
global_obj.yinsiInfoPath = "http://192.168.101.31/xiyou/data/privacy/privacy_uc.json";
