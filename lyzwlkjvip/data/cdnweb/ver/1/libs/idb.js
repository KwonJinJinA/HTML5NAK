var IDB={};
IDB.dbName="XKM_IDX_DB";
IDB.dbVersion=1;
IDB.isInit=false;
IDB.DB = null;
IDB.init=function(callBack){
	if(IDB.isInit){
		callBack(true);
		return;
	}
	IDB.isInit = true;
	IDB.DB = new Dexie(IDB.dbName);
	IDB.DB.version(IDB.dbVersion).stores({
	  dbTable: 'key'
	})
	callBack(true);
	
}

IDB.write=function(k,t,d){
	IDB.DB.dbTable.put({key:k,value:d,type:t});
}

IDB.read=function(url,callBack){
	IDB.DB.dbTable.get(url).then(function(data){
		if(data){
			callBack(url,true,data.value);
		}else{
			callBack(url,false,null);
		}
	},function error(e){
		callBack(url,false,null);
	})
}
IDB.clear=function(callBack){
	IDB.DB.dbTable.clear().then(function(){
		callBack(true);
	});
}