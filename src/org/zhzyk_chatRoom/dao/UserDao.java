package org.zhzyk_chatRoom.dao;

import org.zhzyk_chatRoom.model.UserInfo;

public interface UserDao{
	public UserInfo findUserByName(String username);
	public int countUser(String chatRoom);
	public boolean addOnlineUser(String userName,String chatRoom);
	public boolean denyUser(String userName,String chatRoom);
	public void logout(String userName);
	public void changeRoom(String userName,String chatRoom);
	public boolean checkAdmin(String userName);
	public void kickUser(String userName,String chatRoom);
	public void deleteUser(String userName);
	public int saveUserInfo(UserInfo userInfo);

}
