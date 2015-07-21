<HTML>
<HEAD>
<%@include file="chkSession.jsp"%>
<%@ page language="java" contentType="text/html; charset=GB2312"
pageEncoding="GB2312"
%>
<META http-equiv="Content-Type" content="text/html; charset=GB2312">
<%@ page import="java.util.*"%>
<% 
  String school=request.getParameter("theSchool");
  String chatroom=request.getParameter("chating");
  
%>
<link rel="stylesheet" href="chat.css">
<script language="JavaScript" type="">
//javascript函数，检查用户发言信息是否为空
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
  
   top.window.location="login.jsp";
  
   	
}
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
</script>

<style>
	body,div,ul,ol,li,p,h1,h2,h3,h4,h5,iframe,form,textarea{margin:0px;padding:0px;}
	#left{float:left;width:619px;height:150px;border:1px solid #74a4cb;}
	#left #above{height:30px;background-image:url('images/title.gif');background-repeat:repeat-x;line-height:30px;}
	#left #below{height:120px;background-color:white;position:relative;}
	#left #content{margin-top:24px;margin-left:5px;font-size:14pt;width:480px;height:70px;}
	#send{width:86px;height:67px;background-image:url('images/send.gif');border:none;display:block;position:absolute;
		right:15px;top:25px;}
	#send:hover{background-image:url('images/send_hover.gif');cursor:pointer;}
	#right{float:left;width:216px;height:150px;margin-left:18px;border:1px solid #74a4cb;background-color:white;}
	#right img{width:80px;margin-right:5px;}
</style>
</HEAD>
<BODY onUnload="userLogout(1)">
<!-- 用户输入聊天信息的form表单，聊天信息将提交给sendMsg.jsp进行处理-->
<FORM name="chatForm"  method="post" action="sendMsg.jsp?theSchool=<%=request.getParameter("theSchool")%>&chating=<%=request.getParameter("chating")%>" target="theIframe">
  <div id="left">
  		<div id="above">
	        <!-- 选择聊天对象，只读属性，如果不选择聊天对象表示对所有人-->
	        <input type="text" name="msgTo" size="8" style="font-size:9pt" readonly>动作<!-- 选择聊天表情-->
	        <select name="action" size="1" style="font-size:9pt">
	          <option value="no" selected>说话</option>
	          <option value="友好地握着B的手说：">问好</option>
	          <option value="向B会意地点点头,说：">点头</option>
	          <!-- <option value="对B妩媚地甜甜一笑，说：">妩媚</option> -->
	          <option value="万事不萦于心地呵呵笑着对B说：">开朗</option>
	          <!-- <option value="一脸的坏笑，不怀好意地打量着B，说：">坏笑</option> -->
	          <!-- <option value="忍住泪水，强挤出一丝笑容对B说：">苦笑</option> -->
	          <!-- <option value="白了B一眼，十分不屑地说：">白眼</option> -->
	          <!-- <option value="轻轻地在B的额头上吻了一下，温柔地说：">轻吻</option> -->
	          <!-- <option value="热烈地拥抱着B，几乎透不过气来，说：">拥抱</option> -->
	          <!-- <option value="含情脉脉地凝视着B说：">深情</option> -->
	          <!-- <option value="泪珠儿在眼眶里打转，无限伤心地对B说：">伤心</option> -->
	          <!-- <option value="羞红了脸，拧过身子背对着B说：">害羞</option> -->
	          <!-- <option value="气得全身发抖，两眼喷火瞪着B，说：">愤怒</option> -->
	          <option value="微笑着向B招招手，说：">招手</option>
	          <!-- <option value="嘟着嘴哼哼哧哧地对B说：">不满</option> -->
	          <option value="兴奋得不得了，对着B翩翩起舞，说：">兴奋</option>
	          <!-- <option value="情不自禁地搂着B热吻起来，还叽哩咕噜地说：">狂吻</option> -->
	          <option value="泪光闪闪看着B，脸上写满了委屈的说：">委屈</option>
	          <!-- <option value="急得直跺脚，气急败坏地对B说：">着急</option>
	          <option value="泪如泉涌，对着B哗啦哗啦哭了起来，说：">嚎啕</option> -->
	          <!-- <option value="皱起眉头别转脸，却又偷看B一眼，故作生气说：">撒娇</option> -->
	          <!-- <option value="眯起斗鸡眼看着B一阵奸笑说：">奸笑</option> -->
	          <!-- <option value="突然跃起飞脚猛踢B屁股，说：">飞脚</option> -->
	          <!-- <option value="左右开弓抽得B满地找牙，说：">抽掴</option> -->
	          <!-- <option value="冲B皮笑肉不笑地说：">假笑</option> -->
	        </select>
	        <!-- 选择是否悄悄话-->
	      	<input type="checkbox" name="secret" value="yes" >悄悄话
	        <!-- 选择信息显示颜色-->
	        <select name="color" size="1" style="font-size:9pt">
	          <option style="COLOR: #000000" value="#000000" >黑色</option>
	          <option style="COLOR: #7ec0ee" value="#7ec0ee" >淡蓝</option>
	          <option style="COLOR: #0088ff" value="#0088ff" >海蓝</option>
	          <option style="COLOR: #0000ff" value="#0000ff" >草蓝</option>
	          <option style="COLOR: #000088" value="#000088" >深蓝</option>
	          <option style="COLOR: #8800ff" value="#8800ff" >蓝紫</option>
	          <option style="COLOR: #ab82ff" value="#AB82FF" >紫色</option>
	          <option style="COLOR: #ff88ff" value="#ff88ff" >紫金</option>
	          <option style="COLOR: #ff00ff" value="#ff00ff" >红紫</option>
	          <option style="COLOR: #ff0088" value="#ff0088" >玫红</option>
	          <option style="COLOR: #ff0000" value="#ff0000" >大红</option>
	          <option style="COLOR: #f4a460" value="#f4a460" >棕色</option>
	          <option style="COLOR: #888800" value="#888800" >卡其</option>
	          <option style="COLOR: #888888" value="#888888" >铁灰</option>
	          <option style="COLOR: #90e090" value="#90E090" >绿色</option>
	          <option style="COLOR: #008800" value="#008800" >橄榄</option>
	          <option style="COLOR: #008888" value="#008888" >灰蓝</option>
	        </select>
	       
	 　 		<br>
	        
	      
 		</div>
 		<div id="below">
	        <input id="content" type="text" name="msg"/>
	        <!-- 发送聊天信息按钮-->
	        <input id="send" type="submit" name="Submit" value=" " onclick="return checkForm();">	
        </div>
        <div style="clear:both;"></div>
       </div>
      <div id="right">
      	<div style="margin-left:10px;margin-top:10px;text-align:center;"><img src="images/boy.gif"/></div>
        <!-- 用户离开聊天室按钮-->
        <div style="text-align:center;"><br/><input type="button" name="logout" value="用户退出" style="font-size:9pt" 
                  onclick="return userLogout();">
		<!-- 用户换房间按钮-->
		&nbsp;<input type="button" name="changeRoom" value="回到大厅" style="font-size:9pt" 
               onclick="return userChangeRoom();"></div>	
      </div>
      <div style="clear:both;"></div>
  <!-- iframe用于控制用户发送消息页面不闪-->
<iframe id="theIframe" name="theIframe" width="0" height="0" frameborder="0" style="display:none;"></iframe>
</FORM>
</BODY>
</HTML>

