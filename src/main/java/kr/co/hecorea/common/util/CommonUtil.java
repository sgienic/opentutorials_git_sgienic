package kr.co.hecorea.common.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class CommonUtil extends StringUtils {
	
	
	//쿠기 엔코딩 입력
	public static String ProcEncode(String str) {
		String result = "";
		if(str != null) {
			try{
				result = URLEncoder.encode(str, "euc-kr");
			}catch(Exception e) { 
				return "";
			}
		}
		return result;
	}
	
	
	//쿠기 디코딩 출력
	public static String ProcDecode(String str) {
		String result = "";
		
		if(str!=null) {
			try {
				result = URLDecoder.decode(str, "euc-kr");
			}catch(Exception e){
				return "";
			}
		}
		return result;
	}
	

	//쿠기저장(응답, ID, 날짜)
	public static void addCookie(HttpServletResponse rep, String name, String value, int maxAge) {
		
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		
		cookie.setSecure(false);
		cookie.setPath("/");
		rep.addCookie(cookie);
	}
	
	
	//쿠기삭제
	public static void removeCookie(HttpServletResponse rep, String name) {
		
		addCookie(rep, name, "", 0);
	}
	
	
	//쿠기불러오기
	public static String getCookie(HttpServletRequest req, String cookieName) {
		
		Cookie[] cookies = req.getCookies();
		
		if((cookies != null) && (cookies.length > 0)) {
			Cookie cookie = null;
			
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals(cookieName)) {
					cookie = cookies[i];
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	
	
	//null체크
	public static String replaceNull(String str) {

		Object rtnValue = str;
        
    	if(rtnValue == null || !"java.lang.String".equals(rtnValue.getClass().getName())) rtnValue = "";
    	
	    if(isNull(str)) {
	    	return str;
	    	
		} else {
			return str.trim();
		}
    }
	
	public static boolean isNull(String str) {
		return str == null || str.equals(null) || str.trim().equals("") || str.trim().equalsIgnoreCase("null");
	}
	
	
	public static void printOut(HttpServletResponse rep, int type) throws IOException {
		String text = "";
		
		rep.setCharacterEncoding("UTF-8");
		rep.setContentType("text/html; charset=UTF-8");
		PrintWriter out = rep.getWriter();
		
		if(type != 2) {
			if(type == 0) text = "아이디 혹은 비밀번호가 틀렸습니다.";
			if(type == 1) text = "사용 불가능한 아이디 입니다. 관리자에게 사용 요청하시기 바랍니다.";
			
			out.println("<script language='javascript'>"); 
			out.println("alert('" + text + "');"); 
			out.println("location.href='/user/user_login.do'");
			out.println("</script>");
			out.close();
			
		} else {
			if(type == 2) text = "사용자 등록이 완료되었습니다.";
			
			out.println("<script language='javascript'>"); 
			out.println("alert('" + text + "');");
			out.println("window.open('', '_self', '');");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		}
	}
	
}
