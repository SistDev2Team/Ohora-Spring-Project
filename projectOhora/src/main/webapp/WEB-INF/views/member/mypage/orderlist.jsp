<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
 
 /* 테이블 스타일링 */
/* 테이블의 가로 테두리만 남기기 */
.SP_tableSt01_isThumNail {
    border-collapse: collapse;
    width: 100%;
}

.SP_tableSt01_isThumNail th, 
.SP_tableSt01_isThumNail td {
    border-top: 1px solid #ddd; /* 가로 테두리 */
    border-bottom: 1px solid #ddd;
    padding: 20px;
    text-align: center;     
    vertical-align: middle; /* 세로 가운데 정렬 */
}

/* 첫 번째 행에만 위쪽 테두리를 적용 */
.SP_tableSt01_isThumNail thead th {
    border-top: 2px solid #ddd; /* 헤더의 위쪽만 두껍게 */
}


.SP_subSection {
    position: relative;
    top: -60px; /* 위로 10px 이동 */
}

</style>

<div id="content">
    <!-- 콘텐츠 -->
    <div id="contents">
      <script>
        SMARTPC_GLOBAL_OBJECT.page = "mypage";
      </script>
      <div id="SP_mypage_wrap">
        <div class="SP_subSection large">
          <h2 class="SP_subTitle"><span class="eng_font">order</span></h2>
        </div>

        <div class="SP_layoutFix">
          <div
            class="xans-element- xans-myshop xans-myshop-orderhistorytab SP_myOrderlist_tab"
          >
            <ul class="menu">
              <li class="tab_class selected">
                <a href=""
                  >주문내역조회 (<span id="xans_myshop_total_orders">0</span
                  >)</a
                >
              </li>
              <li class="tab_class_cs">
                <a href="../orderlist_cancel/orderlist_cancel.html"
                  >취소/반품/교환 내역 (<span id="xans_myshop_total_orders_cs"
                    >0</span
                  >)</a
                >
              </li>
            </ul>
          </div>

          <form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
            <div
              class="xans-element- xans-myshop xans-myshop-orderhistoryhead SP_myOrderlist_srh"
            >
              <fieldset class="SP_myOrderlist_fildeset">
                <legend>검색기간설정</legend>
                <div class="stateSelect SP_myOrderlist_li SP_ordSrh_chooseSel">
                  <select id="order_status" name="order_status" class="fSelect">
                    <option value="all">전체 주문처리상태</option>
                    <option value="shipped_before">입금전</option>
                    <option value="shipped_standby">배송준비중</option>
                    <option value="shipped_begin">배송중</option>
                    <option value="shipped_complate">배송완료</option>
                    <option value="order_cancel">취소</option>
                    <option value="order_exchange">교환</option>
                    <option value="order_return">반품</option>
                  </select>
                </div>
                
                <div class="SP_myOrderlist_li SP_ordSrh_chooseBtn">
				  <a href="${pageContext.request.contextPath}/orderlist.do?days=0" class="SP_cm_btn SP_btn_gray_bd">오늘</a>
				  <a href="${pageContext.request.contextPath}/orderlist.do?days=7" class="SP_cm_btn SP_btn_gray_bd">1주일</a>
				  <a href="${pageContext.request.contextPath}/orderlist.do?days=30" class="SP_cm_btn SP_btn_gray_bd">1개월</a>
				  <a href="${pageContext.request.contextPath}/orderlist.do?days=90" class="SP_cm_btn SP_btn_gray_bd">3개월</a>
				  <a href="${pageContext.request.contextPath}/orderlist.do?days=180" class="SP_cm_btn SP_btn_gray_bd">6개월</a>
				</div>
                

                <div class="SP_myOrderlist_li SP_ordSrh_chooseSel">
                  <span class="SP_startday"
                    ><input
                      id="history_start_date"
                      name="history_start_date"
                      class="fText hasDatepicker"
                      readonly="readonly"
                      size="10"
                      value="2024-07-29"
                      type="text" /><button
                      type="button"
                      class="ui-datepicker-trigger"
                    >
                      <img
                        src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
                        alt="..."
                        title="..."
                      /></button></span
                  ><span class="SP_extraTxt">~</span
                  ><span class="SP_endday"
                    ><input
                      id="history_end_date"
                      name="history_end_date"
                      class="fText hasDatepicker"
                      readonly="readonly"
                      size="10"
                      value="2024-10-27"
                      type="text" /><button
                      type="button"
                      class="ui-datepicker-trigger"
                    >
                      <img
                        src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif"
                        alt="..."
                        title="..."
                      /></button
                  ></span>
                </div>
                <div class="SP_myOrderlist_li SP_ordSrh_chooseSubmit">
                  조회<span
                    ><input
                      alt="조회"
                      id="order_search_btn"
                      type="image"
                      src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif"
                  /></span>
                </div>
              </fieldset>
              <ul class="SP_orderlist_srh_guide">
                <li>
                  기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난
                  주문내역을 조회하실 수 있습니다.
                </li>
                <li>
                  주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수
                  있습니다.
                </li>
                <li class="">
                  취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.
                </li>
              </ul>
            </div>
            <input id="mode" name="mode" value="" type="hidden" />
            <input id="term" name="term" value="" type="hidden" />
          </form>
          <div
            class="xans-element- xans-myshop xans-myshop-orderhistorylistitem SP_subSection"
          >

          
				<h3 class="SP_contTitle">주문 목록</h3>
				<table border="1" summary="" class="SP_tableSt01_isThumNail">
				  <colgroup>
				    <col style="width: 200px" />
				    <col style="width: 120px" />
				    <col style="width: auto" />
				    <col style="width: 70px" />
				    <col style="width: 120px" />
				    <col style="width: 150px" />
				    <col style="width: 160px" />
				    <col style="width: 110px" />
				  </colgroup>
				  <thead>
				    <tr>
				      <th scope="col">주문일자</th>
				      <th scope="col">이미지</th>
				      <th scope="col">상품정보</th>
				      <th scope="col">수량</th>
				      <th scope="col">상품구매금액</th>
				      <th scope="col">주문처리상태</th>
				      <th scope="col">취소/교환/반품</th>
				      <th scope="col">주문취소</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach var="order" items="${orderList}">
				      <c:forEach var="detail" items="${order.orderdetails}" varStatus="status">
				        <tr>
				          <!-- 첫 번째 행에만 주문일자 표시 -->
				          <c:if test="${status.first}">
				            <td rowspan="${order.orderdetails.size()}">
				              <fmt:formatDate value="${order.ordorderdate}" pattern="yyyy-MM-dd" />
				            </td>
				          </c:if>
				          <!-- 이미지 -->
				          <td>
				        <a href="/product/detail.html?product_no=2089&amp;cate_no=160">
                            <img src="//www.ohora.kr/web/product/tiny/202408/d2f98917c2be64437a36bcd6474375a0.jpg" alt="" onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';">
                        </a>
				          </td>
				          <!-- 상품정보 -->
				          <td>${detail.opdtname}</td>
				          <!-- 수량 -->
				          <td>${detail.opdtcount}</td>
				          <!-- 상품구매금액 -->
				          <td>
				            <fmt:formatNumber value="${detail.opdtamount}" type="number" pattern="#,##0" />
				          </td>
				          <!-- 주문처리상태 -->
				          <td>${detail.opdtstate}</td>
				          <!-- 취소/교환/반품 -->
				          <td>${detail.opdtrefund}</td>
				          <!-- 주문취소 -->
				          <td>
				            <c:if test="${detail.opdtstate == '주문접수'}">
				              <a href="${pageContext.request.contextPath}/cancelOrder?orderId=${order.ordid}&detailId=${detail.opdtid}">취소</a>
				            </c:if>
				          </td>
				        </tr>
				      </c:forEach>
				    </c:forEach>
				  </tbody>
				</table>
				
				<!-- 주문 내역이 없을 경우 -->
				<c:if test="${empty orderList}">
				  <p class="SP_message">주문 내역이 없습니다.</p>
				</c:if>
          
          </div>
        </div>             
      </div>         
      <!-- cre.ma / init 스크립트 (PC) / 스크립트를 수정할 경우 연락주세요 (support@cre.ma) -->
      <script>
        (function (i, s, o, g, r, a, m) {
          if (s.getElementById(g)) {
            return;
          }
          (a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
          a.id = g;
          a.async = 1;
          a.src = r;
          m.parentNode.insertBefore(a, m);
        })(
          window,
          document,
          "script",
          "crema-jssdk",
          "//widgets.cre.ma/ohora.kr/init.js"
        );
      </script>
    </div>
    <script>
      (function (i, s, o, g, r, a, m) {
        if (s.getElementById(g)) {
          return;
        }
        (a = s.createElement(o)), (m = s.getElementsByTagName(o)[0]);
        a.id = g;
        a.async = 1;
        a.src = r;
        m.parentNode.insertBefore(a, m);
      })(
        window,
        document,
        "script",
        "crema-jssdk",
        "//widgets.cre.ma/ohora.kr/init.js"
      );
    </script>
    <!-- 메인 전체 컨테이너 -->
</div>