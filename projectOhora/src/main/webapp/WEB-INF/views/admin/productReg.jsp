<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content">
		<h1 style="text-align: center; margin: 50px 0;">상품 등록</h1>
		<!-- 상품 디테일 설명 -->
		<div class="product-details-container">
			<form id="productForm" action="/admin/productReg.htm?${_csrf.parameterName}=${_csrf.token}" method="post"  enctype="multipart/form-data">
			    <div class="product-info" style="width: 900px;">
			    
			    	<!-- 첨부파일 -->
					<dl class="article-detail-row">
					    <dt class="article-detail-title">첨부파일</dt>
					    <dd class="article-detail-data">
					        <input type="file" id="txtFile" name="file" onchange="displayFileName()" />
					    </dd>
					</dl>
					<!-- // 첨부파일 -->
			    
			        <table class="product-table">
				        <tr>
				            <th>상품 ID</th>
				            <td><input type="text" name="pdtid" value="183"/></td>
				        </tr>
				        <tr>
				            <th>상품명</th>
				            <td><input type="text" name="pdtname" value="테스트네일"/></td>
				        </tr>
				        <tr>
				            <th>상품가격</th>
				            <td><input type="text" name="pdtamount" value="14000"/></td>
				        </tr>
				        <tr>
				            <th>할인율</th>
				            <td><input type="text" name="pdtdiscountrate" value="20"/></td>
				        </tr>
				        <tr>
				            <th>재고</th>
				            <td><input type="text" name="pdtcount" value="20"/></td>
				        </tr>
				        <tr>
				            <th>카테고리</th>
				            <td><input type="text" name="catid" value="1"/></td>
				        </tr>
				        <tr>
				            <th>하위카테고리</th>
				            <td><input type="text" name="scatid" value="1"/></td>
				        </tr>
				        <tr>
				            <th>상품 등록일</th>
				            <td><input type="text" name="pdtadddate" value="2024/12/02"/></td>
				        </tr>
				        <tr>
				            <th>상품 설명</th>
				            <td><textarea name="pdtdescription">테스트</textarea></td>
				        </tr>
			        </table>
			    </div>
			    
			    <!-- 등록하기, 뒤로 가기 버튼 -->
				<div class="button">
					<input type="button" class="bt_submit" id="bt_submit" value="등록하기"/>
					<input onclick="history.back()" type="button" class="bt_back" id="bt_back" value="뒤로가기"/>
				</div>
				<!-- // 등록하기, 뒤로 가기 버튼 -->
			</form>
		</div>
	<!-- // 상품 디테일 설명 -->
	
</div>

	
<!-- 버튼 스크립트 -->
<script>
   document.addEventListener("DOMContentLoaded", function() {
       var submitButton = document.getElementById("bt_submit");
       if (submitButton) {
           submitButton.addEventListener("click", function(event) {
               event.preventDefault();
               if (confirm("상품을 등록하시겠습니까?")) {
                   document.getElementById("productForm").submit();
               }
           });
       } else {
           console.error("Element with ID 'bt_submit' not found.");
       }
   });
   
    function displayFileName() {
        var input = document.getElementById('txtFile');
        // console.log( input.files.length );
        var fileName = input.files.length > 0 ? input.files[0].name : "선택된 파일 없음";
        document.getElementById('fileName').textContent = fileName;
    }
</script>

