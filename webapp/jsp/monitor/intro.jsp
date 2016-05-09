<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/jsp/component/include/common_header.jsp" />
<script type="text/javascript">
var result = "${result}"

function GoResult(xml) {
	$(xml).find('record').each(function() {
		var $data = $(this);
		
		//alert($data.find('A').text());
		
		var a=  $data.find('A').text();
		console.log('aa');
			
	}); 
}


function GoDetail() {
	$.ajax({
        type: "post",
        dataType: "xml",
        async: false,
        url: "/xml/simpleSelect.do?selectId=kr.co.hecorea.monitor.dao.Monitor.select_day",
        success: GoResult,
        error: function(xhr, status, error) {
        	alert(status);
    	}
	});
}


$(document).ready(function() {
	//alert(result);
	GoDetail();	
});

</script>

<jsp:include page="/jsp/component/include/common_footer.jsp" />