<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="">
<script src="/resources/cdn-main/example.js"></script>
<style>
/* 컨테이너 스타일 */
.container.admin_container {
	margin: 50px auto;
	width: 80%;
	max-width: 1200px;
	font-family: 'Arial', sans-serif;
	color: #333;
	/* border-radius: 10px; */
}

/* 헤더 스타일 */
h1 {
	font-size: 2rem;
	font-weight: bold;
	text-align: center;
	margin-bottom: 30px;
	color: #555;
}

/* 사이드 내비게이션 스타일 */
.side_nav {
	float: left;
	width: 20%;
	margin-right: 5%;
}

.side_nav .nav {
	list-style: none;
	padding: 0;
}

.side_nav .li_btns {
	margin: 10px 0;
	text-align: center;
}

.side_nav .li_btns a {
	display: block;
	padding: 20px 20px;
	background: #f8f9fa;
	text-decoration: none;
	color: #333;
	border-radius: 5px;
	font-size: 1rem;
	transition: background-color 0.3s;
}

.side_nav .li_btns a:hover {
	background: #e9ecef;
}

.side_nav .li_btns.active a {
	background: rgb(175, 175, 175);
	color: #fff;
	font-weight: bold;
}

/* 테이블 스타일 */
.table {
	width: 75%;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.table th, .table td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #f3f3f3;
	font-size: 0.9rem;
	text-align: center;
}

.table th {
	background: rgb(175, 175, 175);
	color: white;
	text-transform: uppercase;
	font-weight: bold;
}

.table tbody tr:hover {
	background: #f1f1f1;
}

.table td {
	color: #333;
}

.table th {
	text-align: center;
}

/* 반응형 디자인 */
@media screen and (max-width: 768px) {
	.container.admin_container {
		width: 90%;
	}
	.side_nav {
		width: 100%;
		margin-right: 0;
		margin-bottom: 20px;
	}
	.table {
		width: 100%;
	}
}
</style>
<style>
/* 상품 디테일 div */
.admin-container {
    display: flex;
    font-family: Arial, sans-serif;
    margin: 20px;
}

.side-nav {
    width: 200px;
    margin-right: 20px;
}

.side-nav .menu {
    list-style: none;
    padding: 0;
}

.side-nav .menu li {
    margin: 10px 0;
}

.side-nav .menu li a {
    display: block;
    padding: 10px 15px;
    background-color: #f7f7f7;
    color: #333;
    text-decoration: none;
    border-radius: 5px;
    text-align: center;
}

.side-nav .menu li.active a {
    background-color: #d3d3d3;
    font-weight: bold;
}

.side-nav .menu li a:hover {
    background-color: #e9e9e9;
}

.main-content {
    flex: 1;
}

.page-title {
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
}

.button-group {
    text-align: right;
    margin-bottom: 10px;
}

.button-group .btn {
    padding: 8px 20px;
    margin-left: 10px;
    border: none;
    border-radius: 5px;
    background-color: #f0f0f0;
    color: #333;
    font-size: 14px;
    cursor: pointer;
}

.button-group .btn:hover {
    background-color: #dcdcdc;
}

.product-table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    border: 1px solid #ddd;
}

.product-table th, .product-table td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

.product-table th {
    background-color: #f7f7f7;
    font-weight: bold;
    text-align: center;
}

.product-table tbody tr:hover {
    background-color: #f9f9f9;
}


</style>
<style>
/* 상품 디테일 div css */
.product-details-container {
    display: flex;
    align-items: flex-start;
    margin: 20px;
    font-family: Arial, sans-serif;
}

.product-image img {
    max-width: 400px;
    max-height: 400px;
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    margin-right: 20px;
}

.product-info {
    flex: 1;
}

.product-table {
    width: 100%;
    border-collapse: collapse;
}

.product-table th,
.product-table td {
    padding: 10px;
    text-align: left;
    vertical-align: top;
    border-bottom: 1px solid #ddd;
}

.product-table th {
    width: 150px;
    font-weight: bold;
    background-color: #f9f9f9;
    text-align: center;
    vertical-align: middle;
}

.product-table td {
    background-color: #fdfdfd;
}

.product-table tr:last-child td {
    border-bottom: none;
}
td input {
	width: 240px;
	height: 25px;
}
textarea {
   width: 100%;
   height: 12.25em;
   resize: none;
 }

</style>
<style>
/* 수정, 삭제버튼 productList 에만 적용 */
.button {
    text-align: right; /* 버튼을 오른쪽으로 정렬 */
    margin: 10px 0; /* 버튼과 테이블 사이의 여백 추가 */
}
.bt_back,
.bt_submit {
    padding: 8px 15px; /* 버튼 크기 확대 */
    font-size: 14px; /* 글자 크기 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 5px; /* 모서리 둥글게 */
    background-color: #f5f5f5; /* 버튼 배경색 */
    color: #333; /* 버튼 글자색 */
    cursor: pointer; /* 마우스 올릴 때 포인터 */
    margin-left: 10px; /* 버튼 간격 */
    transition: all 0.3s ease; /* 애니메이션 효과 */
}
.bt_back:hover {
    background-color: #c2c2c2; 
    color: black;
}

.bt_submit:hover {
    background-color: #c2c2c2; 
    color: black;
}
</style>
</head>
<body>
	<div class="container admin_container">
		<div class="row">
			<h1 style="margin: 50px 0;">상품 등록</h1>
			<!-- 나중에 타일즈로 처리 -->
			<div class="row side_nav">
				<ul class="nav nav-pills nav-stacked">
					<li class="li_btns"><a href="/ik/admin/customerList.jsp">회원
							관리</a></li>
					<li class="li_btns"><a href="/admin/productList.htm">상품
							조회</a></li>
					<li class="li_btns active"><a href="/ik/admin/productReg.jsp">상품
							등록</a></li>
					<li class="li_btns"><a href="/ik/admin/orderList.jsp">주문
							현황</a></li>
				</ul>
			</div>
		</div>

		<!-- 상품 디테일 설명 -->
		<div class="product-details-container">
			<div class="product-image">
				<img src="https://via.placeholder.com/400x400" alt="상품 이미지">
				<!-- 첨부파일 업로드 필요 -->
			</div>
			<div class="product-info">
				<table class="product-table">
					<tr>
						<th>상품 ID</th>
						<td><input type="text" placeholder="01"/></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" placeholder="네일"/></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input type="text" placeholder="50,000원"/></td>
					</tr>
					<tr>
						<th>할인율</th>
						<td><input type="text" placeholder="20"/></td>
					</tr>
					<tr>
						<th>재고</th>
						<td><input type="text" placeholder="50"/></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><input type="text" placeholder="네일"/></td>
					</tr>
					<tr>
						<th>하위카테고리</th>
						<td><input type="text" placeholder="젤네일팁"/></td>
					</tr>
					<tr>
						<th>상품 등록일</th>
						<td><input readonly="readonly" type="text" placeholder="2024-11-27"/></td>
					</tr>
					<tr>
						<th>상품 설명</th>
						<td>
						<textarea rows="" cols="" ></textarea>
						</tr>
				</table>
			</div>
		</div>
		<!-- // 상품 디테일 설명 -->
		
		<!-- 수정하기, 뒤로 가기 버튼 -->
		<div class="button">
			<input type="button" class="bt_submit" id="bt_submit" value="등록하기"/>
			<input onclick="history.back()" type="button" class="bt_back" id="bt_back" value="뒤로가기"/>
		</div>
		<!-- // 수정하기, 뒤로 가기 버튼 -->
		
		<!-- 버튼 스크립트 -->
		<script>
	    $(document).ready(function() {
	        $("#bt_submit").on("click", function(event) {
	            event.preventDefault(); 
	            if (confirm("상품을 등록하시겠습니까?")) {
	                alert("상품이 등록되었습니다.");
	                location.replace("/ik/admin/productDetail.jsp");
	            }
	        });
	    });
		</script>
		<!-- // 버튼 스크립트 -->

	</div>
</body>
</html>









