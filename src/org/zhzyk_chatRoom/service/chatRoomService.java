package org.zhzyk_chatRoom.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("chatRoomService")
public class chatRoomService extends BaseService{
	
	public chatRoomService(){
		super();
	}
	
	public boolean saveUser(Map<String, Object>map){
		boolean flag=false;	
		Date date=new Date();
		map.put("chattime",date);
		if(messageDao.insert(map)<=0)
			return false;
		List<Object> param=new ArrayList<>();
		param.add(map.get("msgFrom"));
		param.add(map.get("theSchool"));
		param.add(map.get("chating"));
		if(onlineUser.getCount(null, "nickName=? and ? in (SELECT theSchool from onlineuser)  and ? in (SELECT chating from onlineuser)", null, param)>0)
			return true;
		map.put("nickName", map.get("msgFrom"));
		map.put("lastchattime", date);
		if(onlineUser.insert(map)>0)
			flag=true;
		return flag;
	}
	
	public List<Map<String, Object>> getChattingData(String theSchool,String chating) {
		return messageDao.getList(null, null, "theSchool='"+theSchool+"' and chating='"+chating+"'", "chattime asc", null, null);
	}

}
