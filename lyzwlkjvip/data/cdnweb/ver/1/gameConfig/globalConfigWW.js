//全局配置
var global_obj = {};
global_obj.userDataFromPublish = {}; 
global_obj.isStartPublishLogin = true;
global_obj.logoUrl = ""; //
global_obj.isUseLibDB = false; //使用index库
global_obj.platform = "all";
global_obj.subPlatformId = "all";
global_obj.payChannelId = "";//支付价格模板ID（充值表相关）
global_obj.publishLogo = "";//
global_obj.publishInfo = "";
global_obj.wxPK = "11";
global_obj.majiaID = ""; //
global_obj.versionInfo = "@2021";
global_obj.res = "res2/"; //
global_obj.config = "config/"; //
global_obj.serverPath = "https://center.zhijiangames.com/center/gameserver/listForClient?";
global_obj.userLoginPath = "https://center.zhijiangames.com/center/gameserver/userLogin?";
global_obj.noticeInfoPath = "xk-cdn.zhijiangames.com/xkm/data/notice/notice_chengzi.json"; //
global_obj.res2Root = "";
global_obj.routeJson = "route_debug";

global_obj.isShowQHBtn = true; //是否显示切换账号按钮
global_obj.isShowGongGao = true; //是否显示公告按钮
global_obj.isHideYaoQing = true; //是否屏蔽【邀请有奖】
global_obj.isShowProgressBar = true;//是否显示加载进度条
global_obj.isDebugger = true; //是否是debugger模式，这个模式可以开启GM快捷键，可以开启快速充值功能,所以外网不能开启

global_obj.ifShowAgeRemind = true;
global_obj.ageRemindPath = "xk-cdn.zhijiangames.com/xkm/data/ageRemind/ageRemind.json";

global_obj.isAutoCreate = false;
global_obj.isOpenPC = true;
global_obj.ifShowYinSi = false;
global_obj.hideServer = [""];
global_obj.serverMaxNum = 10;
global_obj.advertising = "亲爱的侠士，如果您在游戏过程中遇到任何疑问，欢迎随时反馈，我们将及时为您解决！";
global_obj.userArgeementPath = "https://xk-cdn.zhijiangames.com/xkm/data/privacy/protocol.json";
global_obj.yinsiInfoPath = "https://xk-cdn.zhijiangames.com/xkm/data/privacy/privacy.json";