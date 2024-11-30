<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="">
<script src="/resources/cdn-main/example.js"></script>
<style>
</style>
</head>
<body>
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

.table th,
.table td {
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
<header>
</header>

<div class="container admin_container">
		<div class="row">
			<h1 style="text-align: center; margin: 50px 0;">회원 리스트</h1>
			<!-- 나중에 타일즈로 처리 -->
			<div class="row side_nav">
				<ul class="nav nav-pills nav-stacked">
					<li class="li_btns active"><a href="/ik/admin/customerList.jsp">회원 관리</a></li>
					<li class="li_btns"><a href="/admin/productList.htm">상품 조회</a></li>
					<li class="li_btns"><a href="/ik/admin/productReg.jsp">상품 등록</a></li>
					<li class="li_btns"><a href="/ik/admin/orderList.jsp">주문 현황</a></li>
				</ul>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>회원ID</th>
						<th>이름</th>
						<th>등급</th>
						<th>E-mail</th>
						<th>휴대폰번호</th>
						<th>생년월일</th>
						<th>적립금</th>
						<th>SNS동의</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>love</td>
							<td>최사랑</td>
							<td>Family</td>
							<td>love_2s5@naver.com</td>
							<td>010-1234-1234</td>
							<td>1998-02-05</td>
							<td>1000원</td>
							<td>Y</td>
							<td>2024-11-11</td>
						</tr>
				</tbody>
						<tr>
							<td>love</td>
							<td>최사랑</td>
							<td>Family</td>
							<td>love_2s5@naver.com</td>
							<td>010-1234-1234</td>
							<td>1998-02-05</td>
							<td>1000원</td>
							<td>Y</td>
							<td>2024-11-11</td>
						</tr>
				</tbody>
			</table>
		</div>
</div> 
</body>
</html>

