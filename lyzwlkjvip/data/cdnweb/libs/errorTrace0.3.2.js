var fundebug = {};
fundebug.silentConsole = true;
fundebug.silentHttp = true;
fundebug.silentResource = true;
fundebug.user = {
	 name: "route",
	 email: "route@fundebug.com"
};
fundebug.metaData = {
	 roleName: "s1.none",
	 level: "100"
};
var errorNum = {};

var xmlobj; //定义XMLHttpRequest对象
function CreateXMLHttpRequest()
{
	if(window.ActiveXObject)
	//如果当前浏览器支持Active Xobject，则创建ActiveXObject对象
	{
	//xmlobj = new ActiveXObject("Microsoft.XMLHTTP");
	try {
		xmlobj = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
		try {
		xmlobj = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (E) {
			xmlobj = false;
			}
			}
		}
	else if(window.XMLHttpRequest)
	//如果当前浏览器支持XMLHttp Request，则创建XMLHttpRequest对象
	{
		xmlobj = new XMLHttpRequest();
	}
}

function errReport(act,errInfo) //主程序函数
{
	CreateXMLHttpRequest(); //创建对象

	var url = "https://fscsg1.shkuangjing.com/centerserver/gm/errorReport"; //"https://fundebug.com/javascript/";
	xmlobj.Fundebug = !0,
	xmlobj.open("POST", url); 
	xmlobj.setRequestHeader("Content-Type", "application/json"),
	xmlobj.send(errInfo); //设置为发送给服务器数据
}

function N(e) {
	if ("undefined" != typeof JSON)
		return JSON.stringify(e);
	if (e instanceof Array) {
		for (var t = [], r = 0; r < e.length; r++)
			t.push(N(e[r]));
		return "[" + t.join(",") + "]"
	}
	var n = [];
	for (var a in e)
		if (e.hasOwnProperty(a)) {
			var i = '"' + a + '":'
			  , o = e[a];
			o && ("object" == typeof o ? i += N(o) : "number" == typeof o ? i += o : i = i + '"' + o.replace(/\n/g, "\\n") + '"',
			n.push(i))
		}
	return "{" + n.join(",") + "}"
}
function ObjToJson(e) {
	var t;
	try {
		t = N(e)
	} catch (r) {
		delete e.metaData;
		try {
			t = N(e)
		} catch (e) {
			return
		}
	}
	return t
}
function reportBug(errorMsg , scriptURI, lineNumer , columnNumber,errorObj)
{

	if(!errorObj)
		errorObj = {};
	var info = errorMsg + scriptURI + "\n错误行数："+lineNumer ;
	//info += errorObj+errorObj.stack;	
	var log = {};
	log.apiKey = "";
	log.breadcrumbs = [];
	log.columnNumber = columnNumber;
	log.lineNumber = lineNumer;
	log.locale = navigator.language || navigator.userLanguage;
	log.message = errorObj.message;
	log.name = errorObj.name || "uncaught error";
	log.notifierVersion = "0.3.6";
	log.severity = "error";
	log.stacktrace = info + "  " + errorObj.stack;
	log.time = Date.parse(new Date());
	log.title = document.title;
	log.type = errorObj.type;
	log.appVersion = null;
	log.releaseStage = null;
	log.target = null;
	log.metaData = fundebug.metaData;
	log.req = null;
	log.res = null;
	log.fileName = null;
	log.url = window.location.href;
	log.userAgent = navigator.userAgent;
	log.user = {
		name: fundebug.user.name,
		userId:fundebug.user.userId,
		guid:fundebug.user.guid,
		serverId:fundebug.user.serverId,
		serverName:fundebug.user.serverName,
		version: window.global_obj.fileVersion,
		codeVer:window.global_obj.curCodeVer,
		platform:window.global_obj.platform,
		email: fundebug.user.email
	};
	if(!errorNum[log.message]){
	   errorNum[log.message] = 1;	
	}
	else{
		 errorNum[log.message]++;
		 if(errorNum[log.message] > 5)
			 return;
	}
	var data = {data:ObjToJson(log)};
	$.post("https://center.zhijiangames.com/center/gm/errorReport",data);
	//errReport("error",ObjToJson(log));
}
function warnSer(userId,serverId){
	var parm = {};
	parm.userId = userId;
	parm.serverId = serverId;
	var data = {data:ObjToJson(parm)};
	$.post("https://center.zhijiangames.com/center/gm/errorReport",data);
}
window.onerror = function (errorMsg , scriptURI, lineNumer , columnNumber,errorObj )
{
	reportBug(errorMsg , scriptURI, lineNumer , columnNumber,errorObj);
}
window.warnServer = function (userId , serverId)
{
	warnSer(userId,serverId);
}
