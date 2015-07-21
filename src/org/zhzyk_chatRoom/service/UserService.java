package org.zhzyk_chatRoom.service;

import org.zhzyk_chatRoom.dao.UserDao;
import org.zhzyk_chatRoom.dao.impl.UserDaoImpl;
import org.zhzyk_chatRoom.model.UserInfo;

public class UserService {
	UserDao ud=new UserDaoImpl();
	public boolean checkUserName(String username,String password){
		UserInfo userInfo=new UserInfo();
		userInfo=ud.findUserByName(username);
		if(userInfo.getUserPassword().equals(password))
		{
			return true;
		}else{
			return false;
		}		
	}
	
	public int getSum_User(String chatRoom){
		return ud.countUser(chatRoom);	
	}
	public boolean addUser(String userName,String chatRoom)
	{
		return ud.addOnlineUser(userName, chatRoom);
	}
	public int saveUser(UserInfo userInfo)
	{
		return ud.saveUserInfo(userInfo);
	}

}
