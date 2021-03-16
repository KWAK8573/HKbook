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
	//회원가입 버튼 클릭시 이벤트 발생
	$("#submit").on("click", function(){
		//아이디 정규식
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		if( !idReg.test( $("input[name=userId]").val() ) ) {
			 alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return false;
		}
		//비밀번호 정규식
		var pwExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
		if( !pwExp.test( $("input[name=pw]").val() ) ) {
			 alert("비밀번호는 8 ~ 10자 이상 영문, 숫자를 조합해야 합니다");
			return false;
		}
		//비밀번호 확인
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw2').value;
		if (p1 != p2) {
			alert("비밀번호가 일치 하지 않습니다");
			return false;
		}
		//이메일 정규식
		var emailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if( !emailExp.test( $("input[name=email]").val() ) ) {
			 alert("이메일 형식이 맞지 않습니다");
			return false;
		}
		//공백문자 방지
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
			alert("이메일을 입력해주세요.");
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

//아이디 중복체크
function fn_idChk(){
	//아이디 정규식
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	if( !idReg.test( $("input[name=userId]").val() ) ) {
		 alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		return false;
	}
	//아이디 중복체크
	$.ajax({
		url : "/member/idChk",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val()},
		success : function(data){
			if(data == 1){
				$(".result .msg").text("중복된 아이디입니다.");
				$(".result .msg").attr("style", "color:#f00");
				$("#submit").attr("disabled", "disabled");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				$(".result .msg").text("사용가능한 아이디입니다.");
				$(".result .msg").attr("style", "color:#00f");
				$("#submit").removeAttr("disabled");
			}
		}
	})
}
//중복확인 없이 아이디 변경시 회원가입 비활성화
function keyebent(){
	const target = document.getElementById('submit');
	target.disabled = true;
	$(".result .msg").text("아이디 중복확인을 해주세요");
	$(".result .msg").attr("style", "color:#f00");
}
</script>
<body>
	<%@include file="../header.jsp"%>
	<section id="container">
		<form action="/member/register" method="post" id="regForm">
			<div>
				<input type="text" id="userId"  name="userId" placeholder="아이디" onchange="keyebent()"/>
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk()" value="N">중복확인</button>
			</div>
			<div class="result">
				<span class="msg">아이디를 확인해주세요</span>
			</div>
			<div class="pdt30">
				<input type="password" id="pw" name="pw" placeholder="패스워드"/>
				<input type="password" id="pw2" name="pw2" placeholder="패스워드 확인"/>
			</div>
			<div class="pdt30">
				<input type="text" id="email" name="email" placeholder="이메일"/>
			</div>
			<div class="pdt30">
				<button type="submit" id="submit" >회원가입</button>
				<a href="/member/login" >로그인</a>
			</div>
		</form>
	</section>
</body>
</html>