
package org.zhzyk_chatRoom.util;

/**
 * Cookie操作
 * 更新时应同步更新所有使用到的项目, 注意项目编码
 * 使用到的项目有
 * zhzykActivity  UTF-8
 * zhzyk_testReport  GBK
 * chatRoom  GBK
 */
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class CookieUtils {
	    
	    
	   
	   //添加cookie； | UnsupportedEncodingException，转码异常

		public static void addCookie(String name,String value) throws UnsupportedEncodingException{

			 addCookie(name, value, "/");

	    }

		 //添加cookie； | UnsupportedEncodingException，转码异常

		public static void addCookie(String name,String value, String path) throws UnsupportedEncodingException{
			
			//先查找cookie 如果存在cookie 就不用新建
			
			delCookie(name);
			value = URLEncoder.encode(value,"UTF-8");
			 
//	        Cookie cookie = findCookie(name);
//	        if(cookie != null){
//	        	cookie.setValue(value);
//	        	return ;
//	        }
	        		
	        		
			Cookie cookie = new Cookie(name, value);

	       // cookie.setMaxAge(60*60*24*365);//保存365天；
	        cookie.setPath(path);

	        ServletActionContext.getResponse().addCookie(cookie);

	    }

		private static Cookie findCookie(String cookieName)throws UnsupportedEncodingException { 
			HttpServletRequest request = ServletActionContext.getRequest();

	        Cookie[] cookies = request.getCookies();  

	        String value = ""; 

	        if (cookies != null) {  
	        	
	            for (Cookie cookie : cookies) {

	                if (cookieName.equals(cookie.getName())) {  //获取具体的cookie；
	                	return cookie;
	                }  
	            }  

	        }  
	        return null;
		}
		
		
	    // 得到指定的cookie;  
	    public static String getCookie(String cookieName) throws UnsupportedEncodingException { 
	    	
	    	  Cookie cookie = findCookie(cookieName);
	    	  if (cookie != null) {  //获取具体的cookie；
              	return URLDecoder.decode(cookie.getValue(),"UTF-8");
              }  

	        return null;  

	}

	 public static Cookie delCookie(String cookieName, String path){
		 
		 HttpServletRequest request = ServletActionContext.getRequest();

	        Cookie[] cookies = request.getCookies();  

	        if (cookies != null) {  

	            for (Cookie cookie : cookies) {  

	                if (cookieName.equals(cookie.getName())) {  
	                    cookie.setValue("");  
	                    //cookie.setMaxAge(0);  
	                    cookie.setPath(path);  //添加，清除时需要加路径才能清除掉；
	                    ServletActionContext.getResponse().addCookie(cookie); 
	                }  

	            }  

	        }  

	        return null;  

		 
	 }

	// 删除指定的cookie  

	    public static Cookie delCookie(String cookieName) {
	    	
	    	return delCookie(cookieName, "/");
	    }

	}


