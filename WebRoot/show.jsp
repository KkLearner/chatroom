<html>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"
%>
<META http-equiv="Content-Type" content="text/html; charset=GBK">
<head>
<% String school=request.getParameter("theSchool");
   String chatroom=request.getParameter("chating");
    %>
<script language="javascript" type="text/javascript"> 
function GetPosition()
{
  window.location.hash="position";
}
function test()     
{     
window.scroll(0,document.body.scrollHeight)     
}     
</script>
</head>
<body onload="GetPosition()" >
<iframe src="dataValue.jsp?theSchool=<%=request.getParameter("theSchool")%>&chating=<%=request.getParameter("chating")%>" id="dataValue" style="visibility:hidden; height:0;"  width="1"></iframe>
<span id="loadContent" style="font-size:14pt;">data is loading</span>
<a id="position"></a>
 </body>
</html>

