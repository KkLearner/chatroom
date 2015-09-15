package org.zhzyk_chatRoom.model;

import java.io.Serializable;

public class ApkInfo implements Serializable{
 
	private static final long serialVersionUID = 1L;
	
	private String keyCode; //注册号
	private String deviceId; //机器序列号
	
	private String apkCode; //版本号
	
	private String apkPackage; //安卓应用包名
	
	private int times; //使用次数
	
	private int limitTimes; //允许使用次数

	public String getKeyCode() {
		return keyCode;
	}

	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getApkCode() {
		return apkCode;
	}

	public void setApkCode(String apkCode) {
		this.apkCode = apkCode;
	}

	public String getApkPackage() {
		return apkPackage;
	}

	public void setApkPackage(String apkPackage) {
		this.apkPackage = apkPackage;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public int getLimitTimes() {
		return limitTimes;
	}

	public void setLimitTimes(int limitTimes) {
		this.limitTimes = limitTimes;
	}

	@Override
	public String toString() {
		return "ApkInfo [keyCode=" + keyCode + ", deviceId=" + deviceId + ", apkCode=" + apkCode + ", apkPackage="
				+ apkPackage + ", times=" + times + ", limitTimes=" + limitTimes + "]";
	}
	
	 
}
