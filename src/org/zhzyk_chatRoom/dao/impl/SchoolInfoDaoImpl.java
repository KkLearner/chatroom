package org.zhzyk_chatRoom.dao.impl;

import org.springframework.stereotype.Repository;

@Repository("schoolInfoDaoImpl")
public class SchoolInfoDaoImpl extends BaseDaoImpl {

	public SchoolInfoDaoImpl(){
		super("schoolInfo", "id", "theSchool");
	}
}
