<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<table>
<thead>
	<tr>
		<th>사용자명</th>
		<th>SCHEMANAME</th>
		<th>OSUSER</th>
		<th>PROGRAM</th>
		<th>TYPE</th>
		<th>LOGON_TIME</th>
		<th>SERVICE_NAME</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.USERNAME}</td>
		<td>${tableList.SCHEMANAME}</td>
		<td>${tableList.OSUSER}</td>
		<td>${tableList.PROGRAM}</td>
		<td>${tableList.TYPE}</td>
		<td>${tableList.LOGON_TIME}</td>
		<td>${tableList.SERVICE_NAME}</td>
	</Tr>
</c:forEach>
</tbody>
</table>