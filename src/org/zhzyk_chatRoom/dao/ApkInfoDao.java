package org.zhzyk_chatRoom.dao;

import org.zhzyk_chatRoom.model.ApkInfo;

public interface ApkInfoDao {
	
	public abstract ApkInfo getApkInfo(String keyCode);
	
	public abstract long editApkInfo(ApkInfo apkInfo);
	 
	
}
