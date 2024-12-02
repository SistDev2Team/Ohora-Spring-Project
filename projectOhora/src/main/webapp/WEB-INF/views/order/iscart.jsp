<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- 장바구니 영역 -->
<div id="content">
    <div id="SP_order_wrap" class="sub_container basket_container">
        <div class="SP_layoutFix">
            <!-- 타이틀 -->
            <div class="SP_subSection">
                <h2 class="SP_subTitle">
                    <span class="eng_font">장바구니</span>
                </h2>
            </div>
            <!-- 타이틀 -->
            <div style="display:none;" class="xans-element- xans-order xans-order-normnormal xans-record-">
                <div class="xans-element- xans-order xans-order-list xans-record-">
                    <!-- 일반 기본배송 -->
                </div>
            </div>
            <!-- 장바구니 모듈 -->
            <div class="xans-element- xans-order xans-order-basketpackage  order_page">
                <!-- 혜택 정보 -->
                <div style="display:none" class="xans-element- xans-order xans-order-dcinfo ec-base-box typeMember  ">
                    <div class="SP_orderInformation_wrap">
                        <div class="information">
                            <div class="SP_contTitle">혜택정보</div>
                            <div class="description">
                                <div class="member ">
                                    <p>
                                        <strong>이시훈</strong>
                                        님은, [Friend] 회원이십니다.
                                    </p>
                                </div>
                                <div class="SP_orderMileage_wrap">
                                    <ul class>
                                        <li>
                                            <a href="/myshop/mileage/historyList.html">
                                                가용적립금 :
                                                <strong>0원</strong>
                                            </a>
                                        </li>
                                        <li class="displaynone">
                                            <a href="/myshop/deposits/historyList.html">
                                                예치금 :
                                                <strong></strong>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="/myshop/coupon/coupon.html">
                                                쿠폰 :
                                                <strong>0개</strong>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="SP_optChangeGuide_wrap">
                                    <ul class>
                                        <li class="txtWarn txt11">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
                                        <li class="txtWarn txt11 displaynone">할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- // 혜택 정보 -->

                <!-- 장바구니 정보 -->
                <div class="xans-element- xans-order xans-order-tabinfo SP_order_tab displaynone ">
                    <ul class="menu"></ul>
                    <p class="right ">장바구니에 담긴 상품은 14일 동안 보관됩니다.</p>
                </div>
                <!-- // 장바구니 정보 -->

                <!-- 장바구니 상품 있을 때 -->
                <div
                    class="xans-element- xans-order xans-order-emptyitem toggleArea eToggle selected basket_item_wrapper">

                    <!-- 선택상품 제어 버튼 -->
                    <div class="xans-element- xans-order xans-order-selectorder">
                        <a href="javascript:void(0)" class="mini SMScart_allsel_btnTD selected" id="product_select_all"
                            data-status="off">
                            <div class="box">
                                <div id="all_checkcolor"></div>
                            </div>
                            <span class="count">
                                전체 상품 (<span class="all-count">${cartItems.size()}</span>)
                            </span>
                        </a>
                    </div>
                        <!-- 초기 합계 설정 -->
                        <c:set var="totalAmount" value="0" scope="page" />
                        <c:set var="totalDiscount" value="0" scope="page" />

                        <!-- 각 상품 항목 출력 -->
                        <c:forEach var="dto" items="${cartItems}" varStatus="status">
                            <div class="prdInfo xans-record-" data-pdtid="${dto.pdtid }">
                                <div class="xans-element- xans-order xans-order-normnormal xans-record-">
                                    <div class="xans-element- xans-order xans-order-list">


                                        <!-- 개별 체크박스 -->
                                        <input type="checkbox" id="basket_chk_id_${status.index}"
                                            name="basket_product_normal_type_normal_${status.index}"
                                            class="basket-checkbox checked">
                                        <label for="basket_chk_id_${status.index}" class="label_for_check">
                                            <div id="checkcolor${status.index}" class="checkcolor checked"
                                                style="background-color: black;"></div>
                                        </label>
                                        <input type="hidden" id="pdtId" name="pdtId" value="${dto.pdtid}">
                                		<input type="hidden" id="pdtCount" name="pdtCount" value="${dto.quantity}">
                                        &nbsp;
                                        <!-- // 개별 체크박스 -->

                                        <!-- 설명 -->
                                        <div class="description">
                                            <p class="prdImg">
                                                <a href="${contextPath}/product/prd_view.htm?product_no=2&cate_no=160">
                                                    <img loading="lazy" src="../resources/images/prdimage/imgs/${dto.pdtimgurl}.jpg"
                                                    alt="${dto.pdtname}" width="250" height="250"
                                                        onerror="this.onerror=null; this.src='/resources/images/default_image.jpg';">
                                                    </a>
                                            </p>

                                            <!-- 상품 설명 -->
                                            <div class="prdDesc">
                                                <strong class="prdName" title="상품명">
                                                    <a href="view.htm?pdtid=${dto.pdtid}">${dto.pdtname}</a>
                                                </strong>
                                                <ul class="info">
                                                    <li class="displaynone">
                                                        배송 : <span class="displaynone">3,000</span> [조건] / 기본배송
                                                        <span class="displaynone">(해외배송가능)</span>
                                                    </li>
                                                    <li title="적립금" class="mileage displaynone">적립금-</li>
                                                    <li class="price">
                                                    	<c:choose>
															<c:when test="${ dto.pdtdiscountrate != 0 }">
		                                                        <span class="discount" title="판매가">
		                                                            <strong>
		                                                                <fmt:formatNumber value="${dto.pdtamount}"
		                                                                    type="number" pattern="#,##0" />
		                                                            </strong>
		                                                        </span>
		                                                        <span title="할인판매가">
		                                                            <strong>
		                                                                <fmt:formatNumber value="${dto.pdtdiscountamount}"
		                                                                    type="number" pattern="#,##0" />
		                                                            </strong>
		                                                        </span>
		                                                        <span class="dc_percent">${dto.pdtdiscountrate}%</span>
															</c:when>
															<c:otherwise>
		                                                        <span title="할인판매가">
		                                                            <strong>
		                                                                <fmt:formatNumber value="${dto.pdtdiscountamount}"
		                                                                    type="number" pattern="#,##0" />
		                                                            </strong>
		                                                        </span>
															</c:otherwise>
														</c:choose>
                                                    </li>

                                                    <!-- 수량 조절 (-/+) 버튼 -->
                                                    <li class="quantity product-row" data-price="${dto.pdtamount}"
                                                        data-discount="${dto.pdtamount - dto.pdtdiscountamount}">
                                                        <a href="javascript:void(0);" class="minusBtn">
                                                            <img class="QuantityDown" alt="down"
                                                                src="/SkinImg/img/minus.svg" width="25" height="25">
                                                        </a>
                                                        <input id="quantity_id_${dto.pdtid}"
                                                            name="quantity_name_${dto.pdtid}" size="2"
                                                            value="${dto.quantity}" type="text" class="quantityInput">
                                                        <a href="javascript:void(0);" class="plusBtn">
                                                            <img class="QuantityUp" alt="up" src="/SkinImg/img/plus.svg"
                                                                width="25" height="25">
                                                        </a>
                                                    </li>
                                                    <!-- // 수량 조절 -->

                                                    <!-- 합계 -->
                                                    <div class="prdTotal">
                                                        합계 : <strong class="itemTotal">
                                                            <fmt:formatNumber
                                                                value="${(dto.pdtamount - dto.pdtdiscountamount) * dto.pdtcount}"
                                                                type="number" pattern="#,##0" />
                                                        </strong>
                                                    </div>

                                                </ul>
                                            </div>
                                        </div>

                                        <!-- 버튼 영역 -->
                                        <c:choose>
				                            <c:when test="${empty auth}">
				                                <a href="#none" id="deleteBtn" onclick="deleteItem(${status.index});" class="btnNormal SMScart_option_del_btnTD">삭제</a>
				                            </c:when>
				                            <c:otherwise>
				                                <a href="${contextPath}/product/deletecart.htm?pdtid=${dto.pdtid}" class="btnNormal SMScart_option_del_btnTD">삭제</a>
				                            </c:otherwise>
				                        </c:choose>
                                        <div class="btnArea typeFull displaynone">
                                            <span class="gLeft">
                                                <a href="#none" onclick="deleteItem('basket_chk_id_${status.index}');"
                                                 class="btnNormal SMScart_option_del_btnTD">삭제</a>
                                                <a href="#none" onclick="BasketNew.moveWish(${dto.pdtid});"
                                                    class="btnNormal SMScart_option_wish_btnTD">관심상품</a>
                                            </span>
                                            <span class="gRight">
                                                <a href="#none" onclick="Basket.orderBasketItem(${dto.pdtid});"
                                                    class="btnStrong SMScart_option_buy_btnTD">주문하기</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 누적 계산 -->
                                <c:set var="itemTotal" value="${dto.pdtdiscountamount * dto.pdtcount}" />
                                <c:set var="itemDiscount"
                                    value="${(dto.pdtamount - dto.pdtdiscountamount) * dto.pdtcount}" />
                                <c:set var="totalAmount" value="${totalAmount + itemTotal}" scope="page" />
                                <c:set var="totalDiscount" value="${totalDiscount + itemDiscount}" scope="page" />
                            </div>
                        </c:forEach>

                        <!-- 총 주문금액 영역 -->
                        <c:set var="shippingFee" value="3000" scope="page" />

                        <!-- 최종 결제 예정 금액 계산: 50000원 이상일 때 배송비 제외 -->
                        <c:choose>
                            <c:when test="${totalAmount - totalDiscount >= 50000}">
                                <c:set var="finalAmount" value="${totalAmount - totalDiscount}" scope="page" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="finalAmount" value="${totalAmount - totalDiscount + shippingFee}"
                                    scope="page" />
                            </c:otherwise>
                        </c:choose>
                </div>
                <!-- 결제 예정 금액 표시 -->
                <div class="xans-element- xans-order xans-order-emptyitem total_order_wrapper" style="top: 157px;">
                    <div class="total_order_inner">
                        <div class="xans-element- xans-order xans-order-totalsummary totalSummary">

                            <!-- 총 상품 금액 -->
                            <div class="toggleArea type1 eToggle">
                                <div class="total title item">
                                    <h3>총 상품금액</h3>
                                    <p>
                                        <strong class="prdPriceAll">
                                            <fmt:formatNumber value="${totalAmount}" type="number" pattern="#,##0" />
                                        </strong>
                                    </p>
                                </div>
                            </div>

                            <!-- 배송비 -->
                            <c:if test="${shippingFee > 0}">
                                <div class="toggleArea type1 eToggle">
                                    <div class="item total title">
                                        <h3>총 배송비</h3>
                                        <p class="delivery_price_wrap">
                                            <strong class="prdDelvAll">
                                                <fmt:formatNumber value="${shippingFee}" type="number"
                                                    pattern="#,##0" />
                                            </strong>
                                        </p>
                                        <div class="total_info_txt delv">
                                            <span class="amount">
                                                <fmt:formatNumber value="${50000 - (totalAmount - totalDiscount)}"
                                                    type="number" pattern="#,##0" />
                                            </span>
                                            원 추가 구매시 <b>무료배송</b>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- 상품 할인 금액 -->
                            <div class="toggleArea type1 eToggle">
                                <div class="total title item">
                                    <h3>상품할인금액</h3>
                                    <p class="discountAll">
                                        -
                                        <span class="discount">
                                            <strong class="prdDiscountAll">
                                                <fmt:formatNumber value="${totalDiscount}" type="number"
                                                    pattern="#,##0" />
                                            </strong>
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <!-- 결제예정금액 -->
                            <div class="toggleArea type1 eToggle order final">
                                <div class="item total title">
                                    <h3>총 결제예정금액</h3>
                                    <p class="price_final">
                                        <strong class="prdFinalAll">
                                            <fmt:formatNumber value="${finalAmount}" type="number" pattern="#,##0" />
                                        </strong>
                                    </p>

                                    <!-- 예상 적립금 (배송비 제외) -->
                                    <div class="mileage total_info_txt">
                                        <div class="xans-element- xans-layout xans-layout-statelogon member">
                                            <div class="xans-element- xans-order xans-order-dcinfo displaynone">
                                                <div class="group_name">Friend</div>
                                            </div>
                                            <div class="mileage_txt">
                                            	<!-- 비회원 -->
                                                <b>로그인 후 회원혜택과 적립금을 확인하세요.</b>
                                                <!-- 회원 -->
                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 주문하기 버튼 -->
                        <div class="xans-element- xans-order xans-order-totalorder SP_tableBtn_wrap">
                            <div class="SP_tableBtnAlign_right">
                                <div class="btn buy_btn">
                                	<a href="" class="SP_cm_btn">구매하기</a>

                                </div>
                                <div class="displaynone">
                                    <a href="/" class="SP_cm_btn">계속 쇼핑하기</a>
                                    <a href="#none" onclick="Basket.orderSelectBasket(this)"
                                        link-order="/order/orderform.html?basket_type=all_buy"
                                        link-login="/member/login.html" class="SP_cm_btn ">선택상품 주문</a>
                                    <a href="#none" onclick="Basket.orderAll(this)"
                                        link-order="/order/orderform.html?basket_type=all_buy"
                                        link-login="/member/login.html" class="SP_cm_btn   ">전체 상품주문</a>
                                    <div id="appPaymentButtonBox"
                                        style="display:block; max-width:365px; margin:10px auto 0; text-align:center;">
                                    </div>
                                </div>
                                <div id="NaverChk_Button" class="naver_Wrap displaynone"></div>
                            </div>
                        </div>
                        <!-- // 주문하기 버튼 -->
                    </div>
                </div>
                <!-- // 총 주문금액 영역 -->
            </div>
            <div class="common_list_container reco_new_container">
                <div class="text_area">
                    <h3 class="basketRcmdTit">추천 상품</h3>
                </div>
                <div class="SMS_Product_display SMSprdSortTarget common_list_box" data-sort="2col">
                    <div class="swiper-container swiper-lazy-init swiper-container-initialized swiper-container-horizontal"
                        data-swiper-key="reconewContainer">
                        <!-- 상품리스트영역 ul -->
                        <ul class="items SMSitems common_items swiper-wrapper"
                            style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">

                            <li class="xans-record- append_item swiper-slide"
                                style="width: 323.333px; margin-right: 40px;">
                                <div class="complete container " data-prd-no="776" data-filter="#마블#데일리">
                                    <dl>
                                        <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1"
                                            class="viewlink"></a>
                                        <div class="base_img">
                                            <div class="BR_icon">
                                                <p>
                                                    <b>BEST</b>
                                                    리뷰
                                                </p>
                                            </div>
                                            <div class="thumb">
                                                <img loading="lazy"
                                                    class="*lazyload thumb_img swiper-lazy swiper-lazy-loaded"
                                                    data-original alt width="800" height="800"
                                                    src="https://www.ohora.kr/web/product/medium/202206/b6fe4302016acc84bfbf25e779d307f2.jpg">
                                                <img loading="lazy" decoding="async"
                                                    class="*lazyload hover_img swiper-lazy swiper-lazy-loaded"
                                                    data-original alt width="800" height="800" src="">
                                                <div class="sticker">
                                                    <div class="new">NEW</div>
                                                    <div class="percent">
                                                        <div class="dcPercent"></div>
                                                    </div>
                                                    <div class="best">BEST</div>
                                                </div>
                                                <span class="soldout_img" style="display: none;">
                                                    <span>
                                                        coming
                                                        <br>
                                                        soon
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="base_mask">
                                            <dd class="info_container">
                                                <p class="name">
                                                    <span style="font-size:16px;color:#000000;font-weight:bold;">N 멀베리
                                                        네일</span>
                                                </p>
                                                <p class="subname"></p>
                                                <p class="subnameSimple"></p>
                                            </dd>
                                            <dd class="soldout_container" style="display: none;">
                                                <p class="soldout">(품절)</p>
                                            </dd>
                                            <dd class="price_container">
                                                <p class="custom_price displaynone">0</p>
                                                <p class="setCustomPrice displaynone">0</p>
                                                <p class="price">
                                                    14,800
                                                </p>
                                                <p class="sale_price displaynone"></p>
                                            </dd>
                                            <dd class="icons  displaynone" style="display: none;" "></dd>
                                    <div class=" prdInfo_bottom">
                                                <div class="crema_container">
                                                    <div class="crema_wrap">
                                                        <p class="rv_value">
                                                            <span class="crema-product-reviews-score crema-applied"
                                                                data-product-code="776" data-star-style="single"
                                                                data-format="{{{stars}}} {{{score}}}"
                                                                data-hide-if-zero="1" data-applied-widgets="["
                                                                .crema-product-reviews-score"]">
                                                                <div class="crema_product_reviews_score__container"
                                                                    style="display: inline-block; font-family: inherit;">
                                                                    <div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full "
                                                                        style="width: 13px; height: 13px; vertical-align: middle; display: inline-block;">
                                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                            width="20" height="20" viewBox="0 0 20 20"
                                                                            class="crema_product_reviews_score_star_wrapper__star "
                                                                            style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
                                                                            <defs>
                                                                                <path id="star-full"
                                                                                    d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">
                                                                                </path>
                                                                            </defs>
                                                                            <use xlink:href="#star-full"></use>
                                                                        </svg>
                                                                    </div>
                                                                    4.9
                                                                </div>
                                                            </span>
                                                        </p>
                                                        <p class="rv_count">
                                                            <span class="rv_icon">
                                                                <img src="/web/upload/rv_icon2.png">
                                                            </span>
                                                            <span
                                                                class="count crema-product-reviews-count crema-applied"
                                                                data-product-code="776" data-format="{{{count}}}"
                                                                data-hide-if-zero="1" data-applied-widgets="["
                                                                .crema-product-reviews-count"]">
                                                                1,817
                                                            </span>
                                                        </p>
                                                    </div>
                                                </div>
                                        </div>
                                        <div class="hash_container done">
                                            <div class="hash_wrap"></div>
                                        </div>
                                        <div class="Prev_Cart" onclick="basketConfirmShow(this);">
                                            <img src="https://www.ohora.kr/web/upload/common/mobile/icon_cart_gray.png"
                                                onclick="category_add_basket('776','120', '1', 'A0000', false, '1', 'P0000BDW', 'A', 'F', '0');"
                                                alt="장바구니 담기" class="ec-admin-icon cart">
                                        </div>
                                        <div class="rv_icon">
                                            <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1">
                                                <img src="/web/upload/rv_icon1.png">
                                                <span class="count crema-product-reviews-count crema-applied"
                                                    data-product-code="776" data-format="{{{count}}}"
                                                    data-hide-if-zero="1" data-applied-widgets="["
                                                    .crema-product-reviews-count"]">1,817</span>
                                            </a>
                                        </div>
                                        <div class="only_info_chk displaynone">
                                            <div class="xans-element- xans-product xans-product-listitem">
                                                <div class=" display_가격 xans-record-">
                                                    <strong class="title displaynone">
                                                        <span
                                                            style="font-size:12px;color:#555555;font-weight:bold;">가격</span>
                                                    </strong>
                                                    <span
                                                        style="font-size:12px;color:#555555;font-weight:bold;text-decoration:line-through;">14,800</span>
                                                    <span id="span_product_tax_type_text"
                                                        style="text-decoration:line-through;"> </span>
                                                </div>
                                                <div class=" display_사용후기 xans-record-">
                                                    <strong class="title displaynone">
                                                        <span style="font-size:12px;color:#555555;">사용후기</span>
                                                    </strong>
                                                    <span style="font-size:12px;color:#555555;">234</span>
                                                </div>
                                                <div class="xans-record-">
                                                    <strong class="title displaynone"></strong>
                                                </div>
                                                <div class=" display_해시태그 xans-record-">
                                                    <strong class="title displaynone">
                                                        <span style="font-size:12px;color:#555555;">해시태그</span>
                                                    </strong>
                                                    <span style="font-size:12px;color:#555555;">#네일 #아트 #버건디 #레드 #마블
                                                        #가을네일</span>
                                                </div>
                                                <div class=" display_상품필터값 xans-record-">
                                                    <strong class="title displaynone">
                                                        <span style="font-size:12px;color:#555555;">상품필터값</span>
                                                    </strong>
                                                    <span style="font-size:12px;color:#555555;">마블,데일리</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="restockIcon"></div>
                                </div>
                                </dl>
                    </div>
                    </li>

                    <li class="xans-record- append_item swiper-slide" style="width: 323.333px; margin-right: 40px;">
                        <div class="complete container " data-prd-no="776" data-filter="#마블#데일리">
                            <dl>
                                <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1"
                                    class="viewlink"></a>
                                <div class="base_img">
                                    <div class="BR_icon">
                                        <p>
                                            <b>BEST</b>
                                            리뷰
                                        </p>
                                    </div>
                                    <div class="thumb">
                                        <img loading="lazy" class="*lazyload thumb_img swiper-lazy swiper-lazy-loaded"
                                            data-original alt width="800" height="800"
                                            src="https://www.ohora.kr/web/product/medium/202207/a01ac461b36b71f78270548dbc29b121.jpg">
                                        <img loading="lazy" decoding="async"
                                            class="*lazyload hover_img swiper-lazy swiper-lazy-loaded" data-original alt
                                            width="800" height="800" src="">
                                        <div class="sticker">
                                            <div class="new">NEW</div>
                                            <div class="percent">
                                                <div class="dcPercent"></div>
                                            </div>
                                            <div class="best">BEST</div>
                                        </div>
                                        <span class="soldout_img" style="display: none;">
                                            <span>
                                                coming
                                                <br>
                                                soon
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="base_mask">
                                    <dd class="info_container">
                                        <p class="name">
                                            <span style="font-size:16px;color:#000000;font-weight:bold;">N 멀베리 네일</span>
                                        </p>
                                        <p class="subname"></p>
                                        <p class="subnameSimple"></p>
                                    </dd>
                                    <dd class="soldout_container" style="display: none;">
                                        <p class="soldout">(품절)</p>
                                    </dd>
                                    <dd class="price_container">
                                        <p class="custom_price displaynone">0</p>
                                        <p class="setCustomPrice displaynone">0</p>
                                        <p class="price">
                                            14,800
                                        </p>
                                        <p class="sale_price displaynone"></p>
                                    </dd>
                                    <dd class="icons  displaynone" style="display: none;" "></dd>
                                    <div class=" prdInfo_bottom">
                                        <div class="crema_container">
                                            <div class="crema_wrap">
                                                <p class="rv_value">
                                                    <span class="crema-product-reviews-score crema-applied"
                                                        data-product-code="776" data-star-style="single"
                                                        data-format="{{{stars}}} {{{score}}}" data-hide-if-zero="1"
                                                        data-applied-widgets="[" .crema-product-reviews-score"]">
                                                        <div class="crema_product_reviews_score__container"
                                                            style="display: inline-block; font-family: inherit;">
                                                            <div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full "
                                                                style="width: 13px; height: 13px; vertical-align: middle; display: inline-block;">
                                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                    width="20" height="20" viewBox="0 0 20 20"
                                                                    class="crema_product_reviews_score_star_wrapper__star "
                                                                    style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
                                                                    <defs>
                                                                        <path id="star-full"
                                                                            d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">
                                                                        </path>
                                                                    </defs>
                                                                    <use xlink:href="#star-full"></use>
                                                                </svg>
                                                            </div>
                                                            4.9
                                                        </div>
                                                    </span>
                                                </p>
                                                <p class="rv_count">
                                                    <span class="rv_icon">
                                                        <img src="/web/upload/rv_icon2.png">
                                                    </span>
                                                    <span class="count crema-product-reviews-count crema-applied"
                                                        data-product-code="776" data-format="{{{count}}}"
                                                        data-hide-if-zero="1" data-applied-widgets="["
                                                        .crema-product-reviews-count"]">
                                                        1,817
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                </div>
                                <div class="hash_container done">
                                    <div class="hash_wrap"></div>
                                </div>
                                <div class="Prev_Cart" onclick="basketConfirmShow(this);">
                                    <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
                                        onclick="category_add_basket('776','120', '1', 'A0000', false, '1', 'P0000BDW', 'A', 'F', '0');"
                                        alt="장바구니 담기" class="ec-admin-icon cart">
                                </div>
                                <div class="rv_icon">
                                    <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1">
                                        <img src="/web/upload/rv_icon1.png">
                                        <span class="count crema-product-reviews-count crema-applied"
                                            data-product-code="776" data-format="{{{count}}}" data-hide-if-zero="1"
                                            data-applied-widgets="[" .crema-product-reviews-count"]">1,817</span>
                                    </a>
                                </div>
                                <div class="only_info_chk displaynone">
                                    <div class="xans-element- xans-product xans-product-listitem">
                                        <div class=" display_가격 xans-record-">
                                            <strong class="title displaynone">
                                                <span style="font-size:12px;color:#555555;font-weight:bold;">가격</span>
                                            </strong>
                                            <span
                                                style="font-size:12px;color:#555555;font-weight:bold;text-decoration:line-through;">14,800</span>
                                            <span id="span_product_tax_type_text" style="text-decoration:line-through;">
                                            </span>
                                        </div>
                                        <div class=" display_사용후기 xans-record-">
                                            <strong class="title displaynone">
                                                <span style="font-size:12px;color:#555555;">사용후기</span>
                                            </strong>
                                            <span style="font-size:12px;color:#555555;">234</span>
                                        </div>
                                        <div class="xans-record-">
                                            <strong class="title displaynone"></strong>
                                        </div>
                                        <div class=" display_해시태그 xans-record-">
                                            <strong class="title displaynone">
                                                <span style="font-size:12px;color:#555555;">해시태그</span>
                                            </strong>
                                            <span style="font-size:12px;color:#555555;">#네일 #아트 #버건디 #레드 #마블
                                                #가을네일</span>
                                        </div>
                                        <div class=" display_상품필터값 xans-record-">
                                            <strong class="title displaynone">
                                                <span style="font-size:12px;color:#555555;">상품필터값</span>
                                            </strong>
                                            <span style="font-size:12px;color:#555555;">마블,데일리</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="restockIcon"></div>
                        </div>
                        </dl>
                </div>
                </li>

                <li class="xans-record- append_item swiper-slide" style="width: 323.333px; margin-right: 40px;">
                    <div class="complete container " data-prd-no="776" data-filter="#마블#데일리">
                        <dl>
                            <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1"
                                class="viewlink"></a>
                            <div class="base_img">
                                <div class="BR_icon">
                                    <p>
                                        <b>BEST</b>
                                        리뷰
                                    </p>
                                </div>
                                <div class="thumb">
                                    <img loading="lazy" class="*lazyload thumb_img swiper-lazy swiper-lazy-loaded"
                                        data-original alt width="800" height="800"
                                        src="https://www.ohora.kr/web/product/medium/202409/91c66d67ae4ff36b421aebdc8bb4d028.jpg">
                                    <img loading="lazy" decoding="async"
                                        class="*lazyload hover_img swiper-lazy swiper-lazy-loaded" data-original alt
                                        width="800" height="800" src="">
                                    <div class="sticker">
                                        <div class="new">NEW</div>
                                        <div class="percent">
                                            <div class="dcPercent"></div>
                                        </div>
                                        <div class="best">BEST</div>
                                    </div>
                                    <span class="soldout_img" style="display: none;">
                                        <span>
                                            coming
                                            <br>
                                            soon
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <div class="base_mask">
                                <dd class="info_container">
                                    <p class="name">
                                        <span style="font-size:16px;color:#000000;font-weight:bold;">N 멀베리 네일</span>
                                    </p>
                                    <p class="subname"></p>
                                    <p class="subnameSimple"></p>
                                </dd>
                                <dd class="soldout_container" style="display: none;">
                                    <p class="soldout">(품절)</p>
                                </dd>
                                <dd class="price_container">
                                    <p class="custom_price displaynone">0</p>
                                    <p class="setCustomPrice displaynone">0</p>
                                    <p class="price">
                                        14,800
                                    </p>
                                    <p class="sale_price displaynone"></p>
                                </dd>
                                <dd class="icons  displaynone" style="display: none;" "></dd>
                                    <div class=" prdInfo_bottom">
                                    <div class="crema_container">
                                        <div class="crema_wrap">
                                            <p class="rv_value">
                                                <span class="crema-product-reviews-score crema-applied"
                                                    data-product-code="776" data-star-style="single"
                                                    data-format="{{{stars}}} {{{score}}}" data-hide-if-zero="1"
                                                    data-applied-widgets="[" .crema-product-reviews-score"]">
                                                    <div class="crema_product_reviews_score__container"
                                                        style="display: inline-block; font-family: inherit;">
                                                        <div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full "
                                                            style="width: 13px; height: 13px; vertical-align: middle; display: inline-block;">
                                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                                xmlns:xlink="http://www.w3.org/1999/xlink" width="20"
                                                                height="20" viewBox="0 0 20 20"
                                                                class="crema_product_reviews_score_star_wrapper__star "
                                                                style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
                                                                <defs>
                                                                    <path id="star-full"
                                                                        d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">
                                                                    </path>
                                                                </defs>
                                                                <use xlink:href="#star-full"></use>
                                                            </svg>
                                                        </div>
                                                        4.9
                                                    </div>
                                                </span>
                                            </p>
                                            <p class="rv_count">
                                                <span class="rv_icon">
                                                    <img src="/web/upload/rv_icon2.png">
                                                </span>
                                                <span class="count crema-product-reviews-count crema-applied"
                                                    data-product-code="776" data-format="{{{count}}}"
                                                    data-hide-if-zero="1" data-applied-widgets="["
                                                    .crema-product-reviews-count"]">
                                                    1,817
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                            </div>
                            <div class="hash_container done">
                                <div class="hash_wrap"></div>
                            </div>
                            <div class="Prev_Cart" onclick="basketConfirmShow(this);">
                                <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
                                    onclick="category_add_basket('776','120', '1', 'A0000', false, '1', 'P0000BDW', 'A', 'F', '0');"
                                    alt="장바구니 담기" class="ec-admin-icon cart">
                            </div>
                            <div class="rv_icon">
                                <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1">
                                    <img src="/web/upload/rv_icon1.png">
                                    <span class="count crema-product-reviews-count crema-applied"
                                        data-product-code="776" data-format="{{{count}}}" data-hide-if-zero="1"
                                        data-applied-widgets="[" .crema-product-reviews-count"]">1,817</span>
                                </a>
                            </div>
                            <div class="only_info_chk displaynone">
                                <div class="xans-element- xans-product xans-product-listitem">
                                    <div class=" display_가격 xans-record-">
                                        <strong class="title displaynone">
                                            <span style="font-size:12px;color:#555555;font-weight:bold;">가격</span>
                                        </strong>
                                        <span
                                            style="font-size:12px;color:#555555;font-weight:bold;text-decoration:line-through;">14,800</span>
                                        <span id="span_product_tax_type_text" style="text-decoration:line-through;">
                                        </span>
                                    </div>
                                    <div class=" display_사용후기 xans-record-">
                                        <strong class="title displaynone">
                                            <span style="font-size:12px;color:#555555;">사용후기</span>
                                        </strong>
                                        <span style="font-size:12px;color:#555555;">234</span>
                                    </div>
                                    <div class="xans-record-">
                                        <strong class="title displaynone"></strong>
                                    </div>
                                    <div class=" display_해시태그 xans-record-">
                                        <strong class="title displaynone">
                                            <span style="font-size:12px;color:#555555;">해시태그</span>
                                        </strong>
                                        <span style="font-size:12px;color:#555555;">#네일 #아트 #버건디 #레드 #마블 #가을네일</span>
                                    </div>
                                    <div class=" display_상품필터값 xans-record-">
                                        <strong class="title displaynone">
                                            <span style="font-size:12px;color:#555555;">상품필터값</span>
                                        </strong>
                                        <span style="font-size:12px;color:#555555;">마블,데일리</span>
                                    </div>
                                </div>
                            </div>
                            <div class="restockIcon"></div>
                    </div>
                    </dl>
            </div>
            </li>

            <li class="xans-record- append_item swiper-slide" style="width: 323.333px; margin-right: 40px;">
                <div class="complete container " data-prd-no="776" data-filter="#마블#데일리">
                    <dl>
                        <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1" class="viewlink"></a>
                        <div class="base_img">
                            <div class="BR_icon">
                                <p>
                                    <b>BEST</b>
                                    리뷰
                                </p>
                            </div>
                            <div class="thumb">
                                <img loading="lazy" class="*lazyload thumb_img swiper-lazy swiper-lazy-loaded"
                                    data-original alt width="800" height="800"
                                    src="https://www.ohora.kr/web/product/medium/202410/8b4bb562a09100244fa6cd0ef361f550.jpg">
                                <img loading="lazy" decoding="async"
                                    class="*lazyload hover_img swiper-lazy swiper-lazy-loaded" data-original alt
                                    width="800" height="800" src="">
                                <div class="sticker">
                                    <div class="new">NEW</div>
                                    <div class="percent">
                                        <div class="dcPercent"></div>
                                    </div>
                                    <div class="best">BEST</div>
                                </div>
                                <span class="soldout_img" style="display: none;">
                                    <span>
                                        coming
                                        <br>
                                        soon
                                    </span>
                                </span>
                            </div>
                        </div>
                        <div class="base_mask">
                            <dd class="info_container">
                                <p class="name">
                                    <span style="font-size:16px;color:#000000;font-weight:bold;">N 멀베리 네일</span>
                                </p>
                                <p class="subname"></p>
                                <p class="subnameSimple"></p>
                            </dd>
                            <dd class="soldout_container" style="display: none;">
                                <p class="soldout">(품절)</p>
                            </dd>
                            <dd class="price_container">
                                <p class="custom_price displaynone">0</p>
                                <p class="setCustomPrice displaynone">0</p>
                                <p class="price">
                                    14,800
                                </p>
                                <p class="sale_price displaynone"></p>
                            </dd>
                            <dd class="icons  displaynone" style="display: none;" "></dd>
                                    <div class=" prdInfo_bottom">
                                <div class="crema_container">
                                    <div class="crema_wrap">
                                        <p class="rv_value">
                                            <span class="crema-product-reviews-score crema-applied"
                                                data-product-code="776" data-star-style="single"
                                                data-format="{{{stars}}} {{{score}}}" data-hide-if-zero="1"
                                                data-applied-widgets="[" .crema-product-reviews-score"]">
                                                <div class="crema_product_reviews_score__container"
                                                    style="display: inline-block; font-family: inherit;">
                                                    <div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full "
                                                        style="width: 13px; height: 13px; vertical-align: middle; display: inline-block;">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink" width="20"
                                                            height="20" viewBox="0 0 20 20"
                                                            class="crema_product_reviews_score_star_wrapper__star "
                                                            style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
                                                            <defs>
                                                                <path id="star-full"
                                                                    d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">
                                                                </path>
                                                            </defs>
                                                            <use xlink:href="#star-full"></use>
                                                        </svg>
                                                    </div>
                                                    4.9
                                                </div>
                                            </span>
                                        </p>
                                        <p class="rv_count">
                                            <span class="rv_icon">
                                                <img src="/web/upload/rv_icon2.png">
                                            </span>
                                            <span class="count crema-product-reviews-count crema-applied"
                                                data-product-code="776" data-format="{{{count}}}" data-hide-if-zero="1"
                                                data-applied-widgets="[" .crema-product-reviews-count"]">
                                                1,817
                                            </span>
                                        </p>
                                    </div>
                                </div>
                        </div>
                        <div class="hash_container done">
                            <div class="hash_wrap"></div>
                        </div>
                        <div class="Prev_Cart" onclick="basketConfirmShow(this);">
                            <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
                                onclick="category_add_basket('776','120', '1', 'A0000', false, '1', 'P0000BDW', 'A', 'F', '0');"
                                alt="장바구니 담기" class="ec-admin-icon cart">
                        </div>
                        <div class="rv_icon">
                            <a href="/product/detail.html?product_no=776&cate_no=120&display_group=1">
                                <img src="/web/upload/rv_icon1.png">
                                <span class="count crema-product-reviews-count crema-applied" data-product-code="776"
                                    data-format="{{{count}}}" data-hide-if-zero="1" data-applied-widgets="["
                                    .crema-product-reviews-count"]">1,817</span>
                            </a>
                        </div>
                        <div class="only_info_chk displaynone">
                            <div class="xans-element- xans-product xans-product-listitem">
                                <div class=" display_가격 xans-record-">
                                    <strong class="title displaynone">
                                        <span style="font-size:12px;color:#555555;font-weight:bold;">가격</span>
                                    </strong>
                                    <span
                                        style="font-size:12px;color:#555555;font-weight:bold;text-decoration:line-through;">14,800</span>
                                    <span id="span_product_tax_type_text" style="text-decoration:line-through;"> </span>
                                </div>
                                <div class=" display_사용후기 xans-record-">
                                    <strong class="title displaynone">
                                        <span style="font-size:12px;color:#555555;">사용후기</span>
                                    </strong>
                                    <span style="font-size:12px;color:#555555;">234</span>
                                </div>
                                <div class="xans-record-">
                                    <strong class="title displaynone"></strong>
                                </div>
                                <div class=" display_해시태그 xans-record-">
                                    <strong class="title displaynone">
                                        <span style="font-size:12px;color:#555555;">해시태그</span>
                                    </strong>
                                    <span style="font-size:12px;color:#555555;">#네일 #아트 #버건디 #레드 #마블 #가을네일</span>
                                </div>
                                <div class=" display_상품필터값 xans-record-">
                                    <strong class="title displaynone">
                                        <span style="font-size:12px;color:#555555;">상품필터값</span>
                                    </strong>
                                    <span style="font-size:12px;color:#555555;">마블,데일리</span>
                                </div>
                            </div>
                        </div>
                        <div class="restockIcon"></div>
                </div>
                </dl>
        </div>
        </li>

        </ul>
        <!-- // 상품리스트영역 ul -->
        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
    </div>
    <div class="swiper-button-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide"
        aria-disabled="true"></div>
    <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="false"></div>
    <div class="swiper-scrollbar"></div>
    </div>
    </div>
    </div>
    <!-- // 장바구니 영역 -->
    <div id="spm_page_type" style="display:none">sq_basket_page</div>
    <div id="spm_banner_main"></div>
    <div id="spm_cafe_basket_wrap" style="display:none" class="xans-element- xans-order xans-order-totalsummary ">
        <input type="hidden" id="sf_basket_total_price" value="14,800">
        &nbsp;
    </div>
    </div>
	</div>

 	<script>
    const CookieUtil = {
        setCookie: function (name, value, days = 14) {
            let expires = "";
            if (days) {
                const date = new Date();
                date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + encodeURIComponent(value) + expires + "; path=/";
        },
        getCookie: function (name) {
            const nameEQ = name + "=";
            const ca = document.cookie.split(";");
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i].trim();
                if (c.indexOf(nameEQ) === 0)
                    return decodeURIComponent(c.substring(nameEQ.length));
            }
            return null;
        },
        deleteCookie: function (name) {
            document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        }
    };

    function getCartItems() {
        const cartItems = CookieUtil.getCookie("cartItems") || "";
        return cartItems
            .split('|')
            .filter(Boolean)
            .map(item => {
                const [pdtId, quantity] = item.split(':');
                return { pdtId: parseInt(pdtId), quantity: parseInt(quantity) };
            });
    }

    function updateCartCount() {
        const cartItems = getCartItems();
        $(".count.EC-Layout-Basket-count").text(cartItems.length);
    }
    updateCartCount();

    function updateTotalAmount() {
    	const checkCount = $(".basket-checkbox.checked").length;
        const FREE_SHIPPING_THRESHOLD = 50000;
        const SHIPPING_FEE = 3000;
        let totalAmount = 0;
        let totalDiscount = 0;
        
        $(".all-count").text(checkCount);

        $(".prdInfo").each(function () {
            const checkbox = $(this).find(".basket-checkbox");

            if (checkbox.hasClass("checked")) {
                const productRow = $(this).find(".product-row");
                const unitPrice = parseFloat(productRow.data("price")) || 0;
                const discountAmount = parseFloat(productRow.data("discount")) || 0;
                const quantity = parseInt(productRow.find(".quantityInput").val()) || 1;

                totalAmount += unitPrice * quantity;
                totalDiscount += discountAmount * quantity;
            }
        });

        const shippingFee = totalAmount - totalDiscount >= FREE_SHIPPING_THRESHOLD ? 0 : SHIPPING_FEE;
        const finalAmount = totalAmount - totalDiscount + shippingFee;
        const remainingForFreeShipping = Math.max(0, FREE_SHIPPING_THRESHOLD - (totalAmount - totalDiscount));

        $(".prdPriceAll").text(totalAmount.toLocaleString());
        $(".prdDiscountAll").text(totalDiscount.toLocaleString());
        $(".prdFinalAll").text(finalAmount.toLocaleString());
        $(".prdDelvAll").text(shippingFee.toLocaleString());

        if (shippingFee === 0) {
            $(".total_info_txt.delv").hide();
        } else {
            $(".total_info_txt.delv").show().find(".amount").text(remainingForFreeShipping.toLocaleString());
        }
    }

    $(function () {
        $(".basket-checkbox").addClass("checked").prop("checked", true);

        updateTotalAmount();

        $(".box").on("click", function () {
            const allChecked = $(".basket-checkbox").first().hasClass("checked");
            $(".basket-checkbox").toggleClass("checked", !allChecked).prop("checked", !allChecked);
            $(".checkcolor").css("background-color", !allChecked ? "black" : "#eee");
            $(this).css("background-color", !allChecked ? "black" : "#eee");
            console.log(this);

            updateTotalAmount();
        });

        $(document).on("click", ".checkcolor", function () {
            const isChecked = $(this).hasClass("checked");
            const productRow = $(this).closest(".prdInfo");

            $(this).toggleClass("checked", !isChecked);
            $(this).css("background-color", !isChecked ? "black" : "#eee");

            const basketCheckbox = productRow.find(".basket-checkbox");
            basketCheckbox.toggleClass("checked", !isChecked);

            updateTotalAmount();
        });

        $(".minusBtn").on("click", function () {
        	const value = $(this).siblings(".quantityInput");
            const productRow = $(this).closest(".prdInfo"); 
            const pdtId = productRow.data("pdtid");
            let pdtCount = parseInt(value.val()) || 1;
            if (pdtCount > 1) {
                value.val(pdtCount - 1);
                updateCartQuantity(pdtId, pdtCount - 1); 
                updateTotalAmount();
            } else {
                alert("최소 수량은 1개 입니다.");
            }
        });

        $(".plusBtn").on("click", function () {
        	const value = $(this).siblings(".quantityInput");
            const productRow = $(this).closest(".prdInfo");
            const pdtId = productRow.data("pdtid");
            let pdtCount = parseInt(value.val()) || 1;
            value.val(pdtCount + 1);
            updateCartQuantity(pdtId, pdtCount + 1);
            updateTotalAmount();
        });
        
        function updateCartQuantity(pdtId, newQuantity) {
            const cartItems = CookieUtil.getCookie("cartItems") || "";
            const updatedCartItems = cartItems
                .split("|")
                .map(item => {
                    const [cookiePdtId, quantity] = item.split(":");
                    if (parseInt(cookiePdtId) === parseInt(pdtId)) {
                        return `\${cookiePdtId}:\${newQuantity}`;
                    }
                    return item;
                })
                .join("|");

            CookieUtil.setCookie("cartItems", updatedCartItems, 14);
            console.log("업데이트된 쿠키:", updatedCartItems);
        }
    });

    function deleteItem(itemId) {
        const itemCheckbox = document.getElementById(`basket_chk_id_\${itemId}`);
        const itemRow = $(itemCheckbox).closest(".prdInfo");

        if (itemRow.length) {
            const pdtId = $(itemRow).data("pdtid");
            itemRow.remove();
            console.log("삭제된 쿠키:", pdtId,"번 상품");

            const cartItems = CookieUtil.getCookie("cartItems") || "";
            const updatedCartItems = cartItems
                .split("|")
                .filter(item => {
                    const [cookiePdtId] = item.split(":");
                    return parseInt(cookiePdtId) !== parseInt(pdtId);
                })
                .join("|");

            console.log("업데이트된 쿠키:", updatedCartItems);

            if (updatedCartItems) {
                CookieUtil.setCookie("cartItems", updatedCartItems, 14);
            } else {
                CookieUtil.deleteCookie("cartItems");
            }

            updateCartCount();
            updateTotalAmount();
        } else {
            console.error(`itemRow가 null입니다. itemId: \${itemId}`);
        }
    }
    window.deleteItem = deleteItem;
	</script>

    <script>
    $("a.SP_cm_btn").on("click", function createOrderUrl(e) {
    	e.preventDefault();
        let Path = "/projectOhora/product/orderpage.htm?";
        
        $(".basket-checkbox.checked").each(function () {
            const pdtId = $(this).nextAll("input#pdtId").val();
            const pdtCount = $(this).nextAll("input#pdtCount").val();

            if (pdtId !== undefined && pdtCount !== undefined) {
                Path += "pdtId=" + pdtId + "&pdtCount=" + pdtCount + "&";
            }
        });

        Path = Path.slice(0, -1);
        location.href = Path;
    });
    </script>

    <!-- 스와이퍼 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".swiper-container", {
            slidesPerView: 3,
            spaceBetween: 30,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            scrollbar: {
                el: ".swiper-scrollbar",
                hide: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });

        swiper.update();
    </script>
   