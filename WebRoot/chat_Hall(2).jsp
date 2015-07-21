<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>纵横手拉手聊天室</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:useBean id="userService" class="org.zhzyk_chatRoom.service.UserService"/> 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		#container{width:616px;height:509px;margin:50px auto 0 auto;background-image:url('images/bg3.jpg');}
		#wel{color:white;font-size:20px;width:250px;padding-top:190px;padding-left:25px;float:left;}
		#room_list{width:260px;height:250px;margin-top:120px;border:1px solid white;float:left;padding-left:30px;padding-top:50px;}
	</style>
  </head>
  
  <body>
    <div id="container">
    	<p id="wel">欢迎<span id="user"></span>！
    		<br/><br/>请选择你将进入的聊天群。</p>
    	<div id="room_list">
    	<form action="ChooseChatRoom.action" method="post">
     <table border=0 width="100%" height="50%">
      <tr> 
        <td style="color:deeppink"><input type="radio" name="chatRoom" value="zhaoqing_nursery">聊天室1
        [<%=userService.getSum_User("zhaoqing_nursery")%>]人</td>
      </tr>
      <tr>
        <td style="color:blue"><input type="radio" name="chatRoom" value="zhixin">聊天室2
          [<%=userService.getSum_User("zhixin")%>]人</td>
      </tr>
      <tr>
        <td style="color:red"><input type="radio" name="chatRoom" value="yule" checked>聊天室3
         [<%=userService.getSum_User("yule")%>]人</td>
      </tr>
      <tr>
       <td><input type="submit" value="进入"></td>
      </tr>
     </table>
    </form>
    	</div>
    	<div style="clear:both;"></div>
    </div>
  </body>
</html>
