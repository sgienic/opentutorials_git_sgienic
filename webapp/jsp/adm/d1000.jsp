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

	$('#tableInfoDiv').spin();
	// 사용자 정보 select
	$.get("/swg/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getOracleUser"
	},
	callback
	);	

	$('#tableInfoDiv').spin(false);
}
function callback(xml){
	$(xml).find('record').each(function(index) {
		var $data = $(this);

		var jobj = new Object();
		jobj.USERNAME = $data.find('USERNAME').text();
		jArray .push(jobj );
	})
	createTemp(jArray);
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
	$.get("/swg/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getTableInfoByUser",
		"username":username
	},
	callbackTableInfo
	,
	"xml");		
	$('#tableNameLabel').text(username);
}
function callbackTableInfo(xml){
	var xmlIndex;
	$(xml).find('record').each(function(index) {
		var $data = $(this);

		var jobj = new Object();
		jobj.OWNER = $data.find('OWNER').text();
		jobj.TABLE_NAME = $data.find('TABLE_NAME').text();
		jobj.COMMENTS = $data.find('COMMENTS').text();
		jobj.NUM_ROWS = $data.find('NUM_ROWS').text();
		jobj.MB = $data.find('MB').text();
		jobj.LAST_ANALYZED = $data.find('LAST_ANALYZED').text();
		jArray1 .push(jobj );
		
		xmlIndex = index;
	})	
	
	
	xmlIndex = xmlIndex + 1;
	if(xmlIndex>1){
		$('#tableInfoMsg').html("Table Count : " + xmlIndex);
	}else{
		$('#tableInfoMsg').html("생성된 테이블 이 없습니다.");
	}
	
	createTempTableInfo(jArray1);
	
}

function createTempTableInfo(jArray){
	$( "#tableInfoList" ).html(
			$( "#tableInfoByUsernameTemplate" ).render( jArray )
		);	
}


function goTableInfo(userName,tableName){
	frmTableInfo.action ="d1001";
	frmTableInfo.userName.value= userName;
	frmTableInfo.tableName.value= tableName;
	frmTableInfo.submit();
}
function goPopData(userName,tableName){
	frmTableInfo.action ="d1001";
	frmTableInfo.userName.value= userName;
	frmTableInfo.tableName.value= tableName;	
}
</script> 

<script id="userTemplate" type="text/x-jsrender">
<span><a href="javascript:CreateTableInfo('{{>USERNAME}}')"> {{>USERNAME}} </a></span>
</script>

<script id="tableInfoByUsernameTemplate" type="text/x-jsrender">
<tr onclick="goTableInfo('{{>OWNER}}','{{>TABLE_NAME}}')" >
	<td class="align_l">{{>TABLE_NAME}}</td>
	<td class="align_l">{{>COMMENTS}}</td>
	<td class="align_r">{{>NUM_ROWS}}</td>
	<td class="align_r">{{>MB}}</td>
	<td>{{>LAST_ANALYZED}}</td>
	<td onclick="event.cancelBubble = true;">
	<a href="javascript:goTableInfo('{{>OWNER}}','{{>TABLE_NAME}}')">Columns</a></br>
	<a href="javascript:goPopData('{{>OWNER}}','{{>TABLE_NAME}}')">Pop</a></td>
</tr>
</script>

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuD.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	<h3>사용자 </h3>
	<div id="userList" class="userList"></div>
	
	<hr>
	
	<div id="tableInfoDiv">
		<h4><span id="tableNameLabel"></span></h4>
		<table>
		<col width="*" />
		<col width="*" />
		<col width="70" />
		<col width="70" />
		<col width="120" />
		<col width="50" />
		<thead>
		  <tr>
		  	<th>TABLE_NAME</th>
		  	<th>COMMENTS</th>
		  	<th>ROWS</th>
		  	<th>MB</th>
		  	<th>LAST_ANALYZED</th>
		  	<th>Data</th>
		  </tr>
		</thead>
		<tbody id="tableInfoList"></tbody>
		</table>
		<soan id="tableInfoMsg"></soan>
	</div>
	
<!-- //contents -->

</div>


<jsp:include page="/jsp/include/bottom.jsp" />
<form name="frmTableInfo" method="post">
	<input type="hidden" name="userName" id="userName">
	<input type="hidden" name="tableName" id="tableName">
</form>