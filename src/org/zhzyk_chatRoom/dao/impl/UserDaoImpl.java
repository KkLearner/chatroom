package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Repository;
import org.zhzyk_chatRoom.dao.UserDao;
import org.zhzyk_chatRoom.model.UserInfo;
import org.zhzyk_chatRoom.util.ConnectionFactory;

@Repository("userDaoImpl")
public class UserDaoImpl extends BaseDaoImpl {
	ResultSet rs=null;
	PreparedStatement ps=null;	
	Connection con=null;
	
	public UserDaoImpl(){
		super("userinfo", "id", "account");
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
	 * 閻€劍鍩涚粋璇茬磻閼卞﹤銇夌�广倗娈戦弮璺猴拷娆欑礉鐏忓棛鏁ら幋铚傜矤閸︺劎鍤庢禍鍝勬喅鐞涖劋鑵戦崚鐘绘珟
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
	 * 閹广垺鍩ч梻杈剧礉鐏忓棛鏁ら幋铚傜矤閸樼喐娼甸惃鍕喊婢垛晛顓婚崷銊у殠閻€劍鍩涚悰銊よ厬閸掔娀娅�
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
	 * 濡拷閺屻儳鏁ら幋閿嬫Ц娑撳秵妲哥粻锛勬倞閸涙﹫绱濇俊鍌涚亯閺勵垳顓搁悶鍡楁喅鏉╂柨娲杢rue閿涘苯顩ч弸婊�绗夐弰顖濈箲閸ョ�巃lse;
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
	 * 鐏忓棛鏁ら幋鐤丢閸戦缚浜版径鈺侇吇
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
		  //閸︺劏浜版径鈺�淇婇幁顖濄�冩稉顓熷潑閸旂姳绔撮弶陇娑禍铏规畱缁崵绮洪崗顒�鎲�
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
	 * 閸掔娀娅庨悽銊﹀煕
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
