package org.zhzyk_chatRoom.dao.impl;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zhzyk_chatRoom.dao.BaseDao;
import org.zhzyk_chatRoom.database.DBUtils;
import org.zhzyk_chatRoom.database.Page;

public class BaseDaoImpl implements BaseDao{

	private String tableName;
	private String idCol;
	private HashSet<String> colName;
	private int index=0;
	private String dbName=""; 
	private String codeCol;
	
	public BaseDaoImpl(String tableName,String idCol,String codeCol) {
		this.tableName=tableName;
		this.idCol=idCol;
		this.codeCol=codeCol;
		getColName();
	}
	
	public HashSet<String> getColName() {
		Connection conn=null;
		ResultSet rSet=null;
		if(colName==null){
			try {
				colName = new HashSet<String>();
				conn = DBUtils.getConn(index);
				DatabaseMetaData dbmd = conn.getMetaData();
				rSet = dbmd.getColumns(null, "%", tableName, "%");
				if (rSet != null) {
					while (rSet.next()) {
						colName.add(rSet.getString("COLUMN_NAME"));
					}
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				if(rSet!=null){
					try {
						rSet.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}					
				}	
				if(conn!=null)
					DBUtils.freeConn(index, conn);
			}
		}
		return colName;
	}
	
	
	private ArrayList<Object> MapToList(Map<String, Object> map,int type1,int type2,StringBuffer colOut,StringBuffer valueOut) {
		ArrayList<Object> result=new ArrayList<>();
		if(map==null||map.isEmpty())
			return result;
		String []str2={",","and"};
		String []str1={"","=?"};
		Set<String> keys=map.keySet();
		for(String key:keys){
			if(colName.contains(key)){
				colOut.append(key+str1[type1]+str2[type2]+" ");
				valueOut.append("?,");
				result.add(map.get(key));
			}
		}
		if(colOut.length()>0){
			colOut.setLength(colOut.length()-str2[type2].length()-1);
			valueOut.setLength(valueOut.length()-1);
		}else{
			valueOut=null;
			colOut=null;
		}	
		return result;
	}
	
	public Integer executeUpdate(String sql,List<Object> param){
		Integer result=0;
		Connection connection=null;
		PreparedStatement pStatement=null;
		try {
			connection=DBUtils.getConn(index);
			pStatement=connection.prepareStatement(sql);
			if(param!=null&&!param.isEmpty()){
				for(int i=0;i<param.size();++i)
					pStatement.setObject(i+1, param.get(i));				
			}
		//	System.out.println(pStatement.toString());
			result=pStatement.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pStatement!=null){
				try {
					pStatement.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}				
			if(connection!=null)
				DBUtils.freeConn(index, connection);
		}		
		return result;
	}
	
	public List<Map<String, Object>> executeQuery(String sql,List<Object> param) {
		List<Map<String, Object>> resutl=new ArrayList<>();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet rSet=null;
		try {
			connection=DBUtils.getConn(index);
			preparedStatement=connection.prepareStatement(sql);
			if(param!=null&&!param.isEmpty()){
				for(int i=0;i<param.size();++i)
					preparedStatement.setObject(i+1, param.get(i));
			}
		//	System.out.println(preparedStatement.toString());
			rSet=preparedStatement.executeQuery();
			resutl=DBUtils.resultToList(rSet);
			//System.out.println("result:"+resutl);
		} catch (Exception e) {
			resutl.clear();
			e.printStackTrace();
		}finally {
			if(rSet!=null){
				try {
					rSet.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(preparedStatement!=null){
				try {
					preparedStatement.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(connection!=null)
				DBUtils.freeConn(index, connection);
		}
		return resutl;
	}
	
	public Integer insert(Map<String, Object> map){
		return insert(null, map);
	}
	
	public Integer insert(String tableName,Map<String, Object> map) {
		if(map==null||map.isEmpty())
			return 0;
		StringBuffer col=new StringBuffer();
		StringBuffer value=new StringBuffer();
		List<Object> list=MapToList(map, 0,0, col,value);
		if(value==null||col==null||list.isEmpty())
			return 0;
		String sql="insert into "+(tableName==null?this.tableName:tableName)+" ("+col.toString()+") values ("+value.toString()+")";
		return executeUpdate(sql, list);
	}
	
	public Integer deleteById(String tableName,Object id) {
		List<Object> parm=new ArrayList<>();
		parm.add(id);
		String sql="delete from "+(tableName==null?this.tableName:tableName)+" where "+idCol+" =?";
		return executeUpdate(sql, parm);
	}
	
	public Integer delete(String tableName,Map<String, Object> where) {
		if(where==null||where.isEmpty())
			return 0;
		StringBuffer colOut=new StringBuffer(),valueOut=new StringBuffer();
		List<Object> list=MapToList(where, 1,1, colOut, valueOut);
		if(list.isEmpty()||colOut==null)
			return 0;
		String sql="delete from "+(tableName==null?this.tableName:tableName)+" where "+colOut;
		return executeUpdate(sql, list);
	}
	
	public Integer delete(String from,String where) {
		String sql="delete from "+(from==null?this.tableName:from)+" where "+where;
		return executeUpdate(sql, null);
	}
	
	public Integer updateById(String from,String set,Object id) {
		List<Object> parm=new ArrayList<>();
		parm.add(id);
		String sql="update "+(from==null?this.tableName:from)+" set "+set+" where "+idCol+" =?";
		return executeUpdate(sql, parm);
	}
	
	public Integer update(String from,Map<String, Object> set,Map<String, Object> where) {
		if(set==null||set.isEmpty())
			return 0;
		StringBuffer colOut1=new StringBuffer(),valueOut=new StringBuffer(),colOut2=new StringBuffer();
		List<Object> list=MapToList(set, 1,0, colOut1, valueOut);
		list.add(MapToList(where, 1,1, colOut2, valueOut));
		if(list.isEmpty()||colOut1==null||colOut2==null)
			return 0;
		String sql="update "+(from==null?this.tableName:from)+" set "+colOut1+" where "+colOut2;
		return executeUpdate(sql, list);
	}
	
	public Integer updateById(String from,Map<String, Object>set,Object id) {
		if(set==null||set.isEmpty())
			return 0;
		StringBuffer colOut1=new StringBuffer(),valueOut=new StringBuffer();
		List<Object> list=MapToList(set, 1,0, colOut1, valueOut);
		if(list.isEmpty()||colOut1==null)
			return 0;
		String sql="update "+(from==null?this.tableName:from)+" set "+colOut1+" where "+idCol+"=?";
		list.add(id);
		return executeUpdate(sql, list);
	}

	public Map<String, Object> getByIdCode(String what,String from,Object id,int type) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("select ");
		sBuilder.append(what==null ? "*" : what);
		sBuilder.append(" from ");
		sBuilder.append(from==null ? tableName : from);
		if(type==0)
			sBuilder.append(" where "+idCol+"=?");
		else
			sBuilder.append(" where "+codeCol+"=?");
		List<Object> param=new ArrayList<>();
		param.add(id);
		return DBUtils.getUnique(executeQuery(sBuilder.toString(), param));
	}
	
	public Long getCount(String from,String where,String groupby,List<Object> param) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("select count(*)");
		sBuilder.append(" from ");
		sBuilder.append(from==null ? tableName : from);
		sBuilder.append(" where ");
		sBuilder.append(where==null?"1=1":where);
		if (groupby!=null&&!groupby.isEmpty())
			sBuilder.append(" group by " + groupby);
		Map<String, Object> list=DBUtils.getUnique(executeQuery(sBuilder.toString(), param));
		return list==null?0:(Long)list.get("count(*)");
	}
	
	public Page getPage(String what,String from,String where,
			String orderby,String groupby,Integer start,Integer count,List<Object> param) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("select ");
		sBuilder.append(what==null ? "*" : what);
		sBuilder.append(" from ");
		sBuilder.append(from==null ? tableName : from);
		if (where!=null&&!where.isEmpty())
			sBuilder.append(" where " + where);
		if (groupby!=null&&!groupby.isEmpty())
			sBuilder.append(" group by " + groupby);
		if (orderby!=null&&!orderby.isEmpty())
			sBuilder.append(" order by " + orderby);
		if(start!=null)
			sBuilder.append(" limit "+start+","+count);
		List<Map<String, Object>> list=executeQuery(sBuilder.toString(), param);
		Integer totalCount=DBUtils.getCount(list);
		Page page=new Page(start==null?1:start, count==null?totalCount:count,totalCount);
		page.setPageList(list);
		return page;
	}
	
	public List<Map<String, Object>> getList(String what,String from,String where,
			String orderby,String groupby,List<Object> param) {
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("select ");
		sBuilder.append(what==null ? "*" : what);
		sBuilder.append(" from ");
		sBuilder.append(from==null ? tableName : from);
		if (where!=null&&!where.isEmpty())
			sBuilder.append(" where " + where);
		if (groupby!=null&&!groupby.isEmpty())
			sBuilder.append(" group by " + groupby);
		if (orderby!=null&&!orderby.isEmpty())
			sBuilder.append(" order by " + orderby);
		return executeQuery(sBuilder.toString(), param);
	}

}
