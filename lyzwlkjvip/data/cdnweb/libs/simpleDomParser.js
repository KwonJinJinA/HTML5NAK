//var EasySAXParser = require("./easysax.js").EasySAXParser;
var SimpleDomParser = function(){
	this.curNode ;
	this.root ;					
};
SimpleDomParser.prototype = {	
	
	appendNode:function (elemName, attr,elemType){
		var _this = this;
		var node = {};	
		node.nodeName = elemName;		node.nodeType = elemType;		if((_this.curNode && (_this.curNode.nodeName == "#text" || _this.curNode.isEnd)))		{			node.parentNode = _this.curNode.parentNode;			delete _this.curNode["isEnd"];		}		else
			node.parentNode = _this.curNode;
		node.attributes = [];
		node.childNodes = [];		if(elemName == "#text")		{			node.textContent = attr.textContent;		}		for(var key in attr){			var attribute = {};			attribute.nodeName = key;			attribute.value = attr[key];			node.attributes.push(attribute);
		}
		
		if(node.parentNode){
			if(!node.parentNode.hasOwnProperty("childNodes")){
				node.parentNode.childNodes = [];
			}
			node.parentNode.childNodes.push(node);
		}
		_this.curNode = node ;								
		if(!_this.root){
			_this.root = node;
		}
		return node;
	},
	
	parseFromString: function(str){						
		var parser = new EasySAXParser();

		//parser.ns('rss', false);
		var _this = this;
		parser.on('error', function(msgError) {
			console.log(msgError);
		});

		parser.on('startNode', function(elemName, getAttr, isTagEnd, getStrNode) {
			var attr = getAttr();
			_this.appendNode(elemName,attr );
			if(isTagEnd){				}
			
				
							
			
		});

		parser.on('endNode', function(elemName, isTagStart, getStrNode) {
			if(isTagStart){
				//_this.appendNode(elemName,true);
			}
		
			if(_this.curNode && _this.curNode.parentNode){
				_this.curNode = _this.curNode.parentNode;				if(_this.curNode.nodeName == elemName)					_this.curNode.isEnd = true;
			}	
			
								
		
		});

		parser.on('textNode', function(text) {
			_this.appendNode("#text",{textContent:text},3);
			//_this.curNode.value = text;
			//_this.curNode.textContent = text;
			//_this.curNode.attributes.push({text:text});
			//_this.curNode.nodeType = 3;

		});

		parser.on('cdata', function(data) {
			debugger
		});


		parser.on('comment', function(text) {
			
			console.log('--'+text+'--')
		});

		//parser.on('unknownNS', function(key) {console.log('unknownNS: ' + key)});
		//parser.on('question', function() {}); // <? ... ?>
		//parser.on('attention', function() {}); // <!XXXXX zzzz="eeee">

		console.time('easysax');
		//for(var z=1000;z--;) {
		parser.parse(str);	
	
		//};
		console.timeEnd('easysax');
		var result = {};
		result.childNodes = [this.root];
		return result ;
	}
}
//exports.SimpleDomParser = SimpleDomParser;
