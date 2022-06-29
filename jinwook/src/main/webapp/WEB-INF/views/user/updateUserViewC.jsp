<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상점수정</title>


<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
   /*<![CDATA[*/
</script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.sticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	background: #ffffff;
	z-index: 10;
}

.row {
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

.mytop01 {
	padding-left: 20px;
}

.mytop01-content {
	padding-left: 180px;
	color: #6A8F00;
	display: inline;
}

.blog {
	padding-top: 50px;
}

.blog__sidebar {
	padding-top: 0px;
}

.list-group {
	padding-top: 0px;
}

.blog__sidebar {
	padding-bottom: 430px;
}

.blog__sidebar__item {
	width: 200px;
	/*  body > div.container{
           border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */ / . row { margin-top : 10px;
	justify-content: center;
	align-items: center;
	text-align: center;
}

/* .id_ok {
	color: #7fad39;
	display: none;
	font-size: 10px;
}

.id_already {
	color: red;
	display: none;
	font-size: 10px;
	text-align: left;
} */

.control-label {
	whidth: 250px;
	text-align: center;
	justify-content: center;
}

.site-btn {
	background-color: #7fad39; /* Green */
	border: none;
	color: white;
	width: 200px;
	text-align: center;
	font-size: 20px;
}

.userId {
	width: 300px;
	text-indent: 1em;
}

.ss {
	font-size: 30px;
	justify-content: center;
}

input {
	width: 300px;
	height: 50px;
	text-indent: 1em;
	font-size: 15px;
}

div {
	justify-content: center;
	text-align: center;
	align-items: center;
}

/* label {
	font-size: 15px;
	justify-content: top;
	text-align: left;
	display: flex;
	align-items: left;
} */

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
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
	

</style>

<script type="text/javascript">




   /*<![CDATA[*/
   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }

   var storeNo = $("input[id='storeNo']").val();
   /*]]>*/

   $(function() {
      $(".list-group-item:contains('주문 내역')").on("click", function() {
         $(self.location).attr("href", "/admin/blog");
      });
   });

   $(function() {
      $(".list-group-item:contains('상점 정보 수정')").on("click", function() {
         $(self.location).attr("href", "/store/updateStore?storeNo=10000");
      });
   });

   $(function() {
      $(".list-group-item:contains('개인 정보 수정')").on("click", function() {
         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href", "/user/updateUserViewC?userId=${user.userId}");
      });
   });

   $(function() {
      $(".list-group-item:contains('상품 등록')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/store/addStoreProduct?storeNo=10000");
            });
   });

   $(function() {
      $(".list-group-item:contains('광고 등록')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/request/getRequestListForAdmin?reqCode=1");
            });
   });

   $(function() {
      $(".list-group-item:contains('지갑')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/store/getStoreWallet?storeNo=10000");
            });
   });

   $(function() {
      $(".list-group-item:contains('1:1 문의내역')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/request/getRequestListForAdmin?reqCode=2");
            });
   });


	function pwCheck1(){
		$('.pw_ok').css("display","inline-block");
		$('.pw_ok').css("color","black");
	}
	
	function pwCheck(){
		var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
		var pw=$("input[name='password']").val();
		
		if(pwJ.test(pw)){
			$('.pw_ok').css("display","inline-block");
			$('.pw_ok').css("color","#7fad39");
		}else{
			$('.pw_ok').css("color","red");
		}
	}
	
	function pw1Check1(){
		$('.pw2_ok').css("display","inline-block");
		$('.pw2_ok').css("color","black");
	}
	
	function pw1Check(){
		var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
		var pw=$("input[name='password']").val();
		var pw_confirm=$("input[name='password3']").val();
		
		if(pw == pw_confirm){
			$('.pw2_ok').css("display","inline-block");
			$('.pw2_ok').css("color","#7fad39");
		}else{
			$('.pw2_ok').css("color","red");
		}
	}



//============= "탈퇴"  Event 처리 및  연결 =============
$(function() {
$("#deleteUser").on("click" , function() {
 $("#modifyUser").attr("method" , "POST").attr("action" , "/user/deleteUser").submit();
});
});   

//=============이메일" 유효성Check  Event 처리 =============
$(function() {

$("input[name='email']").on("change" , function() {
    
  var email=$("input[name='email']").val();
  
  if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
     alert("이메일 형식이 아닙니다.");
   }
});

});   

////////////////////////////////수정 시작///////////////////////////////////////
function fncUpdateUser() {
   var id=$("input[name='userId']").val();
	var pw1=$("input[name='password1']").val();
	var pw=$("input[name='password']").val();
	var pw2=$("input[name='password3']").val();
	var pw_confirm=$("input[name='password3']").val();
	var name=$("input[name='userName']").val();
	var nickName=$("input[name='nickName']").val();
	var phone=$("input[name='phone']").val();
	var email=$("input[name='email']").val();
	var password=$("input[name='password']").val();
	var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
 
 if(name == null || name.length <1){
    alert("이름은  반드시 입력하셔야 합니다.");
    return;
 }
		
 
 var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 이메일 유효성 검사
	var regexName = /^[가-힣]*$/; // 이름 한글만
	var regexPhone = /^[0-9+]{6,12}$/; // 휴대폰 번호 숫자만
	
	if(pw == null || pw.length <1){
		swal("진욱이네", "비밀번호는 반드시 입력하셔야 합니다.");
		return;
	}
	/* if(pw_confirm == null || pw_confirm.length <1){
		alert("패스워드 확인은  반드시 입력하셔야 합니다.");
		return;
	} */
	
	
	if("${user.role}" != "사장님"){
		
		if(nickName == null || nickName.length <1){
			swal("진욱이네", "닉네임은  반드시 입력하셔야 합니다.");
			nickName.focus();
			return;
		}
	}
	
	if("${user.role}" != "사용자"){
		if(businessNo == null || businessNo.length <1){
			swal("진욱이네", "사업자등록번호는 반드시 입력하셔야 합니다.");
			return;
		}
	}
	
	
	/* if(!checkPassword()){
		return false;
	}else{
		return checkPassword();
	} */
	
	
	if(!pwJ.test(pw) ){
		swal("진욱이네","새 비밀번호를 확인해주세요.");
		return;
	}
	
	if(email == null || email.length <1){
		swal("진욱이네", "이메일은  반드시 입력하셔야 합니다.");
		return;
	}
	
	if(phone == null || phone.length <1){
		swal("진욱이네", "휴대폰번호는 반드시 입력하셔야 합니다.");
		return;
	}
	
	if (!regexEmail.test(email)) {
     swal("진욱이네", "잘못된 이메일 형식입니다.");
     email = "";
     return;
 }
	
	for (var i = 0; i < email.length; i++) {
    var ch = email.charAt(i)
     if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z') && ch == '@' && ch == '.') {
         swal("진욱이네", "이메일은 영문 대소문자, 숫자만 입력가능합니다.");
         email.select();
         return;
     }
 }
	
	/* for(var i = 0; i < rpId.length; i++){
		
		var ch = rpId.charAt(i);
		if(!(ch >= 'a' &&  ch <= 'z') || !(ch >= '0' && ch <= '9')){
		swal("진욱이네", "아이디는 영문 소문자로 입력해주세요.");
		$(".rpId").focus();
		$(".rpId").select();
		return;
		}
		
	} */
		
	
	
	
	if (password == id) {
     swal("진욱이네", "아이디와 비밀번호가 같습니다.")
     password.focus();
     return;
 }
	
	if( pw2 != pw_confirm ) {				
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
  
  $("#modifyUser").attr("method" , "POST").attr("action" , "/user/updateUserC").submit();   
}


/* f(pw.length < 8 || pw.length > 25){
   alert("8자리 ~ 25자리 이내로 입력해주세요.");
   return false;
  }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
   alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
   return false;
  }else {
    console.log("통과");    
  } */



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
	
//============비밀번호 중복 확인 ==============
	function checkPassword(){
		var pw=$("input[name='password']").val();
		var pw2=$("input[name='password3']").val();
	$.ajax({
		url : "/user/checkPassword",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val(),
				"password" : $("#password1").val()},
		success : function(data){
			 if(data == 0){
				swal("현재 비밀번호를 다시 확인해주세요.");
				$("#password1").focus();
				
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
  

//휴대폰 인증
$(function() {
	$( "#phoneC1" ).on("click" , function() {
	$("#phoneChk").show();
	$("#phoneChk1").hide();
		
	});
});


	$(function() {
		$( "#phoneC" ).on("click" , function() {	
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
	});
});

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
  
  

//개인정보 변경 페이지로 이동
function confirm() {
 location.href="/user/confirmPasswordViewC?userId=${user.userId}"
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


	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->

	<!-- ceoTop Section Begin -->
	<jsp:include page="../layout/ceoTop.jsp" />
	<!-- ceoTop Section End -->

	<!-- ceoLeft Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row" style="justify-content: space-around;">
				<div class="col-xs-4 col-xs-5"
					style="width: 200px; margin-right: 30px;">
					<div class="blog__sidebar" style="width: 200px;">

						<div class="blog__sidebar__item">

							<h5 class="text-center" style="margin-bottom: 0px;">
								<strong>사장님 페이지</strong>
							</h5>
							<br />



							<div class="list-group text-center" style="font-size: 15px;">
								<button type="button"
									class="list-group-item list-group-item-action"
									aria-current="true">주문 내역</button>
								<button type="button"
									class="list-group-item list-group-item-action">상점 정보
									수정</button>
								<button type="button"
									class="list-group-item list-group-item-action" class="addStore">
									<span class="addStore">개인 정보 수정</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="deleteStore">상품 등록</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="refundStore">광고 등록</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">내가 한 요청</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">지갑</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">1:1
									문의내역</button>
							</div>

						</div>


					</div>
				</div>

				<!-- 개인 정보 수정 Start -->
            <div>
               <h4 class="text-left">
                  <strong>개인 정보 수정</strong>

               </h4>
                 <table class="table table-hover"
                     style="width: 730px; heigh: 300px;">

                     <form class="form-horizontal" id="modifyUser">
                  <hr size="10px">


                  <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">아이디</label>
                           <div class="col-sm-6">
                              <input type="text" name="userId" style="background-color:white;"
                                 class="form-control form-control" id="userId"
                                 value="${user.userId}" readonly oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password1"
                                 class="form-control form-control" id="password1"
                                 value=""  onkeyup="this.value=this.value.replace(' ','');" >
                           </div>
                            <div class="col-sm-3"></div>
                            	 
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password"
                                 class="form-control form-control" id="password2"
                                 value="" onkeyup="this.value=this.value.replace(' ','');" oninput="pwCheck()" onclick="pwCheck1()">
                           </div>
                            <div class="col-sm-3">
                            </div>
                            <div class="pw_ok " id="pw" style="display:none;" >8자 이상의 영문/숫자/특수문자 조합</div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호 확인</label>
                           <div class="col-sm-6">
                              <input type="password" name="password3"
                                 class="form-control form-control" id="password3"
                                 value="" onkeyup="this.value=this.value.replace(' ','');" oninput="pw1Check()" onclick="pw1Check1()">
                           </div>
                            <div class="col-sm-3"></div>
                             <div class="pw2_ok" id="pw" style="display:none;">동일한 비밀번호를 입력해주세요.</div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="userName"
                                 class="form-control form-control" id="userName" style="background-color:white;"
                                 value="${user.userName}" readonly oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이메일</label>
                           <div class="col-sm-6">
                              <input type="text" name="email"
                                 class="form-control form-control" id="email"
                                 value="${user.email}" oninput="this.value=this.value.replace(' ','');">
                           </div>
                           <div class="col-sm-3">
                           	<button class="emailChk site-btn" type="button" id="emailChk" onclick="checkEmail()" value="N" style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button> 
                           </div>
                        </div>

                        <div class="form-group row" >
                           <label for="colFormLabel" 
                              class="col-sm-3 col-form-label col-form-label">성별</label>
                              
                           <div class="col-sm-2" style="display:flex; margin-top:5px;">
                              <input type="radio" name="gender"
                                 class="form-control form-control" id="gender"
                                 value="남" style="font-size:10px; background: transparent;" onfocus="this.blur()">
                              <label for="" class="col-sm-1" style="margin-right:40px;">남</label>
                           </div>
                           
                           <div class="col-sm-2" style="display:flex; text-align:center; margin-top:5px;">
                              <input type="radio" name="gender"
                                 class="form-control form-control" id="gender"
                                 value="여" style="font-size:10px;" onfocus="this.blur()">
                              <label for="" class="col-sm-1" style="margin-right:40px;">여</label>
                           </div>
                           
                           <div class="col-sm-2" style="display:flex; margin-top:5px;">
                              <input type="radio" name="gender"
                                 class="form-control form-control" id="gender"
                                 value="없음" style="font-size:10px;" onfocus="this.blur()" checked>
                              <label for="" class="col-sm-1" style="margin-right:40px;">X</label>
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row" style="display:flex;">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">생년월일</label>
                          
                           <div class="col-sm-2">
                              <input type="text" name="birth_year"
                                 class="form-control form-control text-center" id="birth"
                                 value="" placeholder="YYYY" size="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
                              <input type="hidden" name="birth"
                                 class="form-control form-control text-center" id="birth"
                                 value="">
                           </div>
                           <div class="col-sm-2">
                              <input type="text" name="birth_month"
                                 class="form-control form-control text-center" id="birth"
                                 value="" pattern="[0-9]*"  placeholder="MM" size="2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
                           </div>
                           <div class="col-sm-2">
                              <input type="text" name="birth_day"
                                 class="form-control form-control text-center" id="birth"
                                 value=""  placeholder="DD" size="2" maxlength="2" min="2" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"> 
                        </div>
                         <div class="col-sm-3"></div>
                        </div>
                        
                         <div class="form-group row" id="phoneChk1">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">휴대폰 번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="phone"style="background-color:white;"
                                 class="form-control form-control" id="phone1"
                                 value="${user.phone}" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" readonly>
                           </div>
                            <div class="col-sm-3">
                            	<button class="phoneChk1 site-btn" type="button" id="phoneC1" value="N" style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">다른번호 인증</button>
                            </div>
                        </div>
                            
                         <div class="form-group row" id="phoneChk" style="display:none;">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">휴대폰 번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="phone1"
                                 class="form-control form-control" id="phone"
                                 value="" placeholder="휴대폰번호를 입력해주세요." oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
                           </div>
                            <div class="col-sm-3">
                            	<button class="phoneChk site-btn" type="button" id="phoneC" value="N" style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">인증번호 받기</button>
                            </div>   
                          </div>
                            
                         <div class="form-group row" id="pch" style="display:none;">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label"></label>
                           <div class="col-sm-6">
                              <input type="text" name="authNo1"
                                 class="form-control form-control" id="authNo1"
                                 value="" placeholder="인증번호를 입력해주세요." oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
                          <input type="hidden" id="phoneDoubleChk"/>
                           </div>
                            <div class="col-sm-3">
                            	<button class="phoneChk site-btn" type="button" id="sned" value="N" style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">인증번호 확인</button>
                            </div>   
                          </div>
                        
                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">사업자등록번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="businessNo" style="background-color:white;"
                                 class="form-control form-control" id="businessNo"
                                 value="${user.businessNo}"  readonly>
                           </div>
                            <div class="col-sm-3">
                            	 <button class="rpIdChk site-btn" type="button" data-toggle="modal" data-target="#checkBno"
                            	  style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">진위확인</button> 
                            </div>
                        </div>
                    </form>



                  </table>
                  
                  <!-- 개인 정보 수정 End-->
                  <!-- 회원 탈퇴 Begin -->

                  <hr size="1px">

                  <div style="padding-left: 295px;">
                     <button type="button" id="button" class="btn btn-outline-success" onClick="fncUpdateUser()">
                        수정</button>
                     &nbsp;&nbsp;&nbsp;
                     <button type="button" id="deleteUser" class="btn btn-outline-danger">회원 탈퇴</button>
                  </div>
            <!— 회원 탈퇴 버튼 End —>
         </div>
      </div>
      </div>
     
   </section>
	<!-- ceoLeft Section End -->
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->


</body>

</html>