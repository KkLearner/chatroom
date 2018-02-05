/**
 * 
 */
$(document).ready(function(){ 
	ajaxJsonReturn("",rootPath+"/chatRoom-getSchools.action","get",true,"",function(data){
		var schools=$("#schools");
		var content='';
		if(data.length>0){
			$.each(data,function(index,map){
				content+='<div class="school" onclick="location=\'XiaoneiHall.jsp?theSchool='+map.theSchool+'\'">';
				content+='<img src="images/schoolonly.png'+'">';
				content+='<p>'+map.schoolName+'</p></div>';

			});
		}
		else{
			content='<div style="margin:0 auto">暂无学校</div>';
		}
		schools.html(content);
	});
}); 