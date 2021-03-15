<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
	});
})
</script>
<body>
	<form action="/member/userDelete" method="post">
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
			<button type="submit" id="submit">회원탈퇴</button>
			<a href="/" >메인으로</a>
		</div>
	</form>
	<div>
		<c:if test="${msg == false}">
			비밀번호가 맞지 않습니다.
		</c:if>
	</div>
</body>
</html>