package org.zhzyk_chatRoom.service.impl;

import org.zhzyk_chatRoom.dao.ApkInfoDao;
import org.zhzyk_chatRoom.dao.impl.ApkInfoDaoImpl;
import org.zhzyk_chatRoom.model.ApkInfo;
import org.zhzyk_chatRoom.service.ApkService;

public class ApkServiceImpl implements ApkService{
	
	private ApkInfoDao apkInfoDao;
	
	public ApkServiceImpl(){
		apkInfoDao = new ApkInfoDaoImpl();
	}
	
	@Override
	public boolean registerService(ApkInfo apkInfo) {
		 
		ApkInfo dbInfo = apkInfoDao.getApkInfo(apkInfo.getApkCode());
		
		if(dbInfo == null){
			return false;
		}
		
		//如果应用不一致，不允许注册
		if(!dbInfo.getApkPackage().contains(apkInfo.getApkPackage())){
			return false;
		}
		
		//如果使用次数超出限制
		
		if(dbInfo.getLimitTimes() <= dbInfo.getTimes()){
			return false;
		}

		if(dbInfo.getDeviceId().contains(apkInfo.getDeviceId())){ 
			return true;
		}
		apkInfo.setDeviceId(apkInfo.getDeviceId()+"_"+dbInfo.getDeviceId());
		apkInfo.setTimes(dbInfo.getTimes()+1);
		
		if(apkInfoDao.editApkInfo(apkInfo) > 0){
			return true;
		};
		
		return false;
	}

}
