<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

CNT : ${resultList[0].CNT}

<table>
<thead>
	<tr>
		<th>계측장비ID</th>
		<th>계측장비모델ID</th>
		<th>설치일</th>
		<th>설치주소</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.DVC_MTR_ID}</td>
		<td>${tableList.DVC_MTR_MDL_ID}</td>
		<td>${tableList.IST_DT}</td>
		<td>${tableList.IST_ADDR}</td>
	</Tr>
</c:forEach>
</tbody>
</table>