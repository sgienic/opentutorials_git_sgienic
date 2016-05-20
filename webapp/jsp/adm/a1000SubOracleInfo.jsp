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
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<tr>
		<td>${tableList.USER_ID}</td>
		<td>${tableList.USER_LOG_DATE}</td>
		<td>${tableList.USER_LOG_IP}</td>
	</tr>
</c:forEach>
</tbody>
</table>
