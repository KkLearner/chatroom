package org.zhzyk_chatRoom.database;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class DBManager {
	
	private static volatile DBManager dbManager;//������
	
	private ArrayList<DBConnectPool> pools;//����Դ����
	
	private Map<String, Integer> nameIndex;
	
	private String filePath="/config/jdbc.properties";//�����ļ���ַ 
	
	private DBManager(){
		initByConfigFile();
	}
	
	public static DBManager getInstance() {
		
				if(dbManager==null)
					dbManager=new DBManager();
			
		
		return dbManager;
	}
	
	//ͨ��������ȡ����Դ
	public DBConnectPool getDBConnectionByIndex(int index) {
		if(index>=pools.size())
			return null;
		return pools.get(index);
	}
	
	//ͨ������Դ���ƻ�ȡ����Դ
	public DBConnectPool getDBConnectionByName(String name) {
		if(!nameIndex.containsKey(name))
			return null;
		return getDBConnectionByIndex(nameIndex.get(name));
	}
	
	//�ͷ���������Դ
	public void releaseAll(){
		for(DBConnectPool dbConnectPool:pools){
			try {
				dbConnectPool.releaseAll();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//ͨ�������ļ���ʼ������Դ�����Զ������Դ
	private synchronized void initByConfigFile() {
		if(pools==null)
			pools=new ArrayList<DBConnectPool>();
		pools.clear();
		if(nameIndex==null)
			nameIndex=new HashMap<String, Integer>();
		nameIndex.clear();
		try {
			Properties properties=new Properties();
			InputStream inputStream=new BufferedInputStream(this.getClass().getResourceAsStream(filePath));
			properties.load(inputStream);
			Set<String> keys=properties.stringPropertyNames();
			DBConfig dbConfig=new DBConfig();
			Class<DBConfig> dbClass=DBConfig.class;
			for(String key:keys){
				Field field=dbClass.getDeclaredField(key);
				field.setAccessible(true);
				Class<?> type=field.getType();
				if(type==Integer.class)
					field.set(dbConfig,Integer.valueOf(properties.getProperty(key)));
				else if(type==Boolean.class)
					field.set(dbConfig, Boolean.valueOf(properties.getProperty(key)));
				else
					field.set(dbConfig, properties.getProperty(key));
			}
			DBConnectPool dbConnectPool=new DBConnectPool(dbConfig);
			dbConnectPool.init();
			pools.add(dbConnectPool);
			nameIndex.put(dbConfig.dbName, pools.size()-1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
