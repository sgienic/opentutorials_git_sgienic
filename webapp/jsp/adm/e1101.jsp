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
	InitSub();
});	

function InitSub(){
	//getSub01();
}

function getSub01(){
    $('#sub01 #cotent').spin();
    $.get('e3103Sub01', {}, function(data) {
        $('#sub01 #cotent').html(data);
        $('#sub01 #cotent').spin(false);
    });	 	
}

</script> 

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuE.jsp" />
<!-- //SNB -->

<div id="contents">
	
	<div id="sub01">
		<div id="cotent"></div>
	</div>
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


