<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

CNT : ${resultList[0].CNT}
<table>
<thead>
	<tr>
		<th>플랜트ID</th>
		<th>작업일자</th>
		<th>수압</th>
		<th>수압최대</th>
		<th>수압최평균</th>
		<th>수압최소</th>
		<th>원본수압</th>
		<th>원본수압최대</th>
		<th>원본수압최평균</th>
		<th>원본수압최소</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.PLT_ID}</td>
		<td>${tableList.WRK_DT}</td>
		<td>${tableList.WAPR}</td>
		<td>${tableList.WAPR_MX}</td>
		<td>${tableList.WAPR_AVG}</td>
		<td>${tableList.WAPR_MN}</td>
		<td>${tableList.BASE_WAPR}</td>
		<td>${tableList.BASE_WAPR_MX}</td>
		<td>${tableList.BASE_WAPR_AVG}</td>
		<td>${tableList.BASE_WAPR_MN}</td>
	</Tr>
</c:forEach>
</tbody>
</table>