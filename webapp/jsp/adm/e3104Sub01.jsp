<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

CNT : ${resultList[0].CNT}
<table>
<thead>
	<tr>
		<th>플랜트<br>ID</th>
		<th>계측<br>장비<br>ID</th>
		<th>작업<br>일자</th>
		<th>시작<br>적산</th>
		<th>종료<br>적산</th>
		<th>지칭<br>공급량</th>
		<th>하위블록<br>지침<br>공급량</th>
		<th>실<br>공급량</th>
		<th>역<br>적산</th>
		<th>정<br>적산</th>
		<th>순시</th>
		<th>수압</th>
		<th>유속</th>
		<th>하위<br>블록수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<Tr>
		<td>${tableList.PLT_ID}</td>
		<td>${tableList.DVC_MTR_ID}</td>
		<td>${tableList.WRK_DT}</td>
		<td>${tableList.ITGF_S}</td>
		<td>${tableList.ITGF_E}</td>
		<td>${tableList.MTR_SPL}</td>
		<td>${tableList.DN_MTR_SPL}</td>
		<td>${tableList.SPL}</td>
		<td>${tableList.ITGF_RVS}</td>
		<td>${tableList.ITGF_FRNT}</td>
		<td>${tableList.MNTF}</td>
		<td>${tableList.WAPR}</td>
		<td>${tableList.VLT}</td>
		<td>${tableList.DN_BLK_CNT}</td>
	</Tr>
</c:forEach>
</tbody>
</table>