<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
		
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?review_id=${update.review_id}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
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
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data">
					<input type="hidden" name="review_id" value="${update.review_id}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title">제목</label><input type="text" id="review_title" name="review_title" value="${update.review_title}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content">내용</label><textarea id="review_content" name="review_content" class="chk" title="내용을 입력하세요."><c:out value="${update.review_content}" /></textarea>
									 <script>
									 var ckeditor_config = {
									   resize_enaleb : false,
									   enterMode : CKEDITOR.ENTER_BR,
									   shiftEnterMode : CKEDITOR.ENTER_P,
									   filebrowserUploadUrl : "/board/ckUpload"
									 };
									 
									 CKEDITOR.replace("review_content", ckeditor_config);
									</script>
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
							<div class="inputArea">
								 <label for=review_img>이미지</label>
								 <input type="file" id="review_img" name="file" />
								 <div class="select_img">
								  <img src="${update.review_img}" />
								  <input type="hidden" name="review_img" value="${update.review_img}" />
								  <input type="hidden" name="thumbimg" value="${update.thumbimg}" /> 
								 </div>
								 
								 <script>
								  $("#review_img").change(function(){
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