<%@ page language="java" contentType="text/html; charset=GBK"
pageEncoding="GBK"
%>  

<%
String school2 = request.getParameter("theSchool") ;
if(school2!= null && school2.contains("xianggan")){
 
%>
 
<style>
 .ckcInput{
 width: 400px; 
 height: 30px;
 }
 .ckcInputDiv{
  margin:5px;
  width:620px;
  height: 180px; 
  text-align:left; 
  font-size:18px; 
 }
  .ckcInputDiv p{
  margin: 5px;
  }
  
  	
 .on_changes{width:300px; top:-10px; list-style:none; background:#FFE; display:none; padding:10px;}
.on_changes li{margin:0px;padding:4px;}
 .on_changes li.active{ background:#CEE7FF;}
</style>
<div class="ckcInputDiv" >
	<p>
	<select>
		<option value="F001">--Ñ¡Ôñ--
		</option>
		<option selected="selected" value="F001">µÜ×ÓÒŽ
		</option>
	</select>
		 &nbsp;
		 &nbsp;
		<input id="ftFlag" type="radio" checked="checked" name="jfFlag"/>·±ów
		<!--
	&nbsp;
		<input id="jtFlag" type="radio" name="jfFlag"/>¼òÌå	 
		 -->
	</p>
	<p>
	  <input class="ckcInput" value="ÇëÊäÈë×ÝºáÂë" onfocus="if (value =='ÇëÊäÈë×ÝºáÂë'){value =''}" onblur="if (value ==''){value='ÇëÊäÈë×ÝºáÂë'}" id="ckcInput">
	  
	</p>
	<ul class="on_changes">
           
		</ul>			   
</div>
 
<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="js/ckcInput.js" type="text/javascript"></script>
 <script type="text/javascript">
 
 $(document).ready(function(){
	 $("#ckcInput").changeTips({
			divTip:".on_changes",
			contentInput:".content"
		}); 
	getCKCWord(1, 0, 1);
	  
 });
 
   
 
</script>

<%
}
%>
