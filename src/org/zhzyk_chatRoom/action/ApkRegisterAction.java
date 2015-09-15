package org.zhzyk_chatRoom.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringBufferInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.zhzyk_chatRoom.model.ApkInfo;
import org.zhzyk_chatRoom.service.ApkService;
import org.zhzyk_chatRoom.service.impl.ApkServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

public class ApkRegisterAction extends ActionSupport{
 
	private static final long serialVersionUID = -4194317388791787981L;
	
	private  HttpServletRequest request;  
	private  HttpServletResponse  response; 
	private InputStream inputStream;
	private ApkInfo apkInfo;
	
	private ApkService apkService;
	
	public ApkRegisterAction() {
		 request = ServletActionContext.getRequest();
		 response = ServletActionContext.getResponse();
		 apkService = new ApkServiceImpl();
	}
	public String apkRegister(){
		 
		String msg = "Error"; 
		
		if(apkInfo != null && apkService.registerService(apkInfo)){
			msg = "yes";
		}
		
		inputStream = new StringBufferInputStream(msg);
		return SUCCESS; 
		 
	}
	public ApkInfo getApkInfo() {
		return apkInfo;
	}
	public void setApkInfo(ApkInfo apkInfo) {
		this.apkInfo = apkInfo;
	}
	
	

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
