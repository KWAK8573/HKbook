<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<h3 class="title">로그인</h3>
	<form action="/member/loginPost" method="post">
		<div>
			<input type="text" id="userId" name="userId" placeholder="아이디"/>
		</div>
		<div>
			<input type="password" id="pw" name="pw" placeholder="패스워드"/>
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
		<div>
			<a href="/member/register">회원가입</a>
			<a href="#">아이디찾기</a>
		</div>
	</form>
	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	//registerPOST에서 날린 값으로 문구를 출력할 수 있다
	var msg = "${msg}";
	if (msg === "REGISTERED") {
		alert ("회원가입이 완료되었습니다. 로그인해주세요~")
	}else if (msg ==="FAILURE") {
		alert ("아이디와 비밀번호를 확인해주세요")
	}
</script>
</body>
</html>