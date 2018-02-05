package org.zhzyk_chatRoom.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtils {

	private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
	public static Connection getConn(String dbName) {
		try{
			return DBManager.getInstance().getDBConnectionByName(dbName).getConn();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static Connection getConn(int index) {
		try{
			return DBManager.getInstance().getDBConnectionByIndex(index).getConn();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void freeConn(int index,Connection conn) {
		DBManager.getInstance().getDBConnectionByIndex(index).freeConn(conn);
	}
	
	public static void freeConn(String dbName,Connection conn) {
		DBManager.getInstance().getDBConnectionByName(dbName).freeConn(conn);
	}
	
	static public List<Map<String, Object>> resultToList(ResultSet rSet) {
		ArrayList<Map<String, Object>> list = null;
		try {
			list = new ArrayList<Map<String, Object>>();
			ResultSetMetaData metaData = rSet.getMetaData();
			while (rSet.next()) {
				Map<String, Object> rMap = new HashMap<String, Object>();
				for (int i = 1; i <= metaData.getColumnCount(); i++) {
					Object val = rSet.getObject(i);
					if (val instanceof java.sql.Timestamp) {
						val = sdf.format(val);
					} else if (val instanceof java.sql.Date) {
						val = sdf2.format(val);
					}
					rMap.put(metaData.getColumnLabel(i), val);
				}
				list.add(rMap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Map<String, Object> getUnique(List<Map<String, Object>> list) {
		if(list!=null&&!list.isEmpty())
			return list.get(0);
		return null;
	}
	
	public static Integer getCount(List<Map<String, Object>> list) {
		return list!=null?list.size():0;
	}
}
