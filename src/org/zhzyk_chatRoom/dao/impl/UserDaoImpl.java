package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import org.zhzyk_chatRoom.dao.UserDao;
import org.zhzyk_chatRoom.model.UserInfo;
import org.zhzyk_chatRoom.util.ConnectionFactory;

public class UserDaoImpl implements UserDao{
	ResultSet rs=null;
	PreparedStatement ps=null;	
	Connection con=null;
	public UserInfo findUserByName(String username){
		UserInfo userInfo=new UserInfo();
		try{
			con= ConnectionFactory.getConnection();
			String sql = "select * from userInfo where nickName=?";			
			ps = con.prepareStatement(sql);
			ps.setString(1,username);
			rs = ps.executeQuery();
			while(rs.next())
			{
				userInfo.setNickName(rs.getString("nickName"));
				userInfo.setUserPassword(rs.getString("userPassword"));
				userInfo.setRole(rs.getString("role"));
		    }
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return userInfo;	
	}
	
	public int saveUserInfo(UserInfo userInfo)
	{
		int row=0;
		String sql="insert into userinfo(nickName,userPassword,province,school,role) values(?,?,?,?,?)";
		try{
			con=ConnectionFactory.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1,userInfo.getNickName());
			ps.setString(2,userInfo.getUserPassword());
			ps.setString(3,userInfo.getProvince());
			ps.setString(4,userInfo.getSchool());
			ps.setString(5,userInfo.getRole());
			row=ps.executeUpdate();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	public int countUser(String chatRoom){
		int sum=0;
		try
		{
			con=ConnectionFactory.getConnection();
			String sql="select count(*) As intCount from onlineuser where chatRoom=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,chatRoom);
			rs =ps.executeQuery();
			if(rs.next())
				sum=rs.getInt("intCount");
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sum;
	}
	
	
	public boolean addOnlineUser(String userName,String chatRoom)
	{
		boolean flag=false;
		try
		{
			con =ConnectionFactory.getConnection();
			
			//先判断该用户是不是已经在该聊天室
			String sql="select * from onlineUser where nickName=? and chatRoom=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,userName);
			ps.setString(2,chatRoom);
			rs =ps.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
			else
			{
				//如果聊天室不存在该用户，将访用户添加到聊天室的在线用户表中
				sql="insert into onlineUser(nickName,chatRoom) values(?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1,userName);
				ps.setString(2,chatRoom);
				ps.executeUpdate();
				ps.close();
              //获取信息时间，并将时间定义为year-Month-day Hour:minutes:seconds
				SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			    String time = cal.format(new java.util.Date());
			    //在msgInfo表中添加一条系统公告，欢迎新用户进入聊天室
				sql = "insert into msgInfo(chatRoom,msgFrom,msgTo,chatTime,msgContent)values(?,?,?,?,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1,chatRoom);
				ps.setString(2,"system notice");
				ps.setString(3,"all people");
				ps.setString(4,time);
				ps.setString(5,"<font color=green>"+userName+"</font>enter our chatroom.let us welcome him or her");
				ps.executeUpdate();
				flag=true;
			}
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean denyUser(String userName,String chatRoom)
	{
		boolean flag=false;
		try
		{
			con =ConnectionFactory.getConnection();
			String sql = "select * from onlineuser where nickName=? and chatRoom=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,userName);
			ps.setString(2,chatRoom);
			rs =ps.executeQuery();
			if(rs.next())
			{
				flag=false;
			}
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}	
	
	/**
	 * 用户离开聊天室的时候，将用户从在线人员表中删除
	 * */
	public void logout(String userName)
	{
		try
		{
		 con=ConnectionFactory.getConnection();
		 String sql = "delete from onlineuser where nickName=?";
		 ps = con.prepareStatement(sql);
		 ps.setString(1,userName);
		 ps.executeUpdate();
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				//rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 换房间，将用户从原来的聊天室在线用户表中删除
	 * */
	public void changeRoom(String userName,String chatRoom)
	{
		try
		{
		 con=ConnectionFactory.getConnection();
		 String sql = "delete from onlineUser where nickName=? and chatRoom=?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1,userName);
		 ps.setString(2,chatRoom);
		 ps.executeUpdate();
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 检查用户是不是管理员，如果是管理员返回true，如果不是返回false;
	 * */
	public boolean checkAdmin(String userName)
	{
	  boolean flag=false;
		try
		{
			con=ConnectionFactory.getConnection();
			String sql="select role from userInfo where nickName=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,userName);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				if(rs.getInt("role")==1)
					flag=true;
				else
				flag=false;
			}
			else
				flag=false;
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		return flag;
	}
	
	/**
	 * 将用户踢出聊天室
	 * */
	public void kickUser(String userName,String chatRoom)
	{
		try
		{
		  con=ConnectionFactory.getConnection();
		  String sql="delete from onlineUser where nickName=? and chatRoom = ?";
		  PreparedStatement ps = con.prepareStatement(sql);
		  ps.setString(1,userName);
		  ps.setString(2,chatRoom);
		  ps.executeUpdate();
		  SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String time = cal.format(new java.util.Date());
		  //在聊天信息表中添加一条踢人的系统公告
		  sql = "insert into msgInfo(chatRoom,msgFrom,msgTo,chatTime,msgContent) values(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,chatRoom);
			ps.setString(2,"system notice");
			ps.setString(3,"all people");
			ps.setString(4,time);
			ps.setString(5,"<font color=red>"+userName+"</font>is kicked out of chatroom by admin !!!");
			ps.executeUpdate();
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 删除用户
	 * */
	public void deleteUser(String userName)
	{
		try
		{
			con = ConnectionFactory.getConnection();
			String sql="delete from onlineUser where nickName=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,userName);
			ps.executeUpdate();
			sql="delete from userInfo where nickName=?";
			ps=con.prepareStatement(sql);
			ps.setString(1,userName);
			ps.executeUpdate();
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				rs.close();
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
