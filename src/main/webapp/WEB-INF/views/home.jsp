<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="include/head.jsp" %>
<body class="sb-nav-fixed">
<!-- 상단메뉴(로고 있는 라인) -->
<%@ include file="include/main_header.jsp" %>
<div id="layoutSidenav">
	<!-- 왼쪽메뉴 -->
	<%@ include file="include/left_column.jsp" %>
	<div id="layoutSidenav_content">
	<main>
	
	<!-- 페이지 내용넣는 곳 -->
	<div>메인 페이지</div>
	<!-- 페이지 내용넣는 곳 끝-->
		
	</main>
	<%@ include file="include/main_footer.jsp" %>
	</div>
</div>
<!-- 부트스트랩 테마 플러그인 -->
<%@ include file="include/plugin_js.jsp" %>
</body>
</html>

