<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<table>
<thead>
	<tr>
		<th>CUST_ID</th>
		<th>CUST_NM</th>
		<th>CUST_PHN</th>
		<th>CUST_ADDR</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.CUST_ID}</td>
		<td>${tableList.CUST_NM}</td>
		<td>${tableList.CUST_PHN}</td>
		<td>${tableList.CUST_ADDR}</td>
	</Tr>
</c:forEach>
</tbody>
</table>