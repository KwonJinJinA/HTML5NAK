var LogRecord = {};
LogRecord.guid = Date.parse(new Date()) +""+parseInt(10000*Math.random());
var ishttps = 'https:' == document.location.protocol ? true : false;
var preprotocal = ishttps ? "https://" : "http://";
LogRecord.reportUrl = preprotocal + "center.zhijiangames.com/center/gm/step";
LogRecord.stepLog = "0";


function sendRp(reportUrl,data)
{	
	var xmlobj; 
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

	var url = reportUrl;
	xmlobj.Fundebug = !0,
	xmlobj.open("POST", url); 
	xmlobj.setRequestHeader("Content-Type", "application/json"),
	xmlobj.send(data); //设置为发送给服务器数据
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
LogRecord.reportStep = function( step , otherParam){	
	LogRecord.stepLog += ","+step;
	var data = {};
	data.guid = LogRecord.guid;
	data.step = LogRecord.stepLog;
	
	var reportUrl = LogRecord.reportUrl;
	if(otherParam)
	{
		data.param = JSON.stringify(otherParam);			
	}
	//sendRp(reportUrl,ObjToJson(data));
	//$.post(reportUrl,data);
	console.log("Log data:", data); // 可选：打印日志用于调试
};
var TXReport = LogRecord;

/**
统计数据字段对照表
id	int	20	
guid	varchar	
step	varchar
uid	varchar	20	
roleguid	varchar	20	
platform	varchar	20	
rolename	varchar	20	
netspeed	int	11	0	
rendermode	varchar	20	
entertimecost	int	11	
isnewrole	tinyint	1	
rolelevel	tinyint	3	
stagewidth	tinyint	4	
stageheight	tinyint	4	
yuanbao	tinyint	10	0	
viplevel	tinyint	3	
useragent	varchar	300	
other	varchar	300	0	
inserttime	timestamp	
lastupdatetime	timestamp
*/
