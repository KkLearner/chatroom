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
		#container{width:717px;height:536px;margin:50px auto 0 auto;background-image:url('images/bg3.jpg');position:relative;}
		#list_div{width:390px;height:240px;position:absolute;top:217px;left:75px;background-color:white;}
		div.transbox
		{
		  /* for IE */
		  filter:alpha(opacity=60);
		  /* CSS3 standard */
		  opacity:0.9;
		}
		td{padding-left:20px;height:30px;}
		td:hover{background-color:#82e6fe}
	</style>
  </head>
  
  <body>
    <div id="container">
    	<form action="ChooseChatRoom.action" method="post">
    	<div id="list_div" class="transbox">
     <table border=0 width="100%">
      <tr>
      	<td>请选择你将进入的聊天室</td>
      </tr>
      <tr> 
        <td style="color:deeppink;"><input type="radio" name="chatRoom" value="zhaoqing_nursery">聊天室1
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
     </div>
    </form>
    	</div>
    	<div style="clear:both;"></div>
  </body>
</html>
