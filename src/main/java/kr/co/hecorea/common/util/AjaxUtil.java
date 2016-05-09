package kr.co.hecorea.common.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

public class AjaxUtil {
		
	public static void callXmlAjax(HttpServletResponse res, HashMap<String, String> resultMap, String result, String charset, String serverCharset) throws IOException {
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"" + charset + "\" ?>");
		sb.append("<result>");
		
		sb.append("<result_info>");
		sb.append("<error_code>" + resultMap.get("ErrorCode") + "</error_code>");
		sb.append("<error_msg>" + resultMap.get("ErrorMsg") + "</error_msg>");
		sb.append("</result_info>");
		
		sb.append("<data_list>");
		sb.append(result);
		sb.append("</data_list>");
		sb.append("</result>");
		
		String xmlStr = new String(sb.toString().getBytes(charset), serverCharset);
		res.setContentType("application/xml; charset=\"" + charset + "\"");
		res.setHeader("Cache-Control", "no-cache");
		PrintWriter pw = res.getWriter();
		
		try {
			pw.write(xmlStr);
		} finally {
			if (pw != null)
				pw.close();
		}
	}

}
