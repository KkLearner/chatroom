package org.zhzyk_chatRoom.database;

import java.util.ArrayList;
import java.util.List;

public class Page {

	private Integer pageNo;
	private Integer pageSize;
	private Integer totalCount;
	private List<?> pageList;
	
	public Page(Integer pageNo,Integer pageSize,Integer totalCount){
		this.pageNo=pageNo;
		this.pageSize=pageSize;
		this.totalCount=totalCount;
		pageList=new ArrayList<>();
	}

	
	public List<?> getPageList() {
		return pageList;
	}


	public void setPageList(List<?> pageList) {
		this.pageList = pageList;
	}


	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
