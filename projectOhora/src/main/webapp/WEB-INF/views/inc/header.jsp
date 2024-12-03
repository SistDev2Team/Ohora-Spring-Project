<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div id="header">
	<div class="SP_topBanner" style="display: block">
		<div class="SP_layoutMin">
			<div class="SP_topBn_inr"></div>

			<div class="xans-element- xans-layout xans-layout-statelogoff">
				<div class="slide_banner_top slick-initialized slick-slider"
					id="sltop_ban">
					<div class="slick-list draggable">
						<div class="slick-track"
							style="opacity: 1; width: 1200px; transform: translate3d(0px, 0px, 0px);">
							<div class="slick-slide slick-current slick-active"
								data-slick-index="0" aria-hidden="false" style="width: 1200px"
								tabindex="0">
								<a href="${pageContext.request.contextPath}/event/event_index.htm"
									tabindex="0" style="display: block"><img
									src="https://ohora.kr/optimize/images/pc/common/PC_header_lamp2.webp"
									style="width: 100%; display: block" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 회원 -->

	<div id="fix_position" class="modify ham_modify">
		<div id="SMS_fixed_wrap" class="SMS_fixed_wrap">
			<div class="SP_top_wrap">
				<div class="layout_Top">

					<div
						class="xans-element- xans-layout xans-layout-statelogoff SP_gnb_inr">
						
						<!-- 비회원 사용자 -->
						<sec:authorize access="isAnonymous()">
						    <a href="${contextPath}/member/joinus/join.htm" class="auth-link">
						        <span class="title">회원가입&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						    </a>
						    <a href="${contextPath}/member/joinus/login.htm" class="auth-link">
						        <span class="title">&nbsp;&nbsp;로그인</span>
						    </a>
						</sec:authorize>
						
						<!-- 관리자 사용자 -->
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						    <a href="${contextPath}/admin/productList.htm">
						        <span class="title">마이페이지</span>
						    </a>
						</sec:authorize>
												
						<!-- 일반 사용자 -->
						<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')">
						    <a href="${contextPath}/member/mypage/mypage.htm">
						        <span class="title">마이페이지</span>
						    </a>
						</sec:authorize>
												
						<!-- 인증된 사용자 (공통 표시) -->
						<sec:authorize access="isAuthenticated()">
		                   <a class="log" style="cursor: pointer;"><span class="title">로그아웃</span></a>
		                   <form id="logoutForm" action="${contextPath}/member/joinus/logout.htm" method="post" style="display: none;">
		                   <input type="hidden" name="_csrf" value="${_csrf.token}">
		                   </form>
		                    <script>
		                         $(document).ready(function(){
		                            $('.log').click(function(e){
		                                e.preventDefault(); // 기본 동작(페이지 이동)을 막음
		                                    $('#logoutForm').submit(); // form 제출
		                                   });
		                             });
		                    </script>                    
					  </sec:authorize>						
<!-- <script>
    <sec:authorize access="isAuthenticated()">
        let userid = '<sec:authentication property="principal.user.userid"/>';
        console.log("> userid : " + userid);
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        console.log("로그인x");
    </sec:authorize>
</script> -->
					</div>
				</div>
			</div>


			<div class="SMS_fixed_inner">
				<div
					class="xans-element- xans-layout xans-layout-logotop fixed_logo">
					<a href="${pageContext.request.contextPath}/oho_main.htm"
						style="display: block; text-align: center; margin-top: 30px">
						<img
						src="https://ohora.kr/web/upload/logo/ohora_BI_logotype_w.png"
						style="margin-bottom: 7px" />
					</a>
				</div>



				<!-- 헤더 주메뉴 -->
				<div class="gnb_menu_container">
					<ul class="gnb_menu_wrap menu_1ul">
						<li class="eng_font menu_1li submenu"><a
							href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=121&currentPage=1">new</a>
						</li>
						<li class="eng_font menu_1li submenu"><a
							href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=120&currentPage=1">best</a>
						</li>

						<li class="eng_font"><a
							href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=44&currentPage=1">product</a>
							<!-- 마우스 오버 시 나오는 영역(product) -->
							<ul class="menu_2ul">
								<li><a
									href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=160&currentPage=1"><span>네일</span></a>
								</li>
								<li><a
									href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=161&currentPage=1"><span>페디</span></a>
								</li>
								<li><a
									href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=49&currentPage=1"><span>커스텀</span></a>
								</li>
								<li><a
									href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=49&currentPage=1"><span>케어
											&amp; 툴</span></a></li>
							</ul> <!-- //마우스 오버 시 나오는 영역(product) --></li>
						<li class="eng_font menu_1li submenu"><a
							href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=671&currentPage=1"><span>outlet</span></a>
						</li>
						<li class="eng_font"><a
							href="${pageContext.request.contextPath}/event/event_index.htm">event</a></li>
						<li class="eng_font"><a
							href="${pageContext.request.contextPath}/howto/howto.htm">how
								to</a></li>
					</ul>
				</div>
				<!-- //헤더 주메뉴 -->


				<div class="icon_wrap">
					<div class="small_icon search_fixed_btn"></div>
					<div
						class="xans-element- xans-layout xans-layout-orderbasketcount small_icon m_cart common_cart">
						<a href="${pageContext.request.contextPath}/order/iscart.htm"><b
							class="count EC-Layout-Basket-count">0</b></a>
					</div>
					<div class="small_icon m_menu">
						<a class="SMS_menu"></a>
					</div>
				</div>
			</div>
		</div>


		<!-- 검색 -->
		<div class="hd_search_container"
			style="overflow: hidden; display: none">
			<div class="SP_search_wrap">
				<div class="SP_utilListSearch_inner">
					<form id="searchBarForm" name=""
						action="${pageContext.request.contextPath}/product/prd_search.htm"
						method="get" target="_self" enctype="multipart/form-data">
						<div class="xans-element- xans-layout xans-layout-searchheader">


							<fieldset>
								<legend style="display: none">검색</legend>
								<input id="keyword" name="keyword" fw-filter="" fw-label="검색어"
									fw-msg="" class="inputTypeText" placeholder=""
									onkeyup="SEARCH_HASHTAG.getHashtag($(this)); "
									autocomplete="off"
									onmousedown="SEARCH_BANNER.clickSearchForm(this)" value=""
									type="text" /> <input id="currentPage" name="currentPage"
									value="1" type="hidden" />
								<button type="button" class="SP_srh_submit_btn"
									onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
									<span class="SP_cm_icon SP_black_search_icon"></span>
								</button>
							</fieldset>
						</div>
					</form>
				</div>

				<!--------------- 검색 키워드 --------------->
				<div class="SP_utilListKeyword_inner">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=671&currentPage=1">#OUTLET
								입장하기</a></li>
						<li><a
							href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=120&currentPage=1">#BEST
								디자인 추천</a></li>
						<li><a
							href="${pageContext.request.contextPath}/event/event_event6.htm">#첫구매
								젤램프 증정</a></li>
					</ul>
				</div>
				<!--------------- 검색 키워드 --------------->
			</div>
		</div>

		<!-- 더보기 -->
		<div class="hd_cate_container" style="overflow: hidden; display: none">
			<div class="SP_category_wrap" style="margin-top: 172px;">
				<div class="inner">

					<div class="cate_wrap first">


						<div class="big_txt">
							<a class="eng_font big_"
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=121&currentPage=1">
								<span>new</span>
							</a> <a class="#"> <span></span>
							</a> <a class="#"> <span></span>
							</a>
						</div>
						<div class="big_txt" style="margin-top: 60px;">
							<a class="eng_font big_"
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=120&currentPage=1">
								<span>best</span>
							</a> <a
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=125&currentPage=1">
								<span>네일</span>
							</a> <a
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=127&currentPage=1">
								<span>페디</span>
							</a>
						</div>
					</div>
					<div class="cate_wrap first">
						<div class="big_txt">
							<a class="eng_font big_"
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=160&currentPage=1">
								<span>nail</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=435&currentPage=1">
								<span>젤스트립</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=436&currentPage=1">
								<span>젤네일팁</span>
							</a>
						</div>
						<div class="big_txt" style="margin-top: 63px;">
							<a class="eng_font big_"
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=161&currentPage=1">
								<span>pedi</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=161&currentPage=1">
								<span>젤스트립</span>
							</a>
						</div>
					</div>

					<div class="cate_wrap first">
						<div class="big_txt">
							<a class="eng_font big_"
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=671&currentPage=1">
								<span>outlet</span>
							</a>
						</div>
						<div class="big_txt">
							<span></span> <span></span> <span></span>
						</div>

						<div class="big_txt" style="margin-top: 80px;">
							<a class="#"> <span></span>
							</a>
						</div>
						<div class="big_txt" style="margin-top: 45px;">
							<a class="eng_font big_"
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=49&currentPage=1">
								<span>care &amp; tool</span>
							</a>
						</div>
					</div>

					<!--------- 첫번째 줄 메뉴(신제품 출시 관련 수정 영역) --------->
					<style>
</style>

					<!------- 두번째 줄 메뉴 ------>
					<div class="cate_wrap second">

						<div class="big_txt"
							style="margin-left: 35px; margin-bottom: 42px;">
							<a class="big_ eng_font"
								href="${pageContext.request.contextPath}/event/event_index.htm">
								<span>event</span>
							</a>
						</div>

						<div class="big_txt"
							style="margin-left: 35px; margin-bottom: 42px;">
							<a class="big_ eng_font"
								href="${pageContext.request.contextPath}/review/reviewlist.htm?pdt_id=1">
								<span>review</span>
							</a>
						</div>
						<div class="big_txt" style="margin-left: 35px;">
							<a class="big_ eng_font" href="#empty"> <span
								style="margin-top: 10px;">brand</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/board/ohora_Fend_brand4.htm">
								<span>about</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/board/membership.htm"> <span>membership</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/board/magazine.htm"> <span>magazine</span>
							</a> <a class=""
								href="${pageContext.request.contextPath}/product/prd_view.htm?cate_no=238&currentPage=1">
								<span>collaboration</span>
							</a>
						</div>
					</div>
					<!------ 두번째 줄 메뉴 ------>
					<!------ 세번째 줄 메뉴 ------>
					<div class="cate_wrap crew">
						<!--오호라 크루 추천-->
						<div
							class="common_reco_section recommend_crew swiper-container swiper-container-initialized swiper-container-horizontal load-complete">
							<h3>오호라 크루 추천</h3>
							<div df-banner-code="common-recommend"
								class="recommend_banner_wrap swiper-wrapper df-bannermanager df-bannermanager-common-recommend"
								style="transition-duration: 0ms; transform: translate3d(-260px, 0px, 0px);">
								<div df-banner-clone=""
									class="SP_eventBn_li swiper-slide swiper-slide-prev">
									<a href="#empty"><div class="imgBox">
											<img
												src="https://ohora.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/94fad6d6474acf635b9c771591480a7c.png"
												alt="페이코 상시 12% 할인" />
										</div>
										<div class="txtBox">페이코 상시 12% 할인</div></a>
								</div>
								<div df-banner-clone=""
									class="SP_eventBn_li swiper-slide swiper-slide-active">
									<a href="#empty"><div class="imgBox">
											<img
												src="	https://ohora.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/4cd90f97beaaeddde49bbad02da10bc5.webp"
												alt="앱 다운 시 무료배송" />
										</div>
										<div class="txtBox">앱 다운 시 무료배송</div></a>
								</div>
								<div df-banner-clone=""
									class="SP_eventBn_li swiper-slide swiper-slide-next">
									<a href="#empty"><div class="imgBox">
											<img
												src="https://ohora.kr/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/0b48933209882b54093f40d23cb23246.webp"
												alt="신규회원 젤램프 증정" />
										</div>
										<div class="txtBox">신규회원 젤램프 증정</div></a>
								</div>
							</div>
							<!-- 스와이퍼 스크롤 -->
							<div class="swiper-scrollbar">
								<div class="swiper-scrollbar-drag"
									style="transition-duration: 0ms; transform: translate3d(85px, 0px, 0px); width: 85px;"></div>
							</div>
							<span class="swiper-notification" aria-live="assertive"
								aria-atomic="true"></span>
						</div>
						<!--// 오호라 크루 추천-->
						<div class="third_cate">
							<a href="https://oe9lp.channel.io/home"><span>CS
									Center</span></a> <a
								href="${pageContext.request.contextPath}/board/noticelist.htm?currentPage=1"><span>Notice</span></a>
							<a
								href="${pageContext.request.contextPath}/board/faqlist.htm?currentPage=1"><span>FAQ</span></a>
							<a href="${pageContext.request.contextPath}/howto/howto.htm">How
								to</a>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- sticky 적용을 위한 태그-->
	<script>
var userPk = <sec:authorize access="isAuthenticated()">'<sec:authentication property="principal.user.userid"/>'</sec:authorize>
<sec:authorize access="isAnonymous()">0</sec:authorize>;
console.log("User ID: " + userPk);
</script>

	<!-- 슬라이더 초기화 코드 -->
	<script>
      $(document).ready(function () {
        $(".slide_banner_top").slick({
          infinite: true,
          speed: 300,
          slidesToShow: 1,
          dots: false,
          arrows: false,
          autoplay: true,
          autoplaySpeed: 3000,
          swipe: true,
          pauseOnHover: false,
        });
      });
      
      function initCartCount(userPk){
     	   $.ajax({
                url: "/initcart.ajax",
                type: "GET",
                dataType: "json",
                data: { userPk },
                success: function (response){
             	   $(".EC-Layout-Basket-count").text(response.count);
               }
            });
        }
        
        if (userPk != 0){
      	  initCartCount(userPk);
        } else {
      	  
        }
      
    </script>

	<script>
      $(document).ready(function() {
        const searchContainer = $('.hd_search_container');
        const cateContainer = $('.hd_cate_container');

        searchContainer.hide();
        cateContainer.hide();

        // 검색 버튼 클릭 시
        $('.small_icon.search_fixed_btn').on('click', function() {
          if (!searchContainer.is(':visible')) {
            cateContainer.stop(true, true).fadeOut(300, function() {
              searchContainer.stop(true, true).slideDown(500).animate({ opacity: 1 }, { duration: 10 });
              $('#keyword').focus();
            });
          } else {
            searchContainer.stop(true, true).slideUp(500).animate({ opacity: 0 }, { duration: 10 });
          }
        });

        // 더보기 버튼 클릭 시
        $('.SMS_menu').on('click', function() {
          if (!cateContainer.is(':visible')) {
            searchContainer.stop(true, true).fadeOut(300, function() {
              cateContainer.stop(true, true).slideDown(500).animate({ opacity: 1 }, { duration: 10 });
              $('#keyword').focus();
            });
          } else {
            cateContainer.stop(true, true).slideUp(500).animate({ opacity: 0 }, { duration: 10 });
          }
        });
      });
    </script>

	<!-- Swiper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- 오호라 크루 추천 스와이퍼 -->
	<script>
     $(document).ready(function() {
      var swiper = new Swiper("div.common_reco_section.recommend_crew.swiper-container.swiper-container-initialized.swiper-container-horizontal", {
        slidesPerView: 1,
        spaceBetween: 10,
        loop: false, 
        pagination: {
          el: ".swiper-scrollbar",
          clickable: true,
        },
        navigation: {
          nextEl: "div.recommend_banner_wrap.swiper-wrapper.df-bannermanager.df-bannermanager-common-recommend > div.SP_eventBn_li.swiper-slide.swiper-slide-next",
          prevEl: "div.recommend_banner_wrap.swiper-wrapper.df-bannermanager.df-bannermanager-common-recommend > div.SP_eventBn_li.swiper-slide.swiper-slide-prev",
        }
      });
    });

    </script>


</div>
