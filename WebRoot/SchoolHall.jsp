<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ݺ�������������</title>
    
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
		body{background:url(images/schoolhall.jpg) no-repeat;}
		#schools{width:1100px;height:500px;margin:100px auto 0 auto;overflow-y:scroll;}
		#schools div.school{width:150px;height:120px;float:left;cursor:pointer;}
		#schools div.school img{margin:10px 0 0 35px;}
		#schools div.school p{margin:0px 0 0 40px;font-size:15px;}
	</style>
	<script type="text/javascript">
        function a(){window.location = "XiaoneiHall.jsp?theSchool=beijing_one";}
        function b(){window.location = "XiaoneiHall.jsp?theSchool=beijing_two";}
        function c(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_one";}
        function d(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_two";}
        function e(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_three";}
        function f(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_four";}
        function g(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_five";}
        function h(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_six";}
        function i(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_seven";}
        function j(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_eight";}
        function k(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_nine";}
        function l(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_ten";}
        function m(){window.location = "XiaoneiHall.jsp?theSchool=guangdong_eleven";}
        function n(){window.location = "XiaoneiHall.jsp?theSchool=guangxi_one";}
        function o(){window.location = "XiaoneiHall.jsp?theSchool=guangxi_two";}
        function p(){window.location = "XiaoneiHall.jsp?theSchool=guangxi_three";}
        function q(){window.location = "XiaoneiHall.jsp?theSchool=guangxi_four";}
        function r(){window.location = "XiaoneiHall.jsp?theSchool=guizhou_one";}
        function s(){window.location = "XiaoneiHall.jsp?theSchool=guizhou_two";}
        function t(){window.location = "XiaoneiHall.jsp?theSchool=guizhou_three";}
        function u(){window.location = "XiaoneiHall.jsp?theSchool=guizhou_four";}
        function v(){window.location = "XiaoneiHall.jsp?theSchool=guizhou_five";}
        function w(){window.location = "XiaoneiHall.jsp?theSchool=hunan_one";}
        function x(){window.location = "XiaoneiHall.jsp?theSchool=henan_one";}
        function y(){window.location = "XiaoneiHall.jsp?theSchool=henan_two";}
        function z(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_one";}
        function aa(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_two";}
        function bb(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_three";}
        function cc(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_four";}
        function dd(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_five";}
        function ee(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_six";}
        function ff(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_seven";}
        function gg(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_eight";}
        function hh(){window.location = "XiaoneiHall.jsp?theSchool=jiangsu_nine";}
        function ii(){window.location = "XiaoneiHall.jsp?theSchool=jiangxi_one";}
        function jj(){window.location = "XiaoneiHall.jsp?theSchool=jiangxi_two";}
        function kk(){window.location = "XiaoneiHall.jsp?theSchool=shanghai_one";}
        function ll(){window.location = "XiaoneiHall.jsp?theSchool=shanghai_two";}
        function mm(){window.location = "XiaoneiHall.jsp?theSchool=shanghai_three";}
        function nn(){window.location = "XiaoneiHall.jsp?theSchool=shanghai_four";}
        function oo(){window.location = "XiaoneiHall.jsp?theSchool=shanxi_one";}
        function pp(){window.location = "XiaoneiHall.jsp?theSchool=shandong_one";}
        function qq(){window.location = "XiaoneiHall.jsp?theSchool=sicuan_one";}
        function rr(){window.location = "XiaoneiHall.jsp?theSchool=tianjin_one";}
        function ss(){window.location = "XiaoneiHall.jsp?theSchool=xianggan_one";}
        function tt(){window.location = "XiaoneiHall.jsp?theSchool=xianggan_two";}
        function uu(){window.location = "XiaoneiHall.jsp?theSchool=xianggan_three";}
        function vv(){window.location = "XiaoneiHall.jsp?theSchool=xianggan_four";}
        function ww(){window.location = "XiaoneiHall.jsp?theSchool=xianggan_five";}
        function xx(){window.location = "XiaoneiHall.jsp?theSchool=xianggan_six";}
        
        
    </script>
  </head>
  
  <body>
     <div id="schools">
          <div class="school" onclick="a();">
             <img src="images/schoolonly.png">
             <p>�������������׶�԰</p>
          </div>
          
          <div class="school" onclick="b();">
             <img src="images/schoolonly.png">
             <p>������̨����һ�׶�԰</p>
          </div>
     
          <div class="school" onclick="c();">
             <img src="images/schoolonly.png">
             <p>�����к���������·Сѧ</p>
          </div>
          
          <div class="school" onclick="d();">
             <img src="images/schoolonly.png">
             <p>�����к�����֪��Сѧ</p>
          </div>
          
          <div class="school" onclick="e();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ������ֱ�����ص�һ�׶�԰</p>
          </div>
          
          <div class="school" onclick="f();">
             <img src="images/schoolonly.png">
             <p>�㶫ʵ����ѧ�Ϻ�ѧУ</p>
          </div>
          
          <div class="school" onclick="g();">
             <img src="images/schoolonly.png">
             <p>�㶫ʵ����ѧ</p>
          </div>
          
          <div class="school" onclick="h();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ����������������·Сѧ</p>
          </div>
          
          <div class="school" onclick="i();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ������������ʵ��ѧУ</p>
          </div>
          
          <div class="school" onclick="j();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ����������׶�԰</p>
          </div>
          
          <div class="school" onclick="k();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ��������Ӣ�ڶ��׶�԰</p>
          </div>
          
          <div class="school" onclick="l();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ�����н�ɽʵ��ѧУ</p>
          </div>
     
          <div class="school" onclick="m();">
             <img src="images/schoolonly.png">
             <p>�㶫ʡ������������������ѧ</p>
          </div>
          
          <div class="school" onclick="n();">
             <img src="images/schoolonly.png">
             <p>����׳������������������Сѧ</p>
          </div>
          
          <div class="school" onclick="o();">
             <img src="images/schoolonly.png">
             <p>����׳�������������е������վ</p>
          </div>
          
          <div class="school" onclick="p();">
             <img src="images/schoolonly.png">
             <p>����׳��������������������ѧ</p>
          </div>
          
          <div class="school" onclick="q();">
             <img src="images/schoolonly.png">
             <p>���������б���������Χ����ȫСѧ</p>
          </div>
          
          <div class="school" onclick="r();">
             <img src="images/schoolonly.png">
             <p>����ʡ��˳ѧԺ</p>
          </div>
          
          <div class="school" onclick="s();">
             <img src="images/schoolonly.png">
             <p>����ʡ��˳���������߼���ѧ</p>
          </div>
          
          <div class="school" onclick="t();">
             <img src="images/schoolonly.png">
             <p>����ʡ��˳�н�����ѧ�о���</p>
          </div>
          
          <div class="school" onclick="u();">
             <img src="images/schoolonly.png">
             <p>����ʡ��˳�������ؽ���������ѧУ</p>
          </div>
          
          <div class="school" onclick="v();">
             <img src="images/schoolonly.png">
             <p>����ʡ��˳�еھ�Сѧ</p>
          </div>
     
          <div class="school" onclick="w();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����Ƽ���ѧ��һ�׶�԰</p>
          </div>
          
          <div class="school" onclick="x();">
             <img src="images/schoolonly.png">
             <p>����ʡ������ʵ��Сѧ</p>
          </div>
          
          <div class="school" onclick="y();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����ж���Сѧ</p>
          </div>
          
          <div class="school" onclick="z();">
             <img src="images/schoolonly.png">
             <p>����ʡ��ͨ�к�����ʦ����ѧУ����Сѧ</p>
          </div>
          
          <div class="school" onclick="aa();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����й�ҵ԰���Ǹ�ѧУ</p>
          </div>
          
          <div class="school" onclick="bb();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����й�ҵ԰������ѧУ</p>
          </div>
          
          <div class="school" onclick="cc();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����е�����ѧ</p>
          </div>
          
          <div class="school" onclick="dd();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����н�������ѧУ</p>
          </div>
          
          <div class="school" onclick="ee();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����еڶ�ʮ����ѧУ</p>
          </div>
          
          <div class="school" onclick="ff();">
             <img src="images/schoolonly.png">
             <p>����ʡ�����д���Ǌ������СѧУ</p>
          </div>
     
          <div class="school" onclick="gg();">
             <img src="images/schoolonly.png">
             <p>����ʡ������ƽ����ѧ</p>
          </div>
          
          <div class="school" onclick="hh();">
             <img src="images/schoolonly.png">
             <p>����ʡ������ʦѧԺ</p>
          </div>
          
          <div class="school" onclick="ii();">
             <img src="images/schoolonly.png">
             <p>����ʡ�ϲ���ԥ��Сѧ</p>
          </div>
          
          <div class="school" onclick="jj();">
             <img src="images/schoolonly.png">
             <p>����ʡȫ���صڶ�Сѧ</p>
          </div>
          
          <div class="school" onclick="kk();">
             <img src="images/schoolonly.png">
             <p>�Ϻ��е�һ����ѧУ</p>
          </div>
          <div class="school" onclick="ll();">
             <img src="images/schoolonly.png">
             <p>�Ϻ��з���������Сѧ</p>
          </div>
          <div class="school" onclick="mm();">
             <img src="images/schoolonly.png">
             <p>�Ϻ��з���������Сѧ</p>
          </div>
          <div class="school" onclick="nn();">
             <img src="images/schoolonly.png">
             <p>�Ϻ��з������𶹶��׶�԰</p>
          </div>
          
          <div class="school" onclick="oo();">
             <img src="images/schoolonly.png">
             <p>ɽ��ʡ���еڶ��׶�԰</p>
          </div>
          
          <div class="school" onclick="pp();">
             <img src="images/schoolonly.png">
             <p>ɽ��ʡ��̨����ɽСѧ</p>
          </div>
          
          <div class="school" onclick="qq();">
             <img src="images/schoolonly.png">
             <p>�Ĵ�ʡ�ɶ�����Ȫ����ʵ��Сѧ</p>
          </div>
          
          
          <div class="school" onclick="rr();">
             <img src="images/schoolonly.png">
             <p>����м��ر�ɽСѧ</p>
          </div>
          
          <div class="school" onclick="ss();">
             <img src="images/schoolonly.png">
             <p>��۾��������Ż������ƽСѧ</p>
          </div>
          
          <div class="school" onclick="tt();">
             <img src="images/schoolonly.png">
             <p>����ʼ�ҽԺ�ڶ���ѧ</p>
          </div>
          
          <div class="school" onclick="uu();">
             <img src="images/schoolonly.png">
             <p>�������Сѧ</p>
          </div>
          
          <div class="school" onclick="vv();">
             <img src="images/schoolonly.png">
             <p>�������Сѧ�׶�԰</p>
          </div>
     
          <div class="school" onclick="ww();">
             <img src="images/schoolonly.png">
             <p>����ʼ�ҽԺ�޳ɳ�˼Сѧ</p>
          </div>
          
          <div class="school" onclick="xx();">
             <img src="images/schoolonly.png">
             <p>���ɳ�����㹫ѧ</p>
          </div>
          
          

     </div>
    
    
    
  </body>
</html>
