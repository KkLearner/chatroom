/**
 * 
 */

function cancle(){
	$("#hide").css("display","none");
}

function expert(){
	$("#hide").css("display","");
}

function upload(){
	window.location="upload.jsp";
}

function submit(){
	if(document.getElementById("pass").value=="zhzyk"){
    	window.location = "chating-chatting.action?theSchool="+getUrlString("theSchool")+"&chating=expert";
    }
	else{
		alert("验证码有误！");
	}
}

$(document).ready(function(){
	var schools=$("#schools");
	var rooms=["学生聊天室1","学生聊天室2","学生聊天室3","学生聊天室4",
			"师生互动聊天室1","师生互动聊天室2"];
	var roomCodes=["student1","student2","student3","student4",
			"interaction1","interaction2"];
	var pic=["xuesheng.png","xuesheng.png","xuesheng.png","xuesheng.png",
			"jiaoshi.png","jiaoshi.png"];
	var content='';
	var school=getUrlString("theSchool");
	$.each(rooms,function(index,str){
		content+='<div class="chat" onclick="location=\'chating-chatting.action?theSchool='+school+'&chating='+roomCodes[index]+'\'">';
        content+='<img src="images/'+pic[index]+'"/>';
        content+='<p>'+str+'</p></div>';         
	});
	content+='<div class="chat" id="expert" onclick="expert();">';
	content+='<img src="images/jiaoshi.png"/><p>专家聊天室</p> </div>';
	content+='<div class="chat" id="upload" onclick="upload();">';
    content+='<img src="images/jiaoshi.png"/><p>上传作业</p> </div>';
	schools.append(content);
})



 