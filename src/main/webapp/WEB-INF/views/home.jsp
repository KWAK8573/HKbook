<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<!-- 스타일 시트 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<br/><br/>
<p><a href="/board/list">게시물 목록</a></p>

<br/><br/>
<div>
	<c:if test="${not empty login}">
		<div>${login.userId} 님 안녕하세요</div>
		<div>로그인 되었습니다</div>
	</c:if>
	<c:if test="${empty login}">
		<div>비회원 상태입니다</div>
		<p><a href="/member/login">로그인</a></p>
	</c:if>
</div>
</body>
</html>
