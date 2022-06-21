<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="UTF-8">
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
 <!-- Google Font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">  	   
	 
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	
	.row{
   display: flex;
    justify-content: center;
    align-items: center;
}
	
*{font-family: 'Noto Sans KR', sans-serif;}
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
 .swal-button 
				{
					background-color: #7fad39;
					font-size: 12px;
					text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
				}
				
 #phoneBt{
 	outline:none;
 }
 #emailBt{
 	outline:none;
 }

    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//아이디 찾기 문자 인증 
	$(document).ready(function() {
	$("#snedA").click(function(){
	var phone = $("#phone").val();
	var userName = $(".userName").val();
	$.ajax({
        type:"GET",
        url:"findIdPhoneSend?phone=" + phone+"&userName="+userName,
        cache : false,
        success:function(data){
        	alert("asdas"+data)
        	if(data == "error"){
				swal("진욱이네", "휴대폰 번호가 올바르지 않습니다.");
        		
				/* $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneChk").css("color","red");
				$("#phone").attr("autofocus",true); */
        	}else{	        		
		swal("진욱이네", "인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
        		/* $("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneChk").css("color","green");
        		$("#phone").attr("readonly",true);
        		code2 = data; */
        		$("#phoneDoubleChk").val(data); 
        		$(".userId").val();
        		$(".regDate").val();
        		console.log();
        	}
        }
    });
});
	});
	$(document).ready(function() {
$("#sned").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
   	const phone2 = $("#authNo1").val();
	const data = $("#phoneDoubleChk").val();
    console.log(data);
    if(phone2 == null || phone2 == ""){
		swal("진욱이네", "휴대폰으로 발송된 인증번호를 입력해주세요.");
    } else{     
       if(phone2 == data){
		swal("진욱이네", "인증 완료");
           $("#findId").hide();
   		   $("#poem").show().html();
        }
        else {
           alert("실패");
        }    
    }
        
 });
 });
	
	
	
	
	
	
	//아이디 찾기 이메일 인증		
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
		swal("진욱이네", "이메일 형식이 아닙니다.");
				return;
			}
			
			$.ajax({
				url: "/user/findIdEmail",
				type: "POST",
				data: {email: email,
						userName : userName}
	
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
	
	// 버튼 클릭 이벤트 - 이메일 인증 버튼	
	function emailAuth(){
		$("#fPhone").hide();
		$("#fEmail").show();
		$("#authNo").hide();
		$("#emailBt").css({
			'border-bottom': '3px solid #7fad39',
			'color' : '#7fad39'
		});
		
		$("#phoneBt").css({
			'border-bottom': '3px solid #E6E6E6',
			'color' : 'gray'
		});
	}

	// 버튼 클릭 이벤트 - 휴대폰 번호 인증 버튼	
	function phoneAuth(){
		$("#fEmail").hide();
		$("#fPhone").show();
		$("#phoneBt").css({
			'border-bottom': '3px solid #7fad39',
			'color' : '#7fad39'
		});
		
		$("#emailBt").css({
			'border-bottom': '3px solid #E6E6E6',
			'color' : 'gray'	
		});
		
	}
	
	function authNo(){
		$("#snedA").hide();
		$("#authNo").show();
		
	}
	
	
	</script>		
	
</head>

<body>
<jsp:include page="../layout/top.jsp" />
	
	<form class="find_id_page text-center" id="findId">
		<div class="find_info">
			<h1 class="">아이디 찾기</h1>
			<br><br>
		</div>
		<div class="auth" style="display:flex; justify-content: center;">
			<button  type="button" class="phone site-btn" id="phoneBt" onclick="phoneAuth()" style="width:150px; border-bottom: 3px solid #7fad39; background-color:white; color:#7fad39;">휴대폰 인증</button>
			<button  type="button" class="email site-btn" id="emailBt" onclick="emailAuth()" style="width:150px; border-bottom: 3px solid #E6E6E6; background-color:white; color:gray; ">이메일 인증</button>
		</div>
			<br><br>
		<form class = "container text-center" >
		<div class="text-center " style="margin-right:270px; ">
		
		<label for="userName " style="font-size:15px; " >이름</label>	
		</div>
			<div class="aaa " style="font-size:15px;">
			<input type="text" name="userName" class="userName" placeholder="이름을 입력해주세요.">
			</div>
			<br>
			
	<div class="text-center" id="fEmail" style="display:none;" >
		<div class="text-center " style="margin-right:260px;">
		<label for="email " style="font-size:15px;" >이메일</label>	
		</div>
			<div class="adad" style="font-size:15px;">
			<input type="email" id="email" class="email" placeholder="이메일을 입력해주세요.">
			</div>
			<br>
			<button class="send_btn site-btn" id="snedE" style="width:300px;">전송</button>
	</div>
	
	<div class="text-center" id="fPhone" >
		<div class="text-center " style="margin-right:230px;">
		
		<label for="phone " style="font-size:15px;" >휴대폰 번호</label>	
		</div>
			<div class="adad" style="font-size:15px;">
			<input type="text" id="phone" class="phone" placeholder="휴대폰 번호를 입력해주세요.">
			</div>
			<br>
			<button class="send_btn site-btn" type="button" id="snedA" style="width:300px;" onclick="authNo()">인증번호 받기</button>
	</div>		
	<div class="text-center" id="authNo" style="display:none;">
		<div class="text-center " style="margin-right:240px;">
		
		<label for="authNo" style="font-size:15px;" >인증 번호</label>	
		</div>
			<div class="adad" style="font-size:15px;">
			<input type="hidden" id="phoneDoubleChk"/>
			<input type="text" id="authNo1" class="authNo" placeholder="인증 번호를 입력해주세요.">
			</div>
			<br>
			<button class="send_btn site-btn" type="button" id="sned" style="width:300px;" >확인</button>
	</div>		
	</form>	
		</form>	
			<br><br>
			
			
		<form class="text-center" id="poem" style="display:none;">
			<br>
			<h3>고객님의 진욱이네 계정을 찾았습니다.</h3>
			<h4>아이디 확인 후 로그인해주세요.</h4>
			<br>
			<h4><a class="fa fa-user">	: ${userId}</a></h4>
			<br>
			<h4><a class="fa fa-calendar-o" aria-hidden="true"> 가입 날짜 : ${regDate}</a></h4>
			<br><br><br>
			<button type="button" onclick="location.href='/user/login' " class="button1 site-btn" style="width:300px;" >로 &nbsp;그 &nbsp;인</button>
			<br>
			<br>
			<button type="button" onclick="location.href='/user/findPassword' " class="button2 site-btn" style="width:300px; background-color:gray;" >비밀번호 찾기</button>
			<input type="hidden" id="userId"/>
			<input type="hidden" id="regDate"/>
			<br><br><br>
			
		</form>
 	<!--  화면구성 div end /////////////////////////////////////-->
<jsp:include page="../layout/footer.jsp" />
</body>

</html>