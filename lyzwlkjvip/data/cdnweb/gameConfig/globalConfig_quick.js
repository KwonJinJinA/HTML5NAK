//全局配置
var quick = window.quick;
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
global_obj.versionInfo = "为了您的健康，请合理控制游戏时间，本游戏适合16周岁以上用户使用\n" + quick.version;
global_obj.res = "res2/"; //
global_obj.config = "config/"; //
global_obj.serverPath = quick.server + ":88/center/gameserver/listForClient.php?pass="+ pass + "&s="+ ss + "&user="+ user + "&";
global_obj.userLoginPath = quick.server + ":88/center/gameserver/userLogin.php?";
global_obj.noticeInfoPath = quick.server + ":88/center/getNotice.php?platform=" + quick.channel;
global_obj.res2Root = quick.cdn;
global_obj.routeJson = quick.server + ":88/center/getFiles.php";
global_obj.miniGameOpenArr = [];//内置小游戏开启类型

global_obj.isMiniGame = true;

global_obj.needShiMingRenZheng = false;
global_obj.isShowQHBtn = false; //是否显示切换账号按钮
global_obj.isShowGongGao = true; //是否显示公告按钮
global_obj.isHideYaoQing = true; //是否屏蔽【邀请有奖】
global_obj.isShowProgressBar = true;//是否显示加载进度条
global_obj.isDebugger = false; //是否是debugger模式，这个模式可以开启GM快捷键，可以开启快速充值功能,所以外网不能开启
global_obj.ifShowAgeRemind = true;
global_obj.ageRemindPath = quick.server + ":88/center/getYinSi.php?platform=" + quick.channel + "&type=slts";

global_obj.isAutoCreate = false; //自动创角
global_obj.isOpenPC = true;
global_obj.userTipType = 1;
global_obj.ifShowYinSi = true;
global_obj.showPrivacyOnce = true;
global_obj.hideServer = [""];
global_obj.serverMaxNum = 10;
global_obj.advertising = "亲爱的侠士，如果您在游戏过程中遇到任何疑问，欢迎随时反馈，我们将及时为您解决！";
global_obj.userArgeementPath = quick.server + ":88/center/getYinSi.php?platform=" + quick.channel + "&type=yonghu";
global_obj.yinsiInfoPath = quick.server + ":88/center/getYinSi.php?platform=" + quick.channel + "&type=yinsi";
