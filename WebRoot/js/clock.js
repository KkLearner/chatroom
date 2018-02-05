function showTime(clock){
	var now=new Date();
	clock.html(now.getFullYear()+"/"+now.getMonth()+"/"+now.getDate()+" "+
			now.getHours()+":"+now.getMinutes()+":"+now.getSeconds());
}

$(document).ready(function(){
	window.setInterval("showTime($('#clock'))",1000);
})