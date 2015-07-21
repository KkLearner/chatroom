package org.zhzyk_chatRoom.model;

import java.sql.Date;

public class UserInfo {
	private String nickName;
	private String userPassword;
	private String repeat_userPassword;
	private Date lastlogintime;
	private String role;
	private String lastchatroom;
	private String province;
	private String school;
	private String identity;
	private String sex;
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getRepeat_userPassword() {
		return repeat_userPassword;
	}
	public void setRepeat_userPassword(String repeatUserPassword) {
		repeat_userPassword = repeatUserPassword;
	}
	public Date getLastlogintime() {
		return lastlogintime;
	}
	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}
	
	public String getLastchatroom() {
		return lastchatroom;
	}
	public void setLastchatroom(String lastchatroom) {
		this.lastchatroom = lastchatroom;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public void setIdentity(String identity)
	{
		this.identity=identity;
	}
	public String getIdentity()
	{
		return this.identity;
	}
	public void setSex(String sex)
	{
		this.sex=sex;
	}
	public String getSex()
	{
		return this.sex;
	}
	
}
