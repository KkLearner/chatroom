package org.zhzyk_chatRoom.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.zhzyk_chatRoom.model.CKC;
import org.zhzyk_chatRoom.model.Page;
import org.zhzyk_chatRoom.service.CKCService;

public class CKCServiceTest {

	@Test
	public void testGetCKCpage() {
		
		Page<CKC> page = new Page<CKC>(1);
		page.setPageSize(100);
		System.out.println(new CKCService().getCKCpage(page, "", false));
		 
	}

}
