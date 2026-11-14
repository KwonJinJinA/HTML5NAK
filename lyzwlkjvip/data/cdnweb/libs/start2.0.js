if (typeof (fundebug) == "undefined")
	fundebug = {};
fundebug.silentConsole = true;
fundebug.silentHttp = true;
fundebug.silentResource = true;
fundebug.user = {
	name: "sdk",
	email: "help@fundebug.com"
};
fundebug.metaData = {};
var isRuned = false;
var dbVersion = 3;//db版本
var GLOBAL_LOAD_WORKER;
var userDataFromPublish;
var isStartJHLogin = global_obj.isStartJHLogin;
var versionInfo = " ";//发行公司声明 eg. 本应用有“xx公司”提供
var publishInfo = " ";//preloadingView 底部文本
var showNotice = false;//是否显示公告
var logoUrl = "xkm"; // 游戏LOGO地址
var game_channel_id = global_obj.platform;//渠道识别ID
//var majiaID = "_9377"; //
var isNotGyroscope = true;//是否不使用陀螺仪
var fileVersion = 1;
var mainFileVer = 1;
var SDKLoginCallback;
var version = 1;
var routePath = global_obj.routeJson;
var isSdkInit = false;
var platformMark;
var enterInfos = ['<font color="#f3fede">这个Feel倍爽！</font>',
	'<font color="#f3fede">战力升级快，爽感无等待</font>',
	'<font color="#f3fede">恭喜发财，游戏大卖。</font>',
	'<font color="#f3fede">侠客临门，战力飙升。</font>'
];

var contentStr = "";
function changeProContent(content) {
	contentStr += "<font fontSize='10'>" + content + "</font><br>";
	$("#loadDiv").html(contentStr);

}
function showVConsole() {
	var vconDom = document.getElementById('__vconsole');
	if (vconDom) {
		var obj = vconDom;
		var cls = 'show';
		var hasCls = obj.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
		if (hasCls) {
			var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
			obj.className = obj.className.replace(reg, ' ');
		} else {
			obj.className += " " + cls;
		}
	}
}


function changetip() {
	var i = Math.floor(enterInfos.length * Math.random());
	var infoStr = enterInfos[i];
	var div = document.getElementById("infoDiv");
	//div.innerHTML = infoStr;
	tipTimer = setTimeout("changetip()", 3500);
}

function XHRWorker(url, ready, scope) {
	var oReq = new XMLHttpRequest();
	oReq.addEventListener('load', function () {
		changeProContent("加载worker成功...");
		var worker = new Worker(window.URL.createObjectURL(new Blob([this.responseText])));
		if (ready) {
			ready.call(scope, worker);
		}
	}, oReq);
	oReq.open("get", url, true);
	oReq.send();
}

function WorkerStart() {
	XHRWorker("libs/worker.js", function (worker) {
		changeProContent("启用worker...");
		GLOBAL_LOAD_WORKER = worker;
	}, this);
}


function initGame() {
	$.getJSON(routePath, function (result) {
		changeProContent("加载版本route文件成功...");
		var sid = getQueryParam("sid");
		if (sid == null) {
			sid = 1;
		}
		if (result.hasOwnProperty("publishInfo")) {
			publishInfo = result.publishInfo;
		}
		if (result.hasOwnProperty("versionInfo")) {
			versionInfo = result.versionInfo;
		}
		if (result.hasOwnProperty("showNotice")) {
			showNotice = result.showNotice;
		}
		if (result.hasOwnProperty("game_channel_id")) {
			game_channel_id = result.game_channel_id;
		}
		if (result.hasOwnProperty("logoUrl")) {
			logoUrl = result.logoUrl;
		}
		if (result.hasOwnProperty("majiaID")) {
			majiaID = result.majiaID;
		}
		version = result.defaultVersion;
		global_obj.severTitleDic = result.severTitleDic;
		global_obj.miniGameOpenArr = result.miniGameOpenArr;
		global_obj.miniGameGuideType = result.miniGameGuideType;
		global_obj.showPrivacyEveryTime = result.showPrivacyEveryTime;
		var rules = result.rules;
		for (var i = 0; i < rules.length; i++) {
			var rule = rules[i];
			if (rule[0] <= sid && sid <= rule[1]) {
				version = rule[2];
				break;
			}
		}
		var routeVerPath = "route/" + version + ".json";
		$.getJSON(routeVerPath, function (routeInfo) {
			changeProContent("加载版本字典文件成功...");
			fileVersion = routeInfo.fileVersion;
			mainFileVer = routeInfo.mainFileVer;
			fundebug.metaData.MainVer = mainFileVer;
			fundebug.metaData.DicVer = fileVersion;
			console.log("version route ok!fileVersion:" + fileVersion + "==mainFileVer:" + mainFileVer);
			//loadFonts(initSdk);
			// initSdk();
			launchGame();
		});
	});
}

function initSdk() {
	try {
		if (getQueryParam("from") == "B") {
		}
		else {
			SDKRuntime.initSdk();
		}
		launchGame();
	} catch (e) {
		window.location.reload();
	}
}

function sdk_login() {
	if (getQueryParam("from") == "B") {
	}
	else {
		SDKRuntime.sdk_login();
	}
}

function copyClip(str) {
	try {
		var div = document.getElementById("divCopy");
		var copyText = document.createElement("input");
		copyText.type = "text";
		div.appendChild(copyText);
		copyText.value = str;
		copyText.select();
		document.execCommand("Copy");
		div.removeChild(copyText);
	}
	catch (e) {
		return false;
	}
	return true;
}

//获取url中的参数
function getQueryParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	if (r != null) return unescape(r[2]); return null; //返回参数值
}
function launchGame() {

	changeProContent("准备加载主游戏文件...");
	IDB.init();
	IDB.read("MAIN_FILE", function (url, suc, data) {
		if (data && data.type == mainFileVer) {
			changeProContent("检测到主游戏文件,直接读取...");
			start(data.data);
		} else {
			console.log("启动H5加载程序");
			changeProContent("未检测到主游戏文件,开始下载...");
			var promise = new JSZip.external.Promise(function (resolve, reject) {
				JSZipUtils.getBinaryContent('./ver/' + mainFileVer + '/micro.Virus?1', function (err, data) {
					changeProContent("加载主游戏文件二进制数据..." + err);
					if (err) {
						reject(err);
					} else {
						resolve(data);
					}
				});
			});
			promise.then(JSZip.loadAsync)
				.then(function (zip) {
					changeProContent("解压缩主游戏文件二进制数据...");
					return zip.file("virus.vbj").async("string");
				})
				.then(function success(text) {
					changeProContent("加载主游戏文件成功...");
					console.log("main file decode OK!");
					clearTimeout(tipTimer);
					//debugger
					var blob = new Blob([text], { type: "application/javascript" });
					IDB.write("MAIN_FILE", mainFileVer, blob);
					start(blob);

				}, function error(e) {
					console.log("main file decode failed");
					window.location.reload();
					//alert("virus.vbj load failed");
				});
		}

	})
}
function start(blob) {
	if (!isRuned) {
		changeProContent("启动游戏...");
		isRuned = true;
		//window.eval(text);	
		var s = document.createElement('script');
		s.src = URL.createObjectURL(blob);
		//s.textContent = text;
		document.body.appendChild(s);
		s.remove();

		$("#loading").remove();
		$("#loadingImg").remove();
	}
}
function listenSDK() {
}

var config = {
	shareinfo: {
		title: "侠客梦",//
		message: "侠客逍遥江湖行!",//
		img_url: "",//
		qzone_img_url: ""//
	},
	url: {
		vip_level_url: "",
		banlance: "",
		buy: ""
	}
};

