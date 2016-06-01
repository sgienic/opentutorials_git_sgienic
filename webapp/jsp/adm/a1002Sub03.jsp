<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    


<table>
<thead>
	<tr>
		<th>SESSION_ID</th>
		<th>SERIAL</th>
		<th>OBJECT_NAME</th>
		<th>PROGRAM</th>
		<th>LOGON_TIME</th>
	</tr>
	<tr>
		<th colspan="5"> SQL </th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.SESSION_ID}</td>
		<td>${tableList.SERIAL}</td>
		<td>${tableList.OBJECT_NAME}</td>
		<td>${tableList.PROGRAM}</td>
		<td>${tableList.LOGON_TIME}</td>
	</Tr>
	<Tr >
		<td colspan="5">${tableList.SQL}</td>
	</Tr>
</c:forEach>
</tbody>
</table>