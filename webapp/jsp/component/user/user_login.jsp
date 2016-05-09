<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript" src="/js/component/user/user_login.js"></script>    
<link rel="stylesheet" type="text/css" href="/css/component/login.css" />

<form method="post" id="form_login" name="form_login" action="/user/proc_login.do">
<div id="login_area">
	<h1><img src="/images/component/user/logo.gif" /></h1>
	
	<ul class="login_form_01">
		<li><img src="/images/component/user/user_id_btn.gif" alt="UserId" /><img src="/images/component/user/nbsp.gif" /><input type="text" id="user_id" name="user_id" /></li>
       	<li><img src="/images/component/user/user_pw_btn.gif" alt="UserPassword" /><img src="/images/component/user/nbsp1.gif" /><input type="password" id="user_password" name="user_password" /></li>
	</ul>
    <ul class="login_form_02">
        <li><input type="checkbox" id="check_user_id" name="checkUserId"/>
        <label> 아이디저장</label></li>
    </ul>
	<p class="btn">
        <a onclick="window.open('/user/user_regist.do','player','width=1050, height=835, scrollbars=no, resizable=no, top=1, left=1');"><img src="/images/component/user/btn_join.gif" alt="사용자등록" /></a>
        <img src="/images/component/user/nbsp.gif" />
		<a><img src="/images/component/user/btn_login.gif" id="btn_login" alt="로그인" /></a>        
	</p>
	<p class="sub_text">administrator / luner47@gmail.com</p>
        
</div>
</form>

<jsp:include page="/jsp/component/include/common_footer.jsp" />