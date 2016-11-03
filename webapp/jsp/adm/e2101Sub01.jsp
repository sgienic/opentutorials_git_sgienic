<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

지하수 실시간 데이터 정보 
CNT : ${resultList[0].CNT}
<table>
<thead>
	<tr>
		<th>일시</th>
		<th>지하수아이디</th>
		<th>수위</th>
		<th>전압</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.DT}</td>
		<td>${tableList.GWID}</td>
		<td>${tableList.LVL}</td>
		<td>${tableList.PWR}</td>
	</Tr>
</c:forEach>
</tbody>
</table>