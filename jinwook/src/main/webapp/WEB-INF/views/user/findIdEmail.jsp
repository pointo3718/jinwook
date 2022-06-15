<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
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
	<title>아이디 찾기</title>
	
	<!-- Google Font -->
	<link
	   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	   rel="stylesheet">
	
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
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

	input{
		width:300px;
		height:50px;
		font-size: 15px;
		text-indent: 1em;
	}

	h3 {
	font-weight: normal;
}
 

 
.auth input {
	border: 1px solid #ddd;
	padding: 0 5px;
	height: 30px;
	margin-bottom: 10px;
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
				
	$(document).ready(function() {
		$("#snedE").click(function() {
			const email = $("#email").val();
			const userName = $(".userName").val();
			/* if (!emailCheck(email)) {
				swal("이메일을 정확히 입력해주세요");
				return;
			} */
	 		alert(email);
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1 )){
				alert("이메일 형식이 아닙니다.");
				return;
			}
			
			$.ajax({
				url: "/user/findIdEmail",
				type: "POST",
				data: {email: email,
						userName : userName}
	
			})
			.done(function() {
				location.href = "/user/login";
				/* const html =
					"<div class='send_email'> "
						+ "<div> "
						+	"<h3>"+email+"</h3> "
						+	"<span>으로 아이디를 전송했습니다</span><br> "
						+	"<div>가입한 적이 없는 이메일 주소나 올바르지 않은 이메일 주소를 입력하신 경우에는 메일을 받을 수 없습니다.</div> "
						+	"<button class='back_btn'>돌아가기</button> "
						+"</div> "
					+"</div>";
				$("main").html(html); */
	 
			})
			.fail(function() {
				alert("다시 확인해주세요.");
				return;
			})
		})
	 
		$(document).on("click", ".back_btn", function() {
			location.href = "login";
		})
	})
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>		
	
</head>

<body>
<jsp:include page="../layout/top.jsp" />
	
	<main></main>
	<form class="find_id_page text-center">
		<div class="find_info">
			<h1 class="">아이디 찾기</h1>
			<br><br>
		</div>
		<div class="auth">
			<button  type="button" class="phone site-btn" onclick="emailAuth()">휴대폰 인증</button>
			<button  type="button" class="email site-btn" onclick="phoneAuth()">이메일 인증</button>
		</div>
		</form>	
			<br><br>
		<form class = "ad text-center">
		<div class="text-center " style="margin-right:270px;">
		
		<label for="userName1 " style="font-size:15px;" >이름</label>	
		</div>
			<div class="aaa" >
			<input type="text" name="userName" class="userName" placeholder="이름을 입력해주세요.">
			</div>
			<br>
		<div class="text-center " style="margin-right:260px;">
		
		<label for="email1 " style="font-size:15px;" >이메일</label>	
		</div>
			<div class="adad">
			<input type="email" id="email" class="email" placeholder="이메일을 입력해주세요.">
			</div>
			<br>
			<button class="send_btn site-btn" id="snedE">전송</button>
			<br><br>
	</form>	
			<br><br>
 	<!--  화면구성 div end /////////////////////////////////////-->
<jsp:include page="../layout/footer.jsp" />
</body>

</html>