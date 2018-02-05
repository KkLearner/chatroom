/**
 * 
 */
 function check(form){	 
	 if(form.account.value==''){
		 alert("账号不能为空!");
		 form.account.focus();
		 return false;
	 }
	 else if(form.userPassword.value==''){
		 alert("登录密码不能为空");
		 form.userPassword.focus();
		 return false;
	 }
	 return true;
}    
	

 $("#account").change(function(){
 	checkUser($("#account").val(),1,test1);//common.js函数
 });

 
 $("#form1").submit(function(){
	 return check(form1);
});
