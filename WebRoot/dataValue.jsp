
<%@include file="chkSession.jsp"%>
<%@ page language="java" import="java.sql.*" pageEncoding="GB2312"%>
<html>
<head>
 <script language="javascript">
 //javascript������ÿ��2000���루2�룩ˢ��һ��ҳ��
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
   
 //���������Ƕ�����һ��msgString��������ҳ����ʾ������������Ϣ�������show.jsp
     //����ʾ����ַ���
 String msgString = "";
 Connection con=null;
 PreparedStatement ps=null;
 ResultSet rs=null;

 try
 {
 //��������Ϣ���ݿ���ѡȡ�������15��������Ϣ
 //����Ҫע���ѯ����д��
 //select top 30 ID from msgInfo where chatRoom=? order by chatTime DESC����ѯʵ��
     //���Ѿ���ѯ�����µ�15����Ϣ
 //����������ѯ��������Ϣ�ǰ�ʱ�䵹˳����ģ����µ���Ϣ�������棬����ʾ��ʱ��Ҫ
     //��������Ϣ��ʾ�����������棬����Ҫ�����β�ѯ����
     
  String sql = "select * from msgInfo  where theSchool='"+school+"' and chating='"+chatroom+"' order by chatTime";
 
  String userName=session.getAttribute("_USER").toString();
  
  con=conn.getConnection();
  ps = con.prepareStatement(sql);
 
  rs =ps.executeQuery();
 
  //����whileѭ����ĳ������ʵ�ֿ���������Ϣ��ʾ��ʽ�Ĺ���
  while(rs.next())
  { 
    String msgFrom = rs.getString("msgFrom");//��ȡ������Ϣ������
    String msgTo=rs.getString("msgTo");//��ȡ������Ϣ������
    String action = rs.getString("chatAction");//��ȡ�������
    String msgContent=rs.getString("msgContent");//��ȡ������Ϣ����
    int secret = rs.getInt("secret");//��ȡ�Ƿ����Ļ� 
    //String imgage_url=rs.getString("image_url");
    String imgage_url="images/yl_girl.gif";
    
     //�ж��Ƿ�ϵͳ����
     
    if(msgFrom.equals("system notice"))
      {msgString=msgString+"<div>ϵͳ:"+msgContent+"</div>";
     //�ж��Ƿ����Ļ�
     }
    else if(secret==0)
    { 
     //�ж��Ƿ�ʹ���������
      if(action==null||action.equals("no"))
        msgString=msgString+"<div><img width=30px heigth=30px src='"+imgage_url+"'></img><font color=blue>"+msgFrom+"</font>��<font color=blue>"+msgTo+"</font></span>˵��"+msgContent+"</div>"; 
      else
        msgString=msgString+"<div><font color=blue>"
             +msgFrom+"</font>"+action.replaceAll("B","<font color=blue>"
             +msgTo+"</font>")+msgContent+"</div>";
    }
    //��������Ļ�ֻ�ڷ����ߺͽ����ߵ�ҳ������ʾ
   
    else if(msgFrom.equals(userName)||msgTo.equals(userName))
    {
    	
     if(action==null||action.equals("no"))
       msgString=msgString+"<div><font color=red>[���Ļ�]</font><font color=blue>"
                  +msgFrom+"</font>��<font color=blue>"+msgTo+"</font></span>˵��"
                  +msgContent+"</div>";
     else
      msgString=msgString+"<div><font color=red>[���Ļ�]</font><font color=blue>"
                   +msgFrom+"</font>"+action.replaceAll("B","<font color=blue>"
                   +msgTo+"</font>")+msgContent+"</div>";
    }  
   }
 }catch(Exception ex)
 {
  ex.printStackTrace();
  out.println("ϵͳά��");
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
  //ע�������javascript,��show.jsp�ж�����һ��idΪloadContent��span
  //���������idΪloadContent�ĵط���ʾmsgString��Ҳ������ʾ������Ϣ
  parent.loadContent.innerHTML="<%=msgString%>";
  parent.location.hash="position";
  parent.test();
</script>
</body>
</html>

