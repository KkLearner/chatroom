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
//javascript����������û�������Ϣ�Ƿ�Ϊ��
function checkForm() {
	if (document.chatForm.msg.value == "") {
		alert("���Բ���Ϊ��!");
		document.chatForm.msg.focus();
		return false;
	}
	else {
		document.chatForm.msg.focus();
		return true;
	}
}
//javascript����,�û��뿪����
function userLogout() {
  
   top.window.location="login.jsp";
  
   	
}
//javascript�������û��л�����
function userChangeRoom()
{
  document.body.onunload="";
  top.window.location="SchoolHall.jsp";
}
//��һ���´���
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
<!-- �û�����������Ϣ��form����������Ϣ���ύ��sendMsg.jsp���д���-->
<FORM name="chatForm"  method="post" action="sendMsg.jsp?theSchool=<%=request.getParameter("theSchool")%>&chating=<%=request.getParameter("chating")%>" target="theIframe">
  <div id="left">
  		<div id="above">
	        <!-- ѡ���������ֻ�����ԣ������ѡ����������ʾ��������-->
	        <input type="text" name="msgTo" size="8" style="font-size:9pt" readonly>����<!-- ѡ���������-->
	        <select name="action" size="1" style="font-size:9pt">
	          <option value="no" selected>˵��</option>
	          <option value="�Ѻõ�����B����˵��">�ʺ�</option>
	          <option value="��B����ص��ͷ,˵��">��ͷ</option>
	          <!-- <option value="��B���ĵ�����һЦ��˵��">����</option> -->
	          <option value="���²������ĵغǺ�Ц�Ŷ�B˵��">����</option>
	          <!-- <option value="һ���Ļ�Ц����������ش�����B��˵��">��Ц</option> -->
	          <!-- <option value="��ס��ˮ��ǿ����һ˿Ц�ݶ�B˵��">��Ц</option> -->
	          <!-- <option value="����Bһ�ۣ�ʮ�ֲ�м��˵��">����</option> -->
	          <!-- <option value="�������B�Ķ�ͷ������һ�£������˵��">����</option> -->
	          <!-- <option value="���ҵ�ӵ����B������͸����������˵��">ӵ��</option> -->
	          <!-- <option value="����������������B˵��">����</option> -->
	          <!-- <option value="��������ۿ����ת���������ĵض�B˵��">����</option> -->
	          <!-- <option value="�ߺ�������š�����ӱ�����B˵��">����</option> -->
	          <!-- <option value="����ȫ����������������B��˵��">��ŭ</option> -->
	          <option value="΢Ц����B�����֣�˵��">����</option>
	          <!-- <option value="�����ߺ�����ض�B˵��">����</option> -->
	          <option value="�˷ܵò����ˣ�����B�������裬˵��">�˷�</option>
	          <!-- <option value="�鲻�Խ���§��B������������ߴ�������˵��">����</option> -->
	          <option value="�����������B������д����ί����˵��">ί��</option>
	          <!-- <option value="����ֱ��ţ������ܻ��ض�B˵��">�ż�</option>
	          <option value="����Ȫӿ������B������������������˵��">����</option> -->
	          <!-- <option value="����üͷ��ת����ȴ��͵��Bһ�ۣ���������˵��">����</option> -->
	          <!-- <option value="���𶷼��ۿ���Bһ���Ц˵��">��Ц</option> -->
	          <!-- <option value="ͻȻԾ��ɽ�����Bƨ�ɣ�˵��">�ɽ�</option> -->
	          <!-- <option value="���ҿ������B����������˵��">����</option> -->
	          <!-- <option value="��BƤЦ�ⲻЦ��˵��">��Ц</option> -->
	        </select>
	        <!-- ѡ���Ƿ����Ļ�-->
	      	<input type="checkbox" name="secret" value="yes" >���Ļ�
	        <!-- ѡ����Ϣ��ʾ��ɫ-->
	        <select name="color" size="1" style="font-size:9pt">
	          <option style="COLOR: #000000" value="#000000" >��ɫ</option>
	          <option style="COLOR: #7ec0ee" value="#7ec0ee" >����</option>
	          <option style="COLOR: #0088ff" value="#0088ff" >����</option>
	          <option style="COLOR: #0000ff" value="#0000ff" >����</option>
	          <option style="COLOR: #000088" value="#000088" >����</option>
	          <option style="COLOR: #8800ff" value="#8800ff" >����</option>
	          <option style="COLOR: #ab82ff" value="#AB82FF" >��ɫ</option>
	          <option style="COLOR: #ff88ff" value="#ff88ff" >�Ͻ�</option>
	          <option style="COLOR: #ff00ff" value="#ff00ff" >����</option>
	          <option style="COLOR: #ff0088" value="#ff0088" >õ��</option>
	          <option style="COLOR: #ff0000" value="#ff0000" >���</option>
	          <option style="COLOR: #f4a460" value="#f4a460" >��ɫ</option>
	          <option style="COLOR: #888800" value="#888800" >����</option>
	          <option style="COLOR: #888888" value="#888888" >����</option>
	          <option style="COLOR: #90e090" value="#90E090" >��ɫ</option>
	          <option style="COLOR: #008800" value="#008800" >���</option>
	          <option style="COLOR: #008888" value="#008888" >����</option>
	        </select>
	       
	 �� 		<br>
	        
	      
 		</div>
 		<div id="below">
	        <input id="content" type="text" name="msg"/>
	        <!-- ����������Ϣ��ť-->
	        <input id="send" type="submit" name="Submit" value=" " onclick="return checkForm();">	
        </div>
        <div style="clear:both;"></div>
       </div>
      <div id="right">
      	<div style="margin-left:10px;margin-top:10px;text-align:center;"><img src="images/boy.gif"/></div>
        <!-- �û��뿪�����Ұ�ť-->
        <div style="text-align:center;"><br/><input type="button" name="logout" value="�û��˳�" style="font-size:9pt" 
                  onclick="return userLogout();">
		<!-- �û������䰴ť-->
		&nbsp;<input type="button" name="changeRoom" value="�ص�����" style="font-size:9pt" 
               onclick="return userChangeRoom();"></div>	
      </div>
      <div style="clear:both;"></div>
  <!-- iframe���ڿ����û�������Ϣҳ�治��-->
<iframe id="theIframe" name="theIframe" width="0" height="0" frameborder="0" style="display:none;"></iframe>
</FORM>
</BODY>
</HTML>

