<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="${pageContext.request.contextPath}/resources/js/customerList.js"></script>

<div id="content">
	<h1 style="text-align: center; margin: 50px 0;">회원 리스트</h1>
	<div class="search-container">
		<select name="grade">
			<option value="">사용자 활성화여부</option>
			<option value="crew">crew</option>
			<option value="family">family</option>
			<option value="friend">friend</option>
		</select>
		<button id="openUserEnrollModal" class="SP_cm_btn">회원등록</button>
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
					<td><c:if test="${user.enabled}">
									사용중
								</c:if> <c:if test="${!user.enabled}">
									사용안함
								</c:if></td>
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
				<div class="label">회원ID:</div>
				<div class="value" id="modal-userid"></div>

				<div class="label">이름:</div>
				<div class="value" id="modal-name"></div>

				<div class="label">등급:</div>
				<div class="value" id="modal-grade"></div>

				<div class="label">이메일:</div>
				<input type="email" id="modal-email-input" class="value" />

				<div class="label">휴대폰번호:</div>
				<input type="text" id="modal-tel-input" class="value" />

				<div class="label">생년월일:</div>
				<div class="value" id="modal-birth"></div>

				<div class="label">적립금:</div>
				<div class="value" id="modal-point"></div>

				<div class="label">SNS 동의:</div>
				<select id="modal-snsagree-input" class="value">
					<option value="true">동의함</option>
					<option value="false">동의안함</option>
				</select>

				<div class="label">가입일:</div>
				<div class="value" id="modal-joindate"></div>

				<div class="label">사용여부:</div>
				<select id="modal-enabled-select" class="value">
					<option value="true">사용중</option>
					<option value="false">사용안함</option>
				</select>
			</div>
			<div class="modal-footer">
				<button id="updateBtn" class="btn btn-primary">수정</button>
				<button id="closeDetailBtn" class="btn btn-secondary">닫기</button>
			</div>
		</div>
	</div>
	<!-- 회원정보 모달창 END -->

	<!-- 회원등록 모달창 START -->
	<div id="userEnrollModal" style="display: none;">
		<div class="modal-enroll-content">
			<div class="modal-header">
				<h1 style="text-align: center; margin: 50px 0;">회원등록</h1>
			</div>
			<div id="modal-enroll-body">
				<div class="table-container">
					<div class="layout-fix">
						<div class="memberJoin-wrap">
							<form
								action="${pageContext.request.contextPath}/member/joinus/register.htm"
								method="post"
								onsubmit="return validateForm() && validatePassword() && validateAuth();">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
								<div class="innerJoinWrap2nd">
									<div class="innerJoin2nd">
										<div class="innerJoin2ndbox">
											<table class="formTable">
												<colgroup>
													<col style="width: 150px;">
													<col style="width: auto;">
												</colgroup>
												<tbody>
													<!-- 아이디 입력란 및 중복 확인 -->
													<tr class="checked-vali">
														<th scope="row"><span class="SP_th_Title">아이디</span>
															<span class="SP_required">*</span></th>
														<td>
															<!-- 아이디 입력 --> <input type="text" id="member_id"
															name="username" data-checked="false"
															value="${user.username}"> <!-- 중복 확인 버튼 -->

															<button type="button" class="btn btn-default"
																onclick="checkDuplication('id', 'member_id', 'idMsg')">중복
																확인</button> <!-- 서버 검증 메시지 --> <span class="error">${usernameError}</span>


															<!-- 중복 확인 메시지 --> <span id="idMsg" class="txtOK error"></span>
														</td>
													</tr>
													<tr class="checked-vali">
														<th scope="row"><span class="SP_th_Title">비밀번호</span>
															<span class="SP_required">*</span></th>
														<td><input type="password" id="passwd"
															name="password">
															<div class="pwGuide">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,
																8자~16자)</div> <!-- 서버 검증 에러 메시지 --> <span class="error">${passwordError}</span>
														</td>
													</tr>
													<tr class="checked-vali">
														<th scope="row"><span class="SP_th_Title">비밀번호<br>확인
																<span class="SP_required">*</span>
														</span></th>
														<td><input type="password" id="passwd-confirm"
															name="passwd-confirm"> <span id="pwConfirmMsg"
															class=""></span></td>
													</tr>
													<tr class="checked-vali">
														<th scope="row"><span class="SP_th_Title">이름</span> <span
															class="SP_required">*</span></th>
														<td><span id="nameContent"> <input type="text"
																id="name" name="name"> <!-- 서버 검증 에러 메시지 --> <span
																class="error">${nameError}</span>
														</span></td>
													</tr>
													<!-- 이메일 입력란 및 중복 확인 -->
													<tr class="checked-vali">
														<th scope="row"><span class="SP_th_Title">이메일</span>
															<span class="SP_required">*</span></th>
														<td><input type="text" id="email" name="useremail"
															data-checked="false" value="${user.useremail}">
															<button type="button"
																onclick="checkDuplication('email', 'email', 'emailMsg')">중복
																확인</button> <!-- 서버 검증 에러 메시지 --> <span class="error">${useremailError}</span>
															<!-- 중복 확인 메시지 --> <span id="emailMsg"
															class="txtOK error"></span></td>
													</tr>
													<!-- 휴대폰 번호 입력란 및 중복 확인 -->
													<tr class="checked-vali">

														<th scope="row"><span class="SP_th_Title">휴대폰</span>

															<span class="SP_required">*</span></th>

														<td><input type="text" id="phone" name="usertel"
															data-checked="false" value="${user.usertel}">
															<button type="button"
																onclick="checkDuplication('phone', 'phone', 'phoneMsg')">휴대폰
																인증</button> <!-- 서버 검증 에러 메시지 --> <span class="error">${usertelError}</span>
															<!-- 중복 확인 메시지 --> <span id="phoneMsg"
															class="txtOK error"></span>
															<div id="authSection" style="display: none;">
																<input type="text" id="authCode" placeholder="인증번호 입력">
																<button type="button" onclick="verifyAuthCode()">인증번호
																	확인</button>
																<span id="authMsg"></span>
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="innerJoinWrap3rd">
									<div class="innerJoin3rd">
										<div class="tableTopWrap">
											<div class="tableTopTitle">추가정보</div>
										</div>
										<div class="table-container2">
											<table class="table3">
												<tbody>
												<colgroup>
													<col style="width: 150px;">
													<col style="width: auto;">
												</colgroup>
												<tr class="birth">
													<th scope="row"><span class="SP_th_Title">생년<br>월일
													</span></th>
													<td><input type="text" id="birth-year"
														name="birthYear" placeholder="년도" maxlength="4"> <input
														type="text" id="birth-month" name="birthMonth"
														placeholder="월" maxlength="2"> <input type="text"
														id="birth-day" name="birthDay" placeholder="일"
														maxlength="2"> <%-- <input type="hidden" id="userbirth" name="userbirth" value="${user.userbirth}"> --%>
														<!-- 서버 검증 에러 메시지 --> <span class="error">${userbirthError}</span>
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-enroll-footer">
				<button type="submit" id="enrollBtn"
					class="SP_cm_btn SP_btn_black_bg">회원 등록하기</button>
				<button id="closeEnrollBtn" class="btn btn-secondary">닫기</button>
			</div>
		</div>

	</div>
	<!-- 회원등록 모달창 END -->

</div>

<script>
	//모달과 닫기 버튼에 대한 DOM 참조
	var userDetailModal = document.getElementById("userDetailModal");
	var closeDetailButton = document.getElementById("closeDetailBtn");
	var userEnrollModal = document.getElementById("userEnrollModal");
	var closeEnrollBtn = document.getElementById("closeEnrollBtn");

	// 바깥 클릭 시 모달 닫기
	window.onclick = function(event) {
		if (event.target === userDetailModal) {
			userDetailModal.style.display = "none";
		} else if (event.target === userEnrollModal) {
			userEnrollModal.style.display = "none";
		}
	};

	// 닫기 버튼 클릭 시 모달 닫기
	closeDetailButton.onclick = function() {
		userDetailModal.style.display = "none";
	}

	// 닫기 버튼 클릭 시 모달 닫기
	closeEnrollBtn.onclick = function() {
		userEnrollModal.style.display = "none";
	}
</script>

