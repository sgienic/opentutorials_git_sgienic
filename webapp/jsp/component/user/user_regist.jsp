<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="/js/component/user/user_regist.js"></script>    

<form method="post" id="form_regedit" name="form_regedit" action="/user/insert_user_data.do">
<input type="hidden" id="check_id" name="check_id" value="0"/>
<!-- 
<input type="hidden" id="user_private_year" name="user_private_year" />
<input type="hidden" id="user_private_month" name="user_private_month" />
<input type="hidden" id="user_private_day" name="user_private_day" />
-->

<div id="join">
	<table border="1">
		<col width="" />
		<col width="" />
		<tbody>
			<tr>
				<td class="th">이름</td>
				<td><input type="text" name="user_name" id="user_name" /></td>
			</tr>
			<tr>
				<td class="th">아이디</td>
				<td>
					<input type="text" name="user_id" id="user_id" />
					<img src="/images/component/user/join_btn_id.gif" id="btn_check_id" alt="중복확인"/>
					<span id="text_msg"></span>
				</td>
			</tr>
			<tr class="th">
				<td class="th">비밀번호</td>
				<td><input type="password" name="user_password" id="user_password" /></td>
			</tr>
			<tr>
				<td class="th">비밀번호 확인</td>
				<td><input type="password" name="re_user_password" id="re_user_password" /></td>
			</tr>
			<tr>
				<td class="th">성별</td>
				<td>
					<select id="user_sex" name="user_sex">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="th">생년월일</td>
				<td>
					<select id="user_private_year" name="user_private_year"></select> 년
					<select id="user_private_month" name="user_private_month"></select> 월
					<select id="user_private_day" name="user_private_day"></select> 일				
				</td>
			</tr>
			<tr>
				<td class="th">이메일</td>
				<td><input type="text" name="user_email" id="user_email" /></td>
			</tr>			
			<tr>
				<td class="th">사용자 연락처</td>
				<td><input type="text" name="user_tel_no" id="user_tel_no" />  <em> "-"생략하고 기입 (예:<strong>01012345678</strong>)</em></td>
			</tr>

		</tbody>
	</table>
	<p class="btn">
		<a href="#"><img src="/images/component/user/join_btn_ok.gif" id="btn_submit" alt="확인" /></a>
		<a href="#"><img src="/images/component/user/join_btn_cancel.gif" id="btn_cancle" alt="취소" /></a>
	</p>
</div>

</form>

