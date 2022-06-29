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
        #id {color:#7fad39;
        		display: none;
        		font-size:12px;
        		text-align:left;
            justify-content: left;
        }
        #pw {color:#7fad39;
        		display: none;
        		font-size:12px;
        		text-align:left;
            justify-content: left;
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
		  text-indent: 1em;
		  
        }
        
        .ss{
        	font-size: 30px;
        	 justify-content: center;
        }
         
        input{
        	width:332px;
        	height:44px;
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
		
		#gender{
			outline:none;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#addUser" ).on("click" , function() {
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
		
		function idCheck1(){
			$('.id_ok').css("display","inline-block");
			$('.id_already').css("display", "inline-block");
			$('.id_already').css("color", "black");
			$('.id_ok').css("color","black");
		}
		
		function idCheck(){
			var idJ = /^[a-z0-9]{8,30}$/;
			var userId=$("input[name='userId']").val();
			
			if(idJ.test(userId)){
				$('.id_ok').css("display","inline-block");
				$('.id_already').css("display", "inline-block");
				$('.id_already').css("color", "red");
				$('.id_ok').css("color","#7fad39");
			}else{
				$('.id_ok').css("color","red");
				$('.id_already').css("color", "red");
			}
		}
		
		function pwCheck1(){
			$('.pw_ok').css("display","inline-block");
			$('.pw_already').css("display", "inline-block");
			$('.pw_already').css("color", "black");
			$('.pw_ok').css("color","black");
		}
		
		function pwCheck(){
			var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
			var pw=$("input[name='password']").val();
			
			if(pwJ.test(pw)){
				$('.pw_ok').css("display","inline-block");
				$('.pw_already').css("display", "inline-block");
				$('.pw_already').css("color", "red");
				$('.pw_ok').css("color","#7fad39");
			}else{
				$('.pw_ok').css("color","red");
				$('.pw_already').css("color", "red");
			}
		}
		
		function pw1Check1(){
			$('.pw2_ok').css("display","inline-block");
			$('.pw2_ok').css("color","black");
		}
		
		function pw1Check(){
			var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			
			if(pw == pw_confirm){
				$('.pw2_ok').css("display","inline-block");
				$('.pw2_ok').css("color","#7fad39");
			}else{
				$('.pw2_ok').css("color","red");
			}
		}
		
		
		//============아이디 중복 확인 ==============
		function checkId(){
			var id=$("input[name='userId']").val();
			
			$.ajax({
				url : "/user/checkId",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(id.length < 1 || id == ""){
						alert("아이디를 입력해주세요.");
					}else if(data == 0){
					/*  $("#idChk").attr("value", "Y"); */
						alert("사용가능한 아이디입니다."); 
						$('.id_already').css("color", "#7fad39");
					/* 	$('.id_ok').css("display","inline-block"); 
		                $('.id_already').css("display", "none"); */
						
					}else {
						alert("중복된 아이디입니다."); 
						/* $('.id_already').css("display","inline-block");
	                    $('.id_ok').css("display", "none"); */
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
						swal("진욱이네", "추천인 아이디를 입력해주세요..");
						$("#rpId").focus();
						return;
					}else if(!regexId.test(rpId)){
						swal("진욱이네", "추천인 아이디를 다시 확인해주세요.");
					}else if(data != 1){
						alert("사용가능한 아이디입니다.");
						
					}else {
						alert("중복된 아이디입니다.");
					}
				},
				 error:function(){
		                alert("에러입니다");
		            }
			});
			
		}
		
		//휴대폰 인증 
		function checkPhone() {
			
				var phone = $("#phone").val();
				$.ajax({
			        type:"GET",
			        url:"authNoSend?phone=" + phone,
			        cache : false,
			        success:function(data){
			        	alert("인증번호 : "+data.authNumber);
			        	if(data.authNumber == 0){
							swal("진욱이네", "이미 등록된 휴대폰 번호 입니다.");
			        		
			        	}else{	        		
							swal("진욱이네", "인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
							$("#pch").show();		
							$("#phoneDoubleChk").val(data.authNumber); 
			        	}
			        }
			    });
		}
		
		 $(function() {
				$( "#sned" ).on("click" , function() {
					const phone2 = $("#authNo1").val();
					const data = $("#phoneDoubleChk").val();
				    console.log(data);
				    if(phone2 == null || phone2 == ""){
						swal("진욱이네", "휴대폰으로 발송된 인증번호를 입력해주세요.");
				    } else{     
				       if(phone2 == data){
						swal("진욱이네", "인증 완료");
				        }
				        else {
				           alert("실패");
				        }    
				    }					
					
				});
			});	
		//휴대폰 인증 끝
		
		
		function fncAddUser() {
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var nickName=$("input[name='nickName']").val();
			var phone=$("input[name='phone']").val();
			var email=$("input[name='email']").val();
			var rpId=$("input[name='rpId']").val();
			var businessNo=$("input[name='businessNo']").val();
			
			var	regexId = /^[a-zA-Z0-9]{8,20}$/;
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
		
			if("${role}" != "사장님"){
				
				if(nickName == null || nickName.length <1){
					swal("진욱이네", "닉네임은  반드시 입력하셔야 합니다.");
					nickName.focus();
					return;
				}
			}
			
			if(email == null || email.length <1){
				swal("진욱이네", "이메일은  반드시 입력하셔야 합니다.");
				email.focus();
				return;
			}
			
			if("${role}" != "사용자"){
				if(businessNo == null || businessNo.length <1){
					swal("진욱이네", "사업자등록번호는 반드시 입력하셔야 합니다.");
					return;
				}
			}
			
			if (!regexEmail.test(email)) {
	            swal("진욱이네", "잘못된 이메일 형식입니다.");
	            email = "";
	            email.focus();
	            return;
	        }
			
			for (var i = 0; i < email.length; i++) {
	           var ch = email.charAt(i);
	            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && ch == '@' && ch == '.') {
	                swal("진욱이네", "이메일은 영문 대소문자, 숫자만 입력가능합니다.");
	                email.focus();
	                email.select();
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
			
			if ($("input[name=gender]:radio:checked").length < 1) {
	            alert("성별을 반드시 선택해주세요");
	            return;
	          }
			
			 var value = "";   
			   if( $("input[name='birth_year']").val() != ""  &&  $("input[name='birth_month']").val() != "" &&  $("input[name='birth_day']").val() != ""){
			      var value = $("input[name='birth_year']").val()  
			                     + $("input[name='birth_month']").val() 
			                     + $("input[name='birth_day']").val();
			   }
			   
			   $("input:hidden[name='birth']").val( value );
			
			/* var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value ); */
			
			$(".form-horizontal").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

	      ///////////// 사업자 등록번호 진위여부 시작 ////////////
	      $(function() {
	         $("#bNo")
	               .on(
	                     "click",
	                  function() {
	                  var   bNo = $("input:text[name='bNo']").val()
	                  //document.detailForm.bNo.value;
	                  //var bNo = "1021652315" // 성공
	                  var   data = {
	                        "b_no" : [ bNo ]
	                     // 배열 
	                     };

	                     $.ajax({
	                        url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=CpyfKTgQgOMvT2Qd7SEtoIGdHU9kDSNvpw1Tb1reppPnvCjdAwmQJHB1dD4AfmlMyUc5FfDjJOztKQq0Q6n0mA%3D%3D", // serviceKey 값을 xxxxxx에 입력
	                        type : "POST",
	                        data : JSON.stringify(data), // json 을 string으로 변환하여 전송
	                        dataType : "JSON",
	                        contentType : "application/json",
	                        accept : "application/json",
	                        success : function(result) {
	                           console.log(result);
	                           console.log(result.match_cnt);
	                           if(result.match_cnt==1){
	                           $('#checkBno').modal('hide');
	                           
	                           $('input[name=businessNo]').attr('value',bNo);
	                           swal("진욱이네", "진위여부 확인되었습니다. 가입을 진행해주세요.");
	                           $(".modal-backdrop.in").remove(); 
	                           }else{
	                              alert("존재하지 않는 사업자 번호입니다.");
	                           }
	                        },
	                        error : function(result) {
	                           console.log(result.responseText); //responseText의 에러메세지 확인
	                        }
	                     });
	                     
	                  
	            
	               });
	         });
	      ///////////// 사업자 등록번호 진위여부 끝 ////////////
	         
		
		
	  

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/top.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	   <!-- 사업자등록번호 Check Modal -->
   <!-- Modal -->
   <div class="modal" id="checkBno" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
     <div class="modal-dialog" role="document">
       <div class="modal-content" style="font-size: 17px;">
         <div class="modal-header">
           <h1 class="modal-title" id="myModalLabel"><strong>사업자 등록번호 진위여부 확인</strong></h1>
         </div>
         <div class="modal-body"  style="text-align: left;">
            <div class="container" style="font-size: 15px; margin-right: 60px;">
             <div style="margin-right:154px;">
                <i class="fa fa-check" aria-hidden="true"></i> &nbsp;사업자 등록번호를 입력해주세요.
             </div>
             <div>
                <i class="fa fa-check" aria-hidden="true"></i> &nbsp;절차에 따라 사업자번호 진위여부 확인후 가입 가능합니다.
             </div>
             <hr>
          </div>
          
          <input type="text" name="bNo" placeholder="사업자 등록번호를 '-'없이 입력해주세요." maxlength='10' style="margin-left: 60px;">
          
         </div>
         <div class="modal-footer" style="font-size: 20px;">
           <button type="button" class="bts site-btn exit" data-dismiss="modal" style="font-size: 13px; background-color: gray; border-radius:4px;">닫기</button>
           <button type="button" id="bNo" class="bts site-btn" style="font-size: 13px; background-color: #7fad39; font-color: white; border-color: #7fad39; border-radius:4px;">확인</button>
         </div>
       </div>
     </div>
   </div>
   <!-- 사업자등록번호 Check Modal -->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="row">
		
	   	 	
	 	 	<div class="col-md-8" >
	 	 	
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
		      <input type="text" maxlength='50' class="userId" id="userId" name="userId" placeholder="중복확인하세요." autocomplete="username" required onkeyup="this.value=this.value.replace(' ','');" oninput="idCheck()" onclick="idCheck1()">
				 <div class="" style="">
				 <div class="id_ok " id="id" >8자 이상의 영문 소문자/영문과 숫자를 조합</div>
				 </div>
					<div class="id_already" id="id">아이디 중복확인</div>
		    </div>
		    <div class="">
		      <button class="idChk site-btn" type="button" id="idChk " onclick="checkId()" value="N" style="border-radius:4px; margin-right:50px; margin-top:1px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class=" col-sm-3 control-label"><a>비밀번호</a></label>
		    <div class="col-sm-6" >
		      <input type="password" maxlength='50' class="password" id="password" name="password" placeholder="비밀번호를 입력하세요." onkeyup="this.value=this.value.replace(' ','');" oninput="pwCheck()" onclick="pwCheck1()">
		    	<div class="" style="">
				 <div class="pw_ok " id="pw" >8자 이상의 영문/숫자/특수문자 조합</div>
				 </div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-0 col-sm-3 control-label"><a>비밀번호 확인</a></label>
		    <div class="col-sm-6">
		      <input type="password" maxlength='50' class="password2" id="password2" name="password2" placeholder="비밀번호를 다시 입력하세요." onkeyup="this.value=this.value.replace(' ','');" oninput="pw1Check()" onclick="pw1Check1()">
		    <div class="" style="">
		    <div class="pw2_ok" id="id">동일한 비밀번호를 입력해주세요.</div>
		    </div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-0 col-sm-3 control-label"><a>이름</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='10' class="userName" id="userName" name="userName" placeholder="이름을 입력하세요." oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  
		 <!--  <div class="form-group">
		    <label for="birth" class="col-sm-offset-0 col-sm-3 control-label"><a>생년월일</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='8' class="birth" id="birth" name="birth" placeholder="생년월일" >
		    </div>
		  </div> -->
		  
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-0 col-sm-3 control-label"><a>닉네임</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='20' class="nickName" id="nickName" name="nickName" placeholder="중복확인하세요." style=" display:inline-block" oninput="this.value=this.value.replace(' ','');">
		    </div>  
		    <div class="">
		      <button class="nickNameChk site-btn" type="button" id="nickNameChk " onclick="checkNickName()" value="N" style="border-radius:4px; margin-right:50px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button>
		    </div>
		  </div>
		  
		  <div class="form-group ">
             <label for="birth"
                class="col-sm-offset-0 col-sm-3 control-label">생년월일</label>
            
             <div class="col-sm-2">
                <input type="text" name="birth_year"
                   class="text-center" id="birth" style="width:80px; text-indent: 0em;"
                   value="" placeholder="YYYY" size="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
		      <input type="hidden" maxlength='8' class="role" id="role" name="role" value=${role } placeholder="role" >
                <input type="hidden" name="birth"
                   class="form-control form-control text-center" id="birth"
                   value="">
             </div>
             <div class="col-sm-2">
                <input type="text" name="birth_month" style="width:80px; text-indent: 0em;"
                   class="text-center" id="birth"
                   value="" pattern="[0-9]*"  placeholder="MM" size="2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
             </div>
             <div class="col-sm-2">
                <input type="text" name="birth_day" style="width:80px; text-indent: 0em;"
                   class="birth text-center" id="birth"
                   value=""  placeholder="DD" size="2" maxlength="2" min="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
          </div>
          </div>
		  
		  
		  <div class="form-group" >
		    <label for="phone" class="col-sm-offset-0 col-sm-3 control-label"><a>휴대폰번호</a></label>
		     <div class="col-sm-6">
		      <input type="text" class="phone" id="phone" name="phone" placeholder="숫자만 입력하세요." style=" display:inline-block" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		    </div>
		    <div class="">
		      <button class="phoneChk site-btn" type="button" id="phoneChk " onclick="checkPhone()" value="N" style="margin-right:50px; height:48px; width:113.52px; padding-left:10px;
		      				border-radius:4px; padding-right:10px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">인증번호 받기</button>
		    </div>
		  </div>
		  <div class="form-group" id="pch" style="display:none;">
		    <label for="" class="col-sm-offset-0 col-sm-3 control-label"><a></a></label>
		  <div class="adad col-sm-6" style="font-size:15px;">
			<input type="hidden" id="phoneDoubleChk"/>
			<input type="text" id="authNo1" class="authNo" placeholder="인증번호를 입력하세요." oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
		<div>
			<button class="send_btn site-btn" type="button" id="sned" style="width:113.52; border-radius:4px; margin-right:48px; height:44; width:113.52px; padding-left:10px; padding-right:10px; color: #7fad39; background-color:white; border: 1px solid #7fad39;" >인증번호 확인</button>
				</div>
		</div>
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
              
            <div class=" col-sm-2" style="display:flex; margin-left:30px; height:48px;">
                <input type="radio" name="gender"
                   class="form-control " id="gender"
                   value="남" style="font-size:10px; border:none; outline:none; background: transparent;" onfocus="this.blur()">
             	<label for="" class="col-sm-1" style="margin-right:40px;">남</label>
             </div>
             
             <div class="col-sm-2" style="display:flex; text-align:center; height:48px;">
                <input type="radio" name="gender"
                   class="form-control form-control" id="gender"
                   value="여" style="font-size:10px;" onfocus="this.blur()">
             	<label for="" class="col-sm-1" style="margin-right:40px;">여</label>
             </div>
             
             <div class="col-sm-2" style="display:flex; height:48px;">
                <input type="radio" name="gender"
                   class="form-control form-control" id="gender"
                   value="없음" style="font-size:10px;" onfocus="this.blur()" checked>
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
		      <input type="text" maxlength='50' class="email" id="email" name="email" placeholder="예 : jinwook@gmail.com" onkeyup="this.value=this.value.replace(' ','');" >
		    </div>
		    <div>
		      <button class="emailChk site-btn" type="button" id="emailChk" onclick="checkEmail()" value="N" style="border-radius:4px;  margin-right:50px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button> 
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="rpId" class=" col-sm-3 control-label">추천인 아이디</label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='50' class="rpId" id="rpId" name="rpId" placeholder="추천인 아이디를 입력하세요." oninput="this.value=this.value.replace(' ','');">
		    </div>
		    <div>
		      <button class="rpIdChk site-btn" type="button" id="rpIdChk" onclick="checkRpId()" value="N" style="margin-right:50px; border-radius:4px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button> 
		    </div>
		  </div>
		 </c:if>
		 <br>
		 <br>
		 <!-- 사용자 폼 끝 -->
		  
		  
	 <!-- 사장님 폼  -->
		<c:if test="${role=='사장님' }">
		   <div class="form-group">
		<hr><br>
		    <label for="userId" class=" col-sm-3 control-label" >아 이 디</label>
		    <div class="col-sm-6" >
		      <input type="text" maxlength='50' class="userId" id="userId" name="userId" placeholder="중복확인하세요" autocomplete="username" required onkeyup="this.value=this.value.replace(' ','');" oninput="idCheck()" onclick="idCheck1()">
				 <div class="" style="">
				 <div class="id_ok " id="id" >8자 이상의 영문 소문혹은 영문과 숫자를 조합</div>
				 </div>
					<div class="id_already" id="id">아이디 중복확인</div>
		    </div>
		    <div class="">
		      <button class="idChk site-btn" type="button" id="idChk " onclick="checkId()" value="N" style="border-radius:4px; margin-right:50px; margin-top:1px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button>
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="password" class=" col-sm-3 control-label"><a>비밀번호</a></label>
		    <div class="col-sm-6" >
		      <input type="password" maxlength='50' class="password" id="password" name="password" placeholder="비밀번호를 입력하세요." onkeyup="this.value=this.value.replace(' ','');" oninput="pwCheck()" onclick="pwCheck1()">
		    	<div class="" style="">
				 <div class="pw_ok " id="pw" >8자 이상의 영문/숫자/특수문자 조합</div>
				 </div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-0 col-sm-3 control-label"><a>비밀번호 확인</a></label>
		    <div class="col-sm-6">
		      <input type="password" maxlength='50' class="password2" id="password2" name="password2" placeholder="비밀번호를 다시 입력하세요." onkeyup="this.value=this.value.replace(' ','');" oninput="pw1Check()" onclick="pw1Check1()">
		    <div class="" style="">
		    <div class="pw2_ok" id="id">동일한 비밀번호를 입력해주세요.</div>
		    </div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-0 col-sm-3 control-label"><a>이름</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='10' class="userName" id="userName" name="userName" placeholder="이름을 입력하세요." oninput="this.value=this.value.replace(' ','');">
		    </div>
		  </div>
		  <%-- 
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-0 col-sm-3 control-label"><a>생년월일</a></label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='8' class="birth" id="birth" name="birth" placeholder="생년월일" >
		      <input type="hidden" maxlength='8' class="role" id="role" name="role" value=${role } placeholder="role" >
		    </div>
		  </div> --%>
		  
		  
		   <div class="form-group ">
             <label for="birth"
                class="col-sm-offset-0 col-sm-3 control-label">생년월일</label>
            
             <div class="col-sm-2">
                <input type="text" name="birth_year"
                   class="text-center" id="birth" style="width:80px; text-indent: 0em;"
                   value="" pattern="[0-9]{4}" placeholder="YYYY" size="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
		      <input type="hidden" maxlength='8' class="role" id="role" name="role" value=${role } placeholder="role" >
                <input type="hidden" name="birth"
                   class="form-control form-control text-center" id="birth"
                   value="">
             </div>
             <div class="col-sm-2">
                <input type="text" name="birth_month" style="width:80px; text-indent: 0em;"
                   class="text-center" id="birth"
                   value="" pattern="0[0-9]|1[0-2]"  placeholder="MM" size="2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
             </div>
             <div class="col-sm-2">
                <input type="text" name="birth_day" style="width:80px; text-indent: 0em;" max="31"
                   class="birth text-center" id="birth"
                   value=""  placeholder="DD" size="2" maxlength="2" min="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
          </div>
          </div>
		  
		  
		  
		  <div class="form-group" >
		    <label for="phone" class="col-sm-offset-0 col-sm-3 control-label"><a>휴대폰번호</a></label>
		     <div class="col-sm-6">
		      <input type="text" class="phone" id="phone" name="phone" placeholder="숫자만 입력하세요." style=" display:inline-block" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
		    </div>
		    <div class="">
		      <button class="phoneChk site-btn" type="button" id="phoneChk " onclick="checkPhone()" value="N" style="margin-right:50px; height:48px; width:113.52px; padding-left:10px;
		      				border-radius:4px; padding-right:10px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">인증번호 받기</button>
		    </div>
		  </div>
		  <div class="form-group" id="pch" style="display:none;">
		    <label for="" class="col-sm-offset-0 col-sm-3 control-label"><a></a></label>
		  <div class="adad col-sm-6" style="font-size:15px;">
			<input type="hidden" id="phoneDoubleChk"/>
			<input type="text" id="authNo1" class="authNo" placeholder="인증번호를 입력하세요." oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
		<div>
			<button class="send_btn site-btn" type="button" id="sned" style="width:113.52; border-radius:4px; margin-right:48px; height:44; width:113.52px; padding-left:10px; padding-right:10px; color: #7fad39; background-color:white; border: 1px solid #7fad39;" >인증번호 확인</button>
				</div>
		</div>
		  
		  
		   <div class="form-group" >
             <label for="gender" 
                class="col-sm-offset-0 col-sm-3 control-label"><a>성별</a></label>
              
            <div class=" col-sm-2" style="display:flex; margin-left:30px; height:48px;">
                <input type="radio" name="gender"
                   class="form-control " id="gender"
                   value="남" style="font-size:10px; border:none; outline:none; background: transparent;" onfocus="this.blur()">
             	<label for="" class="col-sm-1" style="margin-right:40px;">남</label>
             </div>
             
             <div class="col-sm-2" style="display:flex; text-align:center; height:48px;">
                <input type="radio" name="gender"
                   class="form-control form-control" id="gender"
                   value="여" style="font-size:10px;" onfocus="this.blur()">
             	<label for="" class="col-sm-1" style="margin-right:40px;">여</label>
             </div>
             
             <div class="col-sm-2" style="display:flex; height:48px;">
                <input type="radio" name="gender"
                   class="form-control form-control" id="gender"
                   value="없음" style="font-size:10px;" onfocus="this.blur()" checked>
             	<label for="" class="col-sm-1" style="margin-right:40px;">X</label>
             </div>
             
          </div>
		  
		  
		   <div class="form-group">
		    <label for="email" class=" col-sm-3 control-label">이메일</label>
		    <div class="col-sm-6">
		      <input type="text" maxlength='50' class="email" id="email" name="email" placeholder="예 : jinwook@gmail.com" oninput="this.value=this.value.replace(' ','');">
		    </div>
		    <div>
		      <button class="emailChk site-btn" type="button" id="emailChk" onclick="checkEmail()" value="N" style="border-radius:4px;  margin-right:50px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button> 
		    </div>
		  </div>
		  
		  <div class="form-group">
          <label for="businessNo" class=" col-sm-3 control-label">사업자등록번호</label>
          <div class="col-sm-6">
            <input readonly class="businessNo" id="businessNo" name="businessNo" placeholder="진위확인해 주세요." value="">
          </div>
          <div>
            <button class="rpIdChk site-btn" type="button" data-toggle="modal" data-target="#checkBno" style="margin-right:50px; border-radius:4px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">진위확인</button> 
          </div>
        </div>
		 </c:if>
		 <br>
		 <br>
		  
		  <!-- 사장님 폼 끝 -->
		  <div class="form-group">
		    <div class="col-sm-offset-3  col-sm-6 text-center">
		      <button type="button" class="bts site-btn" id="addUser" style="width:200px; font-size:20px; border-radius:4px; ">가입하기</button>
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