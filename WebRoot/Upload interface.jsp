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
  
    
    <title>��Ʒ�ϴ�ͨ��</title>
    
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
     //form_test1�Ǳ�����countcheckbox����㽨���������������̨ȡ�������������ݾͿ�����
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
       
    
    		<th colspan="2" style="background-color:#a0c6ff;line-height:40px;color:white;font-size:16px;font-family:����;"> 
    			<h2>��Ʒ�ϴ�ͨ��</h2>(ע��*��ʶ��Ϊ����)</th>
    	

    		<tr><td width=200 >��Ʒ�ϴ���*</td><td><input type="file" name=attach value="��Ʒ�ϴ�" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �ϴ���Ʒ�ĸ�ʽ��doc��ppt��pdf��exe��txt��html��swf��jpg</td></tr>
            
    	<tr>
    		<td >������Ʒ���⣺*</td>
    		<td><input type="text" name="title" id="title" size='50'/>
    		 </td>
    	</tr>

    	<tr>
    		<td >��Ʒ�ؼ���<br></td>
    		<td><input size='50'type="text" name="workskeyword" id="workskeyword"/>
    		<span style="font-size:14px;">������ؼ�������","�ָ���</span></td>
    	</tr>
    	
    	<tr>
                <td >��Ʒ������</td>  <td align="center" valign="middle" ><div align="left" class="TreeViewlv2" style="padding-left:0px;">
                      <textarea name="worksdescribe" cols="80" rows="8" id="worksdescribe"></textarea>
                  </div></td></tr>
    			<tr>
    			<td>&nbsp;</td>
    			<td><div><input type="button" value="�ϴ�" onclick="shangchuan();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="����" onclick="history.go(-1)"/></div>
    			</td></tr>
    	  <tr><td colspan='2' style="color:249ad8">
       <h2>��ܰ��ʾ��</h2><h3>&nbsp;&nbsp;&nbsp;  
           ���ϴ�ͨ����ר���ڽ�ʦ��ѧ���ϴ���Ʒ����������Ҫע��һ���ʻ��������ϴ���ͨ��֤�����������ʵ��Ϣ����ע�ᣩ���ڵõ�ͨ��֤���¼���ϴ�ͨ��ҳ�棬ѡ��Ҫ�ϴ����ļ��������ļ����⣨�����ͬʱ��������Ϊ���ϴ����ļ�����ļ������͹ؼ�����������ȷ��������Ϣ��д��ȷ�������ϴ���ť���ļ��Ƚϴ�ʱ���ϴ�������Ҫ�ϳ���ʱ�䣬����ˢ�£����ĵȴ�&hellip;�������������Ʒ�ϴ��ɹ�����õ����ϴ���(��Ʒ��)��Ʒ�ѳɹ��ϴ�����ʾ�����ϴ���Ʒ�Ļ�����Ϣ��������ϴ��ļ��г������⣬�뼰ʱ��������ϵ��</h3><h3>&nbsp;<br></h3><h3>&nbsp;&nbsp;&nbsp; ���ǵ���ϵ��ʽ�ǣ��绰��020-38773763      ���䣺 zhzyk2013@163.com</h3><br><br>
          </td></tr>
    </table>
    </form>
    
    </div>
	
    		
    	
  
  </body>
</html>
