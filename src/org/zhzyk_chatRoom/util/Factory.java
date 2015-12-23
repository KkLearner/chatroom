package org.zhzyk_chatRoom.util;

public class Factory {
	
	private static final DaoFactory DAO_FACTORY;
	
	  
	static{
		DAO_FACTORY = new DaoFactory();
		 
	}
	
	
	public static DaoFactory getDaoFactory(){
		return DAO_FACTORY;
	}
	
 
}
