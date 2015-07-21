<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>作品上传通道</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body,div,p,h1,h2,h3,h4,h5,table,tr,td,th,ol,ul,li{margin:0px;padding:0px;}
		body{background-image:url('images/upbg.jpg');background-repeat:repeat-x;}
		#reg_table{margin:50px auto 0px auto;border-right:1px solid #a0c6ff;border-bottom:1px solid #a0c6ff;}
		#reg_table td{border-left:1px solid #a0c6ff;border-top:1px solid #a0c6ff;height:35px;
			font-size:14px;padding-left:8px;}
		#reg_table tr:nth-child(odd) {   background: #EDF4FF; }
	</style>
<script language="javascript" type="text/javascript" src="common/js/jquery-1.3.2.min.js"></script>
	<script src="common/js/random.js" type="text/javascript"></script>
	<script language="javascript" type="text/javascript">
		
		function shangchuan()
 { 

     alert("1");
     //alert("username:"+<s:property value="#session.studentsUserInfo.getUsername()"></s:property>)
      var username="<s:property value="#session.upload.getUsername()"></s:property>"
     alert();
    // form_test1.countcheckbox.value=countCheck;
     //form_test1是表单名，countcheckbox是随便建个隐藏域的名。后台取这个隐藏域的数据就可以了
    alert("username:"+username);
    var title= document.getElementById("title").value;
    var workskeyword= document.getElementById("workskeyword").value;
    var worksdescribe= document.getElementById("worksdescribe").value;
    document.Upload_interface.action="Upload_one.action?title="+title+"&workskeyword="+workskeyword+"&worksdescribe="+worksdescribe+"&username="+username;
    alert("3");
    document.Upload_interface.submit();
    alert("4");

 }
		
	</script>
  </head>
  
  <body>
   

  	<div style="width:980px;height:473px;">
  	
  	<form  method="post" name="Upload_interface" enctype="multipart/form-data">
    <table id="reg_table" width="920px" border="0" cellspacing="0" cellpadding="0" style="margin-left:300px">
       
    
    		<th colspan="2" style="background-color:#a0c6ff;line-height:40px;color:white;font-size:16px;font-family:黑体;"> 
    			<h2>作品上传通道</h2>(注：*标识的为必填)</th>
    	

    		<tr><td width=200 >作品上传：*</td><td><input type="file" name=attach value="作品上传" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 上传作品的格式：doc、ppt、pdf、exe、txt、html、swf、jpg</td></tr>
            
    	<tr>
    		<td >输入作品标题：*</td>
    		<td><input type="text" name="title" id="title" size='50'/>
    		 </td>
    	</tr>

    	<tr>
    		<td >作品关键字<br></td>
    		<td><input size='50'type="text" name="workskeyword" id="workskeyword"/>
    		<span style="font-size:14px;">（多个关键字请用","分隔）</span></td>
    	</tr>
    	
    	<tr>
                <td >作品描述：</td>  <td align="center" valign="middle" ><div align="left" class="TreeViewlv2" style="padding-left:0px;">
                      <textarea name="worksdescribe" cols="80" rows="8" id="worksdescribe"></textarea>
                  </div></td></tr>
    			<tr>
    			<td>&nbsp;</td>
    			<td><div><input type="button" value="上传" onclick="shangchuan();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="history.go(-1)"/></div>
    			</td></tr>
    	  <tr><td colspan='2' style="color:249ad8">
       <h2>温馨提示：</h2><h3>&nbsp;&nbsp;&nbsp;  
           本上传通道是专用于教师或学生上传作品，首先您需要注册一个帐户用于你上传的通行证（务必请以真实信息进行注册），在得到通行证后登录到上传通道页面，选择要上传的文件，输入文件标题（必填），同时，您可以为您上传的文件添加文件描述和关键字描述。当确定所有信息填写正确后，请点击上传按钮。文件比较大时，上传可能需要较长的时间，请勿刷新，耐心等待&hellip;。如果在您的作品上传成功，会得到您上传的(作品名)作品已成功上传的提示和您上传作品的基本信息，如果在上传文件中出现问题，请及时与我们联系～</h3><h3>&nbsp;<br></h3><h3>&nbsp;&nbsp;&nbsp; 我们的联系方式是：电话：020-38773763      邮箱： zhzyk2013@163.com</h3><br><br>
          </td></tr>
    </table>
    </form>
    
    </div>
	
    		
    	
  
  </body>
</html>
