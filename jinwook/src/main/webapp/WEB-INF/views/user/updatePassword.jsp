<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>비밀번호 재설정</title>

<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Google Font -->
 <!-- Google Font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">  

<!-- Css Styles -->
<link rel="stylesheet"
   href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/nice-select.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/owl.carousel.min.css"
   type="text/css">
<link rel="stylesheet"
   href="${path}/resources/static/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/static/css/style.css"
   type="text/css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	

<style>

.row{ 
    	 	display:flex;
            justify-content: center;
            align-items: center;
           
        }
input{
		width:300px;
		height:50px;
		font-size: 15px;
		text-indent: 1em;
	}
</style>
 
 
<script type="text/javascript">

/* const URLSearch = new URLSearchParams(location.search);
const username = URLSearch.get("username"); 
  */
	
/* // 비밀번호 변경시 비밀번호입력 상태 확인
const isSubmit = (function() {
	let submit = false;
	
	const getSubmit =function() {
		return submit;
	}
	
	const setSubmit = function(set){
		submit = set;
		return submit;
	}
	return {getSubmit : getSubmit, setSubmit : setSubmit};
})();	 */

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#bts" ).on("click" , function() {
		fncAddUser();
	});
});	


function fncAddUser() {	
	var pw=$("input[name='password']").val();
	var pw2=$("input[name='password2']").val();
	
	if(pw == null || pw.length <1){
		alert("패스워드는  반드시 입력하셔야 합니다.");
		return;
	}
	if(pw2 == null || pw2.length <1){
		alert("패스워드는  반드시 입력하셔야 합니다.");
		return;
	}
	if( pw != pw2 ) {				
		alert("비밀번호 확인이 일치하지 않습니다.");
		$("input:text[name='password2']").focus();
		return;
	}
	$("form").attr("method" , "POST").attr("action" , "/user/updatePassword").submit();
}
 /* 
$(".modify_btn").click(function(){
	const password1 = $(".password1").val().replaceAll(" ", "");
	const password2 = $(".password2").val().replaceAll(" ", "");
 
	const msgBox = $(".password_check_msg");
	
	if (!password1 || !password2) {
		msgBox.text("비밀번호를 입력해주세요");
		return false;
	} else {
		msgBox.text("");
	}
	
	if(password1 != password2) {
		msgBox.text("비밀번호를 확인해 주세요");
		return false;
	} else {
		msgBox.text("");
	}
	alert("변경 완료되었습니다.");
	$(".password_modify_page").attr("method" , "POST").attr("action" , "updatePassword").submit();
})
 
 
// 패스워드 변경
 $(".modify_btn").click(function(){
			$.ajax({
				url : "/user/updatePassword",
				type : "post",
				dataType : "json",
				data : {"password1" : $(".password1").val()},
				success : function(data){
					if(!pwdCheck()) {
						return;
					}
			self.location = "login";
				} 
 $(".modify_btn").click(function(){
	if(!pwdCheck()) {
		return;
	}
	const data = {
		password: $(".password1").val(),
		userId : $(userId).val()
	}
	
	$.ajax({
		url: "/updatePassword",
		type: "PATCH",
		data: data
	}) 
	
	.done(function(result){
		swal({
			text : result,
			closeOnClickOutside : false
		}) 
	 .fail(function(){
		alert("에러");
	})
	})
			}) */
			 
</script>
</head>
<body>
<jsp:include page="../layout/top.jsp" />

<!-- <form class="password_modify_page">
		<div class="find_info">	
			<h3>새로운 비밀번호로 재설정해주세요</h3>
			
			<div class="box">
				<span>새 비밀번호</span>
				<input type="password" class="password1" name="password">
			</div>
			
			<div class="box">
				<span>새 비밀번호 확인</span>
				<input type="password" class="password2">
				<div class="password_check_msg"></div>
			</div>
			<button class="modify_btn" >변경하기</button>
		</div>
	</form>
 -->

<form class="updatePasswor_page text-center" id="updatePw">
		<div class="row">
			<h1 class="">비밀번호 변경</h1>
			<br><br>
		</div>
			<br><br>
		<div class="text-center " style="margin-right:190px; ">
		 <input id='userId' type='hidden' name='userId' value='${param.userId}'>
		<label for="password " style="font-size:15px; " >새 비밀번호 등록</label>	
		</div>
			<div class="aaa " style="font-size:15px;">
			<input type="password" maxlength='50' id="password2" name="password" class="password" placeholder="새 비밀번호를 입력해주세요.">
			</div>
			<br>
			
		<div class="text-center" id="fEmail" >
			<div class="text-center " style="margin-right:190px;">
			<label for="password2 " style="font-size:15px;" >새 비밀번호 확인</label>	
			</div>
				<div class="adad" style="font-size:15px;">
				<input type="password" id="password2" name="password2" class="password2" placeholder="새 비밀번호를 한 번 더 입력해주세요.">
				</div>
				<br>
				<button class="bts  site-btn" id="bts" style="width:300px;">확인</button>
				<br><br>
		</div>
</form>




<jsp:include page="../layout/footer.jsp" />
</body>
</html>
