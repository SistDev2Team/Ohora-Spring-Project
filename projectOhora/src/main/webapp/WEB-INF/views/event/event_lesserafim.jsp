<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="content">
<div class="wrap">
    <div class="eventDetail">
        <div class="title-block">
        </div>
        <div class="event-wrap">
            <p style="text-align: center;">
            <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_01.jpg" alt="">
            <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_02.jpg" alt="">
            <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_03.jpg" alt="">
            </p>
            <div style="position:relative; width:1000px; margin:0 auto;">
            <iframe src="https://www.youtube.com/embed/hxVv7BJYjlc" width="1024px;" height="576px;" frameborder="0" allow="autoplay; fullscreen; picture-in-picture;" allowfullscreen=""></iframe>
            </div>
                <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_05.jpg" alt="">
                <div style="position:relative; width:1000px; margin:0 auto;">
            <iframe src="https://www.youtube.com/embed/UBURTj20HXI" width="1024px;" height="576px;" frameborder="0" allow="autoplay; fullscreen; picture-in-picture;" allowfullscreen=""></iframe>
            </div>
                <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_07.jpg" alt="">
                <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_08.jpg" alt="">
                
                <!-- 콜라보레이션 제품 페이지. 접근불가 페이지임. -->
                <a href="/product/detail.html?product_no=1891&amp;cate_no=607">
                <img src="${contextPath}/resources/images/event_lesserafim_image/LE-SSERAFIM-X-ohora_event_09.jpg">
                </a>
                
                <!-- go_top 버튼 -->
			   <div id="floating">
				    <div class="go_top">
				        <span class="icon"></span>
				    </div>
				</div>
                
            <script>
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

                </div>
            </div>
        </div>
</div>