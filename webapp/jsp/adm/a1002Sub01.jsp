<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:forEach items="${resultList}" var="tableList" varStatus="listStatus">
	<ul>
		<li>${tableList.USER_ID}</li>
		<li>${tableList.USER_LOG_DATE}</li>
		<li>${tableList.USER_LOG_IP}</li>
	</ul>
</c:forEach>
