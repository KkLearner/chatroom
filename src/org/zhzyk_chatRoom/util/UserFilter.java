package org.zhzyk_chatRoom.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 用于检测用户是否登陆的过滤器，如果未登录，
 * 则重定向到指的登录页面 配置参数 checkSessionKey 
 * 需检查的在 Session 中保存的关键字
 * redirectURL 如果用户未登录，则重定向到指定的页面，URL不包括 ContextPath notCheckURLList
 * 不做检查的URL列表，以分号分开，并且 URL 中不包括 ContextPath
 */
public class UserFilter implements Filter {
	
		protected FilterConfig filterConfig = null;
  
		private String redirectURL = null;
		
		//不检查的Url
		private Set<String> notCheckURLList = new HashSet<String>();
		  
		//不检查的文件夹
		private List<String> notCheckFolderList = new ArrayList<String>();
		  
		//只检查的文件夹列表  不在改列表的不检查
	//	private List<String> checkFolderList = new ArrayList<String>();
		  	  	
		@Override
		public void destroy() {
		    notCheckURLList.clear();    
		    notCheckFolderList.clear();
		   // checkFolderList.clear();
		}
		
		@Override
		public void doFilter(ServletRequest servletRequest,
	      ServletResponse servletResponse, FilterChain filterChain)
	      throws IOException, ServletException {
			HttpServletRequest request = (HttpServletRequest) servletRequest;
		    HttpServletResponse response = (HttpServletResponse) servletResponse;
		    HttpSession session = request.getSession();
		    if (!checkRequestURIIntNotFilterList(request)){
		       if(session.getAttribute("_USER") == null) {
			       response.sendRedirect(request.getContextPath() + redirectURL);
			        return;
			   }
		    }
			filterChain.doFilter(servletRequest, servletResponse);
		}
		  		 
		private boolean checkRequestURIIntNotFilterList(HttpServletRequest request) {
		    String uri = request.getServletPath()
		        + (request.getPathInfo() == null ? "" : request.getPathInfo());
		/*    for(String folder : checkFolderList){
		    	if(!uri.startsWith(folder)){
		    		return true;
		    	}
		    } */ 
		    for(String folder : notCheckFolderList){
		    	if(uri.startsWith(folder)){
		    		return true;
		    	}
		    }
		    return notCheckURLList.contains(uri);
		 }
		
		@Override
		public void init(FilterConfig filterConfig) throws ServletException {			  
			this.filterConfig = filterConfig;
		    redirectURL = filterConfig.getInitParameter("redirectURL");
		    
		    String notCheckURLListStr = filterConfig
		        .getInitParameter("notCheckURLList");
		    
		    if (notCheckURLListStr != null) {
		      String[] params = notCheckURLListStr.split(",");
		      for (int i = 0; i < params.length; i++) {
		        notCheckURLList.add(params[i].trim());
		      }
		    }		    
		    String notCheckFolderStr = filterConfig.getInitParameter("notCheckFolderList");
		    if(notCheckFolderStr != null){
		    	 String[] params = notCheckFolderStr.split(",");
		         for (int i = 0; i < params.length; i++) {
		        	 notCheckFolderList.add(params[i].trim());
		         }
		    }
		    /*
		    String checkFolderStr = filterConfig.getInitParameter("checkFolderList");
		    if(checkFolderStr != null){
		    	 String[] params = checkFolderStr.split(",");
		         for (int i = 0; i < params.length; i++) {
		        	 checkFolderList.add(params[i].trim());
		         }
		    }
		    */
		}
}
