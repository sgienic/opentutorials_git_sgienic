<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<table>
<thead>
	<tr>
		<th>TABLE_NAME</th>
		<th>COMMENTS</th>
		<th>ROWS</th>
		<th>MB</th>
		<th>LAST_ANALYZED</th>
	</tr>
</thead>	
<tbody>
	<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.OWNER}.${tableList.TABLE_NAME}</td>
		<td>${tableList.COMMENTS}</td>
		<td>${tableList.ROWS}</td>
		<td>${tableList.MB}</td>
		<td>${tableList.LAST_ANALYZED}</td>
	</Tr>
	</c:forEach>
</tbody>
</table>