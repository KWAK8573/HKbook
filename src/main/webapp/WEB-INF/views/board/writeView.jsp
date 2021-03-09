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
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
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
			<form action="write" method="post" action="/board/write">
				<table>
					<tbody>
						<tr>
							<td><label for="catecory_id">영화 카테고리</label><input
								type="text" id="catecory_id" name="catecory_id" /></td>
						</tr>
						<tr>
							<td><label for="movie_title">영화 제목</label><input type="text"
								id="movie_title" name="movie_title" /></td>
						</tr>
						<tr>
							<td><label for="user_id">작성자</label><input type="text"
								id="user_id" name="user_id" /></td>
						</tr>
						<tr>
							<td><label for="movie_content">영화 소개</label> <textarea id="movie_content"
									name="movie_content"></textarea></td>
						</tr>

						<tr>
							<td><label for="movie_img">파일경로</label><input type="text"
								id="movie_img" name="movie_img" /></td>
						</tr>
						<tr>
							<td>
								<button class="write_btn" type="submit">작성</button>
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
