<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾은 아이디 확인</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<h3 class="title">찾은 아이디 확인</h3>
	<div>
		찾은 아이디: ${findId}<br/>
		<button type="submit" onclick="location.href='/member/login' ">로그인</button>
	</div>
</body>
</html>