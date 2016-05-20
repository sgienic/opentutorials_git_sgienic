<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
function goLogin(){
	frm.submit();
}
</script>
</head>
<body>
로그인 페이지 입니다. 

<div>
	<form name="frm" action="proc_login">
	id:<input type="text" id="user_id" name="user_id" tabindex="1"/> <span>아이디</span><br>
	pass:<input type="text" id="user_pass" name="user_pass" tabindex="2"/>
	<span tabindex="3"><a href="javascript:goLogin()">로그인</a></span>
	</form>
</div>
</body>
</html>