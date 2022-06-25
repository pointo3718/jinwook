<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

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
	<title>회원가입</title>
	
	<!-- Google Font -->
	<link
	   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	   rel="stylesheet">
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
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       /*  body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */
        
        *{font-family: 'Noto Sans KR', sans-serif;}
        
         .row{ 
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .id_ok {color:#7fad39;
        		display: none;
        		font-size:10px;
        		text-align:left;
            justify-content: left;
        }
		.id_already{color:red;
					 display: none;
					 font-size:10px;
					 text-align: left;
		 }
		.control-label{
			whidth:250px;
			text-align: center;
			 justify-content: center;
		}
        /* .site-btn{
			 background-color: #7fad39; 
			 border: none;
			 color: white;
	       	 width : 200px;
	       	 text-align: center;
	       	 font-size:20px;
		}  */
		.userId{
          width:300px;
		  text-indent: 1em;
		  
        }
        
        .ss{
        	font-size: 30px;
        	 justify-content: center;
        }
         
        input{
        	width:300px;
        	height:50px;
        	text-indent: 1em;
        	font-size:15px;
        	
        }
		div{
		justify-content: center;
		 text-align: center;
		  align-items: center;
		}
		label{
			font-size: 15px;
			justify-content: top;
			text-align: left;
			display:flex;
			 align-items: left;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".bts" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				//$("form")[0].reset();
				self.location="index";
			});
		});	
	
		//============아이디 중복 확인 ==============
		function checkId(){
			$.ajax({
				url : "/user/checkId",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					 if(data != 1){
					 /* $("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다."); */
						$('.id_ok').css("display","inline-block"); 
		                $('.id_already').css("display", "none");
						
					}else {
						/* alert("중복된 아이디입니다."); */
						$('.id_already').css("display","inline-block");
	                    $('.id_ok').css("display", "none");
					}
				},
				 error:function(){
		                alert("에러입니다");
		            }
			});
			
		}
		
		$("#userId").change(function(){
			
		
				idChk = false;
		});
		//============닉네임 중복 확인 ==============
			function checkNickName(){
			$.ajax({
				url : "/user/checkNickName",
				type : "post",
				dataType : "json",
				data : {"nickName" : $("#nickName").val()},
				success : function(data){
					if($("#nickName").val().length <1){
						alert("닉네임을 입력해주세요.")
					}else if(data == 1){
						alert("중복된 닉네임입니다.");
					}else if(data == 0){
						$("#nickNameChk").attr("value", "Y");
						alert("사용가능한 닉네임입니다.");
					}
				}
			});
			
		}
			
			
		//==>"이메일" 유효성Check  Event 처리 및 연결
		function checkEmail(){
			$.ajax({
				url : "/user/checkEmail",
				type : "post",
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data){
					if($("#email").val() != "" && ($("#email").val().indexOf('@') < 1 || $("#email").val().indexOf('.') == -1) ){
						alert("이메일 형식이 아닙니다.");
					}
					else if($("#email").val().length <1){
						alert("이메일을 입력해주세요.")
					}else if(data == 1){
						alert("중복된 이메일입니다.");
					}else if(data == 0){
						$("#emailChk").attr("value", "Y");
						alert("사용가능한 이메일입니다.");
					}
				}
			});
			
		}
		
		//============ 추천인 아이디 중복 확인 ==============
		function checkRpId(){
			$.ajax({
				url : "/user/checkId",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#rpId").val()},
				success : function(data){
					if($("#rpId").val() == null || $("#rpId").val().length <1){
						swal("진욱이네", "추천인 아이디는  반드시 입력하셔야 합니다.");
						$("#rpId").focus();
						return;
					}
					
					for(var i = 0; i < rpId.length; i++){
						
						var ch = rpId.charAt(i);
						if(!(ch >= 'a' &&  ch <= 'z') || !(ch >= '0' && ch <= '9')){
						swal("진욱이네", "추천인 아이디는 영문 소문자로 입력해주세요.");
						$(".rpId").focus();
						$(".rpId").select();
						return;
						}
						
					}
					
					 if(data != 1){
					 /* $("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다."); */
						$('.id_ok').css("display","inline-block"); 
		                $('.id_already').css("display", "none");
						
					}else {
						/* alert("중복된 아이디입니다."); */
						$('.id_already').css("display","inline-block");
	                    $('.id_ok').css("display", "none");
					}
				},
				 error:function(){
		                alert("에러입니다");
		            }
			});
			
		}
		
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var nickName=$("input[name='nickName']").val();
			var phone=$("input[name='phone']").val();
			var email=$("input[name='email']").val();
			var rpId=$("input[name='rpId']").val();
			
			
			var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 이메일 유효성 검사
			var regexName = /^[가-힣]*$/; // 이름 한글만
			var regexPhone = /^[0-9+]{6,12}$/; // 휴대폰 번호 숫자만
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(!regexName.test(name)){
				swal("[진욱이네]", "한글만 입력해주세요.");
				return;
			}
			
			if(nickName == null || nickName.length <1){
				swal("진욱이네", "닉네임은  반드시 입력하셔야 합니다.");
				nickName.focus();
				return;
			}
			
			if(email == null || email.length <1){
				swal("진욱이네", "이메일은  반드시 입력하셔야 합니다.");
				email.focus();
				return;
			}
			
			if (!regexEmail.test(email)) {
	            swal("진욱이네", "잘못된 이메일 형식입니다.");
	            email = "";
	            email.focus();
	            return;
	        }
			
			for (var i = 0; i < email.length; i++) {
	           var ch = email.charAt(i)
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && ch == '@' && ch == '.') {
	                swal("진욱이네", "이메일은 영문 대소문자, 숫자만 입력가능합니다.");
	                email.focus();
	                email.select();
	                return;
	            }
	        }
			
			for(var i = 0; i < rpId.length; i++){
				
				var ch = rpId.charAt(i);
				if(!(ch >= 'a' &&  ch <= 'z') || !(ch >= '0' && ch <= '9')){
				swal("진욱이네", "아이디는 영문 소문자로 입력해주세요.");
				$(".rpId").focus();
				$(".rpId").select();
				return;
				}
				
			}
			
			if (password == id) {
	            swal("진욱이네", "아이디와 비밀번호가 같습니다.")
	            password.focus();
	            return;
	        }
			
			if( pw != pw_confirm ) {				
				swal("진욱이네", "비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			if(!regexPhone.test(phone)){
				swal("[진욱이네]", "휴대폰 번호는 숫자만 입력해주세요.");
				return;
			}	
				
			/* var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value ); */
			
			$(".form-horizontal").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		
		
		
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> 주민번호 유효성 check 는 이해정도로....
		/* function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// 유효한 주민번호 형식인 경우만 나이 계산 진행, PortalJuminCheck 함수는 CommonScript.js 의 공통 주민번호 체크 함수임 
			if(!PortalJuminCheck(ssn)) {
				alert("잘못된 주민번호입니다.");
				return false;
			}
		} */
	
		/* function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "234567892345";
			for (var i=0; i<12; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		} */
		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		 
		//==>"ID중복확인" Event 처리 및 연결
		/*  $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button.btn.btn-info").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	 */
////////////////////////////사용자 사장님 구분에 따른 폼////////////////////////////


	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/top.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="row">
		
	   	 	
	 	 	<div class="col-md-7" >
	 	 	
		 	 	<br/><br/>
				
				<div class="form-group">	 
		<h1 class="ss text-center">회 원 가 입</h1>
		<br><br>
	<!--  	//////////form Start ///////////////////////////////////// -->
		<form class="form-horizontal" style="font-size:15px;">
	<!-- 사용자  -->
	<c:if test="${role=='사용자' }">

		  <div class="form-group">
		<hr><br>
		    <label for="userId" class=" col-sm-3 control-label" >아 이 디</label>
		    <div class="col-sm-6" >
		      <input type="text" maxlength='50' class="userId" id="userId" name="userId" placeholder="중복확인하세요" autocomplete="username" required onkeyup="this.value=this.value.replace(' ','');" oninput = "checkId()" >
					<span class="id_ok" >사용 가능한 아이디입니다.</span>
					<span class="id_already">사용 중인 아이디입니다.</span>
				<!-- <button class="idChk" type="button" id="idChk" onclick="checkId()" style="width:100px; height:50px;" value="N"  >중복확인</button> -->
		    </div>
		    <div class="">
		      <button class="idChk site-btn" type="button" id="idChk " onclick="checkId()" value="N" style="margin-right:50px; margin-top:1px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class=" col-sm-3 control-label"><a>비밀번호</a></label>
		    <div class="col-sm-6" >
		      <input type="password" maxlength='50' class="password" id="password" name="password" placeholder="비밀번호" oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-0 col-sm-3 control-label"><a>비밀번호 확인</a></label>
		    <div class="col-sm-6">
		      <input type="password" maxlength='50' class="password2" id="password2" name="password2" placeholder="비밀번호 확인" oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-0 col-sm-3 control-label"><a>이름</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='10' class="userName" id="userName" name="userName" placeholder="회원이름" oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-0 col-sm-3 control-label"><a>생년월일</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='8' class="birth" id="birth" name="birth" placeholder="생년월일" >
		      <input type="hidden" maxlength='8' class="role" id="role" name="role" value=${role } placeholder="role" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-0 col-sm-3 control-label"><a>닉네임</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='20' class="nickName" id="nickName" name="nickName" placeholder="닉네임" style=" display:inline-block" oninput="this.value=this.value.replace(' ','');">
		    </div>  
		    <div class="">
		      <button class="nickNameChk site-btn" type="button" id="nickNameChk " onclick="checkNickName()" value="N" style="margin-right:50px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button>
		    </div>
		  </div>
		  
		  <div class="form-group" style="display:flex;">
		    <label for="phone" class="col-sm-offset-0 col-sm-3 control-label"><a>휴대폰번호</a></label>
		     <div class="col-sm-6">
		      <input type="text" class="phone" id="phone" name="phone" placeholder="휴대폰번호" style=" display:inline-block" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		    </div>
		    <div class="">
		      <button class="phoneChk site-btn" type="button" id="phoneChk " onclick="checkPhone()" value="N" style="margin-right:50px; height:48px; width:113.52px; padding-left:10px; padding-right:10px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">인증번호 받기</button>
		    </div>
		  </div>
		  <div class="form-group" style="display:flex;">
		  <div class="adad col-sm-6" style="font-size:15px;">
			<input type="hidden" id="phoneDoubleChk"/>
			<input type="text" id="authNo1" class="authNo" placeholder="인증 번호를 입력해주세요." oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			<div>
			<button class="send_btn site-btn" type="button" id="sned" style="width:113.52; margin-right:50px; height:48px; width:113.52px; padding-left:10px; padding-right:10px; color: #7fad39; background-color:white; border: 1px solid #7fad39;" >인증번호 확인</button>
			</div>
			</div>
			<br>
		  <!-- <div class="form-group">
		    <label for="gender" class=" col-sm-3 control-label">성별</label>
		    <div class="col-sm-2" style="display:flex; justify-center;">
		    	<input type="radio" 	name="gender" value="남"/> 남        
		    	<input type="radio" 	name="gender" value="여" /> 여
		  </div>
		  </div> -->
		  
		  <div class="form-group" >
             <label for="gender" 
                class="col-sm-offset-0 col-sm-3 control-label"><a>성별</a></label>
                
             <div class="col-sm-2" style="display:flex; margin-top:5px;">
                <input type="radio" name="남"
                   class="form-control form-control" id="gender"
                   value="남" style="font-size:10px;">
             	<label for="" class="col-sm-1" style="margin-right:40px;">남</label>
             </div>
             
             <div class="col-sm-2" style="display:flex; text-align:center; margin-top:5px;">
                <input type="radio" name="여"
                   class="form-control form-control" id="gender"
                   value="여" style="font-size:10px;">
             	<label for="" class="col-sm-1" style="margin-right:40px;">여</label>
             </div>
             
             <div class="col-sm-2" style="display:flex; margin-top:5px;">
                <input type="radio" name="없음"
                   class="form-control form-control" id="gender"
                   value="없음" style="font-size:10px;">
             	<label for="" class="col-sm-1" style="margin-right:40px;">X</label>
             </div>
             
          </div>
		  <!-- <div class="custom-control custom-radio" >
						<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">남</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">여</label>
					</div> -->
		  
		   <div class="form-group">
		    <label for="email" class=" col-sm-3 control-label">이메일</label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='50' class="email" id="email" name="email" placeholder="이메일" oninput="this.value=this.value.replace(' ','');">
		    </div>
		    <div>
		      <button class="emailChk site-btn" type="button" id="emailChk" onclick="checkEmail()" value="N" style="margin-right:50px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button> 
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="rpId" class=" col-sm-3 control-label">추천인 아이디</label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='50' class="rpId" id="rpId" name="rpId" placeholder="추천인 아이디를 입력하세요." oninput="this.value=this.value.replace(' ','');">
		    </div>
		    <div>
		      <button class="rpIdChk site-btn" type="button" id="rpIdChk" onclick="checkRpId()" value="N" style="margin-right:50px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button> 
		    </div>
		  </div>
		 </c:if>
		 <!-- 사용자 폼 끝 -->
		  
		  
	 <!-- 사장님 폼  -->
		<c:if test="${role=='사장님' }">
		  <div class="form-group">
		<hr><br>
		    <label for="userId" class=" col-sm-3 control-label" >아 이 디</label>
		    <div class="col-sm-6" >
		      <input type="text" maxlength='50' class="userId" id="userId" name="userId" placeholder="중복확인하세요" autocomplete="username" required oninput = "checkId()" oninput="this.value=this.value.replace(' ','');" >
					<span class="id_ok" >사용 가능한 아이디입니다.</span>
					<span class="id_already">사용 중인 아이디입니다.</span>
				<!-- <button class="idChk" type="button" id="idChk" onclick="checkId()" style="width:100px; height:50px;" value="N"  >중복확인</button> -->
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class=" col-sm-3 control-label"><a>비밀번호</a></label>
		    <div class="col-sm-6" >
		      <input type="password" maxlength='50' class="password" id="password" name="password" placeholder="비밀번호" oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-0 col-sm-3 control-label"><a>비밀번호 확인</a></label>
		    <div class="col-sm-6">
		      <input type="password" maxlength='50' class="password2" id="password2" name="password2" placeholder="비밀번호 확인" oninput="this.value=this.value.replace(' ','');" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-0 col-sm-3 control-label"><a>이름</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='10' class="userName" id="userName" name="userName" placeholder="회원이름" oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-0 col-sm-3 control-label"><a>생년월일</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='8' class="birth" id="birth" name="birth" placeholder="생년월일" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-0 col-sm-3 control-label"><a>휴대전화번호</a></label>
		     <div class="col-sm-6">
		      <input type="text" class="phone" id="phone" name="phone" placeholder="번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="gender" class=" col-sm-3 control-label">성별</label>
		    <div class="col-sm-2" style="display:flex; justify-center;">
		    	<input type="radio" 	name="gender" value="남"/> 남        
		    	<input type="radio" 	name="gender" value="여" /> 여
		  </div>
		  </div>
		  
		  <!-- <div class="custom-control custom-radio" >
						<input type="radio" name="jb-radio" id="jb-radio-1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">남</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="jb-radio" id="jb-radio-2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">여</label>
					</div> -->
		  
		   <div class="form-group" style="display:flex;">
		    <label for="email" class=" col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4" >
		      <input type="text" maxlength='50' class="email" id="email" name="email" placeholder="이메일" oninput="this.value=this.value.replace(' ','');">
		      <button class="emailChk" type="button" id="emailChk" onclick="checkEmail()" value="N" >중복확인</button> 
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="businessNo" class=" col-sm-3 control-label">사업자등록번호</label>
		    <div class="col-sm-4">
		      <input type="text" maxlength='50' class="businessNo" id="businessNo" name="businessNo" placeholder="사업자등록번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		      <button class="emailChk" type="button" id="emailChk" onclick="checkEmail()" value="N">중복확인</button> 
		    </div>
		  </div>
		  
		  </c:if>
		  <!-- 사장님 폼 끝 -->
		  <div class="form-group">
		    <div class="col-sm-offset-3  col-sm-6 text-center">
		      <button type="button" class="bts site-btn"  style="width:200px; font-size:20px;">가입하기</button>
			<!--   <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a> -->
		<br><br><br><br><br><br>
		    </div>
		  </div>
		</form>
		</div>
	</div>
</div>
</div> 
	<!--  화면구성 div end /////////////////////////////////////-->
	<jsp:include page="../layout/footer.jsp" />
</body>

</html>