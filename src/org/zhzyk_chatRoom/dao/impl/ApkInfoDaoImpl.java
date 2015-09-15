package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.zhzyk_chatRoom.dao.ApkInfoDao;
import org.zhzyk_chatRoom.model.ApkInfo;
import org.zhzyk_chatRoom.util.ConnectionFactory;

public class ApkInfoDaoImpl implements ApkInfoDao{
	
	private ResultSet rs=null;
	private PreparedStatement ps=null;	
	private Connection con=null;
	@Override
	public ApkInfo getApkInfo(String keyCode) {
		String sql = "";
		
		ApkInfo apkInfo = new ApkInfo();
		
		try{
			con= ConnectionFactory.getConnection();
			sql = "SELECT deviceId, apkCode, apkPackage, times, limitTimes "
					+ "FROM td_apk WHERE keyCode = ?"
					+ " LIMIT 0,1;";			
			ps = con.prepareStatement(sql);
			ps.setString(1, keyCode);
			rs = ps.executeQuery();
			if(rs.next())
			{	
				apkInfo.setKeyCode(keyCode);
				apkInfo.setApkPackage(rs.getString("apkPackage"));
				apkInfo.setDeviceId(rs.getString("deviceId"));
				apkInfo.setApkCode(rs.getString("apkCode"));
				apkInfo.setLimitTimes(rs.getInt("limitTimes"));
				apkInfo.setTimes(rs.getInt("times")); 
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
		 
		return apkInfo;
	}

	@Override
	public long editApkInfo(ApkInfo apkInfo) {
		
		String sql = "";
		
		 int index = 0;
		
		try{
			con= ConnectionFactory.getConnection();
			sql = "UPDATE td_apk "
					+ " SET deviceId = ?, "
					+ " apkCode = ?, "
					+ " apkPackage = ?, "
					+ " times = ? "
					+ " WHERE keyCode =  ? "
					+ " LIMIT 1;";			
			ps = con.prepareStatement(sql);
			ps.setString(1,  apkInfo.getDeviceId());
			ps.setString(2,  apkInfo.getApkCode());
			ps.setString(3,  apkInfo.getApkPackage());
			ps.setInt(4,  apkInfo.getTimes());
			ps.setString(5,  apkInfo.getKeyCode());
			 
			index = ps.executeUpdate();
			
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
		
		
		return index;
	}

}
