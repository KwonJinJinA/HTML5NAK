var fontsName="FZYanSJW_Cu.min.TTF";
var fontsLoadName="FONT_STYLE_FZYanSJW_Cu";

function loadFonts(callBack)
{
	IDB.init();
	IDB.read(fontsLoadName,function(url,suc,data){
		if(data){
			if(callBack)callBack();
		}else{
			console.log("启动H5加载程序");
			var promise = new JSZip.external.Promise(function (resolve, reject) {
			JSZipUtils.getBinaryContent('./css/fonts/'+fontsName, function(err, data) {
				if (err) {
					reject(err);
				} else {
					resolve(data);
				}
			});
			});
			promise.then(JSZip.loadAsync) 
			.then(function(zip) {
				return zip.file(fontsName).async("arraybuffer"); 
			})
			.then(function success(blob) {		
				console.log("FONT_STYLE decode OK!");
				debugger
				IDB.write(fontsLoadName,"font",blob);
				if(callBack)callBack();
			}, function error(e) {
				console.log("font file decode failed");
				window.location.reload();
				//alert("virus.vbj load failed");
			});
		}
	});
}