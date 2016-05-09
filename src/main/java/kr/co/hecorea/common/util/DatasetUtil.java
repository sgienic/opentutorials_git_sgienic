package kr.co.hecorea.common.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class DatasetUtil {
	
	public static String makeXmlDataSet(String selectId, ResultSet rs) throws Exception {
		StringBuffer sb = new StringBuffer();

		ResultSetMetaData rsmd = rs.getMetaData();
		int numberOfColumns = rsmd.getColumnCount();

		sb.append("<" + selectId + ">");
		try {
			sb.append("<columns>");
			if (rs.next()) {
				for (int i = 1; i <= numberOfColumns; i++) {
					String colType	= rsmd.getColumnTypeName(i);
					String colName	= rsmd.getColumnName(i);
					int colSize		= rsmd.getColumnDisplaySize(i);
					sb.append("<column type=\"" + colType + "\" size=\"" + colSize + "\">" + colName + "</column>");
				}
			}
			sb.append("</columns>");
			
			rs.beforeFirst();
			
			sb.append("<records>");
			while (rs.next()) {
				sb.append("<record>");
				for (int i = 1; i <= numberOfColumns; i++) {
					String colName	= rsmd.getColumnName(i);
					String colValue	= rs.getString(colName);
					sb.append("<" + colName + ">" + colValue + "</" + colName + ">");
				}
				sb.append("</record>");
			}
			sb.append("</records>");
		} catch(Exception e) {
			throw e;
		}
		sb.append("</" + selectId + ">");

		return sb.toString();
	}
	
	public static String makeXmlDataSet(ArrayList<HashMap<String, String>> resultList) throws Exception {
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<resultList.size(); i++) {
			sb.append("<data>");
			
			HashMap<String, String> map = (HashMap<String, String>)resultList.get(i);
			
			Iterator<Map.Entry<String, String>> iterator = map.entrySet().iterator();
			
			while(iterator.hasNext()) {
				Map.Entry<String, String> mapEntry=(Map.Entry<String, String>)iterator.next();
				
				String key = mapEntry.getKey().toString();
				String val = mapEntry.getValue().toString();
				
				sb.append("<" + key + ">" + val + "</" + key + ">");
			}
			
			sb.append("</data>");			
		}
		
		return sb.toString();
	}

}
