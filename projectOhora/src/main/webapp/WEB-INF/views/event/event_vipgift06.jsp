<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="content">
	<div class="wrap">
		<div class="eventDetail">
			<div class="title-block"></div>
			<div class="event-wrap">
				<p style="text-align: center;">
					<img
						src="${contextPath}/resources/images/event_vipgift06_image/2_2.jpg"
						alt=""> <img
						src="${contextPath}/resources/images/event_vipgift06_image/1.jpg"
						alt=""> <img
						src="${contextPath}/resources/images/event_vipgift06_image/3.jpg"
						alt=""> <img
						src="${contextPath}/resources/images/event_vipgift06_image/4.jpg"
						alt="">

					<!-- 접근불가 페이지 -->
					<a
						href="/product/detail.html?product_no=1793&amp;cate_no=389&amp;display_group=1">
						<img
						src="${contextPath}/resources/images/event_vipgift06_image/5.jpg"
						alt=""> <img
						src="${contextPath}/resources/images/event_vipgift06_image/6.jpg"
						alt="">
					</a>
					<!-- 마이페이지 이동 링크, 로그인x일시 로그인 페이지로 이동 -->
					<a href="/myshop/mileage/historyList.html"> <img
						src="${contextPath}/resources/images/event_vipgift06_image/7.jpg"
						alt=""> <img
						src="${contextPath}/resources/images/event_vipgift06_image/event_8.jpg"
						alt=""> <!-- go_top 버튼 -->
						<div id="floating">
							<div class="go_top">
								<span class="icon"></span>
							</div>
						</div> <script>
	            // go_top 버튼 스크립트
	               $(document).ready(function() {
	                   // go_top 버튼 클릭 시 상단으로 부드럽게 이동
	                   $('.go_top').on('click', function() {
	                       $('html, body').animate({ scrollTop: 0 }, 400);
	                       return false;
	                   });
	                   
	                   // 스크롤 이벤트에 따라 go_top 버튼 표시
	                   $(window).scroll(function() {
	                       if ($(this).scrollTop() > 200) {
	                           $('#floating').fadeIn();
	                       } else {
	                           $('#floating').fadeOut();
	                       }
	                   });
	               });
	            </script>
					</a>
				</p>
			</div>
		</div>
	</div>
</div>