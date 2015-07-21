<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'sendMsg.jsp' starting page</title>    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
  </head>
  <jsp:useBean id="chatRoom" class="org.zhzyk_chatRoom.dao.impl.UserDaoImpl"/>
  <jsp:useBean id="message" class="org.zhzyk_chatRoom.model.MsgInfo"/>
   <jsp:useBean id="messageDaoService" class="org.zhzyk_chatRoom.service.chatRoomService"/>
   <jsp:useBean id="messageDaoImpl" class="org.zhzyk_chatRoom.dao.impl.MessageDaoImpl"/>
  <body>
   <%
  
   
   
   String school=(String)request.getParameter("theSchool");
   String chatroom=(String)request.getParameter("chating");
     
     message.setSchool(school);
     message.setChating(chatroom);
   //首先检测发送信息的聊天用户是否已经被踢出聊天室
   /*/如果已经被踢出聊天室，后面的信息发送程序将不再执行
   if(chatRoom.denyUser(session.getAttribute("_USER").toString(),
   session.getAttribute("_CHAT_ROOM").toString()))
    {System.out.println("b");
     out.println("<script>parent.alert(\"对不起，你已经被踢出本聊天室\")</script>");
     out.println("<script>parent.parent.document.location.href='chatRoomList.jsp'</script>");
     return; 
    }System.out.println("c");
   request.setCharacterEncoding("GB2312");
   /*
   接收用户输入的聊天信息以及用户选择的信息显示颜色，聊天表情，是否悄悄话，
聊天对象
   */
  
   
   String msgContent=(String)request.getParameter("msg");
   String action = (String)request.getParameter("action");
   String color = (String) request.getParameter("color");
   String msgTo =(String)request.getParameter("msgTo");
   int secret = 0;
   //如果聊天对象为空表示对所有人说话
   if(msgTo==null||msgTo.equals(""))
	   msgTo="所有人";
   //如果悄悄话的选框被选中表示这个消息是悄悄话
   if(request.getParameter("secret")!=null)
   {
      secret=1;
   }
   
   //message对象，用于抽象(保存)一条聊天信息
   message.setMsgFrom(session.getAttribute("_USER").toString());
   
   message.setChatAction(action);
   
   
   
   message.setMsgTo(msgTo);
   message.setSecret(secret);
   
   message.setMsgContent("<font color="+color+" style=font-size:40px>"+msgContent+"</font>");
   //将聊天信息保存到数据库中
  
   messageDaoService.saveUser(message);
   //messageDao.saveToDataBase(MsgInfo msgInfo);
   //messageDaoImpl.saveToDataBase(message);
   
   //将input.jsp的聊天信息输入框清空
   out.println("<script>parent.document.chatForm.msg.value = \"\"</script>");
   //刷新dataValue页面，将刚才发送的信息立即显示出来
   out.println("<script>parent.parent.mainFrame.dataValue.location.reload()</script>");
   
   
   %>
  </body>
</html>

