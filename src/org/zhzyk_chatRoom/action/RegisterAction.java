package org.zhzyk_chatRoom.action;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class RegisterAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Map<Integer,String> role=new HashMap<Integer,String>(){{
		put(1, "学生");
		put(2, "老师");
		put(3, "专家");
	}};

	public String Register(){
		Map<String, Object> bean=new HashMap<String, Object>();
		try {
			BeanUtils.populate(bean, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		int row=0;
		Integer roleType=Integer.valueOf((String)bean.remove("role"));
		bean.put("role", role.get(roleType));
		if(roleType==1)//学生
			bean.put("roleType", 2);
		else//老师
			bean.put("roleType", 1);
		bean.put("homeworkType", 1);
		row=userService.saveUser(bean);		
		if(row!=0)
		{
			session.put("_USER", request.getParameter("account"));
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

}
