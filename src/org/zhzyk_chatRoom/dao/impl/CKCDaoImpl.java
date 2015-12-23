package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.zhzyk_chatRoom.dao.CKCDao;
import org.zhzyk_chatRoom.model.CKC;
import org.zhzyk_chatRoom.model.Page;
import org.zhzyk_chatRoom.util.ConnectionFactory;

public class CKCDaoImpl implements CKCDao {

	@Override
	public Page<CKC> getCKC(Page<CKC> page, String tableName, String code) {
		ResultSet rs=null;
		PreparedStatement ps=null;	
		Connection con=null;
		String sql = "";
		 
		try{
			con= ConnectionFactory.getConnection();
			page.setTotalItemNumber(getPageTotalItemNumber(con, tableName, code));
			  
			
			sql = "SELECT word, ckcCode "
					+ "FROM "+tableName+"  WHERE ckcCode like ? order by ckcCode asc"
					+ " LIMIT ?, ?;";			
			ps = con.prepareStatement(sql);
			ps.setString(1, code+"%");
			ps.setInt(2, (page.getPageNo()-1)*page.getPageSize()); //起始位置
			ps.setInt(3, page.getPageSize()); ;  //查询记录数
			rs = ps.executeQuery();
			
			List<CKC> ckcList = new ArrayList<CKC>();
			CKC ckc ;
			while(rs.next())
			{	
				ckc = new CKC();
				ckc.setWord(rs.getString("word"));;
				ckc.setCkcCode(rs.getString("ckcCode"));
				ckcList.add(ckc);
		    } 
			page.setList(ckcList);
			
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				if(rs != null)
				rs.close();
				
			} catch (SQLException e) {
				 
			}finally {
				try {
					if(ps != null)
					 ps.close();
					
				} catch (SQLException e) {
					 
				}finally {
					
					try {
						if(con != null)
						con.close();
						
					} catch (SQLException e) {
						 
					} 
				}
			}
			
		}
		 
		return page;
	}
	
	private long getPageTotalItemNumber(Connection con, String tableName, String code) {
		ResultSet rs=null;
		PreparedStatement ps=null;	
		 
		try{
			String sql = "SELECT count(*) "
					+ "FROM "+tableName+" WHERE ckcCode like ? ;";
			ps = con.prepareStatement(sql);
			ps.setString(1, code+"%");
			rs = ps.executeQuery();
			if(rs.next()){
				return rs.getLong(1);
			}
			
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}finally{
			try {
				if(rs != null)
				rs.close();
				
			}catch (SQLException e) {
				 
			}finally {
				try {
					if(ps != null)
					ps.close();	
				} catch (SQLException e) {
				}
			}
			
		}
		 
		return 0;  
	}

}
