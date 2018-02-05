package org.zhzyk_chatRoom.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import org.zhzyk_chatRoom.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class ChatRoomAction extends BaseAction{//�̳�actionsupport��
	/**
	 * 
	 */
	private static final long serialVersionUID = -1016254872883484599L;//���к�
	
	private List<Map<String, Object>> schoolInfo;
	private List<Map<String, Object>> data;
	private List<Map<String, Object>> roomMates;	

	public String ChooseChatRoom(){

		String chatRoom = (String)request.getParameter("chatRoom");
		session.put("_CHAT_ROOM",chatRoom);
		userService.addUser(session.get("_USER").toString(),chatRoom);
		return SUCCESS;
	}

	public String getSchools(){
		schoolInfo=schoolInfoService.getSchoolInfo();
		return "schools";
	}
	
	public String getChattingDatas(){
		data=chatRoomService.getChattingData(request.getParameter("theSchool"),request.getParameter("chating"));
		return "chattingData";
	}
	
	public String getRoomPeople(){
		roomMates=userService.getRoomPeople(request.getParameter("theSchool"),request.getParameter("chating"));
		return "roommates";
	}

	public List<Map<String, Object>> getSchoolInfo() {
		return schoolInfo;
	}

	public void setSchoolInfo(List<Map<String, Object>> schoolInfo) {
		this.schoolInfo = schoolInfo;
	}

	public List<Map<String, Object>> getData() {
		return data;
	}

	public void setData(List<Map<String, Object>> data) {
		this.data = data;
	}

	public List<Map<String, Object>> getRoomMates() {
		return roomMates;
	}

	public void setRoomMates(List<Map<String, Object>> roomMates) {
		this.roomMates = roomMates;
	}
	
}
