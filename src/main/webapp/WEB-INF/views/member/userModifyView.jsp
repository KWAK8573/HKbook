<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		//비밀번호 정규식
		var pwExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
		if( !pwExp.test( $("input[name=pw]").val() ) ) {
			 alert("비밀번호는 8 ~ 10자 이상 영문, 숫자를 조합해야 합니다");
			return false;
		}
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
	});
})
</script>
<body>
	<%@include file="../header.jsp"%>
	<h3 class="title">회원정보 수정</h3>
	<form action="/member/userModify" method="post">
		<div>
			<label for="userId">아이디</label>
			<input type="hidden" id="userId" name="userId" placeholder="아이디" value="${login.userId}"/>
			${login.userId}
		</div>
		<div>
			<label for="pw">패스워드</label>
			<input type="password" id="pw" name="pw" placeholder="패스워드" />
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="hidden" id="email" name="email" placeholder="이메일" value="${login.email}"/>
			${login.email}
		</div>
		<div>
			<button type="submit" id="submit">회원정보 수정</button>
			<a href="/" >메인으로</a>
		</div>
	</form>
</body>
</html>