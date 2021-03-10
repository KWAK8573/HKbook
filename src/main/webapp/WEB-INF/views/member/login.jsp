<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="/member/loginPost" method="post">
		<div>
			<input type="text" id="userId" name="userId" placeholder="아이디"/>
		</div>
		<div>
			<input type="password" id="pw" name="pw" placeholder="패스워드"/>
		</div>
		
		<div class="checkbox iCheck">
			<label>
				<input type="checkbox" name="useCookie"> 로그인 유지
			</label>
		</div>
		
		<div>
			<button type="submit">로그인</button>
			<a href="/member/register">회원가입</a>
		</div>
	</form>
	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var msg = "${msg}";
	if (msg === "REGISTERED") {
		alert ("회원가입이 완료되었습니다. 로그인해주세요~")
	}else if (msg ==="FAILURE") {
		alert ("아이디와 비밀번호를 확인해주세요")
	}
	
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