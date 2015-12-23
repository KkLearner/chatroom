// JavaScript Document
function getCKCWord(value,code, jf, num){//根据纵横码获取扩展字  
    var params = {
       ckcCode : code,
       jfFlag : jf,
       pageNo : num 
    };
	$.ajax({
	type: "POST",
	url: "ckcQuery.jsp",
	data: params,
	dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	  success: function(json){ 
		  var result = $.parseJSON(json);  //使用这个方法解析json
		  
		  //显示结果
		  for(var i=0; i< result.length; i++){
			  
			  $(value.divTip).append('<li value='+result[i].data+'>'+ result[i].value +'</li>');
			  
		  } 
		   
	  },
	  error: function(json){
	   alert("json=" + json);
	   return false;
	  }
	});       
}


(function($){
	$.fn.extend({
		"changeTips":function(value){
			value = $.extend({
				divTip:"",
				contentInput:""
			},value)
			
			var $this = $(this);
			var indexLi = 0;
			
			var timer; //定时器
			//点击document隐藏下拉层
			$(document).click(function(event){
				if($(event.target).attr("class") == value.divTip || $(event.target).is("li")){
					var liVal = $(event.target).text().split(": ")[1];
					$this.val("");
					if(typeof(liVal)=='undefined'){ 
						 
					}else{
						$(value.contentInput).focus()
						$(value.contentInput).val($(value.contentInput).val()+liVal); 
						$(value.divTip).find("li").remove();
					} 
					blus();
				}else{
					clearTimeout(timer);
					blus();
				}
			})
			
			//隐藏下拉层
			function blus(){
				$(value.divTip).hide();
				 
			}
			  
			//键盘上下执行的函数
			function keychang(up){
				if(up == "up"){
					if(indexLi == 0){
						indexLi = $(value.divTip).children().length-1;
					}else{
						indexLi--;
					}
				}else{
					if(indexLi ==  $(value.divTip).children().length-1){
						indexLi = 0;
					}else{
						indexLi++;
					}
				}
				$(value.divTip).children().eq(indexLi).addClass("active").siblings().removeClass();	
			}
			
			//值发生改变时
			function valChange(){
				var tex = $this.val();//输入框的值
				
				//让提示层显示，并对里面的LI遍历
				if($this.val()==""){
					$(value.divTip).find("li").remove();
					blus();
				}else{	
					$(value.divTip).find("li").remove();
					clearTimeout(timer);
					timer =setTimeout(function(){getCKCWord(value, tex, 0, 0);},500)
					$(value.divTip).show();
				}	
			}
			
			
			//输入框值发生改变的时候执行函数，这里的事件用判断处理浏览器兼容性;
			if($.browser.msie){
				$(this).bind("propertychange",function(){
					valChange();
				})
			}else{
				$(this).bind("input",function(){
					valChange();
				})
			}
			

			//鼠标点击和悬停LI
			$(value.divTip).children().
			hover(function(){
				indexLi = $(this).index();//获取当前鼠标悬停时的LI索引值;
				if($(this).index()!=0){
					$(this).addClass("active").siblings().removeClass();
				}	
			})
					
		   
			//按键盘的上下移动LI的背景色
			$this.keydown(function(event){
				if(event.which == 38){//向上
					keychang("up")
				}else if(event.which == 40){//向下
					keychang()
				}else if(event.which == 13){ //回车
					var liVal = $(value.divTip).children().eq(indexLi).text().split(": ")[1];
					$this.val("");
					if(typeof(liVal)=='undefined'){ 
						 
					}else{
						$(value.contentInput).focus()
						$(value.contentInput).val($(value.contentInput).val()+liVal); 
						
						$(value.divTip).find("li").remove();
					} 
					
					blus();
					 
					return false;
				}
			})				
		}	
	})	
})(jQuery)