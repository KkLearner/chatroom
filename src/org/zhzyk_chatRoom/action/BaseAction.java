package org.zhzyk_chatRoom.action;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.zhzyk_chatRoom.service.CKCService;
import org.zhzyk_chatRoom.service.SchoolInfoService;
import org.zhzyk_chatRoom.service.UserService;
import org.zhzyk_chatRoom.service.chatRoomService;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware,SessionAware{

	@Autowired
	protected chatRoomService chatRoomService;
	@Autowired
	protected CKCService ckcService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected SchoolInfoService schoolInfoService;
	
	protected HttpServletRequest request;
	protected Map<String, Object> session;
	
	public BaseAction(){
		super();
		chatRoomService=new chatRoomService();
		ckcService=new CKCService();
		userService=new UserService();
		schoolInfoService=new SchoolInfoService();
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request=arg0;
		
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session=arg0;
		
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}
	
}
