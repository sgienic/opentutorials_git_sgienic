<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    %>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="d";
menu_num ="4";

var username ;
var tableName ;
var rowNum ;

$(document).ready( function() { 
});	


function subLoginLog(){
    $('#TableSearchView #cotent').spin();
    
    var inputTableName = $('#inputTableName').val();
    
    $.get('d1003SubSearch', {"COMMENTS":inputTableName}, function(data) {
        $('#TableSearchView #cotent').html(data);
        $('#TableSearchView #cotent').spin(false);
    });
}
</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuD.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	<h3>TableSerarch</h3> 
	<div id="searchDiv">
	<form >   
		comment : <input type="text" id="inputTableName" name="inputTableName" onkeydown="javascript: if (event.keyCode == 13) {subLoginLog();   return false; }" >
		<a href="javascript:subLoginLog()">검색</a>
	</form>	
	</div>	
	
	<div id="TableSearchView" >
		<span id="cotent" ></span>
	</div>	
	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


