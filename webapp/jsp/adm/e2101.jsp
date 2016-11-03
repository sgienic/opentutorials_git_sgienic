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
	//InitSub();
});	

function InitSub(){
	getSub01();
}

function getSub01(){
	var workdt =$('#datepicker').val();
    $('#sub01 #cotent').spin();
    $.get('e2101Sub01', {"workdt":workdt}, function(data) {
        $('#sub01 #cotent').html(data);
        $('#sub01 #cotent').spin(false);
    });	 	
}

function selSql(){
	getSub01();
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
	<div class="spot">Date: <input type="text" id="datepicker"> <a class="btn" href="javascript:selSql()">조회</a></div>
	
	<div id="sub01">
		<div id="cotent"></div>
	</div>	

</div>




<jsp:include page="/jsp/include/bottom.jsp" />


