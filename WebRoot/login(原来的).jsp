<%@ page language="java"  pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>chat user login</title>    
	<script language="javascript">
	//javascript check函数，用于检查表单中输入的用户昵称和登录密码是否为空
	 function check()
	 {
	  if(document.form1.nickName.value=='')
	  {
	   alert("用户昵称不能为空!");
	   document.form1.nickName.focus();
	   return false;
	  }
	  else if(document.form1.userPassword.value=='')
	  {
	   alert("登录密码不能为空");
	   document.form1.userPassword.focus();
	   return false;
	  }
	  else
	   return true;
	 }
	</script>
  </head>  
  <body>
	 <form action="UserLogin.action" method="post" name="form1" onSubmit="return check()">
    <TABLE align="center" cellpadding="0" cellspacing="0" border="0" width="500">
	 <tr>
	  <td height="100" colspan="2" style="font-size:18px; font-weight:bold;color=green" align="center">
	   聊天室登录
	  </td>
	 </tr>
	 
	 <tr>
	  <td width="222" align="right" style="color:deeppink" >
	   账号:
	  </td>
	  <td width="278">
	   <input type="text" name="userInfo.nickName" style="width:150 ">
	  </td>
	 </tr>
	 <tr>
	  <td colspan="2">
	  </td>
	 </tr>
	 <tr>
	  <td align="right" style="color:deeppink">
	   密码:
	  </td>
	  <td>
	   <input type="password" name="userInfo.userPassword" style="width:150 ">
	  </td>
	 </tr>
	 <tr>
	  <td colspan="2" align="center" height="30" valign="bottom">
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="submit" value="登录 ">&nbsp;&nbsp;
	   <input type="reset" value="注册">
	  </td>
	 </tr>
	</TABLE>
	 </form>
  </body>
</html>
