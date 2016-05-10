<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="d";
menu_num ="1";
$(document).ready( function() { 
	Init();
	InitD1000_1();
	$('#tableInfoDiv').hide();
});	


var jArray = new Array();
function InitD1000_1(){
	// 사용자 정보 select
	$.get("/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getOracleUser"
	},
	function(xml){
		$(xml).find('record').each(function() {
			var $data = $(this);

			var jobj = new Object();
			jobj.USERNAME = $data.find('USERNAME').text();
			jArray .push(jobj );
			createTemp(jArray);
		})
	}
	,
	"xml");	
}
function createTemp(jArray){
	$( "#userList" ).html(
			$( "#userTemplate" ).render( jArray )
		);	
}



var jArray1 
function CreateTableInfo(username){
	
	$('#tableInfoDiv').show();
	jArray1 = new Array();
	// 사용자 정보 select
	$.get("/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getTableInfoByUserNoComment",
		"username":username
	},
	function(xml){
		$(xml).find('record').each(function() {
			var $data = $(this);

			var jobj = new Object();
			jobj.TABLE_NAME = $data.find('TABLE_NAME').text();
			//jobj.COMMENTS = $data.find('COMMENTS').text();
			jobj.NUM_ROWS = $data.find('NUM_ROWS').text();
			jobj.MB = $data.find('MB').text();
			jobj.LAST_ANALYZED = $data.find('LAST_ANALYZED').text();
			jArray1 .push(jobj );
			createTempTableInfo(jArray1);
		})
	}
	,
	"xml");		
}

function createTempTableInfo(jArray){
	$( "#tableInfoList" ).html(
			$( "#tableInfoByUsernameTemplate" ).render( jArray )
		);	
}
</script> 

<script id="userTemplate" type="text/x-jsrender">
<span><a href="javascript:CreateTableInfo('{{>USERNAME}}')"> {{>USERNAME}} </a></span>
</script>

<script id="tableInfoByUsernameTemplate" type="text/x-jsrender">
<tr>
	<td>{{>TABLE_NAME}}</td>
	<td>{{>NUM_ROWS}}</td>
	<td>{{>MB}}</td>
	<td>{{>LAST_ANALYZED}}</td>
</tr>
</script>

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuD.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	<h2>사용자</h2>
	<div id="userList"></div>
	
	<hr>
	
	
	<div id="tableInfoDiv">
	<table>
	<thead>
	  <tr>
	  	<th>TABLE_NAME</th>
	  	<th>NUM_ROWS</th>
	  	<th>MB</th>
	  	<th>LAST_ANALYZED</th>
	  </tr>
	</thead>
	<tbody id="tableInfoList"></tbody>
	</table>
		

	
	</div>
	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


