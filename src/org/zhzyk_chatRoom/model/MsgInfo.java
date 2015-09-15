package org.zhzyk_chatRoom.model;

import java.sql.Date;

public class MsgInfo {
	private int id;
	private String chatRoom;
	private String msgFrom;
	private String msgTo;
	private String school;
	private String chatroom;
	private Date chattime;
	private String msgContent;
	private String chatAction;
	private int secret;
	private String image_url;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getChatRoom() {
		return chatRoom;
	}
	public void setChatRoom(String chatRoom) {
		this.chatRoom = chatRoom;
	}
	public String getMsgFrom() {
		return msgFrom;
	}
	public void setMsgFrom(String msgFrom) {
		this.msgFrom = msgFrom;
	}
	public String getMsgTo() {
		return msgTo;
	}
	public void setMsgTo(String msgTo) {
		this.msgTo = msgTo;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getChating() {
		return chatroom;
	}
	public void setChating(String chatroom) {
		this.chatroom = chatroom;
	}
	public Date getChattime() {
		return chattime;
	}
	public void setChattime(Date chattime) {
		this.chattime = chattime;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent){
		 
		if(msgContent.contains("<%")){
			msgContent =msgContent.replace("<%", "&#60;%");
		}
		 
		this.msgContent = msgContent;
	}
	public String getChatAction() {
		return chatAction;
	}
	public void setChatAction(String chatAction) {
		this.chatAction = chatAction;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public void setImage_url(String image_url)
	{
		this.image_url=image_url;
	}
	public String getImage_url()
	{
		return this.image_url;
	}

}
