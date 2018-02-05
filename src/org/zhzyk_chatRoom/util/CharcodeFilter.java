package org.zhzyk_chatRoom.util;

import java.io.IOException;



import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharcodeFilter implements Filter{
	private String encoding;
	public CharcodeFilter(){}
	public void init(FilterConfig filterconfig)throws ServletException{
		encoding = filterconfig.getInitParameter("encoding");
	     }
	public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse, FilterChain filterchain)
	         throws IOException, ServletException{
		if(encoding != null && servletrequest.getCharacterEncoding() == null)
			servletrequest.setCharacterEncoding(encoding);
		filterchain.doFilter(servletrequest, servletresponse);
	     }
	     public void destroy(){}
	}