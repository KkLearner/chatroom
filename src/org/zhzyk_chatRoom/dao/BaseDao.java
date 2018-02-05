package org.zhzyk_chatRoom.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.zhzyk_chatRoom.database.Page;

public interface BaseDao {
	
	public HashSet<String> getColName();
	
	public Integer executeUpdate(String sql,List<Object> param);
	
	public List<Map<String, Object>> executeQuery(String sql,List<Object> param);
	
	public Integer insert(Map<String, Object> map);
	
	public Integer insert(String tableName,Map<String, Object> map);
	
	public Integer deleteById(String tableName,Object id) ;
	
	public Integer delete(String tableName,Map<String, Object> where) ;
	
	public Integer delete(String from,String where) ;
	
	public Integer updateById(String from,String set,Object id) ;
	
	public Integer update(String from,Map<String, Object> set,Map<String, Object> where);
	
	public Integer updateById(String from,Map<String, Object>set,Object id);
	
	public Map<String, Object> getByIdCode(String what,String from,Object id,int type);
	
	public Long getCount(String from,String where,String groupby,List<Object> param);
	
	public Page getPage(String what,String from,String where,
			String orderby,String groupby,Integer start,Integer count,List<Object> param);
	
	public List<Map<String, Object>> getList(String what,String from,String where,
			String orderby,String groupby,List<Object> param) ;
	
	
}
