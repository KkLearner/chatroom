package org.zhzyk_chatRoom.dao.impl;

import org.springframework.stereotype.Repository;
import org.zhzyk_chatRoom.dao.OnlineUserDao;

@Repository("onlineUserImpl")
public class OnlineUserImpl extends BaseDaoImpl implements OnlineUserDao{

	public OnlineUserImpl() {
		super("onlineuser", "id", "nickName");
	}
}
