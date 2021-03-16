<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
</head>
<body>
<%@include file="../header.jsp"%>
<div>
로그인 세션: ${login.userId} <br/>
아이디: ${userInfo.userId} <br/>
이메일: ${userInfo.email} <br/>
가입날짜: ${userInfo.memberDate} <br/>
</div>

<p><a href="/member/userModifyView">회원정보수정</a></p>
<p><a href="/">메인으로</a></p>
</body>
</html>