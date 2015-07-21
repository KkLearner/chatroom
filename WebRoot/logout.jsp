<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<META http-equiv="Content-Type" content="text/html; charset=GBK">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>logout.jsp</TITLE>
</HEAD>
<BODY>
<jsp:useBean id="chatRoomObj" class="org.zhzyk_chatRoom.dao.impl.UserDaoImpl"/>
<%
try
 {
   //chatRoomObj对象调用logout方法将该用户从聊天室在线用户列表中删除
   chatRoomObj.logout(session.getAttribute("_USER").toString()); 
   //设置session失效
   session.invalidate();
   //跳转到聊天室登录界面
   response.sendRedirect("login.jsp");
}catch(Exception ex)
{
 ex.printStackTrace();
 out.println("error!");
}
%>
</BODY>
</HTML>

