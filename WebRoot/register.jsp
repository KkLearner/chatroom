<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
	<style type="text/css">
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		body{background-image:url('${contextPath}/images/bg.gif');}
		#reg_table{margin:100px auto 0px auto;border-right:1px solid #a0c6ff;border-bottom:1px solid #a0c6ff;}
		#reg_table td{border-left:1px solid #a0c6ff;border-top:1px solid #a0c6ff;height:35px;
			font-size:14px;padding-left:8px;}
		#reg_table tr:nth-child(odd) {   background: #EDF4FF; }
	</style>

  </head>
  
  <body>

  <form  id="form1" >
    <table id="reg_table" width="600px" border="0" cellspacing="0" cellpadding="0">
    
    	<tr>
    		<th colspan="2" style="background-color:#a0c6ff;line-height:40px;color:white;font-size:16px;font-family:黑体;">
    			纵横手拉手聊天室&nbsp;&nbsp;&nbsp;新用户注册</th>
    	</tr>
    	<tr>
    		<td width="25%">所在省市</td>
    		<td><input type="text" name="province" id="province"/></td>
    	</tr>
    	<tr>
    		<td>所属学校或单位</td>
    		<td><input type="text" name="school" id="school"/></td>
    	</tr>
    	<tr>
    		<td>本人身份</td>
    		<td>
    		   <select name="role" id="role">
    		   <option  selected ="selected" value="1">学生</option>
    		   <option value="2">老师</option>
    		   <option value="3">专家</option>
    		   </select>
    		
    		</td>
    	</tr>
    	<tr>
    		<td>账号(手机号/邮箱)</td>
    		<td><input type="text" name="account" id="account" />
    		<span id="test1" style="color:red;left:260px;"></span></td>
    	</tr>
    	<tr>
    		<td>真实姓名</td>
    		<td><input type="text" name="nickName" id="nickName"/></td>
    		
    	</tr>
    	<tr>
    		<td>性别</td>
    		<td>
    			<input type="radio" name="sex" id="sex" value="男" checked="checked	"/>男
    			<input type="radio" name="sex" id="sex" value="女"/>女
    		</td>
    		
    	</tr>
    	<tr>
    		<td>设置密码</td>
    		<td><input type="password" name="userPassword" id="userPassword"/></td>
    	</tr>
    	<tr>
    		<td>确认密码</td>
    		<td><input type="password" name="repeat_userPassword" id="repeat_userPassword"/>
    		<span style="font-size:10px;">*请再次输入您设置的密码</span></td>
    	</tr>
    </table>
    </form>
    <div style="text-align:center;margin:0:auto;">
		<input type="button" value="提交" id="submit"/>&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="location='${contextPath}/login.jsp'"/>
		<span id="text1" style="text-align:center;margin:0:auto;color:red"></span>		
    </div>
    <script src="${contextPath}/js/register.js" ></script>
  </body>
  	  
</html>
