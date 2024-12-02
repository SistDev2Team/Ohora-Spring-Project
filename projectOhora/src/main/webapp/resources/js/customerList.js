$(document).on(
		"click",
		".detail-btn",
		function() {
			const userId = $(this).data("userid"); // 버튼에 저장된 회원 ID 가져오기

			// AJAX 요청 보내기
			$.ajax({
				url : "/admin/customerDetail.ajax", // 서버의 AJAX 처리 URL
				type : "GET",
				data : {
					userid : userId
				}, // 요청에 회원 ID 전달
				dataType : "json", // JSON 형식으로 응답 받기
				success : function(response) {
					if (response) {
						// 응답 데이터를 기반으로 모달에 데이터 설정
						$("#modal-userid").text(response.userid);
						$("#modal-name").text(response.name);
						$("#modal-grade").text(response.memid);
						$("#modal-email").text(response.useremail);
						$("#modal-tel").text(response.usertel);
						$("#modal-point").text(response.userpoint + "원");
						$("#modal-snsagree").text(response.usersnsagree);

						// 날짜 형식 변환
						const birthDate = new Date(response.userbirth);
						const joinDate = new Date(response.userjoindate);
						const birthFormatted = birthDate.toISOString()
								.split('T')[0]; // yyyy-MM-dd 형식으로 변환
						const joinFormatted = joinDate.toISOString().split(
								'T')[0]; // yyyy-MM-dd 형식으로 변환

						$("#modal-birth").text(birthFormatted);
						$("#modal-joindate").text(joinFormatted);
						if (response.enabled) {
			                $("#modal-enabled").text("사용중");
			            } else {
			                $("#modal-enabled").text("사용안함");
			            }

						// 모달 표시
						$("#userDetailModal").show();
					} else {
						alert("회원 정보를 불러오는 데 실패했습니다.");
					}
				},
				error : function(xhr, status, error) {
					console.error("Error:", error);
					alert("회원 정보를 불러오는 중 오류가 발생했습니다.");
				},
			});
		});
		
// 모달창 열기
$(document).on("click", "#openUserEnrollModal", function () {
    $("#userEnrollModal").show();
});
		

$(document).ready(function() {
    // 회원 정보 모달 열기
    function openUserDetailModal(user) {
        $('#modal-userid').text(user.userid);
        $('#modal-name').text(user.name);
        
        // '사용중'과 '사용안함' 옵션에 클래스 추가
        if (user.enabled) {
            $('#modal-enabled-select').val('true').removeClass('disabled').addClass('enabled');
        } else {
            $('#modal-enabled-select').val('false').removeClass('enabled').addClass('disabled');
        }
        
        $('#userDetailModal').show();
    }

    // 수정 버튼 클릭 시
    $('#updateBtn').click(function() {
        const userid = $('#modal-userid').text();
        const enabled = $('#modal-enabled-select').val();

        // CSRF 토큰 가져오기
        const csrfToken = $('meta[name="csrf-token"]').attr('content');

        // 서버에 업데이트 요청
        $.ajax({
            url: '/admin/updateUserStatus.ajax',
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': csrfToken
            },
            data: {
                userid: userid,
                enabled: enabled
            },
            dataType: 'json',
            success: function(response) {
                alert(response.message);
                $('#userDetailModal').hide();
                location.reload();
            },
            error: function(xhr, status, error) {
                alert('회원 정보 수정에 실패했습니다.');
            }
        });
    });

    // 닫기 버튼 클릭 시
    $('#closeDetailBtn').click(function() {
        $('#userDetailModal').hide();
    });
});	
