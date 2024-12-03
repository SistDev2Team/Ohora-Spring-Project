<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }  
</style>

</head>

<div id="content">

    <div id="main-container">

        <div id="contents">

            <div id="myPage-wrap">

                <div class="subSection">
                    <h2 class="subTitle">
                        <span>MY PAGE</span>
                    </h2>
                </div>
            
                

                <div class="profile-container">
                    <div class="member-info-wrap">

                        <div class="member-info"> 
                        <!-- 얘가 SP_Message임 -->
                            
                            <div class="info-msg">
                            
                                <div class="member-radius">
                                    <div class="radius-box" id="radiusBox">
                                        <canvas id="doughnut1" width="170" height="170" ></canvas>
                                       
                                        <!-- 원 그리는 스크립트 -->
                                        <script>
                                            // 1. canvas 엘리먼트 취득
                                            const canvas = document.getElementById('doughnut1');
                                            
                                            // 2. 2d모드의 그리기 객체 취득
                                            const ctx = canvas.getContext("2d");
                                
                                            // 3. path 그리기 시작 설정
                                            ctx.beginPath();
                                
                                            // 4. 외곽선
                                            ctx.lineWidth = 1.5; // 선 굵기 설정 (5픽셀)
                                            ctx.strokeStyle = "gray"; // 외곽선 색상 설정
                                
                                            // 5. 원 모양 설정
                                            // 중심 (85, 85), 반지름 85, 시작 각도 0, 끝 각도 2*Math.PI (완전한 원)
                                            ctx.arc(85, 85, 80, 0, 2 * Math.PI);
                                
                                            // 6. 내부 채우기 및 외곽선 그리기

                                            ctx.stroke();
                                        </script>
                                    </div>
                                </div>


                                <div class="infoMegBox_wrap">
                                 <sec:authentication property="principal" var="pinfo" />
                                    <p class="ment">
                                        <strong><span><span class="member-name">${pinfo.user.name}</span></span></strong>님 반갑습니다.
                                    </p>
                                    
										<p class="grade">회원님의 등급은 
										    <strong class="group">[
										        <span class="groupName-wrap" id="groupName">
										            <span class="group_name">
										                ${pinfo.user.memid == 1 ? 'friend' : pinfo.user.memid == 2 ? 'family' : pinfo.user.memid == 3 ? 'crew' : ''}
										            </span>
										        </span>
										    ]</strong>입니다.
										</p>
									
        
								  <p class="gradeValue" id="toNextGrade">다음 등급까지
								   
								    <span id="changePrd" class="toNext-won">
								        <span class="toNext-value">
								        						            
								            <c:set var="totalSum" value="0" />
								            
								            <c:forEach var="entry" items="${groupedOrders}">
								            
								                <c:forEach var="orderDetail" items="${entry.value}">
								                    <c:set var="totalSum" value="${totalSum + orderDetail.ORD_TOTAL_AMOUNT}" />
								                </c:forEach>
								                
								            </c:forEach>
																            
								            <c:choose>								               
								                <c:when test="${pinfo.user.memid == 3}">
								                    이미 최고 등급에 도달하셨습니다.
								                </c:when>
								               								               
								                <c:otherwise>
								                    <c:set var="goalAmount" value="${pinfo.user.memid == 1 ? 150000 : 400000}" />
								                    <fmt:formatNumber value="${ goalAmount - totalSum < 0 ? 0 :goalAmount - totalSum }" type="number" pattern="#,##0" />원 남았습니다.								   							                    
								                </c:otherwise>
								                
								            </c:choose>
							            
								        </span>
								    </span> 
								</p>

										
                                    <p class="order_total">
                                        <span class="order_total_value">0</span>
                                    </p>
                                    <div class="user-UtilLink">
                                        <a href="">등급 혜택보기</a>
                                        <a href="">후기쓰러가기</a>
                                        <a href="">1:1문의하기</a>
                                    </div>
                                </div>


                            </div>   
                        </div>

                        <div class="order_info_wrap">
                            <div class="point_coupon-wrap">
                                <ul class="point_coupon">
                                    <li>
                                        <div class="pnc_displayTable">
                                            <div class="pnc_displayTableInr">
                                                <div class="myOrderInfoTitle">my point</div>
                                                <div class="myOrderInfoCont">
                                                    <a href="" class="pointCount" style=""><fmt:formatNumber value="${pinfo.user.userpoint}"/></a>
                                                </div> 
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="pnc_displayTable">
                                            <div class="pnc_displayTableInr">
                                                <div class="myOrderInfoTitle">my coupon</div>
                                                <div class="myOrderInfoCont">
                                                    <a href="" style="">${availableCoupons}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- 오더 인포 랩 -->

                    </div>
                </div>

                <div class="orderList-layout">
                    <div class="subSection">
                        <div class="ol-title-wrap">
                            <h3>order list</h3>
                            <div class="ol-moreBtn">
                                <a href="">+더보기</a>
                            </div>
                        </div>
<div class="orderState_wrap">
    <ul>
        <li>
            <a href="">
                <span>상품준비중</span>
                <span class="count">
                    <span id="orderstate_prepare_production_count">
                        <c:forEach var="stateCount" items="${stateCounts}">
                            <c:if test="${stateCount.STATE == '상품준비중'}">
                                ${stateCount.STATECOUNT}
                            </c:if>
                        </c:forEach>
                    </span>
                </span>
            </a>
        </li>
        <li>
            <a href="">
                <span>배송준비중</span>
                <span class="count">
                    <span id="orderstate_prepare_delivery_count">
                        <c:forEach var="stateCount" items="${stateCounts}">
                            <c:if test="${stateCount.STATE == '배송준비중'}">
                                ${stateCount.STATECOUNT}
                            </c:if>
                        </c:forEach>
                    </span>
                </span>
            </a>
        </li>
        <li>
            <a href="">
                <span>배송중</span>
                <span class="count">
                    <span id="xans_myshop_orderstate_shppied_begin_count">
                        <c:forEach var="stateCount" items="${stateCounts}">
                            <c:if test="${stateCount.STATE == '배송중'}">
                                ${stateCount.STATECOUNT}
                            </c:if>
                        </c:forEach>
                    </span>
                </span>
            </a>
        </li>
        <li>
            <a href="">
                <span>배송완료</span>
                <span class="count">
                    <span id="xans_myshop_orderstate_shppied_complate_count">
                        <c:forEach var="stateCount" items="${stateCounts}">
                            <c:if test="${stateCount.STATE == '배송완료'}">
                                ${stateCount.STATECOUNT}
                            </c:if>
                        </c:forEach>
                    </span>
                </span>
            </a>
        </li>
    </ul>
</div>



                        <div class="order-history-wrap">
						<table>
						    <thead>
						        <tr>
						            <th scope="col" class="number">주문일자</th>
						            <th scope="col" class="thumb">상품정보</th>
						            <th scope="col" class="product">상품금액</th>
						            <th scope="col" class="product">결제금액</th>
						            <th scope="col" class="quantity">주문상세</th>
						        </tr>
						    </thead>
						    <tbody>
						        <!-- 주문 내역이 있을 경우 -->
						        <c:if test="${not empty groupedOrders}">
						            <c:forEach var="entry" items="${groupedOrders}">
						                <!-- 날짜별 그룹화 -->
						                <c:set var="orderDate" value="${entry.key}" />
						                <c:set var="orders" value="${entry.value}" />
						                
						                <c:forEach var="orderDetail" items="${orders}" varStatus="status">
						                    <tr class="table-record">
						                        <!-- 첫 번째 행에만 날짜 표시 -->
						                        <c:if test="${status.first}">
						                            <td class="number center" rowspan="${orders.size()}">${orderDate}</td>
						                        </c:if>
						                        
						                        <!-- 상품정보 -->
						                        <td class="subject alignLeft">
						                            <a href="#">${orderDetail.OPDTNAME}</a>
						                        </td>
						                        
						                        <!-- 상품금액 -->
						                        <td class="price center">
						                            <fmt:formatNumber value="${orderDetail.OPDTAMOUNT}" type="number" pattern="#,##0" />
						                        </td>
						                        
						                        <!-- 결제금액 -->
						                        <td class="totalprice">
						                            <fmt:formatNumber value="${orderDetail.ORDTOTALAMOUNT}" type="number" pattern="#,##0" />
						                        </td>
						                        
						                        <!-- 첫 번째 행에만 주문 상세 표시 -->
						                        <c:if test="${status.first}">
						                            <td class="center number" rowspan="${orders.size()}">
						                                <form action="${pageContext.request.contextPath}/member/mypage/orderdetail.htm" method="post">
						                                    <input type="hidden" name="ORDPK" value="${orderDetail.ORDPK}" />
						                                     <input type="hidden" name="_csrf" value="${_csrf.token}">
						                                    <button type="submit" class="ordhistory-linkView">자세히보기</button>
						                                </form>
						                            </td>
						                        </c:if>
						                    </tr>
						                </c:forEach>
						            </c:forEach>
						        </c:if>
						        
						        <!-- 주문 내역이 없을 경우 -->
						        <c:if test="${empty groupedOrders}">
						            <tr>
						                <td colspan="5" class="empty">주문 내역이 없습니다</td>
						            </tr>
						        </c:if>
						    </tbody>
						</table>


                        </div>

                    </div>

                    <div class="myShopMenu-layout">
                        <div class="myShopMenu-list">
                            <ul>
                              
                                <li><a href="${pageContext.request.contextPath}/member/mypage/orderlist.htm">주문내역</a></li>
                                
								<li>
								    <a href="${pageContext.request.contextPath}/member/mypage/meminfo.htm">
								        회원정보
								    </a>
								</li>
                                                                                                                                                      
                                <li><a href="${pageContext.request.contextPath}/member/mypage/addr.htm">배송주소록</a></li>
                                
                                <li><a href="">이용약관</a></li>
                            </ul>
                        </div>

                        <div class="myShopMenu-list">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/member/mypage/coupon.htm">쿠폰내역<span class="">
                                        <span class="xans_myshop_main_coupon_cnt">${availableCoupons}</span>
                                        장</span>
                                    </a>
                                </li>
                                <li class="point-history">
                                    <a href="">적립금 내역
                                        <span class="count">${formattedUserPoint}</span>
                                    </a>
                                </li>
                                                
                                <li class="caty">
                                    <a href="">장바구니
                                        <span class="">${cartlist}</span>
                                    </a>
                                </li>
                                                
                                <li>
                                    <a href="">게시글 관리</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- 오더 레이아웃 픽스 -->




            </div>
            <!-- 마이페이지 랩 -->
        </div>
        <!-- 컨텐츠 -->

    </div>
    <!-- 메인 컨테이너 -->

</div>