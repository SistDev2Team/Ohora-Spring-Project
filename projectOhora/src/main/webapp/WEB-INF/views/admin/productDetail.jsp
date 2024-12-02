<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content">
	<div class="container admin_container">
		<div class="row">
			<h1 style="text-align: center; margin: 50px 0;">상품 상세 조회</h1>
		</div>

		<!-- 상품 디테일 설명 -->
		<div class="product-details-container">
			<div class="product-image">
				<img src="../resources/images/prd_image/imgs/${productDTO.pdtimgurl}.jpg" alt="상품 이미지">
			</div>
			<div class="product-info">
				<table class="product-table">
					<tr>
						<th>상품 ID</th>
						<td>${productDTO.pdtid}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${productDTO.pdtname}</td>
					</tr>
					<tr>
						<th>상품판매가격</th>
						<td><fmt:formatNumber value="${productDTO.pdtamount}" type="number" pattern="#,##0" />원</td>
					</tr>
					<tr>
						<th>할인판매가격</th>
						<td><fmt:formatNumber value="${productDTO.pdtdiscountamount}" type="number" pattern="#,##0" />원</td>
					</tr>
					<tr>
						<th>할인율</th>
						<td>${productDTO.pdtdiscountrate}%</td>
					</tr>
					<tr>
						<th>재고</th>
						<td>${productDTO.pdtcount}</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>${productDTO.catid == 1 ? '네일' : productDTO.catid == 2 ? '페디' : '케어툴' }</td>
					</tr>
					<tr>
						<th>하위카테고리</th>
						<td>${productDTO.scatid == 1 ? '젤스트립' : productDTO.scatid == 2 ? '젤네일팁' : '-'}</td>
					</tr>
					<tr>
						<th>상품 등록일</th>
						<td><fmt:formatDate value="${productDTO.pdtadddate}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>${productDTO.pdtdescription == null ? productDTO.pdtdescription : '-'}</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- // 상품 디테일 설명 -->
	</div>
</div>

<!-- 수정하기, 뒤로 가기 버튼 -->
<div class="button">
	<input type="button" class="bt_modify" id="bt_modify" value="수정하기"/>
	<input onclick="history.back()" type="button" class="bt_back" id="bt_back" value="뒤로가기"/>
</div>
<!-- // 수정하기, 뒤로 가기 버튼 -->

<!-- 버튼 스크립트 -->
<script>
$("#bt_modify").on("click",function(event){
	location.href = "/admin/productModify.htm";
});
</script>




