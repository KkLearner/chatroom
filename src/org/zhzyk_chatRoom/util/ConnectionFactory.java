package org.zhzyk_chatRoom.util;
import java.sql.*;

public class ConnectionFactory {
	private static Connection con;
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/chatroom?useUnicode=true&characterEncoding=utf-8";
	private static String userName = "root";
	private static String password = "123456";
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userName,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
