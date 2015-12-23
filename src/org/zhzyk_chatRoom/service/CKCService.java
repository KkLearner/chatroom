package org.zhzyk_chatRoom.service;

import org.zhzyk_chatRoom.model.CKC;
import org.zhzyk_chatRoom.model.Page;
import org.zhzyk_chatRoom.util.DaoFactory;
import org.zhzyk_chatRoom.util.Factory;

public class CKCService {
	
	private static final String ftTable = " td_ckc_ft ";
	private static final String jtTable = " td_ckc_jt ";
	
	
	/**
	 * 
	 * @param page
	 * @param ckcCode
	 * @param jfFlag  jfFlag = flase ·±Ìå£¬  jfFlag = true ¼òÌå
	 * @return
	 */
	public Page<CKC> getCKCpage(Page<CKC>page, String ckcCode, boolean isFT){
		
		String tableName = jtTable;
		if(isFT){
			tableName = ftTable;
		}
		
		page = Factory.getDaoFactory().getCKCDao().getCKC(page, tableName, ckcCode);
		
		return page;
	}
	
}
