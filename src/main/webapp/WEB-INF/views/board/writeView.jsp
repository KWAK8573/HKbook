<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/board/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title">제목</label><input type="text" id="review_title" name="review_title" />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content">내용</label><textarea id="review_content" name="review_content" ></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${login.userId}" readonly />
								</td> 
							<tr>
								<td>						
									<button type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>