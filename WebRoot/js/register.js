/**
 * 
 */
//检查表单信息
 
function check(form){
	 var flag=true;
	 if(form.province.value==''){
		 alert("省份不能为空!");
		 form.province.focus();
		 flag=false;
	 }
	 else if(form.school.value==''){
		 alert("所属单位不能为空!");
		 form.school.focus();
		 flag=false;
	 }
	 else if(form.nickName.value==''){
		 alert("用户名称不能为空!");
		 form.nickName.focus();
		 flag=false;
    }else if(form.userPassword.value==''){
        alert("登录密码不能为空");
        form.userPassword.focus();
        flag=false;
    }else if(form.userPassword.value!=form.repeat_userPassword.value){
   	 alert("两次输入的密码不一样！");
   	 form.userPassword.focus();
	     flag=false;
	 }
	 return flag;
}

$("#submit").click(function(){
 	if(check(form1)){	
 		ajaxNoReturn($("#form1").serialize(),"Register.action","post",true,"",function(data){
 			window.location.href=data;
 		});
 	}
});


$("#account").change(function(){
	 checkUser($("#account").val(),2,test1);//common.js函数
});
