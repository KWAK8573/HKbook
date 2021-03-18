<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		if($("#email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
	});
})
</script>
<body>
	<%@include file="../header.jsp"%>
	<h3 class="title">비밀번호 찾기</h3>
	<section id="container">
		<form action="/member/findPw" method="post" id="regForm">
			<div>
				<input type="text" id="email" name="email" placeholder="이메일"/>
			</div>
			<div class="pdt30">
				<button type="submit" id="submit" >임시 비밀번호 발송</button>
				<a href="/member/login" >로그인</a>
			</div>
		</form>
		<div>
			<c:if test="${msg == false}">
				<script type="text/javascript">
					alert("등록되지 않은 이메일 입니다.");
				</script>
			</c:if>
		</div>
	</section>
</body>
</html>