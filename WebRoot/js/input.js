/**
 * 
 */
function checkForm() {
	
	if (document.chatForm.msg.value == "") {
		alert("发言不能为空!");
		document.chatForm.msg.focus();
		return false;
	}
	else {
		document.chatForm.msg.focus();
		return true;
	}
}
//javascript函数,用户离开房间
function userLogout() {
	var keyword={
		"nickName":userName	
	};
	ajaxNoReturn(keyword,"Login-out.action","post",false,"",function(data){
		window.location="login.jsp";
	}) 
}

function submitForm(){	
	if(checkForm()){ 
		ajaxJsonReturn($("#chatForm").serialize(),"chating-sendMsg.action","post",false,"",function(data){
			if(data=="ok"){
				$("#content").val("");
				getChattingData(location.search.substring(1));
			}			
		});
		//document.getElementById("chatForm").submit();
		return true;
	}else{
		return false;
	}
	 
}

$(function() {  
    $("#content").keydown(function(event){ 
      if(event.keyCode == 13){  
    	  submitForm();
      }  
    });  
});  

//javascript函数，用户切换房间
function userChangeRoom()
{
  document.body.onunload="";
  top.window.location="SchoolHall.jsp";
}
//打开一个新窗口
function openWindow(url) {
	var newWin = window.open(url,"","toolbar=no,status=no,scrollbars=yes,menubar=no,width=450,height=320");
	return false;
}

/*
$(document).ready(function(){
	session.setAttribute("_LOGIN","_SUCCESS");
	if(session.isNew()==true||session.getAttribute("_LOGIN")==null||!session.getAttribute("_LOGIN").equals("_SUCCESS")){
		out.println("你还没有登录，请先登录后再访问本页面");
		return;
	}
})
*/