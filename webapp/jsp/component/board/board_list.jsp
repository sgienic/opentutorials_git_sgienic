<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/jsp/component/include/common_header.jsp" />

<div id="admin_board">
<form action="" method="get">
	<div id="contents">
		<!-- <h3></h3> -->
		<div class="spot">
			<p><select><option value="">말머리</option></select></p>
		</div>
		<div class="table">
			<table summary="">
				<caption></caption>
				<col width="80" />
				<col width="*" />
				<col width="100" span="3" />
				<col width="80" />
				<thead>
					<tr>
						<th scope="col" class="fir">번호</th>
						<th scope="col">제목</th>
						<th scope="col">첨부파일</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>						
				</thead>
				<tbody>
					<tr>
						<td class="fir">1</td>
						<td class="left"><a href="#">기상 R&amp;D 사업 수행의 효율성 제고 방안 연구 과제 공모</a></td>
						<td><img src="/images/component/board/btn_down.gif" alt="다운로드" /></td>
						<td>홍길동</td>
						<td>2014-10-2</td>
						<td>27</td>
					</tr>
					<tr>
						<td class="fir">321</td>
						<td class="left"><a href="#">기상 R&amp;D 사업 수행의 효율성 제고 방안 연구 과제 공모</a></td>
						<td><img src="/images/component/board/btn_down.gif" alt="다운로드" /></td>
						<td>홍길동</td>
						<td>2014-10-2</td>
						<td>27</td>
					</tr>
					<tr>
						<td class="fir">321</td>
						<td class="left"><a href="#">기상 R&amp;D 사업 수행의 효율성 제고 방안 연구 과제 공모</a></td>
						<td><img src="/images/component/board/btn_down.gif" alt="다운로드" /></td>
						<td>홍길동</td>
						<td>2014-10-2</td>
						<td>27</td>
					</tr>
				</tbody>
			</table>
			<p>
				<span class="arrow">&lt;</span>
				<span class="on">1</span>
				<span>2</span>
				<span>3</span>
				<span class="arrow">&gt;</span>
			</p>
		</div>
		<p class="btnarea"><a href="#"><img src="/images/component/board/btn_write.gif" alt="글쓰기" /></a></p>
	</div>
</form>
</div>

<jsp:include page="/jsp/component/include/common_footer.jsp" />