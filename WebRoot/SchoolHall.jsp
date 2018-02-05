<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>  
    <title>纵横手拉手聊天室</title>
	<style type="text/css">
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		body{background:url('${contextPath}/images/schoolhall.jpg') no-repeat;}
		#schools{width:1100px;height:500px;margin:100px auto 0 auto;overflow-y:scroll;}
		#schools div.school{width:150px;height:120px;float:left;cursor:pointer;margin:10px;}
		#schools div.school img{margin:10px 0 0 35px;}
		#schools div.school p{margin:0px 0 0 40px;font-size:15px;}
	</style>
  </head>
  
  <body>
     <div id="schools"></div>
     <script src="${contextPath}/js/schoolHall.js"></script>
  </body>
</html>
