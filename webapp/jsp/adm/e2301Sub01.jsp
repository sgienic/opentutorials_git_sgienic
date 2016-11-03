<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

동네예보
<table>
<thead>
	<tr>
		<th>기준일</th>
		<th>기준시간</th>
		<th>X</th>
		<th>Y</th>
		<th>CATEGORY</th>
		<th>VALUE</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.BASEDATE}</td>
		<td>${tableList.BASETIME}</td>
		<td>${tableList.NX}</td>
		<td>${tableList.NY}</td>
		<td>${tableList.CATEGORY}</td>
		<td>${tableList.FCSTVALUE}</td>
	</Tr>
</c:forEach>
</tbody>
</table>