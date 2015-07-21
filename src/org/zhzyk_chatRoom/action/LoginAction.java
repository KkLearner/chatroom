package org.zhzyk_chatRoom.action;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.zhzyk_chatRoom.model.UserInfo;
import org.zhzyk_chatRoom.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserInfo userInfo;
	private HttpServletRequest request;
	public void setUserInfo(UserInfo userInfo)
	{
		this.userInfo=userInfo;
	}
	public UserInfo getUserInfo()
	{
		return this.userInfo;
	}
	public LoginAction(){
		request=ServletActionContext.getRequest();
	}
	public String UserLogin(){
		UserService us=new UserService();
		String nickName=userInfo.getNickName();
		String userPassword=userInfo.getUserPassword();
		//System.out.println(nickName+userPassword);
		boolean flag=us.checkUserName(nickName, userPassword);
		if(flag){
			request.getSession().setAttribute("_USER", nickName);
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

}
