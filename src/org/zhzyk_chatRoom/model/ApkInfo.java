package org.zhzyk_chatRoom.model;

import java.io.Serializable;

public class ApkInfo implements Serializable{
 
	private static final long serialVersionUID = 1L;
	
	private String keyCode; //ע���
	private String deviceId; //�������к�
	
	private String apkCode; //�汾��
	
	private String apkPackage; //��׿Ӧ�ð���
	
	private int times; //ʹ�ô���
	
	private int limitTimes; //����ʹ�ô���

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
