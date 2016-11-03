<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

중기예보
<table>
<thead>
	<tr>
		<th>TIME</th>
		<th>3일오전</th>
		<th>3일오후</th>
		<th>4일오전</th>
		<th>4일오후</th>
		<th>5일오전</th>
		<th>5일오후</th>
		<th>6일오전</th>
		<th>6일오후</th>
		<th>7일오전</th>
		<th>7일오후</th>
		<th>8일</th>
		<th>9일</th>
		<th>10일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.TMFC}</td>
		<td>${tableList.WF3AM}</td>
		<td>${tableList.WF3PM}</td>
		<td>${tableList.WF4AM}</td>
		<td>${tableList.WF4PM}</td>
		<td>${tableList.WF5AM}</td>
		<td>${tableList.WF5PM}</td>
		<td>${tableList.WF6AM}</td>
		<td>${tableList.WF6PM}</td>
		<td>${tableList.WF7AM}</td>
		<td>${tableList.WF7PM}</td>
		<td>${tableList.WF8}</td>
		<td>${tableList.WF9}</td>
		<td>${tableList.WF10}</td>
	</Tr>
</c:forEach>
</tbody>
</table>