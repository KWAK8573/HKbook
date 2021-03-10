<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
		})
	
	</script>
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
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="review_id" value="${update.review_id}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title">제목</label><input type="text" id="review_title" name="review_title" value="${update.review_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content">내용</label><textarea id="review_content" name="review_content"><c:out value="${update.review_content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${update.user_id}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="review_date">작성날짜</label>
									<fmt:formatDate value="${update.review_date}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>