<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
//Menu
menu_id ="a";
menu_num ="3";
 
$(document).ready( function() { 
	Init();
	InitA1002();
});	


function InitA1002(){

}

</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuA.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	<h2>DB Lock </h2>
	
	<h1>DB Lock table 확인</h1>
	<h1>락발생 사용자와 SQL, OBJECT 조회</h1>
	<h1>현재 접속자의 SQL 분석</h1>
	<h1>락 세션 찾기</h1>
	<h1>락 세션 SQL 로 실행하기</h1>
<!-- //contents -->

<!-- 
http://pangate.com/647  : 오라클 LOCK 조회 및 KILL 방법
 -->
</div>



<jsp:include page="/jsp/include/bottom.jsp" />


