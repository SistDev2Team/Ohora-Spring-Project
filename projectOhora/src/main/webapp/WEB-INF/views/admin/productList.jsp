<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="content">
	<h1 style="text-align: center; margin: 50px 0;">상품 조회</h1>
	<div class="button">
		<input type="button" class="bt_del" id="bt_del" value="삭제"/>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width:30px;"></th>
				<th style="width:75px;">상품ID</th>
				<th style="width:165px;">상품명</th>
				<th>상품가격</th>
				<th>할인율</th>
				<th>할인가</th>
				<th>재고</th>
				<th>카테고리</th>
				<th>하위카테고리</th>
				<th style="width:108x;">상품 등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productDTO}" var="dto">
			<tr class="check">
				<td><input type="checkbox" class="check_btn" id="check_btn" value="${dto.pdtid}"/></td>
				<td>${dto.pdtid}</td>
				<%-- <td id="pdtname" data-pdtid="${dto.pdtid}">${dto.pdtname}</td> --%>
				<td><a href="/admin/productDetail.htm?pdtid=${dto.pdtid}" style="text-decoration: none">${dto.pdtname}</a></td>
				<td><fmt:formatNumber value="${dto.pdtamount}" type="number" pattern="#,##0" /></td>
				<td>${dto.pdtdiscountrate}</td>
				<td><fmt:formatNumber value="${dto.pdtdiscountamount}" type="number" pattern="#,##0" /></td>
				<td>${dto.pdtcount}</td>
				<td>${dto.catid == 1 ? '네일' : dto.catid == 2 ? '페디' : '케어툴' }</td>
				<td>${dto.scatid == 1 ? '젤스트립' : dto.scatid == 2 ? '젤네일팁' : '-'}</td>
				<td><fmt:formatDate value="${dto.pdtadddate}" pattern="yyyy-MM-dd" /></td>
			</tr> 
			</c:forEach>
		</tbody>
	</table>
	
	<div class="search-container" style="text-align: center; margin-bottom: 20px;">
	    <form action="/admin/productList.htm" method="get" id="searchForm">
	        <input type="text" name="keyword" value="${param.keyword}" placeholder="상품명을 입력하세요." style="padding: 8px; width: 250px;">
	        <button type="submit" style="padding: 8px 12px; background-color: #555; color: white; border: none;">검색</button>
	    </form>
	</div>
	
	<!-- prev [1start] 2 3 4 5 6 7 8 9 10 next -->
	<div id="page-container">
	    <a href="/admin/productList.htm?currentPage=1&keyword=${param.keyword}" class="first">first</a>
	    <c:if test="${pdto.prev}">
	        <a href="/admin/productList.htm?currentPage=${pdto.currentPage - 1}&keyword=${param.keyword}" class="prev">prev</a>
	    </c:if>
	    <ol>
	        <c:forEach begin="${pdto.start}" end="${pdto.end}" var="i">
	            <c:choose>
	                <c:when test="${i == pdto.currentPage}">
	                    <li><a href="#" class="active">${i}</a></li>
	                </c:when>
	                <c:otherwise>
	                    <li><a href="/admin/productList.htm?currentPage=${i}&keyword=${param.keyword}">${i}</a></li>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	    </ol>
	    <c:if test="${pdto.currentPage != pdto.last}">
	        <a href="/admin/productList.htm?currentPage=${pdto.currentPage + 1}&keyword=${param.keyword}" class="next">next</a>
	    </c:if>
	    <a href="/admin/productList.htm?currentPage=${pdto.last}&keyword=${param.keyword}" class="last">last</a>
	</div>
</div>

<!-- 삭제버튼 클릭 시 -->
<script>
      $("#bt_del").on("click", function () {
          const checkedItems = $(".check td input:checkbox:checked");
          
          if (checkedItems.length === 0) {
              alert("삭제할 상품을 선택해주세요."); 
              return;
          }
          
          const productIds = checkedItems.map(function () {
              return $(this).val();
          }).get();

          if (!confirm("상품을 삭제하시겠습니까?")) {
              return;
          }
          
          $.ajax({
              url: '/adminProduceDelete.ajax', 
              type: 'POST',
              headers: {
                  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              },
              dataType: 'json',
              data: { productIds: productIds },
              success: function (response) {
                  if (response.success) {
                      checkedItems.each(function () {
                          $(this).closest("tr").remove();
                      });
                      alert("삭제 완료!");
                  } else {
                      alert("삭제 실패: " + response.message);
                  }
              },
              error: function (xhr, status, error) {
                  console.error("삭제 요청 중 오류 발생:", error);
                  alert("삭제 요청 중 오류가 발생했습니다.");
              }
          });
      });
</script>
	

