package org.zhzyk_chatRoom.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.zhzyk_chatRoom.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
public class ChatingAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1016254872883484599L;//���к�
	private HttpServletRequest request;
	public ChatingAction(){
		request=ServletActionContext.getRequest();
	}
	public String Chatting()
	{    
		UserService userService=new UserService();
		HttpSession session=request.getSession();
		 String chatRoom = request.getParameter("chatRoom");
		 String schooltoo=request.getParameter("theSchool");
 	     String chatroom=request.getParameter("chating");
 	     System.out.println(schooltoo);
  	     System.out.println(chatroom);
		 System.out.println(chatRoom);
		request.getSession().setAttribute("_CHAT_ROOM",chatRoom);
		request.getSession().setAttribute("theSchool", schooltoo);
		request.getSession().setAttribute("chating", chatroom);
		//userService.addUser(session.getAttribute("_USER").toString(),chatRoom);
		return SUCCESS;
	}

}