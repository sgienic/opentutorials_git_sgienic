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
	a1000Sub01();
	a1000Sub02();
	a1000Sub03();
}


function a1000Sub01(){
    $('subContent01').spin();
    $.get('a1002Sub01', {}, function(data) {
        $('#subContent01').html(data);
        $('#subContent01').spin(false);
    });	 
}
function a1000Sub02(){
    $('subContent02').spin();
    $.get('a1002Sub02', {}, function(data) {
        $('#subContent02').html(data);
        $('#subContent02').spin(false);
    });	 
}
function a1000Sub03(){
    $('subContent03').spin();
    $.get('a1002Sub03', {}, function(data) {
        $('#subContent03').html(data);
        $('#subContent03').spin(false);
    });	 
}

//참고 : http://pangate.com/647 
</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuA.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	<h3>DB Lock </h3>
	
	<h4>DB Lock table 확인</h4>
	<div id="subContent01"></div>
	<h4>락발생 사용자와 SQL, OBJECT 조회</h4>
	<div id="subContent02"></div>
	<h4>락 세션 SQL 찾기</h4>
	<div id="subContent03"></div>
<!-- //contents -->

<!-- 
http://pangate.com/647  : 오라클 LOCK 조회 및 KILL 방법
 -->
</div>



<jsp:include page="/jsp/include/bottom.jsp" />


