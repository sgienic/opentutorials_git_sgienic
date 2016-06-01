<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    


<table>
<thead>
	<tr>
		<th>OBJECT_NAME</th>
		<th>TERMINAL</th>
		<th>PIECE</th>
		<th>SQL_TEXT</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.OBJECT_NAME}</td>
		<td>${tableList.TERMINAL}</td>
		<td>${tableList.PIECE}</td>
		<td>${tableList.SQL_TEXT}</td>
	</Tr>
</c:forEach>
</tbody>
</table>