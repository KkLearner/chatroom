package org.zhzyk_chatRoom.service;

import org.zhzyk_chatRoom.dao.MessageDao;
import org.zhzyk_chatRoom.dao.impl.MessageDaoImpl;
import org.zhzyk_chatRoom.model.MsgInfo;

public class chatRoomService {
	public boolean saveUser(MsgInfo msgInfo)
	{
		boolean flag=false;
		System.out.println("saveUser :"+msgInfo.getSchool());
		MessageDao md=new MessageDaoImpl();
		/*if(msgInfo.getChatRoom().equals("zhaoqing_nursery"))
		{
			msgInfo.setImage_url("images/zq_boy.jpg");
			flag=md.saveToDataBase(msgInfo);
			
		}else if(msgInfo.getChatRoom().equals("zhixin"))
		{
			msgInfo.setImage_url("images/zx_boy.gif");
			flag=md.saveToDataBase(msgInfo);
		}else if(msgInfo.getChatRoom().equals("yule"))
		{
			msgInfo.setImage_url("images/yl_girl.gif");
			flag=md.saveToDataBase(msgInfo);
		}else{
			flag=md.saveToDataBase(msgInfo);
		}*/
		flag=md.saveToDataBase(msgInfo);
		return flag;
	}

}
