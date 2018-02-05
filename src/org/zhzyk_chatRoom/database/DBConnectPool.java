package org.zhzyk_chatRoom.database;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.LinkedList;
import java.util.logging.Logger;

import javax.sql.DataSource;

public class DBConnectPool implements DataSource {

	private LinkedList<Connection> frees;
	private LinkedList<Connection> all;
	private Integer busyNum;
	private DBConfig dbConfig;
	
	public DBConnectPool(DBConfig dbConfig) {
		// TODO 自动生成的构造函数存根
		busyNum=0;
		this.dbConfig=dbConfig;
		frees=new LinkedList<>();
		all=new LinkedList<>();
	}
	
	//初始化连接池
	public synchronized void init() throws ClassNotFoundException,SQLException{
		Class.forName(dbConfig.dirverClass);
		int max=Math.min(dbConfig.initConn,dbConfig.maxConn);
		for(int i=0;i<max;++i){
			frees.add(newConnection());
		}
	}
	
	//新建连接
	private synchronized Connection newConnection() throws SQLException{
		Connection con = DriverManager.getConnection(dbConfig.url,dbConfig.username,dbConfig.passwrod);
		all.add(con);
		return con;
	}
	
	//获取连接
	public Connection getConn() throws SQLException{
		Connection connection=null;
		long startTime=System.currentTimeMillis();
		long waitTime=60*1000;//等待时间  1 min
		long nowTime=startTime;
		while(startTime+waitTime>=nowTime){
			synchronized (busyNum) {
				synchronized (frees) {
					while(!frees.isEmpty()){//空余连接还有剩余  
						connection=frees.pollFirst();
						if(connection!=null&&!connection.isClosed()){
							++busyNum;
							return connection;
						}
						
					}
					if(busyNum<dbConfig.maxConn){//当前连接数少于允许的最大连接数
						connection=newConnection();
						if(connection!=null&&!connection.isClosed()){
							++busyNum;
							return connection;
						}
					}
				}
			}
			try {
				Thread.sleep(300);
			} catch (Exception e) {
				e.printStackTrace();
				return connection;
			}
			nowTime=System.currentTimeMillis();
		}
		return connection;
	}
	
	//释放所有连接
	public synchronized void releaseAll() throws SQLException{
		busyNum=0;
		for(int i=0;i<all.size();++i){
			Connection connection=all.get(i);
			if(connection!=null&&!connection.isClosed())
				connection.close();
		}
		frees.clear();
		all.clear();;
	}
	
	public void freeConn(Connection conn) {
		synchronized (busyNum) {
			synchronized (frees) {
				--busyNum;
				frees.add(conn);
			}
		}
	}
	
	@Override
	public PrintWriter getLogWriter() throws SQLException {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public void setLogWriter(PrintWriter out) throws SQLException {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public void setLoginTimeout(int seconds) throws SQLException {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public int getLoginTimeout() throws SQLException {
		// TODO 自动生成的方法存根
		return 0;
	}

	@Override
	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		// TODO 自动生成的方法存根
		return null;
	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		// TODO 自动生成的方法存根
		return false;
	}

	@Override
	public Connection getConnection() throws SQLException {
		// TODO 自动生成的方法存根
		return getConn();
	}

	@Override
	public Connection getConnection(String username, String password) throws SQLException {
		// TODO 自动生成的方法存根
		return getConnection();
	}

}
