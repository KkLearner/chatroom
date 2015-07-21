package org.zhzyk_chatRoom.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.zhzyk_chatRoom.model.UserInfo;
import org.zhzyk_chatRoom.service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserInfo userInfo;
	private HttpServletRequest request;
	public RegisterAction(){
		request=ServletActionContext.getRequest();
	}
	public void setUserInfo(UserInfo userInfo)
	{
		this.userInfo=userInfo;
	}
	public UserInfo getUserInfo()
	{
		return this.userInfo;
	}
	public String Register()
	{
		int row=0;
		UserService us=new UserService();
		row=us.saveUser(userInfo);
		String nickName=userInfo.getNickName();
		request.getSession().setAttribute("_USER", nickName);
		if(row!=0)
		{
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

}
