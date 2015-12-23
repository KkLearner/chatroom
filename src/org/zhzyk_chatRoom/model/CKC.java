package org.zhzyk_chatRoom.model;

import java.io.Serializable;

/**
 * �ݺ���
 * @author zhzyk
 *
 */
public class CKC implements Serializable{

	 
	private static final long serialVersionUID = 4684758289016056906L;
	
	private long ckcId;  //����
	private String word; //����
	private String ckcCode; //�ݺ���
	public long getCkcId() {
		return ckcId;
	}
	public void setCkcId(long ckcId) {
		this.ckcId = ckcId;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getCkcCode(){
		if(ckcCode != null){
			while(ckcCode.length() <6){
				ckcCode = ckcCode+" ";
			}
		}
		return ckcCode;
	}
	public void setCkcCode(String code) {
		this.ckcCode = code;
	}
	@Override
	public String toString() {
		return "\n CKC [ckcId=" + ckcId + ", word=" + word + ", code=" + ckcCode + "]";
	}
	
	
}
