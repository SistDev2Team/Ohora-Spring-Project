<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="csrf-token" content="${_csrf.token}">
<script
	src="${pageContext.request.contextPath}/resources/js/customerList.js"></script>

<div id="content">
	<h1 style="text-align: center; margin: 50px 0;">회원 리스트</h1>
	<div class="search-container">
		<select name="grade">
			<option value="">사용자 활성화여부</option>
			<option value="1">사용중</option>
			<option value="0">사용안함</option>
		</select>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>회원ID</th>
				<th>이름</th>
				<th>등급</th>
				<th>E-mail</th>
				<th>휴대폰번호</th>
				<th>생년월일</th>
				<th>적립금</th>
				<th>SNS동의</th>
				<th>가입일</th>
				<th>사용여부</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userDTO}" var="user">
				<tr>
					<td>${user.userid}</td>
					<td>${user.name}</td>
					<td>${user.memid}</td>
					<td>${user.useremail}</td>
					<td>${user.usertel}</td>
					<td><fmt:formatDate value="${user.userbirth}"
							pattern="yyyy-MM-dd" /></td>
					<td>${user.userpoint}원</td>
					<td>${user.usersnsagree}</td>
					<td><fmt:formatDate value="${user.userjoindate}"
							pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${user.enabled}">사용중</c:if>
						<c:if test="${!user.enabled}">사용안함</c:if>
					</td>
					<td>
						<button class="detail-btn" data-userid="${user.userid}"
							data-name="${user.name}" data-grade="${user.memid}"
							data-email="${user.useremail}" data-tel="${user.usertel}"
							data-birth="${user.userbirth}" data-point="${user.userpoint}"
							data-snsagree="${user.usersnsagree}"
							data-joindate="${user.userjoindate}"
							data-joindate="${user.enabled}">자세히 보기</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 회원정보 모달창 START -->
	<div id="userDetailModal" class="modal-overlay" style="display: none;">
		<div class="modal-content">
			<div class="modal-header">
				<h2>회원 상세 정보</h2>
			</div>
			<div class="modal-body">
				<div class="label">회원ID</div>
				<div class="value" id="modal-userid"></div>

				<div class="label">이름</div>
				<div class="value" id="modal-name"></div>

				<div class="label">사용여부</div>
				<select id="modal-enabled-select" class="value">
				    <option value="true" ${user.enabled ? 'selected' : ''}>사용중</option>
				    <option value="false" ${!user.enabled ? 'selected' : ''}>사용안함</option>
				</select>

			</div>
			<div class="modal-footer">
				<button id="updateBtn" class="btn btn-primary">수정</button>
				<button id="closeDetailBtn" class="btn btn-secondary">닫기</button>
			</div>
		</div>
	</div>
	<!-- 회원정보 모달창 END -->
</div>

