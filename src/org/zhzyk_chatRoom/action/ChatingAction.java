package org.zhzyk_chatRoom.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.zhzyk_chatRoom.database.Page;
import org.zhzyk_chatRoom.util.RequestUtils;

public class ChatingAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1016254872883484599L;//���к�
	private List<Map<String, Object>> ckcResult;

	public String chatting(){    
	//	 String chatRoom = (String)request.getParameter("chatRoom");
		 String schooltoo=(String)request.getParameter("theSchool");
 	     String chatroom=(String)request.getParameter("chating");
	//	session.put("_CHAT_ROOM",chatRoom);
		session.put("theSchool", schooltoo);
		session.put("chating", chatroom);
		return SUCCESS;
	}
	
	public String sendMsg() {
		Map<String, Object> bean=new HashMap<String, Object>();
		try {
			BeanUtils.populate(bean, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		Object msgTo=bean.remove("msgTo");
		int secret = 0;
	   //如果聊天对象为空表示对所有人说话
	   if(msgTo==null||msgTo.equals(""))
		   msgTo="所有人";
	   //如果悄悄话的选框被选中表示这个消息是悄悄话
	   if(request.getParameter("secret")!=null)
	      secret=1;
	   bean.put("msgTo", msgTo);
	   bean.put("secret", secret);
	   bean.put("msgFrom", session.get("_USER").toString());
	   bean.put("msgContent", "<font color="+(String)bean.remove("color")+">"+(String)bean.remove("msg")+"</font>");
	   chatRoomService.saveUser(bean);
	   return "sendMsg";
	}

	public String getCkcCode() {
		String ckcCode = request.getParameter("ckcCode");
		//页码
		int pageNo = RequestUtils.parseInt(request.getParameter("pageNo"), 1) ;
		Page pages=new Page(pageNo,5,0);
		//jfFlag = 0 为 繁体，  1为简体
		int jfFlag = RequestUtils.parseInt(request.getParameter("jfFlag"), 0);		 
		boolean isFT = false;
		if(jfFlag == 0)
			isFT = true;
		pages = ckcService.getCKC( ckcCode.trim(), isFT,(pageNo-1)*5,5);
		ckcResult=(List<Map<String,Object>>)pages.getPageList();
		return "ckcCode";
	}

	public List<Map<String, Object>> getCkcResult() {
		return ckcResult;
	}

	public void setCkcResult(List<Map<String, Object>> ckcResult) {
		this.ckcResult = ckcResult;
	}

}