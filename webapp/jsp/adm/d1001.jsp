<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    


<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="d";
menu_num ="2";


var username ;
var tableName ;
$(document).ready( function() {
	username ='${userName }';
	tableName =  '${tableName }';

	Init();
	InitD1001();
	
	if(username){
		selUserChange(username);
	}
});	


//사용자 정보 select box option 추가
function InitD1001(){
	// 사용자 정보 select
	$.get("/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getOracleUser"
	},
	callback
	);
}
function callback(xml){
	
	var optVal ;
	$(xml).find('record').each(function(index) {
		var $data = $(this);
		var opt = new Option();
		
		opt.value = $data.find('USERNAME').text();
		opt.text  = $data.find('USERNAME').text();
		optVal =  $data.find('USERNAME').text();
		$('#selUser').append(opt);
		
	})
	
	$("#selUser").val(username).attr("selected", "selected");
	
}


function selUserChange(userName){
	
	// 사용자 정보 select
	$.get("/xml/simpleSelect.do", {
		"username":userName,
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getTableInfoByUser"
	},
	callbackSelUsergetList
	);	
}

function callbackSelUsergetList(xml){
	
	 $("#selTable").find("option").remove();
	$(xml).find('record').each(function(index) {
		var $data = $(this);
		var opt = new Option();
		opt.value = $data.find('TABLE_NAME').text();
		opt.text  = $data.find('TABLE_NAME').text();
		$('#selTable').append(opt);
	})
	$("#selTable").val(tableName).attr("selected", "selected");
	
}


function goTableInfo(userName,tableName){
	frmTableInfo.action ="d1001";
	frmTableInfo.userName.value= $("#selUser option:selected").val();
	frmTableInfo.tableName.value= $("#selTable option:selected").val();
	frmTableInfo.submit();
}


function goTableData(userName,tableName){
	frmTableInfo.action ="d1002";
	frmTableInfo.userName.value= userName;
	frmTableInfo.tableName.value= tableName;
	frmTableInfo.submit();
}






//select * from table 값을불러옵니다.;
function InitD1002Sub(){
    $.post("d1002Sub", {
    	"username" : "${userName }",
    	"tableName" : "${tableName }",
    	"rowNum" : "${rowNum }"
    	},
    	function(data) {
        $('#divTabInfo').html(data);
    });
}
</script> 





<!-- SNB -->
<jsp:include page="/jsp/include/subMenuD.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->

<div id="searchDiv">
<form >
	선택된 사용자  4 
    <select id ="selUser" name="selUser" onchange="selUserChange(this.value)">
    	<option>..선택하세요..</option>
    </select>

	선택된 table :
    <select id ="selTable" name="selTable" onchange ="goTableInfo()">
    	<option>..선택하세요..</option>
    </select>
</form>	
</div>


	사용자 선택
	table 선택
	<div id = "divTabInfo">
	<span><h2>TableInfo ShowData</h2></span>
	사용자명 : <c:out value="${userName }"></c:out> | <br/>
	TableName : <c:out value="${tableName }"></c:out>  <c:out value="${comments }"></c:out> | 
	num_rows : <c:out value="${num_rows }"></c:out> | 
	MB : <c:out value="${mb }"></c:out>Mb   
	
	
	<a href="javascript:goTableData('${userName }','${tableName }')">tableData 보기 . </a>
	
	<a href="javascript:InitD1002Sub('${userName }','${tableName }')">tableData 여기서 보기 . </a>
	<table>
	<thead>
	  <tr>
	  	<th>COLUMN_NAME</th>
	  	<th>COMMENTS</th>
	  	<th>DATATYPE</th>
	  	<th>NULLABLE</th>
	  	<th>PK</th>
	  </tr>
	</thead>	
	<tbody>
	<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
		<tr>
			<td>${tableList.COLUMN_NAME}</td>
			<td>${tableList.COMMENTS}</td>
			<td>${tableList.DATATYPE}</td>
			<td>${tableList.NULLABLE}</td>
			<td>${tableList.PK}</td>
		</tr>
	</c:forEach>
	</tbody>
		
	</table>
	
	</div>
	
<!-- //contents -->
</div>


<form name="frmTableInfo" method="post">
	<input type="hidden" name="userName" id="userName">
	<input type="hidden" name="tableName" id="tableName">
</form>

<jsp:include page="/jsp/include/bottom.jsp" />


