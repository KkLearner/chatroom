<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ݺ�������������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		#reg_table{background:#fffff;margin:100px auto 0px auto;border-right:1px solid #a0c6ff;border-bottom:1px solid #a0c6ff;}
		#reg_table td{background:#fffff;border-left:1px solid #a0c6ff;border-top:1px solid #a0c6ff;height:35px;
			font-size:14px;padding-left:8px;}
		#reg_table tr:nth-child(odd) {   background:#fffff;}
	</style>
	<script type="text/javascript">
	 function check()
	 {
		 if(document.form1.province.value=='')
		  {
		   alert("ʡ�ݲ���Ϊ��!");
		   document.form1.province.focus();
		   return false;
		  }
		 else if(document.form1.school.value=='')
		  {
		   alert("������λ����Ϊ��!");
		   document.form1.school.focus();
		   return false;
		  }
		 else if(document.form1.identity.value=='')
		  {
		   alert("��ݲ���Ϊ��!");
		   document.form1.identity.focus();
		   return false;
		  }else if(document.form1.nickName.value=='')
	      {
	        alert("�û��ǳƲ���Ϊ��!");
	        document.form1.nickName.focus();
	        return false;
	       }else if(document.form1.userPassword.value=='')
	        {
	          alert("��¼���벻��Ϊ��");
	          document.form1.userPassword.focus();
	          return false;
	        }else if(document.form1.userPassword.value!=document.form1.repeat_userPassword.value){
	    	  alert("������������벻һ����");
		      document.form1.userPassword.focus();
		      return false;
		      }
	  else
	   return true;
	 }
       //ajax������ ע����û��Ƿ��Ѿ�����
		function callServer() {
			if(typeof String.prototype.trim !== 'function') {
	            String.prototype.trim = function() {
	                return this.replace(/^\s+|\s+$/g, ''); 
	           }
	        } 
			var username = document.getElementById("nickName").value;
			  var url = "checker.jsp?name=" + username.trim();
			  //var xmlHttp=new XMLHttpRequest();
			  var xmlHttp = false;
	 try {
		 xmlHttp= new ActiveXObject('Msxml2.XMLHTTP');
	     } catch (e) {
	         try {
	        	 xmlHttp= new ActiveXObject('Microsoft.XMLHTTP');
	         } catch (E) {
	        	 xmlHttp= null;
	         }
	     }
	     if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
	    	 xmlHttp= new XMLHttpRequest();
	     }
	    // return xmlhttp_request;
			  xmlHttp.open("GET", url, true);
			  xmlHttp.onreadystatechange = function() {
			  if (xmlHttp.readyState < 4) {
			 	test1.innerHTML="loading...";
			  }
			  if (xmlHttp.readyState == 4) {
			    var response = xmlHttp.responseText;
			    test1.innerHTML=response.replace(/^\s+|\s+$/g, '');
			  }
			  if (response == "���û����Ѿ���ʹ�ã�"){
			 	same = true;
			 }else{
			 	same = false;
			  }
			}
			  xmlHttp.send(null); 
			}
</script>
  </head>
  
  <body>
  	<form action="Register.action" method="post" name="form1" onSubmit="return check()">
    <table id="reg_table" width="600px" border="0" cellspacing="0" cellpadding="0">
    
    	<tr>
    		<th colspan="2" style="background-color:#a0c6ff;line-height:40px;color:white;font-size:16px;font-family:����;">
    			�ݺ�������������&nbsp;&nbsp;&nbsp;���û�ע��</th>
    	</tr>
    	<tr>
    		<td width="25%">����ʡ��</td>
    		<td><input type="text" name="userInfo.province" id="province"/></td>
    	</tr>
    	<tr>
    		<td>������λ</td>
    		<td><input type="text" name="userInfo.school" id="school"/></td>
    	</tr>
    	<tr>
    		<td>�������</td>
    		<td><input type="text" name="userInfo.identity" id="identity"/></td>
    	</tr>
    	<tr>
    		<td>��ʵ����</td>
    		<td><input type="text" name="userInfo.nickName" id="nickName" onChange="callServer();"/>
    		 <span id="test1" style="color: red">�������û���</span></td>
    	</tr>
    	<tr>
    		<td>��������</td>
    		<td><input type="password" name="userInfo.userPassword" id="userPassword"/></td>
    	</tr>
    	<tr>
    		<td>ȷ������</td>
    		<td><input type="password" name="userInfo.repeat_userPassword" id="repeat_userPassword"/>
    		<span style="font-size:10px;">*���ٴ����������õ�����</span></td>
    	</tr>
    	<tr>
    		<td colspan='2' style="background-color:#a0c6ff;text-align:center;">
    			<input type="submit" value="�ύ"/>&nbsp;&nbsp;&nbsp;&nbsp;
    			&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="����" onclick="history.go(-1)"/></td>
    	</tr>
   
    </table>
    </form>
  </body>
</html>
