<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

CNT : ${resultList[0].CNT}
<table>
<thead>
	<tr>
		<th>계측장비ID</th>
		<th>작업일자</th>
		<th>시작적산</th>
		<th>종료적산</th>
		<th>원본시작적산</th>
		<th>원본종료적산</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.DVC_MTR_ID}</td>
		<td>${tableList.WRK_DT}</td>
		<td>${tableList.ITGF_S}</td>
		<td>${tableList.ITGF_E}</td>
		<td>${tableList.BASE_ITGF_S}</td>
		<td>${tableList.BASE_ITGF_E}</td>
	</Tr>
</c:forEach>
</tbody>
</table>