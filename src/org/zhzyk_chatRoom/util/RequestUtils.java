package org.zhzyk_chatRoom.util;

import java.io.UnsupportedEncodingException;

public class RequestUtils {
	
	/**
	 * �ַ���ת����
	 * @param str  �ַ���
	 * @param defaultValue  Ĭ��ֵ
	 * @return
	 */
	 public static int parseInt(String str, int defaultValue){
		 int value = defaultValue;
		 try{
			 value = Integer.parseInt(str);
			}catch(NumberFormatException e){
				value = defaultValue;;
		 }
		 return value;
	 }
	 
	 //�����־
	 public static  String getJFFlag(){
			
			String username = "";
			try {

				username = CookieUtils.getCookie("JFFLag");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return username;
	}
		
	 //�����־
	 public static  void setJFFlag(String value){
			
		try {
			CookieUtils.addCookie("JFFlag", value);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			 
			 
	}
	 
	 
	  
}

