<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ include file="/../common.jsp"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>  
    <title>纵横手拉手聊天室</title>
	<style type="text/css">
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		body{background:url('${contextPath}/images/xiaonei_Hall.jpg') no-repeat;}
		#schools{width:500px;height:500px;margin:100px auto 0 auto;}
		#schools div.chat{width:160px;height:120px;float:left;cursor:pointer;}
		#schools div.chat img{margin:20px 0 0 45px;}
		#schools div.chat p{margin:0px 0 0 40px;font-size:15px;}
	</style>
  </head>  
  <body>  
     <div id="schools">
         
         <div id="hide"  style="display:none;background:#FFFFFF;width:180px;height:120px;position:absolute;left:550px;top:250px;">
             <img src="${contextPath}/images/hide_bg.jpg" style="position:absolute;top:0px;left:0px; width:180px;height:25px;"/>
             <p style="position:absolute;top:5px;left:10px;">请填写您的专家验证码</p>
             <input id="pass" style="position:absolute;top:40px;left:15px;width:150px;height:25px;"  type="text"/>
             <button id="cancle" style="position:absolute;top:75px;left:28px;width:50px;height:22px;" onclick="cancle();">取消</button>
             <button id="submit" style="position:absolute;top:75px;left:100px;width:50px;height:22px;" onclick="submit();">提交</button>
         </div> 
     </div>
     <script src="${contextPath}/js/xiaoneiHall.js"></script>  
  </body>
</html>
