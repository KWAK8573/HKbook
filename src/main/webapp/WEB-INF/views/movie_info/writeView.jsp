<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='write']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/movie_info/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
	</script>
<body>

	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container">
			<form action="write" method="post" action="/movie_info/write" enctype="multipart/form-data">
				<table>
					<tbody>
						<c:if test="${login.userId != null}">
						<tr>
							<td><label for="category_id">영화 카테고리</label><input
								type="number" id="category_id" class="chk" name="category_id" /></td>
						</tr>
						<tr>
							<td><label for="movie_title">영화 제목</label><input type="text"
								id="movie_title" name="movie_title" class="chk"/></td>
						</tr>
						<tr>
							<td><label for="user_id">작성자</label><input type="text"
								id="user_id" name="user_id" class="chk" value="${login.userId}"/></td>
						</tr>
						<tr>
							<td><label for="movie_content">영화 소개</label> <textarea id="movie_content"
									name="movie_content" class="chk"></textarea></td>
						</tr>

						<tr>
							<td><label for="movie_img">파일경로</label><input type="text"
								id="movie_img" name="movie_img" class="chk"/></td>
						</tr>
						
						<td>
							<input type="file" name="file">
						</td>
						
						<tr>
							<td>
								<button class="write_btn" type="submit">작성</button>
							</td>
						</tr>
						</c:if>
						<c:if test="${login.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>

					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>
