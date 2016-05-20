<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
//Menu
menu_id ="a";
menu_num ="1";
 
$(document).ready( function() { 
	Init();
	InitA1000();

});	

function InitA1000(){
	subOracleInfo();
	subLoginLog();
	subOracleSession();
}

function subOracleInfo(){
	$.get("/xml/simpleSelect.do", {
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
}

function subLoginLog(){
    $('#loginLog #cotent').spin();
    $.get('a1000LoginLog', {}, function(data) {
        $('#loginLog #cotent').html(data);
        $('#loginLog #cotent').spin(false);
    });	 
}
function subOracleSession(){
    $('#OracleSession #cotent').spin();
    $.get('a1000OracleSession', {}, function(data) {
        $('#OracleSession #cotent').html(data);
        $('#OracleSession #cotent').spin(false);
    });	 
}
</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuA.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->

	<div id="oracleInfo">
		<div>
			<span>최근업데이트</span>
			<span id="updateTime">0000.00.00 00:00:00</span>
		</div>
		<div>
			<div><h3>오라클 DB 사용공간</h3>
			<span id="textORCL">00</span>
			</div>
			<div><h3>사용 공간 </h3> 
			<span id="textUSED">00</span></div>
		</div>
	</div>
	
	<div id="loginLog" >
		<h1>최근 로그인 기록</h1>
		<span id="cotent" ></span>
	</div>
	
	<div id="OracleSession">
		<h1>세션 정보</h1>
		<div id="cotent"></div>
	</div>
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


