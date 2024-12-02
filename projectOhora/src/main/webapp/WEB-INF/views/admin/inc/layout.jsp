<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta name="csrf-token" content="${_csrf.token}" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon"
	href="https://www.ohora.kr/web/upload/favicon_20190801113230.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<title><tiles:getAsString name="title" /></title>
<link href="/resources/css/header.css" type="text/css" rel="stylesheet" />
<link href='<tiles:getAsString name="css"/>' type="text/css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>

	<!-- header 시작 -->
	<tiles:insertAttribute name="header" />
	<!-- header 종료 -->

	<div id="main">
		<div class="top-wrapper clear">
			<div class="container admin_container">
				<div class="row">
					<!-- aside 시작 -->
					<tiles:insertAttribute name="aside" />
					<!-- aside 종료 -->
					<!-- content 시작 -->
					<tiles:insertAttribute name="content" />
					<!-- content 종료 -->
				</div>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<tiles:insertAttribute name="footer" />
	<!-- footer 종료 -->
</body>
</html>