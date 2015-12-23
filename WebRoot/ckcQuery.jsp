<%@page import="org.zhzyk_chatRoom.util.RequestUtils"%>
<%@page import="org.zhzyk_chatRoom.service.CKCService"%>
<%@page import="org.zhzyk_chatRoom.model.CKC"%>
<%@page import="org.zhzyk_chatRoom.model.Page"%>
<%@ page contentType="text/plain; charset=GBK"%>
<%@ page language="java"%>

<%
	 
	String ckcCode = request.getParameter("ckcCode");
	if(ckcCode == null || ckcCode.trim().length() == 0){
		return;
	}
	//ckcCode = "";
	//页码
	int pageNo = RequestUtils.parseInt(request.getParameter("pageNo"), 1) ;
	
	 Page<CKC> p = new Page<CKC>(pageNo);
	 
	 p.setPageSize(5);
	//jfFlag = 0 为 繁体，  1为简体
	int jfFlag = RequestUtils.parseInt(request.getParameter("jfFlag"), 0);
	 
	boolean isFT = false;
	if(jfFlag == 0){
		isFT = true;
	}
	p = new CKCService().getCKCpage(p, ckcCode.trim(), isFT);
	 
	String result = "[ ";
	 
	if(p.getList() != null){
		for(CKC ckc : p.getList()){
			 result = result+"{\"value\":\""+ckc.getCkcCode()+": "+ckc.getWord()+"\", \"data\":\""+ckc.getWord()+"\"},";
		}
	}
	result= result.substring(0,result.length()-1)+"]";
	System.out.println("result:"+result);
	  
	response.getWriter().write(result);
	 
%>
 