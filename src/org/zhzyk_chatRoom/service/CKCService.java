package org.zhzyk_chatRoom.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zhzyk_chatRoom.database.Page;

@Service("CKCService")
public class CKCService extends BaseService {
	
	private static final String ftTable = " td_ckc_ft ";
	private static final String jtTable = " td_ckc_jt ";
	
	public CKCService(){
		super();
	}
	
	/**
	 * 
	 * @param page
	 * @param ckcCode
	 * @param jfFlag  jfFlag = flase ���壬  jfFlag = true ����
	 * @return
	 */
	public Page getCKC(String ckcCode, boolean isFT,Integer start,Integer count){		
		String tableName = jtTable;
		if(isFT)
			tableName = ftTable;
		return ckcDao.getPage("word,ckcCode", tableName, "ckcCode like '"+ckcCode+"%'", "ckcCode asc", null, start, count, null);
	}
	
}
