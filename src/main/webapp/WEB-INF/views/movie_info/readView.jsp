<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='readForm']");
	
	// 수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/movie_info/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	})
	
	// 삭제
	$(".delete_btn").on("click", function(){
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			
		formObj.attr("action", "/movie_info/delete");
		formObj.attr("method", "post");
		formObj.submit();
			
		}
	})
	
	// 목록
	$(".list_btn").on("click", function(){
		
		location.href = "/movie_info/movielist?page=${scri.page}"
				      +"&perPageNum=${scri.perPageNum}"
				      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	})
	
	
})

</script>
<body>

	<div class="container">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<div>
			<%@include file = "nav.jsp" %>
		</div>
			

		<section id="container">
			<form name="readForm" role="form" method="post">
				  <input type="hidden" id="movie_id" name="movie_id" value="${read.movie_id}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				<table>
					<tbody>
						<tr>
							<td><label for="category_id">영화 카테고리</label><input type="text" id="category_id" name="category_id" value="${read.category_id}" /></td>
						</tr>
						<tr>
							<td><label for="movie_title">영화 제목</label><input type="text" id="movie_title" name="movie_title" value="${read.movie_title}" /></td>
						</tr>
						<tr>
							<td><label for="movie_content">영화 소개</label> <textarea id="movie_content" name="movie_content"><c:out value="${read.movie_content}" /></textarea></td>
						</tr>
						<tr>
							<td><label for="movie_img">파일경로</label><input type="text" id="movie_img" name="movie_img" value="${read.movie_img}" /></td>
						</tr>
						<tr>
							<td><label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${read.user_id}" /></td>
						</tr>
						<tr>
							<td><label for="movie_date">작성날짜</label> <fmt:formatDate value="${read.movie_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div>
				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
				<button type="submit" class="list_btn">목록</button>
			</div>
		</section>
		<hr />
	</div>
</body>
</html>