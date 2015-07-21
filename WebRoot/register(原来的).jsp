<%@ page language="java"  pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>用户注册</title>    
	<script type="text/javascript">
		function validateInfo() {
			var temp = true;
			var loginUsername = document.getElementById("username").value;
			var new_password = document.getElementById("new_password").value;
			var comfirm_password = document.getElementById("comfirm_password").value;
			if(loginUsername.trim() == "") {
				alert("用户名不能为空！");
				temp = false;
			}
			if(new_password.trim()=="") {
				alert("新密码不能为空!");	
				temp = false;
			}
			if(comfirm_password.trim()=="")
			{
				alert("确认密码不能为空！");
				temp=false;
			}else{
				if(comfirm_password.trim()!=new_password.trim())
				{
					alert("两次密码必须一样！");
					temp=false;
				}
			}
			if(temp) {
				return true;
			} else {
				return false;
			}
		}
		function callServer() {
			if(typeof String.prototype.trim !== 'function') {
	            String.prototype.trim = function() {
	                return this.replace(/^\s+|\s+$/g, ''); 
	           }
	        } 
			var username = document.getElementById("username").value;
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
			  if (response == "此用户名已经被使用！"){
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
	 <form action="UserLogin.action" method="post" name="form1" onSubmit="return check()">
    <TABLE align="center" cellpadding="0" cellspacing="0" border="0" width="500">
	 <tr>
	  <td height="100" colspan="2" style="font-size:18px; font-weight:bold;color=green" align="center">
	 注册
	  </td>
	 </tr>
	 
	 <tr>
	  <td width="222" align="right" style="color:deeppink" >
	   账号:
	  </td>
	  <td width="550">
	   <input type="text" name="userInfo.nickName" id="username" style="width:150" onChange="callServer();">
	    <span id="test1" style="color: red">请输入用户名</span>
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
	  <td align="right" style="color:deeppink">
	  重复密码:
	  </td>
	  <td>
	   <input type="password" name="userInfo.repeat_userPassword" style="width:150">
	  </td>
	 </tr>
	 <tr>
<td align="right" style="color:deeppink ">省份：  
  <SELECT> 
<OPTION value=北京市 selected>北京市</OPTION> 
<OPTION value=天津市>天津市</OPTION> 
<OPTION value=河北>河北</OPTION>
<OPTION value=山西>山西</OPTION> 
<OPTION value=辽宁>辽宁</OPTION>
<OPTION value=吉林>吉林</OPTION> 
<OPTION value=上海市>上海市</OPTION>
<OPTION value=江苏>江苏</OPTION>
<OPTION value=浙江>浙江</OPTION>
<OPTION value=安徽>安徽</OPTION>
<OPTION value=江西>江西</OPTION>
<OPTION value=山东>山东</OPTION>
<OPTION value=河南>河南</OPTION>
<OPTION value=湖北>湖北</OPTION>
<OPTION value=湖南>湖南</OPTION>
<OPTION value=广东>广东</OPTION>
<OPTION value=广西>广西</OPTION>
<OPTION value=海南>海南</OPTION>
<OPTION value=重庆>重庆</OPTION>
<OPTION value=四川>四川</OPTION>
<OPTION value=贵州>贵州</OPTION>
<OPTION value=云南>云南</OPTION>
<OPTION value=西藏>西藏</OPTION>
<OPTION value=陕西>陕西</OPTION>
<OPTION value=甘肃>甘肃</OPTION>
<OPTION value=青海>青海</OPTION>
<OPTION value=宁夏>宁夏</OPTION>
<OPTION value=新疆>新疆</OPTION>
<OPTION value=内蒙古>内蒙古</OPTION>
<OPTION value=黑龙江>黑龙江</OPTION>
<OPTION value=福建>福建</OPTION>
<OPTION value=香港>香港</OPTION>
<OPTION value=台湾>台湾</OPTION>
<OPTION value=澳门>澳门</OPTION>
</SELECT>
</td>
</tr>
	 <tr>
	  <td align="right" style="color:deeppink">
	    学校
	  </td>
	  <td>
	   <input type="password" name="userInfo.repeat_userPassword" style="width:150 ">
	  </td>
	 </tr>
	</TABLE>
	 </form>
  </body>
</html>
