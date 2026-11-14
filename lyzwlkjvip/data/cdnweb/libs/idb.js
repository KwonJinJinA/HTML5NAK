var IDB={};
IDB.dbName="XKM_IDX_DB";
IDB.dbVersion=1;
IDB.isInit=false;
IDB.DB = null;
IDB.isAvalible = false;
IDB.init=function(callBack){
	if(IDB.isInit){
		if(callBack)
			callBack(true);
		return;
	}
	
	var u = navigator.userAgent;
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
    var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
	if(isiOS){
		IDB.isAvalible = false;
		if(callBack)
			callBack(false);
		return;
	}
	IDB.isInit = true;
	try{
		IDB.DB = new Dexie(IDB.dbName);
		IDB.DB.version(IDB.dbVersion).stores({
		  dbTable: 'key'
		})
		IDB.isAvalible = true;
		if(callBack)
			callBack(true);
		
	}catch(e){
		callBack && callBack(false);
	}
	
}

IDB.write=function(k,t,d){
	if(!IDB.isAvalible){
		return;
	}
	IDB.DB.dbTable.put({key:k,data:d,type:t});
}

IDB.read=function(url,callBack){
	if(!IDB.isAvalible){
		callBack(url,false,null);
		return;
	}
	
	IDB.DB.dbTable.get(url).then(function(data){
		if(data){
			callBack(url,true,data);
		}else{
			callBack(url,false,null);
		}
	},function error(e){
		callBack(url,false,null);
	})
}
IDB.clear=function(callBack){
	if(!IDB.isAvalible){
		callBack(true);
		return;
	}
	IDB.DB.dbTable.clear().then(function(){
		callBack(true);
	});
}