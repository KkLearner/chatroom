
<%@include file="chkSession.jsp"%>
<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<html>
<head>
 <script language="javascript">
 //javascript函数，每融2000毫秒（2秒）刷新一次页面
   function GetData()
   {
        var timeoutid = setTimeout("this.location.reload()",6000)
  }
 </script>
</head>
<body onload="GetData()">
<jsp:useBean id="conn" class="org.zhzyk_chatRoom.util.ConnectionFactory" scope="page"/>
<%
   String school=request.getParameter("theSchool");
   String chatroom=request.getParameter("chating");
   
 //在这里我们定义了一个msgString，它保存页面显示的所有聊天信息，最后在show.jsp
     //中显示这个字符串
 String msgString = "";
 Connection con=null;
 PreparedStatement ps=null;
 ResultSet rs=null;

 try
 {
 //从聊天信息数据库中选取出最近的15条聊天信息
 //这里要注意查询语句的写法
 //select top 30 ID from msgInfo where chatRoom=? order by chatTime DESC这句查询实际
     //上已经查询出最新的15条信息
 //但是这样查询出来的信息是按时间倒顺排序的，最新的信息在最上面，而显示的时候要
     //把最新信息显示在聊天室下面，所以要再做次查询排序
     
  String sql = "select * from msgInfo  where theSchool='"+school+"' and chating='"+chatroom+"' order by chatTime";
 
  String userName=session.getAttribute("_USER").toString();
  
  con=conn.getConnection();
  ps = con.prepareStatement(sql);
 
  rs =ps.executeQuery();
 
  //下面while循环里的程序就是实现控制聊天信息显示格式的功能
  while(rs.next())
  { 
    String msgFrom = rs.getString("msgFrom");//获取聊天信息发送者
    String msgTo=rs.getString("msgTo");//获取聊天信息接收者
    String action = rs.getString("chatAction");//获取聊天表情
    String msgContent=rs.getString("msgContent");//获取聊天信息内容
    int secret = rs.getInt("secret");//获取是否悄悄话 
    //String imgage_url=rs.getString("image_url");
    String imgage_url="images/yl_girl.gif";
    
     //判断是否系统公告
     
    if(msgFrom.equals("system notice"))
      {msgString=msgString+"<div>系统:"+msgContent+"</div>";
     //判断是否悄悄话
     }
    else if(secret==0)
    { 
     //判断是否使用聊天表情
      if(action==null||action.equals("no"))
        msgString=msgString+"<div><img width=30px heigth=30px src='"+imgage_url+"'></img><font color=blue>"+msgFrom+"</font>对<font color=blue>"+msgTo+"</font></span>说："+msgContent+"</div>"; 
      else
        msgString=msgString+"<div><font color=blue>"
             +msgFrom+"</font>"+action.replaceAll("B","<font color=blue>"
             +msgTo+"</font>")+msgContent+"</div>";
    }
    //如果是悄悄话只在发送者和接收者的页面中显示
   
    else if(msgFrom.equals(userName)||msgTo.equals(userName))
    {
    	
     if(action==null||action.equals("no"))
       msgString=msgString+"<div><font color=red>[悄悄话]</font><font color=blue>"
                  +msgFrom+"</font>对<font color=blue>"+msgTo+"</font></span>说："
                  +msgContent+"</div>";
     else
      msgString=msgString+"<div><font color=red>[悄悄话]</font><font color=blue>"
                   +msgFrom+"</font>"+action.replaceAll("B","<font color=blue>"
                   +msgTo+"</font>")+msgContent+"</div>";
    }  
   }
 }catch(Exception ex)
 {
  ex.printStackTrace();
  out.println("系统维护");
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
<script language="javascript">
  //注意这里的javascript,在show.jsp中定义了一个id为loadContent的span
  //这里就是在id为loadContent的地方显示msgString，也就是显示聊天信息
  parent.loadContent.innerHTML="<%=msgString%>";
  parent.location.hash="position";
  parent.test();
</script>
</body>
</html>

