<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content">
		<h1 style="text-align: center; margin: 50px 0;">상품 등록</h1>
		<!-- 상품 디테일 설명 -->
		<div class="product-details-container">
			<div class="product-image">
				<img src="https://via.placeholder.com/400x400" alt="상품 이미지">
				
				<!-- 첨부파일 업로드 필요 -->
				
			</div>
			<form action="/admin/productReg" method="post">
				<div class="product-info">
					<table class="product-table">
						<tr>
							<th>상품 ID</th>
							<td><input type="text" value="2"/></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" value="테스트네일"/></td>
						</tr>
						<tr>
							<th>상품가격</th>
							<td><input type="text" value="10000"/></td>
						</tr>
						<tr>
							<th>할인율</th>
							<td><input type="text" value="10"/></td>
						</tr>
						<tr>
							<th>재고</th>
							<td><input type="text" value="20"/></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><input type="text" value="1"/></td>
						</tr>
						<tr>
							<th>하위카테고리</th>
							<td><input type="text" value="2"/></td>
						</tr>
						<tr>
							<th>상품 등록일</th>
							<td><input type="text" value="24/12/02"/></td>
						</tr>
						<tr>
							<th>상품 설명</th>
							<td>
							<textarea>테스트</textarea>
						</tr>
					</table>
				</div>
			</form>
		</div>
	<!-- // 상품 디테일 설명 -->
	<!-- 수정하기, 뒤로 가기 버튼 -->
	<div class="button">
		<input type="button" class="bt_submit" id="bt_submit" value="등록하기"/>
		<input onclick="history.back()" type="button" class="bt_back" id="bt_back" value="뒤로가기"/>
	</div>
	<!-- // 수정하기, 뒤로 가기 버튼 -->
</div>

	
<!-- 버튼 스크립트 -->
<script>
   $(document).ready(function() {
       $("#bt_submit").on("click", function(event) {
           event.preventDefault(); 
           if (confirm("상품을 등록하시겠습니까?")) {
               alert("상품이 등록되었습니다.");
               //admin/productList
               location.replace("/admin/productList.htm");
           }
       });
   });
</script>


