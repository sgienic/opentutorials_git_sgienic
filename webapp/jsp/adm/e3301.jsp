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
//실시간 지하수 최근 10개
function getSub01(){
    $('#sub01 #cotent').spin();
    $.get('e3103Sub01', {}, function(data) {
        $('#sub01 #cotent').html(data);
        $('#sub01 #cotent').spin(false);
    });	 	
}
//날짜 선택조회
function getSub02(){
	var workdt =$('#datepicker').val();
    $('#sub02 #cotent').spin();
    $.get('e2101Sub02', {"workdt":workdt}, function(data) {
        $('#sub02 #cotent').html(data);
        $('#sub02 #cotent').spin(false);
    });
}

</script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#datepicker" ).datepicker({dateFormat: 'yymmdd' });
} );
</script>
<!-- SNB -->
<jsp:include page="/jsp/include/subMenuE.jsp" />
<!-- //SNB -->

<div id="contents">
	
	<div id="sub01">
		<div id="cotent"></div>
	</div>
	
	<p>Date: <input type="text" id="datepicker"> <a href="javascript:selSql()">조회</a></p>
	<div id="sub02">
		<div id="cotent"></div>
	</div>
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


