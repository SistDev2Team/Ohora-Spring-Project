<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
/* 컨테이너 스타일 */
.container.admin_container {
    margin: 50px auto;
    width: 80%;
    max-width: 1200px;
    font-family: 'Arial', sans-serif;
    color: #333;
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
/* label:before에 체크하기 전 상태 CSS */
input#check_btn {
  content:"";
  display:inline-block;
  width:20px;
  height:20px;
  border:2px solid #F47C7C;
  border-radius: 10px;
  vertical-align:middle;
  }
  
/* label:before에 체크 된 상태 CSS */  
input#check_btn:checked {
  content:"";
  background-color:black;
  border-color:black;
  background-position: 50%;
  }
  
/* 수정, 삭제버튼 productList 에만 적용 */
.button {
    text-align: right; /* 버튼을 오른쪽으로 정렬 */
    margin: 10px 0; /* 버튼과 테이블 사이의 여백 추가 */
}

.bt_del,
.bt_modify {
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
.bt_del:hover {
    background-color: #c2c2c2; 
    color: black;
}

.bt_modify:hover {
    background-color: #c2c2c2; 
    color: black;
}
</style>
</head>
<body>
<div class="container admin_container">
		<div class="row">
			<h1 style="text-align: center; margin: 50px 0;">주문 현황</h1>
			<!-- 나중에 타일즈로 처리 -->
			<div class="row side_nav">
				<ul class="nav nav-pills nav-stacked">
					<li class="li_btns"><a href="/admin/customerList.htm">회원 관리</a></li>
					<li class="li_btns"><a href="/admin/productList.htm">상품 조회</a></li>
					<li class="li_btns"><a href="/admin/productReg.htm">상품 등록</a></li>
					<li class="li_btns active"><a href="/admin/orderList.htm">주문 현황</a></li>
				</ul>
			</div>
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
						<td><fmt:formatNumber value="${dto.opdtamount}" type="number" pattern="#,##0" /></td>
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
</body>
</html>







 

