<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
//Menu
menu_id ="a";
menu_num ="2";
 
$(document).ready( function() { 
	Init();
	InitA1000();
});	


function InitA1000(){
	// /xml/simpleSelect.do?selectId=kr.co.hecorea.monitor.dao.Monitor.getOracleInfo
	$.get("/swg/xml/simpleSelect.do", {
		"selectId":"kr.co.hecorea.common.dao.XmlSelectDao.getOracleInfo"
	},
	function(xml){
		$(xml).find('record').each(function() {
			var $data = $(this);
			var textA = $data.find('ORCL').text()
			var textB = $data.find('USED').text()
			var textC = $data.find('TIME').text()
			$('#textORCL').text(textA);
			$('#textUSED').text(textB);
			$('#updateTime').text(textC);
		})
	},
	"xml");	

	a1001Sub01();
	a1001Sub02();
}




function a1001Sub01(){
    $('subContent01').spin();
    $.get('a1001Sub01', {}, function(data) {
        $('#subContent01').html(data);
        $('#subContent01').spin(false);
    });	 
}function a1001Sub02(){
    $('subContent02').spin();
    $.get('a1001Sub02', {}, function(data) {
        $('#subContent02').html(data);
        $('#subContent02').spin(false);
    });	 
}
</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuA.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
<h3>OracleInfo</h3>
	
		<table class="update">
			<col width="140" />
			<col width="*" />
			<col width="100" />
			<col width="*" />
			<tbody>
				<tr>
					<td class="th">최근업데이트</td>
					<td colspan="3"><span id="updateTime">0000.00.00 00:00:00</span></td>
				</tr>
				<tr>
					<td class="th">오라클 DB 사용공간</td>
					<td><span id="textORCL">00</span></td>
					<td class="th">사용공간</td>
					<td><span id="textUSED">00</span></td>
				</tr>
			</tbody>
		</table>
			

	<div id="subContent01"></div>
	

	<div id="subContent02"></div>
	
	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


