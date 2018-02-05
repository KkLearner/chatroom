<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ include file="/../common.jsp"%>
<html>
<head>
 	<title>纵横手拉手聊天室</title>
 	<script type="text/javascript">
 		function checkFile(){
 			if(document.forms[0].attach.value==''){
 				alert("请选择要上传的文件");
 				return false;
 			}
 			return true;
 		}
 	</script>
</head>
<body style="background:url('${contextPath}/images/bg.gif')">
	<div style="width:500px;height:500px;margin:300px auto 0 auto;">
		<form  method="post"  action="${contextPath}/upload.action"  enctype="multipart/form-data" onsubmit="return checkFile()">
		       <input id="attach" type="file" name="attach" value="上传作业(最大上传20m)" />
		       <input id="submit" type="submit"  value="确定" />
	     </form>
	     <button style="margin:0 auto 0 auto;" onclick="location='${contextPath}/SchoolHall.jsp'" >返回</button>
	</div>
</body>
</html>