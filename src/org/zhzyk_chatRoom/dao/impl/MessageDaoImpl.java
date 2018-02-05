package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.zhzyk_chatRoom.dao.MessageDao;
import org.zhzyk_chatRoom.model.MsgInfo;
import org.zhzyk_chatRoom.util.ConnectionFactory;

@Repository("messageDaoImpl")
public class MessageDaoImpl extends BaseDaoImpl implements MessageDao{
	
	public MessageDaoImpl(){
		super("msginfo_", "id", "chatRoom");
	}
	
	public Integer userIntoMsg(String userName,String chatRoom) {
		Map<String, Object> map=new HashMap<>();
		map.put("nickName", userName);
		map.put("chatRoom", chatRoom);
		map.put("msgFrom", "system notice");
		map.put("msgTo", "all people");
		map.put("chatTime", System.currentTimeMillis());
		map.put("msgContent", "<font color=green>"+userName+"</font>enter our chatroom.let us welcome him or her");
		return insert(map);
	}
	
}
