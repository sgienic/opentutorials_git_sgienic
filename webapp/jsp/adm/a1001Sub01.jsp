<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<table>
<thead>
	<tr>
		<th>INSTANCE_NAME</th>
		<th>HOST_NAME</th>
		<th>VERSION</th>
		<th>STARTUP_TIME</th>
		<th>STATUS</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.INSTANCE_NAME}</td>
		<td>${tableList.HOST_NAME}</td>
		<td>${tableList.VERSION}</td>
		<td>${tableList.STARTUP_TIME}</td>
		<td>${tableList.STATUS}</td>
	</Tr>
</c:forEach>
</tbody>
</table>