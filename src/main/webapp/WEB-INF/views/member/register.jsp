<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
 	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			location.href = "/";
		})
		
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
				alert("성명을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if(idChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			}else if(idChkVal == "Y"){
				$("#regForm").submit();
			}
		});
	})
	
	function fn_idChk(){
		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
				}else if(data == 0){
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
</script>
<body>
	<section id="container">
		<form action="/member/register" method="post" id="regForm">
			<div>
				<label for="userId">아이디</label>
				<input type="text" id="userId"  name="userId" placeholder="아이디"/>
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk()" value="N">중복확인</button>
			</div>
			<div>
				<label for="pw">패스워드</label>
				<input type="password" id="pw" name="pw" placeholder="패스워드"/>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" placeholder="이메일"/>
			</div>
			<div>
				<button type="submit" id="submit">회원가입</button>
				<a href="/member/login" >로그인</a>
			</div>
		</form>
	</section>
</body>
</html>