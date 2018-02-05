<%@ page language="java" pageEncoding="UTF-8"%>
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
		<option value="F001">--选择--
		</option>
		<option selected="selected" value="F001">弟子規
		</option>
	</select>
		 &nbsp;
		 &nbsp;
		<input id="ftFlag" type="radio" checked="checked" name="jfFlag"/>繁體
		<!--
	&nbsp;
		<input id="jtFlag" type="radio" name="jfFlag"/>简体	 
		 -->
	</p>
	<p>
	  <input class="ckcInput" value="请输入纵横码" onfocus="if (value =='请输入纵横码'){value =''}" onblur="if (value ==''){value='请输入纵横码'}" id="ckcInput">
	  
	</p>
	<ul class="on_changes"></ul>			   
</div> 
<script src="${contextPath}/js/ckcInput.js" type="text/javascript"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	 $("#ckcInput").changeTips({
			divTip:".on_changes",
			contentInput:".content"
		}); 
	getCKCWord(1, 0, 0,1);
	  
 });
</script>

