<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!-- loginLog 최근 로그인 기록 -->
<table>
<thead>
	<tr>
		<th  width="100">사용자명</th>
		<th  width="100">SCHEMANAME</th>
		<th  width="100">OSUSER</th>
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
