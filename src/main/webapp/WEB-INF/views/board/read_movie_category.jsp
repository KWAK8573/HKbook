<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movie_categoryList</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>카테고리 아이디</td>
		<td>무비 카테고리</td>
		
	<tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.category_Id}</td>
		<td>${dto.movie_Category}</td>
	
		<td><a href="delete?mId=${dto.category_Id}">X</a></td>
	<tr>
	</c:forEach>
</table>
<p><a href="/board/board/reg">신규카테고리</a></p>
</body>
</html>