<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<!-- 스타일 시트 추가 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<head>
	<title>Home</title>
</head>
<body>

<div id="header">
	<div id="logo">로고</div>
	<div class="top_menu">
		<ul>
			<c:if test="${not empty login}">
			<li>${login.userId}님 로그인</li>
			<li><a href="">로그아웃</a></li>
			<li><a href="">회원탈퇴</a></li>
			</c:if>
			<c:if test="${empty login}">
			<li><a href="/member/login">로그인</a></li>
			<li><a href="/member/register">회원가입</a></li>
			</c:if>
		</ul>
	</div>
</div>

<div id="nav">
	<ul>
		<li><a href="">영화 소개 게시판</a></li>
		<li><a href="/board/list">리뷰 게시판</a></li>
		<li><a href="">마이페이지</a></li>
	</ul>
</div>


