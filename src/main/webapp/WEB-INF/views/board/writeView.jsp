<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

		<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	 	<title>게시판</title>
	</head>
	
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='write']");
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
			var regForm = $("form[name='write'] .chk").length;
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
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title">제목</label><input type="text" id="review_title" name="review_title" class="chk" title="제목을 입력하세요." />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content">내용</label>
									<textarea rows="5" cols="50" id="review_content" name="review_content" ></textarea>
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
								<!-- <td>
									<label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${login.userId}" readonly />
								</td>--> 
							<tr>
								<td>						
									<button class="write_btn" type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
							<div class="inputArea">
								 <label for="review_img">이미지</label>
								 <input type="file" id="review_img" name="file" />
								 <div class="select_img"><img src="" /></div>
								 
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
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>