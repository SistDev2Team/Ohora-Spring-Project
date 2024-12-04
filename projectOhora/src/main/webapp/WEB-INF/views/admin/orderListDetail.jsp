<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>
</head>
<body>
<div id="content">
<div class="container admin_container">
		<div class="row">
			<h1 style="text-align: center; margin: 50px 0;">주문 현황</h1>
			<table class="table table-hover">
			    <tbody>
			        <tr>
			            <th>주문ID</th>
			            <td>1</td>
			        </tr>
			        <tr>
			            <th>회원ID</th>
			            <td>1</td>
			        </tr>
			        <tr>
			            <th>회원이름</th>
			            <td>최사랑</td>
			        </tr>
			        <tr>
			            <th>배송주소</th>
			            <td>서울시 동작구</td>
			        </tr>
			        <tr>
			            <th>우편번호</th>
			            <td>158-483</td>
			        </tr>
			        <tr>
			            <th>전화번호</th>
			            <td>010-1234-5678</td>
			        </tr>
			        <tr>
			            <th>이메일</th>
			            <td>love@naver.com</td>
			        </tr>
			        <tr>
			            <th>주문내역</th>
			            <td>팬더네일,판다네일,대나무네일</td>
			        </tr>
			        <tr>
			            <th>총주문금액</th>
			            <td>25000</td>
			        </tr>
			        <tr>
			            <th>할인금액</th>
			            <td>8000</td>
			        </tr>
			        <tr>
			            <th>적립금사용액</th>
			            <td>500</td>
			        </tr>
			        <tr>
			            <th>주문일</th>
			            <td>2024-11-11</td>
			        </tr>
			        <tr>
			            <th>결제수단</th>
			            <td>신용카드</td>
			        </tr>
			        <tr>
			            <th>교환반품취소</th>
			            <td>N</td>
			        </tr>
			    </tbody>
			</table>
		</div>
		<div class="button">
			<input type="button" class="bt_list" id="bt_list" value="목록"/>
		</div>
		
		<!-- 주문목록으로 이동 -->
		<script>
		$("#bt_list").on("click",function(event){
			location.href = "/admin/orderList.htm";
		});
		</script>
</div>