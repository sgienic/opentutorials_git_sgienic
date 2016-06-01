<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin.css" />

<script>
function goLogin(){
	frm.submit();
}
</script>
</head>


<body id="login">
	<form name="frm" action="proc_login" method="get">
	<div class="login">
		<h1>Smart Water Grid <br />관리자</h1>
		<div class="">
			<input class="id" type="text" id="user_id" name="user_id" value="admin" />
			<input class="pw" type="password" id="user_pass" name="user_pass" value="admin" />
			<a href="javascript:goLogin()"><img src="/images/login_btn.gif" alt="Login" /></a>
		</div>
	</div>
	</form>
</body>


</html>