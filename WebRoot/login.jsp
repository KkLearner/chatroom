<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
  	<title>纵横手拉手聊天室</title>
	<style>
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		body{background-image:url('${contextPath}/images/bg.gif');}
		#container{background-image:url('${contextPath}/images/bg1.jpg');width:533px;height:310px;margin:160px auto 0 auto;}
	</style>
  </head>
  
  <body>
    <div id="container">
    	<div style="height:65px;"></div>
    	<div style="margin-left:210px;font-family:黑体;">
    		<form  action="${contextPath}/Login-userLogin.action" method="post" name="form1" id="form1" >
    			<p style="color:white;margin:30px 0px 0px 33px;">
    				账 号:<input type="text" name="account" id="account" /><br/><br/>
    				密 码:<input type="password" name="userPassword" id="userPassword" /></p>
    			<p style="margin-top:20px;text-align:center;"><input type="submit" value="登录" />
    				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="注册" onclick="location='${contextPath}/register.jsp'" /></p>
    				<span id="test1" style="color: red;position:relative;top:-115px;left:260px;"></span>
    		</form>
    	</div>
         
        <div style="margin-left:410px;margin-top:70px;">
    	<a href="http://www.chxckc.com/" style="text-decoration:none;color:#ffffff;">资源库</a><a href="http://www.chxckc.com/aboutChatRoom.jsp" style="text-decoration:none;color:#ffffff;margin-left:10px;">关于</a>
    	</div>

    	<!--<p style="color:white;font-size:15px;font-family:黑体;text-align:center;margin:40px;">目前注册人数 <span id="reg_count" style="color:#b78a32;">168</span> 人</p>-->
   </div> 
	<script src="${contextPath}/js/login.js"></script>
  </body>
</html>
