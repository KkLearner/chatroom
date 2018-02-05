package org.zhzyk_chatRoom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zhzyk_chatRoom.dao.impl.CKCDaoImpl;
import org.zhzyk_chatRoom.dao.impl.MessageDaoImpl;
import org.zhzyk_chatRoom.dao.impl.OnlineUserImpl;
import org.zhzyk_chatRoom.dao.impl.SchoolInfoDaoImpl;
import org.zhzyk_chatRoom.dao.impl.UserDaoImpl;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class BaseService {

	@Autowired
	protected CKCDaoImpl ckcDao;
	@Autowired
	protected MessageDaoImpl messageDao;
	@Autowired
	protected UserDaoImpl userDao;
	@Autowired
	protected OnlineUserImpl onlineUser;
	@Autowired
	protected SchoolInfoDaoImpl schoolInfoDaoImpl;
	
	public BaseService(){
		super();
		ckcDao=new CKCDaoImpl();
		messageDao=new MessageDaoImpl();
		userDao=new UserDaoImpl();
		onlineUser=new OnlineUserImpl();
		schoolInfoDaoImpl=new SchoolInfoDaoImpl();
	}
	
	
}
