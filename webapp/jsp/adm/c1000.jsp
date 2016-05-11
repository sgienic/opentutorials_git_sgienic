<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="c";
menu_num ="1";

var jArray = new Array();
$(document).ready( function() { 
	Init();
	InitC1000();
});	

function InitC1000(){
	
	// /xml/simpleSelect.do?selectId=kr.co.hecorea.common.dao.XmlSelectDao.getOracleUser
	$.get("/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getDataFile"
	},
	function(xml){
		$(xml).find('record').each(function() {
			var $data = $(this);

			var jobj = new Object();

			jobj.FILE_NAME = $data.find('FILE_NAME').text();
			jobj.TABLESAPCE_ANME = $data.find('TABLESAPCE_ANME').text();
			jobj.TOTAL = $data.find('TOTAL').text();
			jobj.USED = $data.find('USED').text();
			jobj.FREE = $data.find('FREE').text();
			jobj.FREE_PER = $data.find('FREE_PER').text();

	        jArray .push(jobj );
			createTemp(jArray);
		})
	}
	,
	"xml");		
}

function createTemp(jArray){
	//console.log("data : " + JSON.stringify(jArray));
	$( "#DataFileList" ).html(
			$( "#DataFileTemplate" ).render( jArray )
		);		
}
</script> 

<script id="DataFileTemplate" type="text/x-jsrender">
<tr>
	<td>{{>FILE_NAME}}</td>
	<td>{{>TABLESAPCE_ANME}}</td>
	<td>{{>TOTAL}}</td>
	<td>{{>USED}}</td>
	<td>{{>FREE}}</td>
	<td>{{>FREE_PER}}</td>
</tr>
</script>

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuC.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	<h3>DataFile</h3>
	
	<table>
	<thead>
	  <tr>
	  	<th>File</th>
	  	<th>TableSpaceName</th>
	  	<th>TOTAL(MB)</th>
	  	<th>UED(MB)</th>
	  	<th>FREE(MB)</th>
	  	<th>FREE(%)</th>
	  </tr>
	</thead>
	<tbody id="DataFileList"></tbody>
	</table>	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


