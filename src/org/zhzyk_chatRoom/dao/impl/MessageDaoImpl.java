package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import org.zhzyk_chatRoom.dao.MessageDao;
import org.zhzyk_chatRoom.model.MsgInfo;
import org.zhzyk_chatRoom.util.ConnectionFactory;

public class MessageDaoImpl implements MessageDao {
	
	
	//ResultSet rs=null;用户行为记录
	PreparedStatement ps=null;	
	Connection con=null;
	ResultSet rs=null;
	public boolean saveToDataBase(MsgInfo msgInfo)
	{  
		System.out.println("saveToDataBase:" +msgInfo.getSchool());
		boolean flag=false;
		try
		{   //System.out.println("1");
		    //HttpSession session=HttpServletrequest.getSession();
			//session.getAttribute("school").toString();
			//System.out.println(session.getAttribute("school").toString());
			//System.out.println("2");
			con =ConnectionFactory.getConnection();
			SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String time = cal.format(new java.util.Date());
			String sql="insert into msgInfo(chatRoom,msgFrom,msgTo,chatTime,chatAction,msgContent,secret,image_url,theSchool,chating) values(?,?,?,?,?,?,?,?,?,?)";
		    ps = con.prepareStatement(sql);
		    ps.setString(1,msgInfo.getChatRoom());
		    ps.setString(2,msgInfo.getMsgFrom());
		    ps.setString(3,msgInfo.getMsgTo());
		    ps.setString(4,time);
		    ps.setString(5,msgInfo.getChatAction());
		    ps.setString(6,msgInfo.getMsgContent());
		    ps.setInt(7,msgInfo.getSecret());
		    ps.setString(8,msgInfo.getImage_url());
		    ps.setString(9,msgInfo.getSchool());
		    ps.setString(10,msgInfo.getChating());
		    ps.executeUpdate();
		  //  sql = "insert into onlineuser(lastchattime,nickName,theSchool,chating) values(?,?,?,?)";
		   // ps = con.prepareStatement(sql);
		   // ps.setString(1,time);
		   // ps.setString(2,msgInfo.getMsgFrom());
		   // ps.setString(3,msgInfo.getSchool());
		   // ps.setString(4,msgInfo.getChating());
		  //  ps.executeUpdate();
		       
		  // sql="select * from onlineUser where nickName=?";
			sql="select * from onlineUser where nickName=? and '"+msgInfo.getSchool()+"' in (SELECT theSchool from onlineuser)  and '"+msgInfo.getChating()+"' in (SELECT chating from onlineuser)";
		    
		    ps = con.prepareStatement(sql);
			ps.setString(1,msgInfo.getMsgFrom());
			rs =ps.executeQuery();
			if(rs.next())
			{   
				flag=true;
			}
			else
			{
				
				sql = "insert into onlineuser(lastchattime,nickName,theSchool,chating) values(?,?,?,?)";
			    ps = con.prepareStatement(sql);
			    ps.setString(1,time);
			    ps.setString(2,msgInfo.getMsgFrom());
			    ps.setString(3,msgInfo.getSchool());
			    ps.setString(4,msgInfo.getChating());
			    ps.executeUpdate();
		        flag=true;
			}
		    
		    
		    
		        
		        
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
		return flag;
	 }

}
