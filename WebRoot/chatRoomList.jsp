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
   ��ӭ��:<span style="color:red"><%=session.getAttribute("_USER")%></span>��ѡ��һ�������ҽ��룡
    <form action="ChooseChatRoom.action" method="post">
     <table border=0>
      <tr> 
        <td style="color:deeppink"><input type="radio" name="chatRoom" value="zhaoqing_nursery">������1
        [<%=userService.getSum_User("zhaoqing_nursery")%>]��</td>
      </tr>
      <tr>
        <td style="color:blue"><input type="radio" name="chatRoom" value="zhixin">������2
          [<%=userService.getSum_User("zhixin")%>]��</td>
      </tr>
      <tr>
        <td style="color:red"><input type="radio" name="chatRoom" value="yule" checked>������3
         [<%=userService.getSum_User("yule")%>]��</td>
      </tr>
      <tr>
       <td><input type="submit" value="enter"></td>
      </tr>
     </table>
    </form>
  </body>
</html>
