/**
 * 
 */

function loginOut(){
	if(userName=='undefined'||userName==null){
		alert("你已经和聊天室断开");
		window.location='login.jsp';
	}
}

function PerformSubmit(user) {
    if(user=='all_people')
       {
        parent.chatForm.msgTo.value='';
		   return false;
       }else{
		    parent.chatForm.msgTo.value=user;
		    return false;
     }
}

function getRoomMates(param){
	ajaxJsonReturn(param,"chatRoom-getRoomPeople.action","post",false,"",function(data){
		if(data.length>0){
			var msgContent='<br/>&nbsp;&nbsp;<span style="cursor:pointer;" onClick=PerformSubmit("all_people")>所有人</span><br>',name="";
			$.each(data,function(index,map){
				name=map.nickName;
				msgContent+='&nbsp;&nbsp;[<span class="l1" style="cursor:pointer;" onClick=PerformSubmit(\"'+name+'\")>'+name+'</span>]<br>';
			})
			$("#roommates").html(msgContent);
		}
	})	
}

$(document).ready(function(){
	var query=location.search.substring(1);	
	if(query=='undefine'||query==''){
		alert("请登录!!!");
		window.location="login.jsp";
	}	
	else if(userName=='undefined'||userName==null||userName==''){
		alert("你已经和聊天室断开");
		window.location='login.jsp';
	}
	else{
		getRoomMates(location.search.substring(1));
		window.setInterval("getRoomMates(location.search.substring(1))",8000);
	}
})