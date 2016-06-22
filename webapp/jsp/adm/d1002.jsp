<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="d";
menu_num ="3";

var username ;
var tableName ;
var rowNum ;

$(document).ready( function() { 
	username ='${userName }';
	tableName =  '${tableName }';
	tableName =  '${rowNum }';	
	
	
	if(!username){
		alert("선택된 table 이 없습니다.");
		location("d1001");
	}
	Init();
	InitD1002Sub();
});	

//select * from table 값을불러옵니다.;
function InitD1002Sub(){
    $.post("d1002Sub", {
    	"username" : "${userName }",
    	"tableName" : "${tableName }",
    	"rowNum" : "${rowNum }"
    	},
    	function(data) {
        $('#tableData').html(data);
    });
}
</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuD.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	선택한 table 의 data 를 출력하여 보여줍니다. 기본값 50 건..1
	<br>
	${userName }
	<div id="tableData" style="overflow:auto;width:100% ;height:100% ">
	</div>
	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


