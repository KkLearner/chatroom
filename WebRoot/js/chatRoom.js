/**
 * 
 */
function getChattingData(queryUrl){
	ajaxJsonReturn(queryUrl,"chatRoom-getChattingDatas.action","post",false,"",function(data){
		if(data.length>0){
			var msgString="",msgFrom="",msgTo="",
			action="",msgContent="",secret="",imgage_url="";
			$.each(data,function(index,map){
				msgFrom = map.msgFrom;//获取聊天信息发送者
				msgTo=map.msgTo;//获取聊天信息接收者
				action =map.chatAction;//获取聊天表情
				msgContent=map.msgContent;//获取聊天信息内容
				secret = map.secret;//获取是否悄悄话 
				imgage_url="images/yl_girl.gif";
				if(msgFrom=="system notice"){
					msgString=msgString+"<div>系统:"+msgContent+"</div>";
			    }
			    else if(secret==0){ 
			    	//判断是否使用聊天表情
			    	if(action=='undefine'||action==null||action=="no"){
			    		msgString=msgString+"<div><img width=30px heigth=30px src='"+imgage_url+"'></img><font color=blue>"+msgFrom+"</font>对<font color=blue>"+msgTo+"</font></span>说："+msgContent+"</div>"; 
			    	}			    		
			    	else{
			    		msgString=msgString+"<div><font color=blue>"
		    			+msgFrom+"</font>"+action.replace(/B/g,"<font color=blue>"+msgTo+"</font>")
		    			+msgContent+"</div>";
			    	}
			    		
			    }
			    else if(msgFrom==userName||msgTo==userName){
				    if(action=='undefine'||action==null||action=="no"){
				    	msgString=msgString+"<div><font color=red>[悄悄话]</font><font color=blue>"
			               +msgFrom+"</font>对<font color=blue>"+msgTo+"</font></span>说："
			               +msgContent+"</div>";
				    }				      
				   else{
					   msgString=msgString+"<div><font color=red>[悄悄话]</font><font color=blue>"
		               +msgFrom+"</font>"+action.replace(/B/g,"<font color=blue>"+msgTo+"</font>")
		               +msgContent+"</div>";
				   }
					
			    } 
			});
			var orilLoadContentCount=$("#loadContent")[0].childElementCount;
			$("#loadContent").html(msgString);
			if(orilLoadContentCount!=$("#loadContent")[0].childElementCount){
				$("#C_body")[0].scrollTop =$("#C_body")[0].scrollHeight; 
			}		
		}
	});
}

$(document).ready(function(){	
	var query=location.search.substring(1);	
	if(query=='undefine'||query==''){
		alert("请登录!!!");
		window.location="login.jsp";
	}	
	else{
		getChattingData(location.search.substring(1));
		window.setInterval("getChattingData(location.search.substring(1))",2000);
		$("#C_body")[0].scrollTop =$("#C_body")[0].scrollHeight; 
	}
		
})
