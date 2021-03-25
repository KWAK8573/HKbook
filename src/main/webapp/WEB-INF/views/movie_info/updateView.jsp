<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<style>
	.inputArea {margin:10px 0;}
	.select_img img {width:500px; margin:20px 0;}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/movie_info/movielist";
			})
		})
			$(".cancel_btn").on("click", function(){
					event.preventDefault();
					location.href = "/movie_info/readView?movie_id=${update.movie_id}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
		})
					$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/movie_info/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
		 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
	
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>

			 <div>
			<%@include file = "nav.jsp" %>
			</div>

			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/movie_info/update" enctype="multipart/form-data">
					<input type="hidden" name="movie_id" value="${update.movie_id}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="category_id">카테고리 번호</label><input type="number" id="category_id" name="category_id" value="${update.category_id}"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="movie_title">제목</label><input type="text" id="movie_title" name="movie_title" value="${update.movie_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="movie_content">내용</label><textarea id="movie_content" name="movie_content"><c:out value="${update.movie_content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${update.user_id}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="movie_date">작성날짜</label>
									<fmt:formatDate value="${update.movie_date}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>
							<div class="inputArea">
							 <label for="movie_img">이미지</label>
							 <input type="file" id="movie_img" name="file" />
							 <div class="select_img">
							  <img src="${update.movie_img}" />
							  <input type="hidden" name="movie_img" value="${update.movie_img}" />
							  <input type="hidden" name="img" value="${update.img}" /> 
							 </div>
							 
							 <script>
							  $("#movie_img").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(500);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
							 </script>
							 <%=request.getRealPath("/") %>
							</div>	
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