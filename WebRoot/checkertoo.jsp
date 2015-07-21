<%@ page contentType="text/plain; charset=UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*,org.zhzyk_chatRoom.util.ConnectionFactory"%>

<%
//request.setCharacterEncoding("gbk");
String old = request.getParameter("name");
String name = new String(old.getBytes("ISO8859-1"),"gbk");
//System.out.println(name);
String sql = "select * from userinfo where nickName = '" + name + "'";
Connection con = ConnectionFactory.getConnection();
PreparedStatement ps = null;
ResultSet rs = null;

try {
ps = con.prepareStatement(sql);

rs = ps.executeQuery();

if(rs.next()) {
	response.getWriter().write("");
} else {
	response.getWriter().write("不存在此用户！");
}
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	try {
		rs.close();
		ps.close();
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
} 
%>