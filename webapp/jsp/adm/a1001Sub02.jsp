<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<table>
<thead>
	<tr>
		<th>NAME</th>
		<th>CREATED</th>
		<th>PLATFORM_NAME</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.NAME}</td>
		<td>${tableList.CREATED}</td>
		<td>${tableList.PLATFORM_NAME}</td>
	</Tr>
</c:forEach>
</tbody>
</table>