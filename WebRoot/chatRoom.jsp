<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<%@ include file="/../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>   
    <title>纵横手拉手聊天室</title>
	<style>
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		iframe{border:none;}
		#container{width:1046px; margin:0 auto; background-image:url('${contextPath}/images/bg.gif');}
		#banner{width:844px;height:125px;margin:0px auto;background-image:url('${contextPath}/images/banner.gif');}
		#display_chatting{width:619px;height:363px;border:1px solid #74a4cb;margin-left:82px;}
		#C_head{height:30px;background-image:url('${contextPath}/images/title.gif');background-repeat:repeat-x;line-height:30px;}
		#C_body{height:333px;background-color:white;overflow-y:scroll}
		#C_body loadContent{height:100%;width:100%;font-size:14pt;}
		#room_info{width:216px;height:363px;margin-left:18px;border:1px solid #76a5ea;overflow-y:scroll} 
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
    		</div>	    		
			<div id="C_body">
				<span id="loadContent"></span>
			</div>
    	</div>
    	<div id="room_info" class="fl">
    		<%@include file="userList.jsp"%>  		
    	</div>
    	<div id="input_block" class="fl">
    		<%@include file="input.jsp"  %>   	
    	</div>   	
    	<div class="clear_both"></div>
    </div>
    <script src="${contextPath}/js/clock.js" type="text/javascript" ></script>
    <script src="${contextPath}/js/chatRoom.js" type="text/javascript" ></script>
  </body>
</html>
