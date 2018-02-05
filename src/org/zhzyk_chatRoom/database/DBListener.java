package org.zhzyk_chatRoom.database;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.mysql.jdbc.*;

public class DBListener implements ServletContextListener{

	static final String mysql="com.mysql.jdbc.Driver";	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO 自动生成的方法存根
		DBManager.getInstance().releaseAll();
		ClassLoader classLoader=Thread.currentThread().getContextClassLoader();
		Enumeration<Driver> dEnumeration=DriverManager.getDrivers();
		while(dEnumeration.hasMoreElements()){
			Driver driver=dEnumeration.nextElement();
			if(driver.getClass().getClassLoader()==classLoader){
				try {
					if(driver.getClass().getName().equals(mysql)){
						AbandonedConnectionCleanupThread.shutdown();
					}
					DriverManager.deregisterDriver(driver);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO 自动生成的方法存根
		DBManager.getInstance();
	}

	
}
