<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Movie CaategoryList</title>
</head>
<body>
			
		<form action="/board/board/modCon" method="get">
			int category_Id   : <input type="text" name="name" value=${b.int category_Id}></br>
			String movie_Category : <input type="text" name="author" value=${b.String movie_Category}></br>
					
			<input type="submit" value="Modify">
		</form>

	</body>
	
</html>