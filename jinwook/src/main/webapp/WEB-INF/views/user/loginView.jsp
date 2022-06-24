<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


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
<title>로그인</title>

<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 -->
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	 <style>
	 
    	 .row{ 
    	 	display:flex;
            justify-content: center;
            align-items: center;
           
        }
         .form-group{
       		 justify-content: center;
           	 align-items: center;
        } 
        input{
          width:100px;
		  height:50px;
		  font-size:15px;
		  text-indent: 1em;
        }
         #alal{
        justify-content: center;
        align-items: center;
        font-size:15px;
        color:black;
        text-indent:-1em;
        } 
        .zz{
        justify-content: center;
        font-size:"30px";
        }
        .userId{
       		 justify-content: center;
           	 align-items: center;
           	  width : 350px;
        }
        .password{
       		 justify-content: center;
           	 align-items: center;
           	  width : 350px;
        }
        .button1{
			  background-color: #7fad39; 
			  border: none;
			  color: white;
			  width : 350px;
			  }
        .button2{
			  background-color: white; 
			  width : 350px;
			  border: 1px solid #7fad39;
			  color: #7fad39;
			  }
		.swal-button 
				{
					background-color: #7fad39;
					font-size: 12px;
					text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
				}
    </style> 
    <!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	<!-- 카카오 로그인 -->
	 $(document).ready(function(){
	        Kakao.init('7a50e1995f458ef51a98c92f52419d00');
	        Kakao.isInitialized();
	    });

	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: 'http://localhost:8082/user/kakaoLogin' 
	        }); // 등록한 리다이렉트uri 입력
	    }	
	
		//============= "로그인"  Event 연결 =============
		$( function() {
			
	
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(".button1").on("click" , function() {
				var id=$(".userId").val();
				var pw=$(".password").val();
				
				if(id == null || id.length <1) {
					swal("진욱이네", "ID를 입력해주세요.");
					$(".userId").focus();
					return;
				}
				
				if(id.length < 6 || id.length > 25) {
					swal("진욱이네", "아이디는 6~25자 이내로 입력해주세요.");
					$(".userId").focus();
					return;
				}
				
				for(var i = 0; i < id.length; i++){
					
					var ch = id.charAt(i);
					if(!(ch >= 'a' &&  ch <= 'z') && !(ch >= '0' && ch <= '9')){
					swal("진욱이네", "아이디는 영문 소문자로 입력해주세요.");
					$(".userId").focus();
					$(".userId").select();
					return;
					}
					
				}
				
				var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사        
				if (!password1RegExp.test(pw)) {
					swal("진욱이네", "비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해주세요.");            
					pw = "";            
					$(".password").focus();  
					return;        
					}
				
				
				if(pw == null || pw.length <4) {
					swal("진욱이네", "비밀번호를 8자 이상으로 입력해주세요.");
					$(".password").focus();
					return;
				}
				
				
				/* var messege = "${msg}";
				var url = "${url}"
				alert(messege);
				document.location.href= url;
				 */
				 
 			 
				$(".form-horizontal").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				 
				 // 로그인할 때 검증 메세지
				 const msg = "${msg}";
					 
				 /* swal("진욱이네",msg); */
				 alert(msg);
					 
					 
				 
			});
		});	
			
				// 테스트 중
				
					
				/*  $("#userId").on("propertychange change keyup paste input" , function() {
				
					 $(".button1").css({
							'background-color': 'white',
						});
					 
					 
				 }); */
				 
					/* //============아이디, 비밀번호 확인 ==============
					$.ajax({
						url : "/user/checkLogin",
						type : "post",
						dataType : "json",
						data : {"userId" : $("#userId").val(),
								"password" : $("#password").val()},
						success : function(data){
							alert(data.password);
							if(data.userId == null){
								$("input[name='userId']").focus();
								swal("진욱이네", "아이디를 확인해주세요.");
								return;
							}else if($("#password").val() != data.password){
								$("#password").focus();
								swal("진욱이네", "비밀번호를 확인해주세요.");
								return;
							}else if( data.userByeStatus == true){
								swal("진욱이네", "탈퇴한 계정입니다.");
								return;								
							}
						}
					}); */
					

		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(".button2").on("click" , function() {
				/* self.location = "/user/addUser" */
				$("form").attr("method" , "GET").attr("action" , "/user/addUserSelec").submit();
			});
		});
		
		
	</script>		
	
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
 	<jsp:include page="../layout/top.jsp" />
    	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
		<!--  row Start /////////////////////////////////////-->
		<div class="container">
		
		<div class="row">
		
	   	 	
	 	 	<div class="col-md-6" >
	 	 	
		 	 	<br/><br/>
				
				<div class="form-group">	 	 	
		 	 		<h1 class="zz text-center" >로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>
					<br/><br/>
					
			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-2 control-label"></label>
					    <div class="col-sm-3" style="font-size:15px;">
					      <input type=   "text" class="userId" name="userId" id="userId" placeholder="아이디를 입력해주세요." required="required" oninput="this.value=this.value.replace(' ','');"/>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-2 control-label"></label>
					    <div class="col-sm-6" style="font-size:15px;">
					      <input type="password" class="password" name="password" id="password" placeholder="패스워드를 입력해주세요."  oninput="this.value=this.value.replace(' ','');" >
					    </div>
					  </div>
					  	<br/><br/>
					  <div class="form-group text-center" >
					    <a class="find_id" id="alal" href="findId" style="color:black; " > &nbsp;아이디 찾기</a><a> | </a><a class="find_password" id="alal"href="findPassword" style="color:black;">비밀번호 찾기</a>
					  </div>
					  <div class="form-group" style="text-align: center">
					    <div class="col-sm-offset-2 col-sm-5 text-center">
					      <button type="button" class="button1 site-btn" >로 &nbsp;그 &nbsp;인</button>
					    </div>
					    </div>

					  <div class="form-group" style="text-align: center">
					    <div class="col-sm-offset-2 col-sm-5 text-center">
				      <button type="button" class="button2 site-btn"  >회 &nbsp;원 &nbsp;가 &nbsp;입</button>
 					     <!--  <a class="button2 site-btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a> -->
					    </div>
					  </div>
					  <br>
					  <hr>
					  <br>
					  <div id="kakao_login" style="text-align: center" data-toggle="modal" data-target="#staticBackdrop">
					  <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=7a50e1995f458ef51a98c92f52419d00&redirect_uri=	
						http://127.0.0.1:8082/user/kakaoLogin&response_type=code" >
                     <img width="50" height="50" 
                        src="${path}/resources/static/kakao-icon.svg" /></a>
       				 </div>	<br>
					<%--   <div id="naver_login" style="text-align: center">
                     <a href="#">
                     <img width="350" height="50" src="${path}/resources/static/naverlogin.png" /></a>
       				 </div>	<br>
					  <div id="google_login" style="text-align: center">
                     <a href="#">
                     <img width="350" height="50" src="${path}/resources/static/googlelogin.png" /></a>
       				 </div>	 --%>
						 <!--  <div class="form-group row">
							<div class="or-seperator"><b>or</b></div>
						</div> -->
					</form>
			
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	</div>
  	 	<br/><br/>	<br/><br/>	<br/><br/>	<br/><br/>	<br/><br/>	<br/><br/>
 	<!--  화면구성 div end /////////////////////////////////////-->
 <jsp:include page="../layout/footer.jsp" />
 </body>

</html>