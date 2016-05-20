package kr.co.hecorea.common.util;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class ParameterUtil {

	public static HashMap<String, String> getRequestMap(HttpServletRequest req) throws Exception {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		Enumeration<String> enums = req.getParameterNames();
		
		while(enums.hasMoreElements()) {
			String paramName = (String)enums.nextElement();
			String[] params = req.getParameterValues(paramName);
			
			if(params.length > 1) {
			} else {
				paramMap.put(paramName, params[0]);
			}
		}
		
		/* Paging tag*/
		if(paramMap.get("currPage") == null || paramMap.get("currPage").equals("") || paramMap.get("currPage").equals("undefined"))
			paramMap.put("currPage", "1");
		if(paramMap.get("pageLine") == null || paramMap.get("pageLine").equals("") || paramMap.get("pageLine").equals("undefined"))
			paramMap.put("pageLine", "10");	
		
		return paramMap;
	}
	
}
