package org.zhzyk_chatRoom.dao;

import org.zhzyk_chatRoom.model.CKC;
import org.zhzyk_chatRoom.model.Page;

public interface CKCDao {
	
	/**
	 * ∑÷“≥ªÒ»°CKC
	 * @param page
	 * @param tableName 
	 * @param code
	 * @return
	 */
	public abstract Page<CKC> getCKC(Page<CKC> page, String tableName, String code);
}
