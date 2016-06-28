<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="b";
menu_num ="";


var jArray = new Array();
$(document).ready( function() { 
	Init();
	InitB1000();
	
});	

function InitB1000(){
	
	// /xml/simpleSelect.do?selectId=kr.co.hecorea.common.dao.XmlSelectDao.getOracleUser
	$.get("/swg/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getOracleUser"
	},
	function(xml){
		$(xml).find('record').each(function() {
			var $data = $(this);
			

			var jobj = new Object();

			jobj.ROWNUM = $data.find('ROWNUM').text();
			jobj.USERNAME = $data.find('USERNAME').text();
			jobj.USER_ID = $data.find('USER_ID').text();
			jobj.ACCOUNT_STATUS = $data.find('ACCOUNT_STATUS').text();
			jobj.DEFAULT_TABLESPACE = $data.find('DEFAULT_TABLESPACE').text();
			jobj.CREATED = $data.find('CREATED').text();
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
</script> 

<script id="userTemplate" type="text/x-jsrender">
<tr>
	<td>{{>ROWNUM}}</td>
	<td>{{>USERNAME}}</td>
	<td>{{>USER_ID}}</td>
	<td>{{>ACCOUNT_STATUS}}</td>
	<td>{{>DEFAULT_TABLESPACE}}</td>
	<td>{{>CREATED}}</td>
</tr>
	<div>
		{{:#index+1}}: <b>{{>name}}</b> ({{>releaseYear}})
	</div>
</script>

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuB.jsp" />
<!-- //SNB -->

<div id="contents" class="noSnb">
<!-- contents -->
	<h3>사용자정보</h3>
	
	
	<table>
	<thead>
	  <tr>
	  	<th>No.</th>
	  	<th>UserName</th>
	  	<th>USER_ID</th>
	  	<th>ACCOUNT_STATUS</th>
	  	<th>DEFAULT_TABLESPACE</th>
	  	<th>CREATED</th>
	  </tr>
	</thead>
	<tbody id="userList"></tbody>
	</table>

	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


