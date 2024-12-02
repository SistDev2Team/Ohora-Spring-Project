<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div id="aside">
	<div class="row side_nav">
		<ul class="nav nav-pills nav-stacked">
			<li class="li_btns"><a href="/admin/customerList.htm">회원 관리</a></li>
			<li class="li_btns active"><a href="/admin/productList.htm">상품
					조회</a></li>
			<li class="li_btns"><a href="/admin/productReg.htm">상품 등록</a></li>
			<li class="li_btns"><a href="/admin/orderList.htm">주문 현황</a></li>
		</ul>
	</div>
</div>