<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>
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
}
 

    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//비밀번호 찾기 문자 인증 
	$(document).ready(function() {
	$("#snedA").click(function(){
		swal("진욱이네", "인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#phone").val();
	var userId = $(".userId").val();
	$.ajax({
        type:"GET",
        url:"findPasswordPhoneSend?phone=" + phone+"&userId="+userId,
        cache : false,
        success:function(data){
        	/* alert("asdas"+data) */
        	if(data == "error"){
				swal("진욱이네", "휴대폰 번호가 올바르지 않습니다.");
        		
				/* $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneChk").css("color","red");
				$("#phone").attr("autofocus",true); */
        	}else{	        		
        		/* $("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneChk").css("color","green");
        		$("#phone").attr("readonly",true);
        		code2 = data; */
        		$("#phoneDoubleChk").val(data); 
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
		swal({
			   title: '진욱이네',
			   text: '인증 완료',
			   
			}).then(function(){
			
		self.location = "updatePassword";
		})
        }
        else {
           alert("실패");
        }
    }
    
        
 });
 });
	
	
	
	
	
	
	//비밀번호 찾기 이메일 인증		
	$(document).ready(function() {
		$("#snedE").click(function() {
			const email = $("#email").val();
			const userId = $(".userId").val();
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
				url: "/user/findPasswordEmail",
				type: "POST",
				data: {email: email,
						userId : userId}
	
			})
			.then(function() {
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
	
	// 버튼 클릭 이벤트 - 이메일 인증 버튼	
	function emailAuth(){
		$("#fPhone").hide();
		$("#fEmail").show();
		$("#authNo").hide();
	}

	// 버튼 클릭 이벤트 - 휴대폰 번호 인증 버튼	
	function phoneAuth(){
		$("#fEmail").hide();
		$("#fPhone").show();
		
	}
	
	function authNo(){
		$("#snedA").hide();
		$("#authNo").show();
		
	}
	
	
	</script>		
	
</head>
<body>

<jsp:include page="../layout/top.jsp" />
	
	<form class="find_password_page text-center" id="findPassword">
		<div class="find_info">
			<h1 class="">비밀번호 찾기</h1>
			<br><br>
		</div>
		<div class="auth">
			<button  type="button" class="phone site-btn" onclick="phoneAuth()"  style="width:145px; border-bottom: 3px solid #7fad39; background-color:gray;">휴대폰 인증</button>
			<button  type="button" class="email site-btn" onclick="emailAuth()" style="width:145px;">이메일 인증</button>
		</div>
			<br><br>
		<form class = "container text-center">
		<div class="text-center " style="margin-right:270px;">
		
		<label for="userId " style="font-size:15px;" >아이디</label>	
		</div>
			<div class="aaa " style="font-size:15px;">
			<input type="text" name="userId" class="userId" placeholder="이름을 입력해주세요.">
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
			
 	<!--  화면구성 div end /////////////////////////////////////-->
<jsp:include page="../layout/footer.jsp" />




	<!-- <form class="form-horizontal">
		<label for="phone">휴대폰 번호</label>
		<p>
			<input type="text" name="userId" class="userId"><br>
			<input id="phone" type="text" name="phone" title="전화번호 입력" required/>
			<span id="phoneChk" class="doubleChk">인증번호 보내기</span><br/>
			<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
			<span id="phoneChk2" class="doubleChk">본인인증</span>
			<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
			<input type="hidden" id="phoneDoubleChk"/>
		</p>
		<p class="tip">
			최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)
		</p>
</form> -->
</body>


</html>