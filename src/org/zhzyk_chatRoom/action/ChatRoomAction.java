package org.zhzyk_chatRoom.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.zhzyk_chatRoom.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
public class ChatRoomAction extends ActionSupport{//�̳�actionsupport��
	/**
	 * 
	 */
	private static final long serialVersionUID = -1016254872883484599L;//���к�
	private HttpServletRequest request;
	public ChatRoomAction(){
		request=ServletActionContext.getRequest();
	}
	public String ChooseChatRoom()
	{
		UserService userService=new UserService();
		HttpSession session=request.getSession();
		String chatRoom = request.getParameter("chatRoom");
		request.getSession().setAttribute("_CHAT_ROOM",chatRoom);
		userService.addUser(session.getAttribute("_USER").toString(),chatRoom);
		return SUCCESS;
	}

}
