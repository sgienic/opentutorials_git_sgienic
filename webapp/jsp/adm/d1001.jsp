<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    


<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="d";
menu_num ="2";
$(document).ready( function() { 
	Init();
});	
</script> 

<!-- SNB -->
<jsp:include page="/jsp/include/subMenuD.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->


	사용자 선택
	table 선택
	<div id = "divTabInfo">
	<span><h2>TableInfo ShowData</h2></span>
	사용자명 : <c:out value="${userName }"></c:out> | 
	TableName : <c:out value="${tableName }"></c:out>  <c:out value="${comments }"></c:out> | 
	num_rows : <c:out value="${num_rows }"></c:out> | 
	MB : <c:out value="${mb }"></c:out>Mb
	
	
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




<jsp:include page="/jsp/include/bottom.jsp" />


