<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<table>
<thead>
	<tr>
		<th>OWNER</th>
		<th>TYPE</th>
		<th>OBJECT_NAME</th>
		<th>OS_USER_NAME</th>
		<th>XIDUSN</th>
		<th>SESSION_ID</th>
		<th>LOCKED_MODE</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.OWNER}</td>
		<td>${tableList.TYPE}</td>
		<td>${tableList.OBJECT_NAME}</td>
		<td>${tableList.OS_USER_NAME}</td>
		<td>${tableList.XIDUSN}</td>
		<td>${tableList.SESSION_ID}</td>
		<td>${tableList.LOCKED_MODE}</td>
	</Tr>
</c:forEach>
</tbody>
</table>