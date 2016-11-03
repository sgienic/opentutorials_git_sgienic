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
}

function selSql(){
	var workdt =$('#datepicker').val();
	console.log(" workdt : " + workdt);
    $('#sub01 #cotent').spin();
    $.get('e3104Sub01', {"workdt":workdt}, function(data) {
        $('#sub01 #cotent').html(data);
        $('#sub01 #cotent').spin(false);
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
		<p>Date: <input type="text" id="datepicker"> <a href="javascript:selSql()">조회</a></p>
	
		<div id="cotent">
		<img src="/swg/images/no-data.gif" />
		</div>
	</div>
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


