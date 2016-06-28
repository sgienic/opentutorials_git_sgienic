<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hecorea.common.util.*"%>
<%
String loginUserId = CommonUtil.ProcDecode(CommonUtil.getCookie(request, "loginUserId"));
String loginAKA = CommonUtil.ProcDecode(CommonUtil.getCookie(request, "loginAKA"));
String loginUserName = CommonUtil.ProcDecode(CommonUtil.getCookie(request, "loginUserName"));

String authMsg = "권한이 없습니다." ;
Boolean chkAuth = true;

chkAuth = false; 

if(loginUserId.length()>0) chkAuth=true;

if(!chkAuth){
	out.println("<script>alert('"+authMsg+"'); location.href='/swg/common/login'</script>");
	out.println("<meta http-equiv=refresh content='0;url=/'>"); 
	out.flush();
	if(true) return;
}
%>
