<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/jsp/component/include/common_header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/component/admin.css" />
<script type="text/javascript" src="/js/component/admin/admin_user_manage.js"></script>

<div id="table_list">
<table border="1">
  <tr>
    <th width="50" scope="col">번호</th>
    <th width="100" scope="col">아이디</th>
    <th width="100" scope="col">이름</th>
    <th width="50" scope="col">성별</th>
    <th width="50" scope="col">나이</th>
    <th width="100" scope="col">회원상태</th>
    <th width="100" scope="col">회원등급</th>
    <th width="100" scope="col">포인트</th>
    <th width="100" scope="col">삭제</th>
    </tr>
	<c:forEach items="${userList}" var="user" varStatus="listStatus">
		<tr>
			<td></td>
			<td><a href="javascript:GoDetail('${user.user_id}');">${user.user_id}</a></td>
			<td>${user.user_name}</td>
			<td>${user.user_sex}</td>
			<td>${user.user_age}</td>
			<td>${user.user_flag}</td>
			<td>${user.user_grade}</td>
			<td>${user.user_point}</td>
			<td><input type="button" value="삭제" /></td>
		</tr>
	</c:forEach>
</table>
</div>


<div id="table_detail">

<table border="1">
  <tr>
    <td width="90" scope="row" class="field">아이디</td>
    <td width="160" id="text_user_id"></td>
    <td width="90" class="field">전화번호</td>
    <td width="160" id="text_user_tel_no"></td>
    <td width="90" class="field">승인상태</td>
    <td width="160">
        <select name="select" id="select_user_appr_flag">
            <option value="Y">완료</option>
            <option value="N">미완료</option>
        </select>
    </td>
    </tr>
  <tr>
    <td scope="row" class="field">이름</td>
    <td id="text_user_name"></td>
    <td class="field">이메일</td>
    <td id="text_user_email"></td>
    <td class="field">승인자</td>
    <td id="text_user_appr_id"></td>
    </tr>
  <tr>
    <td scope="row" class="field">성별</td>
    <td id="text_user_sex"></td>
    <td class="field">회원상태</td>
    <td>
    	<select name="select" id="select_user_flag">
      		<option value="Y">정상</option>
      		<option value="N">불량</option>
    	</select>
    </td>
    <td class="field">승인일</td>
    <td id="text_user_appr_date"></td>
    </tr>
  <tr>
    <td scope="row" class="field">나이</td>
    <td id="text_user_age"></td>
    <td class="field">회원등급</td>
    <td>
    	<select name="select" id="select_user_grade">
      		<option value="A">관리자</option>
      		<option value="B">우수</option>
      		<option value="G">일반</option>
    	</select>
    </td>
    <td class="field">가입일</td>
    <td id="text_user_reg_date">2016-01-01</td>
    </tr>
  <tr>
    <td scope="row" class="field">생년월일</td>
    <td id="text_user_private_no"></td>
    <td class="field">포인트</td>
    <td><label>
      <input name="text_point2" type="text" id="text_user_point" size="12" />
    </label>
      <input type="button" value="수정" /></td>
    <td class="field">최근활동일</td>
    <td>-</td>
  </tr>
  <tr>
    <td scope="row" class="field">관리메모</td>
    <td colspan="5"><input name="text_point" type="text" id="text_point" value="" size="101" /> <input type="button" value="저장" /></td>
    </tr>
</table>
</div>




<jsp:include page="/jsp/component/include/common_footer.jsp" />