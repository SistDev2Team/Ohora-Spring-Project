<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

</style>
<div id="content">
	<div class="container admin_container">
		<div class="row">
			<h1 style="text-align: center; margin: 50px 0;">주문 현황</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>주문상세ID</th>
						<th>주문ID</th>
						<th>주문상품</th>
						<th>수량</th>
						<th>총주문금액</th>
						<th>취소반품</th>
						<th>처리상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ordList}" var="dto">
						<tr>
							<td>${dto.opdtid}</td>
							<td>${dto.ordpk}</td>
							<td id="opdtname" data-opdtid="${dto.opdtid}">${dto.opdtname}</td>
							<td>${dto.opdtcount}</td>
							<td><fmt:formatNumber value="${dto.opdtamount}"
									type="number" pattern="#,##0" /></td>
							<td>-</td>
							<td>${dto.opdtstate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 항목 클릭시 상품상세페이지 이동 -->
		<script>
		$("tr td#opdtname").on("click",function(event){
			let opdtid = $(this).data("opdtid");
			location.href = "/admin/orderListDetail.htm?opdtid="+opdtid;
		});
		</script>
	</div>
</div>