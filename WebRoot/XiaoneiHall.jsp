<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="java.sql.*,org.zhzyk_chatRoom.util.ConnectionFactory"%>
<%@ page import="java.sql.*,org.zhzyk_chatRoom.model.UserInfo"%>




 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>纵横手拉手聊天室</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:useBean id="userService" class="org.zhzyk_chatRoom.service.UserService"/> 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body,div,ul,ol,li,p,h1,h2,h3,h4,h5{margin:0px;padding:0px;}
		body{background:url(images/xiaonei_Hall.jpg) no-repeat;}
		#schools{width:500px;height:500px;margin:100px auto 0 auto;}
		#schools div.chat{width:160px;height:120px;float:left;cursor:pointer;}
		#schools div.chat img{margin:20px 0 0 45px;}
		#schools div.chat p{margin:0px 0 0 40px;font-size:15px;}
	</style>
	
	
	<script type="text/javascript">
	  function chating_one(){
	    	var school='<%=request.getParameter("theSchool")%>';
	    	window.location = "chating.action?theSchool="+school+"&chating=chating_one";
	    	
          }
	    function chating_two(){
	    	var school='<%=request.getParameter("theSchool")%>';
	    	window.location = "chating.action?theSchool="+school+"&chating=chating_two";
          
          }
	    function chating_three(){
	    	var school='<%=request.getParameter("theSchool")%>';
	    	window.location = "chating.action?theSchool="+school+"&chating=chating_three";
          
          }
	    function chating_four(){
	    	
	    	var school='<%=request.getParameter("theSchool")%>';
	    	
	    	window.location = "chating.action?theSchool="+school+"&chating=chating_four";
          
          }
	    function chating_five(){
	    	var school='<%=request.getParameter("theSchool")%>';
	    	window.location = "chating.action?theSchool="+school+"&chating=chating_five";
          
          }
	    function chating_six(){
	    	var school='<%=request.getParameter("theSchool")%>';
	    	window.location = "chating.action?theSchool="+school+"&chating=chating_six";
          
          }
	    function chating_seven(){
		    document.getElementById('hide').style.display='';
	    	//var school='<%=request.getParameter("theSchool")%>';
	    	//window.location = "chating.action?theSchool="+school+"&chating=chating_seven";
          
          }
        function chating_eight(){
        	window.location = "upload.jsp";
            
            }
        
      function hidea(){
          document.getElementById('hide').style.display='none';
  	}
  	function hideb(){
  		if(document.getElementById("pass").value=="zhzyk"){
                var school='<%=request.getParameter("theSchool")%>';
  	    	  window.location = "chating.action?theSchool="+school+"&chating=chating_seven";
              }
  		else{alert("验证码有误！");
      		}
      	}
	   
	</script>
  </head>
  
  <body>

    
     <div id="schools">
          <div class="chat" onclick="chating_one();">
             <img src="images/xuesheng.png">
             <p>学生聊天室1</p>
          </div>
          
          <div class="chat" onclick="chating_two();">
             <img src="images/xuesheng.png">
             <p>学生聊天室2</p>
          </div>
          
          <div class="chat" onclick="chating_three();">
             <img src="images/xuesheng.png">
             <p>学生聊天室3</p>
          </div>
          
          <div class="chat" onclick="chating_four();">
             <img src="images/xuesheng.png">
             <p>学生聊天室4</p>
          </div>
          
          <div class="chat" onclick="chating_five();">
             <img src="images/jiaoshi.png">
             <p style="margin:0px 0 0 30px;">师生互动聊天室1</p>
          </div>
          
          <div class="chat" onclick="chating_six();">
             <img src="images/jiaoshi.png">
             <p style="margin:0px 0 0 30px;">师生互动聊天室2</p>
          </div>
          
          <div class="chat" onclick="chating_seven();">
             <img src="images/jiaoshi.png">
             <p>专家聊天室</p>
          </div>
          
          <div class="chat" onclick="chating_eight();">
             <img src="images/jiaoshi.png">
             <p style="position:relative;left:10px;">上传作业</p>
          </div>
          
         <div id="hide"  style="display:none;background:#FFFFFF;width:180px;height:120px;position:absolute;left:550px;top:250px;">
             <img src="images/hide_bg.jpg" style="position:absolute;top:0px;left:0px; width:180px;height:25px;"/>
             <p style="position:absolute;top:5px;left:10px;">请填写您的专家验证码</p>
             <input id="pass" style="position:absolute;top:40px;left:15px;width:150px;height:25px;"  type="text"/>
             <input style="position:absolute;top:75px;left:28px;width:50px;height:22px;"  type="submit" value="取消" onclick="hidea();"/>
             <input style="position:absolute;top:75px;left:100px;width:50px;height:22px;"  type="submit" value="提交"onclick="hideb();"/>
         </div> 

     </div>
     
     
    
    
  </body>
</html>
