<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String school=request.getParameter("theSchool");
  String chatroom=request.getParameter("chating");
   System.out.println(school);
    System.out.println(chatroom);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>纵横手拉手聊天室</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="纵横,聊天室,输入法">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/clock.js" type="text/javascript" ></script>
	<style>
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		iframe{border:none;}
		#container{width:1046px; margin:0 auto; background-image:url('images/bg.gif');}
		#banner{width:844px;height:125px;margin:0px auto;background-image:url('images/banner.gif');}
		#display_chatting{width:619px;height:363px;border:1px solid #74a4cb;margin-left:82px;}
		#C_head{height:30px;background-image:url('images/title.gif');background-repeat:repeat-x;line-height:30px;}
		#C_body{height:333px;background-color:white;}
		#C_body iframe{height:100%;width:100%;}
		#room_info{width:216px;height:363px;margin-left:18px;border:1px solid #76a5ea;} 
		#room_info iframe{width:100%;height:100%;}
		#input_block{width:857px;height:152px;margin-left:82px;margin-top:10px;}
		#input_block iframe{width:100%;height:100%;}
		.fl{float:left;} .clear_both{clear:both;}
	</style>
  </head>
  
  <body>
    <div id="container">
    	<div id="banner"></div>
    	<div id="display_chatting" class="fl"> 
    		<div id="C_head">
    			<span id="room_name" style="display:inline-block;width:200px;margin-left:10px;">聊天室</span>
    			<span id="clock" style="display:inline-block;"></span>
	    			<script type="text/javascript">
					    var clock = new Clock();
					    clock.display(document.getElementById("clock"));
					</script>
    		</div>	    		
			<div id="C_body"><iframe src ="show.jsp?theSchool=<%=request.getParameter("theSchool")%>&chating=<%=request.getParameter("chating")%>" name="mainFrame"></iframe></div>
    	</div>
    	<div id="room_info" class="fl">
	         <iframe name = "userlistFrame" src="userList.jsp?theSchool=<%=request.getParameter("theSchool")%>&chating=<%=request.getParameter("chating")%>"  scrolling="no" frameborder="0"></iframe>		
    	</div>
    	<div id="input_block" class="fl">
    		<iframe src="input.jsp?theSchool=<%=request.getParameter("theSchool")%>&chating=<%=request.getParameter("chating")%>"    name="inputFrame" scrolling="no" frameborder="0"></iframe>
    	</div>
    	<div class="clear_both"></div>
    </div>
  </body>
</html>
