<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ݺ�������������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		body{background-image:url('images/bg.gif');}
		#container{background-image:url('images/bg1.jpg');width:533px;height:310px;margin:160px auto 0 auto;}
	</style>
	<script language="javascript">
	    
	//ajax������ ע����û��Ƿ��Ѿ�����
		function callServer() {
			if(typeof String.prototype.trim !== 'function') {
	            String.prototype.trim = function() {
	                return this.replace(/^\s+|\s+$/g, ''); 
	           }
	        } 
			var username = document.getElementById("nickName").value;
			  var url = "checkertoo.jsp?name=" + username.trim();
			  //var xmlHttp=new XMLHttpRequest();
			  var xmlHttp = false;
	 try {
		 xmlHttp= new ActiveXObject('Msxml2.XMLHTTP');
	     } catch (e) {
	         try {
	        	 xmlHttp= new ActiveXObject('Microsoft.XMLHTTP');
	         } catch (E) {
	        	 xmlHttp= null;
	         }
	     }
	     if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
	    	 xmlHttp= new XMLHttpRequest();
	     }
	    // return xmlhttp_request;
			  xmlHttp.open("GET", url, true);
			  xmlHttp.onreadystatechange = function() {
			  if (xmlHttp.readyState < 4) {
			 	test1.innerHTML="loading...";
			  }
			  if (xmlHttp.readyState == 4) {
			    var response = xmlHttp.responseText;
			    test1.innerHTML=response.replace(/^\s+|\s+$/g, '');
			  }
			  if (response == "���û����Ѿ���ʹ�ã�"){
			 	same = true;
			 	
			 }else{
				
			 	same = false;
			 	
			  }
			}
			  xmlHttp.send(null); 
    
        }

      
		 function check()
		 {

			 

			 
		  if(document.form1.nickName.value=='')
		  {
		   alert("�û��ǳƲ���Ϊ��!");
		   document.form1.nickName.focus();
		   return false;
		  }
		  else if(document.form1.userPassword.value=='')
		  {
		   alert("��¼���벻��Ϊ��");
		   document.form1.userPassword.focus();
		   return false;
		  }
		  else
		   return true;
		 }
			

      
        
		 
	</script>
  </head>
  
  <body>
    <div id="container">
    	<div style="height:65px;"></div>
    	<div style="margin-left:210px;font-family:����;">
    		<form  action="UserLogin.action" method="post" name="form1" onSubmit="return check()">
    			<p style="color:white;margin:30px 0px 0px 33px;">�û�����<input type="text" name="userInfo.nickName" id="nickName" onChange="callServer();"/><br/><br/>
    				&nbsp;�� �룺<input type="password" name="userInfo.userPassword" id="userPassword" /></p>
    			<p style="margin-top:20px;text-align:center;"><input type="submit" value="��¼" />
    				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="ע��" onclick="location='register.jsp'"></p>
    				<span id="test1" style="color: red;position:relative;top:-115px;left:260px;"></span>
    		</form>
    	</div>
         
        <div style="margin-left:410px;margin-top:70px;">
    	<a href="http://www.zhzyk.cn/" style="text-decoration:none;color:#ffffff;">��Դ��</a><a href="http://www.zhzyk.cn/aboutChatRoom.jsp" style="text-decoration:none;color:#ffffff;margin-left:10px;">����</a>
    	</div>

    	<!--<p style="color:white;font-size:15px;font-family:����;text-align:center;margin:40px;">Ŀǰע������ <span id="reg_count" style="color:#b78a32;">168</span> ��</p>-->
   </div>
  </body>
</html>
