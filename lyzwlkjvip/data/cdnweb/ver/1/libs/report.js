var TXReport = {};
TXReport.guid = Date.parse(new Date()) +""+parseInt(10000*Math.random());
TXReport.reportUrl = "http://www.tu86.cn/tu86brophp/index2.php/zgstatic/report";
TXReport.stepLog = "0";
TXReport.reportStep = function( step , otherParam){	
	TXReport.stepLog += ","+step;
	var data = {};
	data.guid = TXReport.guid;
	data.step = TXReport.stepLog;
	
	var reportUrl = TXReport.reportUrl;
	if(otherParam)
	{
		data.param = JSON.stringify(otherParam);			
	}
	$.post(reportUrl,data);
};
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
