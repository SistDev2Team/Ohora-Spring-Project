<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div id="content">

<script src="${pageContext.request.contextPath}/member/joinus/findid.js"></script>


<c:if test="${param.error == 'true'}">
    <script>
        alert("입력하신 정보로 가입된 회원 아이디는 존재하지 않습니다.");
    </script> 
</c:if>
    
<div class="container">
    <span class="title">ID FIND</span> 
    <span class="description">
        가입하신 방법에 따라 아이디 찾기가 가능합니다. 법인사업자 회원 또는 외국인 회원의 경우 법인명과 법인번호 또는 이름과 등록번호를 입력해 주세요.
    </span>
    <form class="form-container" id="findPwForm" action="${pageContext.request.contextPath}/member/joinus/findid.htm" method="post">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">    
        <div class="label-container">
            <span class="label-text">회원유형</span>
        </div>
        <select class="dropdown-select" name="membership_type">
            <option value="개인회원">개인회원</option>
            <option value="개인사업자 회원">개인사업자 회원</option>
            <option value="법인사업자 회원">법인사업자 회원</option>
            <option value="외국인 회원">외국인 회원</option>
        </select>
        <div class="radio-group">
            <input type="radio" id="email" name="contact_method" value="email" checked="checked">
            <label for="email" class="radio-label">이메일</label>
            <input type="radio" id="phone" name="contact_method" value="phone">
            <label for="phone" class="radio-label">휴대폰번호</label>
        </div>
     
        <div class="label-container" style="top: 108px;">
            <span class="label-text" id="nameLabel">이름</span>
        </div>
        <input type="text" class="input-field" style="top: 108px;" name="name">
        
        <div class="label-container" id="findByEmail" style="top: 152px;">
            <span class="label-text">이메일로 찾기</span>
        </div>
        <input type="text" class="input-field" id="emailInput" style="top: 152px; left: 170px;" name="useremail">
        <div class="label-container" id="findByPhone" style="top: 152px; display: none;">
            <span class="label-text">휴대폰번호로 찾기</span>
        </div>
        <input type="text" class="input-field" id="phoneInput" style="top: 152px; left: 170px; display: none;" name="usertel">
        <div class="button-container">
            <button type="submit" class="button-text">확인</button>
        </div>
    </form>
</div>



<script>

$(document).ready(function() {
    $('input[name="contact_method"]').change(function() {
        if ($('#email').is(':checked')) {
            $('#findByEmail').show();
            $('#emailInput').show();
            $('#findByPhone').hide();
            $('#phoneInput').hide();
        } else if ($('#phone').is(':checked')) {
            $('#findByEmail').hide();
            $('#emailInput').hide();
            $('#findByPhone').show();
            $('#phoneInput').show();
        }
    });

    // 이거 안해주면 파라미터값 안넘어간다!!!!
    $('#findPwForm').submit(function() {
        if ($('#email').is(':checked')) {
            $('#emailInput').prop('disabled', false);
        } else if ($('#phone').is(':checked')) {
            $('#phoneInput').prop('disabled', false);
        }
    });
});


$(document).ready(function() {
	
	// 연락 방법에 따른 필드 전환 함수
	function toggleContactMethod(method, isCorporate = false, isForeigner = false) {
		if (isCorporate) {  // 법인사업자 회원
			$('#findByCompanynumber, #companynumberInput').toggle(method === 'companynumber');
			$('#findByEmail, #emailInput').toggle(method === 'email');
			$('#findByPhone, #phoneInput').toggle(method === 'phone');
		} 
		else if (isForeigner) {  // 외국인 회원
			$('#findByRegistrationnumber, #registrationnumberInput').toggle(method === 'registration');
			$('#findByEmail, #emailInput').toggle(method === 'email');
			$('#findByPhone, #phoneInput').toggle(method === 'phone');
		} 
		else {  // 개인회원 또는 개인사업자 회원
			$('#findByEmail, #emailInput').toggle(method === 'email');
			$('#findByPhone, #phoneInput').toggle(method === 'phone');
		}
	}

	// 초기 필드 설정 함수
	function resetFields() {
		$('#findByEmail, #emailInput, #findByPhone, #phoneInput, #findByCompanynumber, #companynumberInput, #findByRegistrationnumber, #registrationnumberInput').hide();
		$('#companynameLabel').closest('.label-container').hide(); // 법인명 라벨과 입력 필드 숨기기
		$('#nameLabel').text('이름');  // 기본 라벨 텍스트로 초기화
		$('#companynumber, label[for="companynumber"], #registrationnumber, label[for="registrationnumber"]').hide(); // 법인번호, 등록번호 라디오 버튼 숨기기
	}

	// 회원 유형에 따른 초기 필드 설정 함수
	function setMembershipFields(selectedType) {
		resetFields();
		if (selectedType === '개인회원' || selectedType === '개인사업자 회원') {
			// 개인회원 및 개인사업자: 이름과 이메일 or 휴대폰 번호 필드
			$('#findByEmail, #emailInput').show(); // 기본은 이메일로 찾기
			$('#phone').on('click', function() {
				toggleContactMethod('phone');
			});
			$('#email').on('click', function() {
				toggleContactMethod('email');
			});
		} 
		else if (selectedType === '법인사업자 회원') {
			// 법인사업자면 기본은 법인번호로 찾기
			$("#companynumber").prop("checked", true);
			$('#companynameLabel').closest('.label-container').show();
			$('#companynumber, label[for="companynumber"]').show();
			$('#findByCompanynumber, #companynumberInput').show(); 
			$('#nameLabel').text('법인명');
			
			// 법인사업자 연락 방법 선택 시 필드 전환
			$('#phone').on('click', function() {
				toggleContactMethod('phone', true);
			});
			$('#email').on('click', function() {
				toggleContactMethod('email', true);
			});
			$('#companynumber').on('click', function() {
				toggleContactMethod('companynumber', true);
			});
		} 
		else if (selectedType === '외국인 회원') {
			// 외국인 회원: 기본은 등록번호로 찾기
			$("#registrationnumber").prop("checked", true);
			$('#registrationnumber, label[for="registrationnumber"]').show();
			$('#findByRegistrationnumber, #registrationnumberInput').show();
			
			// 외국인 회원 연락 방법 선택 시 필드 전환
			$('#phone').on('click', function() {
				toggleContactMethod('phone', false, true);
			});
			$('#email').on('click', function() {
				toggleContactMethod('email', false, true);
			});
			$('#registrationnumber').on('click', function() {
				toggleContactMethod('registration', false, true);
			});
		}
	}

	// 초기 회원 유형에 따른 필드 설정
	$('.dropdown-select').on('change', function() {
		setMembershipFields($(this).val());
	});

	// 기본 이메일 및 휴대폰번호 클릭 이벤트 정의
	$('#phone').on('click', function() {
		toggleContactMethod('phone');
	});
	$('#email').on('click', function() {
		toggleContactMethod('email');
	});
});
</script>
</div>