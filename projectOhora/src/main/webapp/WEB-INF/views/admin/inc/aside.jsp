<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div id="aside">
	<div class="row side_nav">
		<ul class="nav nav-pills nav-stacked">
			<li class="li_btns"><a href="/admin/customerList.htm">회원 관리</a></li>
			<li class="li_btns"><a href="/admin/productList.htm">상품 조회</a></li>
			<li class="li_btns"><a href="/admin/productReg.htm">상품 등록</a></li>
			<li class="li_btns"><a href="/admin/orderList.htm">주문 현황</a></li>
		</ul>
	</div>
</div>
<script>
$(document).ready(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const currentNo = urlParams.get('no') || '2';

    $(".li_btns").each(function (index) {
        const link = $(this).find("a");
        let href = link.attr("href");

        if (!href.includes("?")) {
            href += `?no=\${index + 1}`;
        } else if (!href.includes("no=")) {
            href += `&no=\${index + 1}`;
        }

        link.attr("href", href);

        // 현재 no와 일치하는 항목에 active 클래스 추가
        if ((index + 1).toString() === currentNo) {
            $(this).addClass("active");
        }
    });
});
</script>