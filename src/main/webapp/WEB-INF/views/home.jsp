<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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

<p><a href="/board/list">게시물 목록</a></p>
<p><a href="/member/register">회원가입</a></p>

</body>
</html>
