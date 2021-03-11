<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>회원가입</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		if($("#userId").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		if($("#email").val()==""){
			alert("이메일 입력해주세요.");
			$("#email").focus();
			return false;
		}
	});
})
</script>
<body>
	<section id="container">
		<form action="/member/register" method="post">
			<div>
				<label for="userId">아이디</label>
				<input type="text" id="userId" name="userId" placeholder="아이디"/>
			</div>
			<div>
				<label for="pw">패스워드</label>
				<input type="password" id="pw" name="pw" placeholder="패스워드"/>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" placeholder="이메일"/>
			</div>
			<div class="checkbox iCheck">
				<label>
					<input type="checkbox">약관에 동의 
				</label>
			</div>
			<div>
				<button type="submit" id="submit">회원가입</button>
				<a href="/member/login" >로그인</a>
			</div>
		</form>
	</section>

<script type="text/javascript">
$(function () {
	$('input').iCheck({
		checkboxClass:'icheckbox_square-blue',
		radioClass: 'iradio_square-blue',
		increaseArea:'20%' //optional
	})
})
</script>
</body>
	
</html>