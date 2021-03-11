<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Movie Category</title>
</head>
<body>
			
		<form action="/board/board/regCon" method="get">
			카테고리 아이디 : <input type="text" name="category_Id"></br>
			영화 카테고리 : <input type="text" name="movie_Category"></br>
		
			<input type="submit" value="Register">
		</form>
	</body>
	
</html>