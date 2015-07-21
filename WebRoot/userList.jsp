<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GB2312"
pageEncoding="GB2312"
%>
<%@include file="chkSession.jsp"%>
<META http-equiv="Content-Type" content="text/html; charset=GB2312">
<%@page import="java.sql.*"%>
<jsp:useBean id="conn" class="org.zhzyk_chatRoom.util.ConnectionFactory" scope="page"/>
<jsp:useBean id="list" class="org.zhzyk_chatRoom.service.UserService" scope="page"/> 
<jsp:useBean id="chatRoomObj" class="org.zhzyk_chatRoom.dao.impl.UserDaoImpl"/>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>
body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
</style>
<!-- 在这里设置，每8秒钟刷新一次页面-->
<META http-equiv="refresh" content="8">
<script language="JavaScript" type="">
	function PerformSubmit(user) {
       if(user=='all_people')
          {
           parent.inputFrame.chatForm.msgTo.value='';
		   return false;
          }else{
		    parent.inputFrame.chatForm.msgTo.value=user;
		    return false;
        }
	}
</script>
<style>
	
</style>

</HEAD>
<BODY bgcolor="white">
<%
String school=request.getParameter("theSchool");
String chatroom=request.getParameter("chating");

//检查当前用户是否已经被踢出聊天室，如果已经被踢出聊天室后面程序不再执行
//if(chatRoomObj.denyUser(session.getAttribute("_USER").toString()))
   // {
    // out.println("<script>alert(\"对不起，你已经被踢出本聊天室\")</script>");
    // out.println("<script>parent.document.location.href='chatRoomList.jsp'</script>");
     //response.sendRedirect("chatRoomList.jsp");
    // return; 
   // }
String userName =session.getAttribute("_USER").toString();

//断用户是否已经和聊天室断开连接
if (userName == null) {
	out.println("<script>alert(\"你已经和聊天室断开\")</script>");
    out.println("<script>parent.document.location.href='login.jsp'</script>");
	return;		
}

//String chatRoom =(String)session.getAttribute("_CHAT_ROOM").toString();

%>
		  <span style="display:block;background-image:url('images/title.gif');background-repeat:repeat-x;line-height:30px;">
			当前在线人员</span>
		<br/>&nbsp;&nbsp;<a href="#" onClick=PerformSubmit('all_people')>所有人</a><br>
		
		
<%

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

 try
 {
   //获取当前聊天房间中的所有用户列表
   
   String sql="select * from onlineUser where theSchool='"+school+"'and chating='"+chatroom+"'";
   con=conn.getConnection();
   ps= con.prepareStatement(sql);
   rs =ps.executeQuery();
   
   while(rs.next())
   {
%>		
		&nbsp;&nbsp;[<a href="#" class="l1" onClick=PerformSubmit("<%=rs.getString("nickName")%>")>
          <%=rs.getString("nickName")%></a>]<br>
         
<%
    }
  }catch(Exception ex)
  {
    out.println("数据库维护");
  }finally
  {
	  try {
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
  }  
%>
</BODY>
</HTML>
