<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>纵横手拉手聊天室</title>
    
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
	    
	//ajax程序检测 注册的用户是否已经存在
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
			  if (response == "此用户名已经被使用！"){
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
		   alert("用户昵称不能为空!");
		   document.form1.nickName.focus();
		   return false;
		  }
		  else if(document.form1.userPassword.value=='')
		  {
		   alert("登录密码不能为空");
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
    	<div style="margin-left:210px;font-family:黑体;">
    		<form  action="UserLogin.action" method="post" name="form1" onSubmit="return check()">
    			<p style="color:white;margin:30px 0px 0px 33px;">用户名：<input type="text" name="userInfo.nickName" id="nickName" onChange="callServer();"/><br/><br/>
    				&nbsp;密 码：<input type="password" name="userInfo.userPassword" id="userPassword" /></p>
    			<p style="margin-top:20px;text-align:center;"><input type="submit" value="登录" />
    				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="注册" onclick="location='register.jsp'"></p>
    				<span id="test1" style="color: red;position:relative;top:-115px;left:260px;"></span>
    		</form>
    	</div>
         
        <div style="margin-left:410px;margin-top:70px;">
    	<a href="http://www.zhzyk.cn/" style="text-decoration:none;color:#ffffff;">资源库</a><a href="http://www.zhzyk.cn/aboutChatRoom.jsp" style="text-decoration:none;color:#ffffff;margin-left:10px;">关于</a>
    	</div>

    	<!--<p style="color:white;font-size:15px;font-family:黑体;text-align:center;margin:40px;">目前注册人数 <span id="reg_count" style="color:#b78a32;">168</span> 人</p>-->
   </div>
  </body>
</html>
