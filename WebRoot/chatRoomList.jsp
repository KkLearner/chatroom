<%@ page language="java" import="java.util.*,org.zhzyk_chatRoom.service.*" pageEncoding="gbk"%>
<%@include file="chkSession.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>chatroon list</title>    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
<jsp:useBean id="userService" class="org.zhzyk_chatRoom.service.UserService"/>    
  </head>  
  <body>
   欢迎您:<span style="color:red"><%=session.getAttribute("_USER")%></span>请选择一个聊天室进入！
    <form action="ChooseChatRoom.action" method="post">
     <table border=0>
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
       <td><input type="submit" value="enter"></td>
      </tr>
     </table>
    </form>
  </body>
</html>
