package org.zhzyk_chatRoom.dao.impl;

import static org.junit.Assert.*;

import java.util.Random;

import org.junit.Test;
import org.zhzyk_chatRoom.dao.ApkInfoDao;
import org.zhzyk_chatRoom.model.ApkInfo;

public class ApkInfoDaoImplTest {
	
	private ApkInfoDao  apkInfoDao = new ApkInfoDaoImpl();
	
	
	@Test
	public void testGetApkInfo() {
		
		System.out.println(apkInfoDao.getApkInfo("a"));
		System.out.println(apkInfoDao.getApkInfo("APKASSSS"));
		
	}

	@Test
	public void testEditApkInfo() {
	 ApkInfo apkInfo =	apkInfoDao.getApkInfo("APKASSSS");
	 
	 apkInfo.setTimes(apkInfo.getTimes()+1);
	 
	 System.out.println(apkInfoDao.editApkInfo(apkInfo));
	 
	 apkInfo.setKeyCode("");
	 
	 System.out.println(apkInfoDao.editApkInfo(apkInfo));
	 
	 getRandomString(24);
	}
	
	public static String getRandomString(int length) { //length表示生成字符串的长度  
		//定义数组
		StringBuffer Random_text=new StringBuffer("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
	   //定义随机的数组
		StringBuffer sb = new StringBuffer(); 
		//System.out.println(Random_text.length());//36
		Random random = new Random(); 
		//System.out.println(Random_text.charAt(0));
		for(int i=1;i<26;i++){
			int index=random.nextInt(Random_text.length());
			//System.out.println("随机数_index:"+index);
			//System.out.println("随机值："+Random_text.charAt(index));
			//System.out.println("原数组："+Random_text);
			sb.append(Random_text.charAt(index));
			//System.out.println("随机数组："+sb);
			Random_text.deleteCharAt(index);
			//System.out.println("删除后的数组："+Random_text);
		}
		System.out.println("随机数组："+sb);
		System.out.println("剩余数组："+Random_text);
		sb.insert(5,"-");
		sb.insert(11,"-");
		sb.insert(17,"-");
		sb.insert(23,"-");
		System.out.println("随机数组秘钥："+sb);
		 return null ; 
	   
	 } 

}
