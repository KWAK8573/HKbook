<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript"></script>
<script>
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
/*    	//추천하기 버튼
	$("#btnRecommend").click(function(){
	    if(confirm("해당 글을 추천하시겠습니까?")){
	        document.form1.action="recommend";
	        document.form1.submit();
	        
	        alert("해당 글을 추천하였습니다.")
	        
	        }
	    });   */
	 
	// 추천하기

/* 	$("#recommendSubmit").click(function() {
		if (confirm("추천을 하시겠습니까?")) {
			var activeTime = new Date($("#u_recommend_active_time").val());
			if (activeTime < new Date()) {
				$("#recommend").submit();
			} else {
				if($("#userId").val() != null){
					alert("다음 추천가능 시간: " + activeTime.toLocaleString());
				}else{
					// 로그인된 아이디가 없는 경우 인터셉터 경로로 반환
					window.location = "recommend";
				}
			}
		} else {
			return;
		}
	}); */
	
	
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
				  <!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 -->
 
 				<c:if test = "${login.userId != null and login.userId != userVO.userId}">   
					<button type = "button" id = "btnRecommend">추천하기</button>
    			</c:if>
    			<script>
	    			$("#btnRecommend").click(function(){
	    			    if(confirm("해당 글을 추천하시겠습니까?")){
	    			        document.form1.action="recommend";
	    			        document.form1.submit();
	    			        
	    			        alert("해당 글을 추천하였습니다.")
	    			        
	    			        }
	    			    });
    			</script>
					
 								
<%-- 						<div class="panel-body">
 								<div class="well text-center">
									<form id="recommend" action="recommend?page=${page}&perPageNum=${perPageNum}" method="post">
										<input type="hidden" name="movie_id" value="${read.movie_id}">
										<c:if test="${login != null}">
											<input id="userId" type="hidden" name="userId" value="${login.userId}">
											<input id="u_recommend_active_time" type="hidden" name="u_recommend_active_time" value="${u_recommend_active_time}">
										</c:if>
										<button id="recommendSubmit" type="button" class="btn btn-primary">추천 ${read.b_recommend}</button>
									</form>
								</div>
							</div> --%>
			    
			</div>		
		</section>
		<hr />
	</div>
</body>
</html>