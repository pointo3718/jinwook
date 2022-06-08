<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

	h3 {
	font-weight: normal;
}
 
main {
	width: 100%;
	text-align: center;
	min-height: calc(100vh - 341px);
}
 
main input {
	font-size: 1.5rem;
}
 
main button {
	background: #30DAD9;
	color: #fff;
	padding: 1px 5px;
	border: none;
	height: 30px;
	border-radius: 5px;
}
 
.find_info {
	width: 350px;
	max-width: 90%;
	margin: 0 auto;
	margin-top: 50px;
}
 
.find_id_page .find_info input, .find_password_page .find_info input {
	border-radius: 5px;
	border: 1px solid #666;
	width: 75%;
	min-width: 150px;
	height: 30px;
	padding: 0 5px;
}
 
.find_password {
	text-align: left;
	margin: 10px;
}
 
.find_password a {
	text-decoration: underline;
}
 
.send_email {
	margin-top: 50px;
}
 
.send_email h2 {
	display: inline;
}
 
.find {
	text-align: left;
}
 
.find>div {
	margin-bottom: 20px;
}
 
.find input[type=radio]:checked ~ .auth {
	display: block;
}
 
.auth {
	margin: 10px;
	display: none;
}
 
.auth input {
	border: 1px solid #ddd;
	padding: 0 5px;
	height: 30px;
	margin-bottom: 10px;
}
 
.password_modify_page .find_info {
	width: 450px;
}
 
.password_modify_page h3 {
	margin-bottom: 20px;
}
 
.password_modify_page .box {
	text-align: left;
	margin-bottom: 5px;
}
 
.password_modify_page .box span {
	display: inline-block;
	width: 120px;
}
 
.password_modify_page .box input {
	border: 1px solid #ddd;
	padding: 0 5px;
	height: 30px;
	max-width: 250px;
	width: 60%;
}
 
.password_modify_page .modify_btn {
	margin-top: 20px;
}
 
.password_modify_page .password_check_msg {
	text-align: center;
}
 
@media ( max-width : 767px) {
	body>div {
		min-height: calc(100vh - 276px);
		width: 90%;
		margin: 0 auto;
	}
}
 
@media ( max-width : 480px) {
	.password_modify_page .box span {
		width: 90px;
	}
}

    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
				
	$(document).ready(function(){
		
		function usernameCheck() {
			let submit = false;
			const username = $("input[name=username]").val().replaceAll(" ", "");
			if(!username) {
				return false;
			}
			
			$.ajax({
				url: "/overlapCheck",
				type: "GET",
				async: false,
				data: {
					value : username,
					valueType : "username"
				}
			})
			.done(function(result){
				if(result == 1) {
					submit = true;
				} 
			})
			.fail(function(){
				alert("에러");
			})
			return submit;
		}
		 
		 
		 
		 
		$(".next_page").click(function(){
			if(!usernameCheck()) {
				swal("아이디를 정확히 입력해주세요");
				return;
			}
			const data = {
				username : $(".username").val(),	
			}
			
			$.ajax({
				url: "/find/password/auth",
				type: "POST",
				data: data
			})
			.then(function(result){
				location.href= "/find/password/auth?username=" + result;
			})
			.fail(function(){
				alert('에러');
			})
		})
		 
		 
		 
			
		 
			
		})
		
		
	</script>		
	
</head>

<body>
	<main class="find_id_page">
		<div class="find_info">
			<h3>가입하신 이름과 이메일을 입력해주세요</h3>
			<input type="text" name="userName" class="userName">
			<input type="email" name="email" class="email">
			<button class="find_btn">찾기</button>
			<div class="find_password"><a href="/find/password">비밀번호 찾기</a></div>
		</div>
	</main>	
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>