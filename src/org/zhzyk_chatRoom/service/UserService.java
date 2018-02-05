package org.zhzyk_chatRoom.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zhzyk_chatRoom.dao.UserDao;
import org.zhzyk_chatRoom.dao.impl.MessageDaoImpl;
import org.zhzyk_chatRoom.dao.impl.OnlineUserImpl;
import org.zhzyk_chatRoom.dao.impl.UserDaoImpl;

@Service("UserService")
public class UserService extends BaseService{
	
	public UserService(){
		super();
	}
	
	public boolean checkUserName(String account,String password){
		Map<String, Object> user=userDao.getByIdCode("nickName,userPassword,role",null, account, 1);
		if(user!=null&&user.get("userPassword").equals(password))
		{
			return true;
		}else{
			return false;
		}		
	}
	
	public long getSum_User(String chatRoom){
		return onlineUser.getCount(null, "chatRoom='"+chatRoom+"'", null, null);
	}
	
	public boolean addUser(String userName,String chatRoom){
		boolean flag=false;
		List<Object> param=new ArrayList<>();
		param.add(userName);
		param.add(chatRoom);
		if(onlineUser.getCount(null, "nickName=? and chatRoom=?", null, param)>0)
			return true;
		Map<String, Object> map=new HashMap<>();
		map.put("nickName", userName);
		map.put("chatRoom", chatRoom);
		if(onlineUser.insert(map)<=0)
			return false;
		flag=messageDao.userIntoMsg(userName, chatRoom)>0?true:false;
		return flag;
	}
	
	public int saveUser(Map<String, Object> map){
		return userDao.insert(map);
	}

	public boolean checkUser(String account) {
		return userDao.getCount(null, "account='"+account+"'", null, null)>0?true:false;
	}
	
	public List<Map<String, Object>> getRoomPeople(String theSchool,String chating) {
		return onlineUser.getList(null, null, "theSchool='"+theSchool+"' and chating='"+chating+"'", null, null, null);
	}
}
