package org.zhzyk_chatRoom.model;

import java.util.List;

public class Page<T> {
    
	//当前第几页
	private int pageNo;
	
	//当前页的 List
	private List<T> list;
	
	//每页显示多少条记录
	private int pageSize = 10;
	
	//共有多少条记录
	private long totalItemNumber;
	
	//构造器中需要对 pageNo 进行初始化
	public Page(int pageNo) {
		super();
		this.pageNo = pageNo;
	}
	
	/**
	 *  
	 * @return
	 */
	public int getPageNo() {
		
		if(pageNo > getTotalPageNumber()){
			return getTotalPageNumber();
		}
		if(pageNo <= 0){
			return 1;
		}
		 
		return pageNo;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setList(List<T> list) {
		this.list = list;
	}
	
	public List<T> getList() {
		return list;
	}
	
	//获取总页数
	public int getTotalPageNumber(){
		
		int totalPageNumber = (int)totalItemNumber / pageSize;
		
		if(totalItemNumber % pageSize != 0){
			totalPageNumber++;
		}
		totalPageNumber = totalPageNumber == 0 ? 1:totalPageNumber;
		return totalPageNumber;
	}
	
	public void setTotalItemNumber(long totalItemNumber) {
		this.totalItemNumber = totalItemNumber;
	}
	
	public boolean isHasNext(){
		if(getPageNo() < getTotalPageNumber()){
			return true;
		}
		
		return false;
	}
	
	public boolean isHasPrev(){
		if(getPageNo() > 1){
			return true;
		}
		
		return false;
	}
	
	public int getPrevPage(){
		if(isHasPrev()){
			return getPageNo() - 1;
		}
		
		return getPageNo();
	}
	
	public int getNextPage(){
		if(isHasNext()){
			return getPageNo() + 1;
		}
		
		return getPageNo();
	}

	public long getTotalItemNumber() {
		return totalItemNumber;
	}

//	public void setPageNo(int pageNo) { //方便测试
//		
//		this.pageNo = pageNo;
//	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "\n Page [getPageNo()=" + getPageNo() + ", getPageSize()="
				+ getPageSize() + ", getList()=" + getList()
				+ ", getTotalPageNumber()=" + getTotalPageNumber()
				+ ", getTotalItemNumber()=" + getTotalItemNumber() + "]";
	}
	
	
}
