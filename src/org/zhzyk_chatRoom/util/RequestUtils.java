package org.zhzyk_chatRoom.util;

import java.io.UnsupportedEncodingException;

public class RequestUtils {
	
	/**
	 * 字符串转数字
	 * @param str  字符串
	 * @param defaultValue  默认值
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
	 
	 //简繁体标志
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
		
	 //简繁体标志
	 public static  void setJFFlag(String value){
			
		try {
			CookieUtils.addCookie("JFFlag", value);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
			 
			 
	}
	 
	 
	  
}

