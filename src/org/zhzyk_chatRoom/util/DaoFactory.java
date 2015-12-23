package org.zhzyk_chatRoom.util;

import org.zhzyk_chatRoom.dao.CKCDao;
import org.zhzyk_chatRoom.dao.impl.CKCDaoImpl;

public class DaoFactory {
	
	private static CKCDao ckcDao;
	
	static{
		ckcDao = new CKCDaoImpl();
	}
	public CKCDao getCKCDao(){
		
		return ckcDao;
	}
	
}
