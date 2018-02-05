package org.zhzyk_chatRoom.dao.impl;

import org.springframework.stereotype.Repository;
import org.zhzyk_chatRoom.dao.CKCDao;

@Repository("cKCDaoImpl")
public class CKCDaoImpl extends BaseDaoImpl implements CKCDao{

	public CKCDaoImpl() {
		// TODO 锟皆讹拷锟斤拷锟缴的癸拷锟届函锟斤拷锟斤拷锟�
		super("td_ckc_jt", "id","word");
	}
}
