/**
* 
* Map对象
* @valone
* @return Map  
*/
function Map(){
	this.container = new Object();	
}

/**
*
* Map put 方法
* @valone
* @param key
* @param vlaue 
*/
Map.prototype.put = function(key,value){
	this.container[key] = value;	
}

/**
*
* Map get 方法
* @valone
* @param key
* @return vlaue 
*/
Map.prototype.get = function(key){
	return this.container[key];	
}

/**
*
* Map keySet 方法
* @valone
* @return key集合
*/
Map.prototype.keySet = function(){
	var keySet = new Array();
	var count = 0;
	for(var key in this.container){
		if(key == 'extend')
			continue;
		keySet[count] = key;
		count ++;
	}
	return keySet;
}

/**
*
* Map size 方法
* @valone
* @return size
*/
Map.prototype.size = function(){
	var count = 0;
	for(var key in this.container){
		if(key == 'extend')
			continue;
		count ++;	
	}
	return count;
}

/**
*
* Map remove 方法
* @valone
* @param key 
*/
Map.prototype.remove = function(key){
	delete this.container[key];	
}


/**
*
* @valone
* @return string形式 
* Map toString 方法
*/
Map.prototype.toString = function(){
	var str = "";
	for(var key in this.container){
		if(key == 'extend')
			continue;
		str += key + ":" + this.container[key] + ","
	}
	str = str.substring(0,str.length-1);
	return str;
}

/**
*
* @valone
* @return JSON形式 
* Map toJSON 方法
*/
Map.prototype.toJSON = function(){
	return this.container;
}

var rootPath="chatRoom";//根路径
var returnData="";
var EMPTY_MSG="error";
var EMPTY_MSG="empty";


function ajaxJsonReturn(keyword,action,type,async,callback1,callback2){
	$.ajax({
		type:type,
		url:action,
		data:keyword,
		async:async,
		cache:false,
		beforeSend: function(e){
			if(callback1 && typeof callback1 != 'undefined' && callback1 != undefined)
				if(!callback1(e))
					return false;
				else
					return true;
		},
		success: function(e){
			if(!e.error && !e.empty){
				returnData = e;
			}
			else if(e.empty)
				returnData = EMPTY_MSG;
			else
				returnData = ERROR_MSG;	
			callback2(returnData);
		},
		error: function(){
			returnData = ERROR_MSG;	
			callback2(returnData);
		}
	})	
}

function ajaxNoReturn(keyword,action,type,async,callback1,callback2){
	$.ajax({
		type:type,
		url:action,
		data:keyword,
		async:async,
		cache:false,
		beforeSend: function(e){
			if(callback1 && typeof callback1 != 'undefined' && callback1 != undefined)
				if(!callback1(e))
					return false;
				else
					return true;
		},
		success: function(data){
			callback2(data);
		},
		error: function(){
			returnData = ERROR_MSG;	
			callback2(returnData);
		}
	})	
}

function checkUser(account,type,test){
	if(typeof String.prototype.trim !== 'function') {
		String.prototype.trim = function() {
			return this.replace(/^\s+|\s+$/g, ''); 
		}
	} 		
	var map=new Map();
	map.put("account",account.trim())
	$.ajax({
		type:"GET",
		url:rootPath+"/Login-checkUser.action",
		data:map.toJSON(),
		dataType:"json",
		success:function(data){
			var flag=data["flag"];				
			if(flag==false&&type==1){
				test.innerHTML="该账号不存在"; 
			}
			else if(flag==true&&type==2){
				test.innerHTML="该账号已存在"; 
			}
			else
				test.innerHTML=""; 
		}
	});
}

function getUrlString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}