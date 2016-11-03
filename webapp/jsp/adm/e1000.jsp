<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="e";
menu_num ="0";


var jArray = new Array();
$(document).ready( function() { 
	Init();
});	

</script> 

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuE.jsp" />
<!-- //SNB -->

<div id="contents">
	BackOffice 입니다. </br>
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


