package org.zhzyk_chatRoom.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import org.zhzyk_chatRoom.util.ConnectionFactory;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("all")
public class UploaderAction extends BaseAction {
	
	private File attach;
	private String attachFileName;
    
	public String upload() throws Exception  {
		if(attach==null)
			return INPUT;
		File saved;
		// System.out.println(System.currentTimeMillis());
		
		saved = new File(ServletActionContext.getServletContext().getRealPath(
				"uploads"), attachFileName);
		//saved = new File("cr.zhzyk.cn/chatRoom/attached/", attachFileName);
		
        System.out.println(saved);
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			saved.getParentFile().mkdirs();
			fis = new FileInputStream(attach);
			fos = new FileOutputStream(saved);
			byte[] bytes = new byte[20 * 1024 * 1024];
			int len = 0;
			while ((len = fis.read(bytes)) != -1) {
				fos.write(bytes, 0, len);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				fis.close();
			}
			if (fos != null) {
				fos.close();
			}

		}
		return SUCCESS;

	}

	public File getAttach() {
		return attach;
	}

	public void setAttach(File attach) {
		this.attach = attach;
	}


	public String getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(String attachFileName) {
		this.attachFileName = attachFileName;
	}

}