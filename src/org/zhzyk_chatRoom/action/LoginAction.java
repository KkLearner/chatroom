package org.zhzyk_chatRoom.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.zhzyk_chatRoom.model.UserInfo;

public class LoginAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> flag;
	
	public String userLogin(){
		String account=request.getParameter("account");
		if(userService.checkUserName(account,request.getParameter("userPassword"))){
			session.put("_USER", account);
			return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	public String checkUser(){
		flag=new HashMap<>();
		flag.put("flag", userService.checkUser((String)request.getParameter("account")));
		return "check";
	}
	
	public String out() {
		if(session.get("_USER")!=null){
			session.clear();
		}
		return "out";
	}
	
	public Map<String, Object> getFlag() {
		return flag;
	}
	public void setFlag(Map<String, Object> flag) {
		this.flag = flag;
	}
	
}
