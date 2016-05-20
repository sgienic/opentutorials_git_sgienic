<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.hecorea.common.util.*"%>    
<jsp:include page="/jsp/include/authChk.jsp" />    
<%
String loginUserId = CommonUtil.ProcDecode(CommonUtil.getCookie(request, "loginUserId"));
String loginAKA = CommonUtil.ProcDecode(CommonUtil.getCookie(request, "loginAKA"));
String loginUserName = CommonUtil.ProcDecode(CommonUtil.getCookie(request, "loginUserName"));
Boolean chkAuth = true;

chkAuth = false;  

if(loginUserId.length()>0) chkAuth=true; 
%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SWG</title>
	<link rel="stylesheet" href="/css/admin.css" />
	
	<script src="http://code.jquery.com/jquery-1.11.2.js" type="text/javascript"></script>
	<script src="/js/admin.js"></script>
	<script src="/js/jsrender.js" type="text/javascript"></script>
	<script src="/js/spin.min.js" type="text/javascript"></script>
	<script>
	
	var chkAuth = '<%=chkAuth%>';
	
	$(document).ready( function() { 
		if(chkAuth){
			$('#loginInfo').show();
		}else{
			$('#loginInfo').hide();
		}
	});	
	
	
	$.fn.spin = function(opts) {
		  this.each(function() {
		    var $this = $(this),
		        data = $this.data();

		    if (data.spinner) {
		      data.spinner.stop();
		      delete data.spinner;
		    }
		    if (opts !== false) {
		      data.spinner = new Spinner($.extend({color: $this.css('color')}, opts)).spin(this);
		    }
		  });
		  return this;
		};	
		
	function logOut(){
		location.href='/swg/logOut'
	}		
	</script>

</head>
<body>

<!-- header -->
<div id="header">
	<h1><a href="#">Smart Water Grid DB 관리</a></h1>
	
	<div id="loginInfo">	
		<span ><%=loginUserId%> 님께서 로그인하셧습니다.</span>
		<a href="javascript:logOut();">log out</a>
	</div>
	
	   
	<h2 class="skip">주메뉴</h2>
	<div class="menu">
		<ul>
			<li id="a"><a href="a1000">오라클 정보</a></li>
			<li id="b"><a href="b1000">사용자정보</a></li>
			<li id="c"><a href="c1000">TableSpace</a></li>
			<li id="d"><a href="d1000">TableInfo</a></li>
		</ul>
	</div>
</div>
<!-- //header -->
 
<!-- container -->
<div id="container">