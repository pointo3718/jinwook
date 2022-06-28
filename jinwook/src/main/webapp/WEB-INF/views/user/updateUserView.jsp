<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>유저/사장/관리자 페이지 </title>

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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

/////////////// 가지고 있는 쿠폰 개수 ///////////////
$(function() {
  getCouponCount();
});

function getCouponCount() {

  var uri = "/store/getCouponCount";

  $.get(uri, function(response) {
  
        var countCouponHtml = "";

        countCouponHtml += `
              <span>\${response.getCouponCount}</span>
           `;

        $(".countCoupon").html(countCouponHtml);
     
  }, "json");
}


   
   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }


   function searchBoard(form) {
      /*[- 드롭다운이 아닌 메인 검색 키워드로 검색했을 때 -]*/
   if (isEmpty(form) == true) {
      var searchKeyword = document.getElementById("mainSearchKeyword");
      if (isEmpty(searchKeyword.value) == true) {
            alert("키워드를 입력해 주세요.");
            searchKeyword.focus();
            return false;
         }

         form = document.getElementById("searchForm");
         form.searchKeyword.value = searchKeyword.value;
         form.submit();
      }

      if (isEmpty(form.searchKeyword.value) == true) {
         alert("키워드를 입력해 주세요.");
         form.searchKeyword.focus();
         return false;
      }
   }
         
   /*[- end of function -]*/
   
   
      /////////////// 회원목록 이동 시작 ////////////////
      $(function() {
       $( ".list-group-item:contains('회원 목록')").on("click" , function() {
         $(self.location).attr("href","/admin/blog");
      });
   });
   //////////////// 상점목록 이동 끝 /////////////////
   
   /////////////// 상점목록 이동 시작 ////////////////
      $(function() {
       $( ".list-group-item:contains('상점 목록')").on("click" , function() {
         $(self.location).attr("href","/admin/listStoreAdmin");
      });
   });
   //////////////// 상점목록 이동 끝 /////////////////
   
   /////////////// 신고접수 목록 이동 ////////////////
      $(function() {
       $( ".list-group-item:contains('신고 접수 목록')").on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href","/admin/listComplainAdmin");
      });
   });
   
   /////////////// 상점등록요청 목록 이동 ////////////////
      $(function() {
       $( ".list-group-item:contains('상점 등록 요청')").on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href","/request/getRequestListForAdmin?reqCode=1");
      });
   });
   
   /////////////// 상점삭제요청 목록 이동 ////////////////
      $(function() {
       $( ".list-group-item:contains('상점 삭제 요청')").on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href","/request/getRequestListForAdmin?reqCode=2");
      });
   });

   /////////////// 환급요청 목록 이동 ////////////////
      $(function() {
       $( ".list-group-item:contains('환급 요청')").on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href","/request/getRequestListForAdmin?reqCode=3");
      });
   });

   /////////////// 광고 요청 목록 이동 ////////////////
      $(function() {
       $( ".list-group-item:contains('광고 등록 요청')").on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href","/request/getRequestListForAdmin?reqCode=4");
      });
   });



   
      
		
		function pwCheck1(){
			$('.pw_ok').css("display","inline-block");
			$('.pw_ok').css("color","black");
		}
		
		function pwCheck(){
			var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
			var pw=$("input[name='password2']").val();
			
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
			var pw=$("input[name='password2']").val();
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
		var pw=$("input[name='password']").val();
		var pw2=$("input[name='password2']").val();
		var pw_confirm=$("input[name='password3']").val();
		var name=$("input[name='userName']").val();
		var nickName=$("input[name='nickName']").val();
		var phone=$("input[name='phone']").val();
		var email=$("input[name='email']").val();
     	var password=$("input[name='password']").val();
      
      
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
		
		
		if(nickName == null || nickName.length <1){
			swal("진욱이네", "닉네임은  반드시 입력하셔야 합니다.");
			nickName.focus();
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
		
		checkPassword();
		
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
	   
	   $("#modifyUser").attr("method" , "POST").attr("action" , "/user/updateUser").submit();   
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
		$.ajax({
			url : "/user/checkPassword",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val(),
					"password" : $("#password").val()},
			success : function(data){
				 if(data == 0){
					alert("현재 비밀번호를 다시 확인해주세요.");
					return;
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
      location.href="/user/confirmPasswordView?userId=${user.userId}"
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

<style>


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

.blog__sidebar__item {
   width: 200px;
}

.row{
   display: flex;
    justify-content: center;
   align-items: flex-start;
}

#pw {color:#7fad39;
        		display: none;
        		font-size:12px;
        		text-align:left;
            justify-content: left;
        }


</style>

</head>

<body>

   <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
   <!-- Header End -->

   <!-- Breadcrumb Section Begin -->
   <section class="breadcrumb-section set-bg"
      style="background-color: #F2F2F2">
      <div class="container">
         <div class="row my-1">
            <div class="col-4">
               <div class="bg-white text-black mx-3">

                  <br/> <button type="button" class="btn btn-outline-success" style="margin-left: 20px; margin-bottom: 10px; color:#7fad39; border-color:#7fad39;" disabled>${sessionScope.user.grade}</button>
                  <span>
                  <strong class="mytop01"><span style="font-size: 30px;">${sessionScope.user.nickName}</span>&nbsp;님&nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></strong><br/>
                  </span>
                  <h1 class="mytop01-content " id="inquiry"><span class="countinq"></span></h1>
                  <a href="#" style="color: gray;">전체등급보기</a> <br/> <br/>
                  
               </div>
            </div>

            <div class="col-4">
               <div class="bg-white text-black mx-3" style="height: 153px;">

                  <br/> <strong class="mytop01"><span style="font-size: 25px;">진욱페이 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong>
                  &nbsp;&nbsp;<a href="#" style="color:gray;">충전하기</a></br> </br>
                  <div><h2 class="mytop01-content " id="request" style="padding-left:170px;"><span class="countall">${sessionScope.user.jpBalance}</span></h2> 원</div>
                  <br/> <br/>
               </div>
            </div>

            <div class="col-4">
               <div class="bg-white text-black mx-3" style="height: 153px;">

                  <br/> <strong class="mytop01"><span style="font-size: 25px;"><a data-toggle="modal" style="color:black;" href="#staticBackdrop">보유쿠폰</a>&nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong> <br/> <br/>
                  <h2 class="mytop01-content " id="request"><span class="countall"><span class="countCoupon"></span></span></h2> 개 </br> </br>

               </div>
            </div>
         </div>

      </div>
      <!-- /container -->
   </section>
   <!-- Breadcrumb Section End -->

   <!-- Blog Section Begin -->
   <section class="blog spad">
      <div class="container">
         <div class="row" style="justify-content: space-around;">
            <div class="col-xs-4 col-xs-5"
               style="width: 200px; margin-right: 30px;">
               <div class="blog__sidebar" style="width: 200px;">

                  <div class="blog__sidebar__item">

                     <h5 class="text-center" style="margin-bottom: 0px;">
                        <strong>마이 페이지</strong>
                     </h5>

                     <br/>

                     <div class="list-group text-center" style="font-size: 15px;">
                        <button type="button"
                           class="list-group-item list-group-item-action"
                           aria-current="true" onclick="location.href='/orders/getOrdersList'">주문내역</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" onclick="confirm()">개인정보</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" onclick="location.href='/board/getBoardInquiryList'">1:1문의</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" class="addStore"><span class="addStore">작성한 글 
                           </span>
                            </button>
                     </div>

                  </div>


               </div>
            </div>

<!-- 사업자등록번호 Check Modal -->
   <!-- Modal -->
   <div class="modal" id="checkBno" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
     <div class="modal-dialog" role="document">
       <div class="modal-content" style="font-size: 20px;">
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
          
          <input type="text" name="bNo" placeholder="사업자 등록번호를 '-'없이 입력해주세요." maxlength='10' style="margin-left: 60px; ">
          
         </div>
         <div class="modal-footer" style="font-size: 20px;">
           <button type="button" class="bts site-btn exit" data-dismiss="modal" style="font-size: 13px; background-color: gray; border-radius:4px;">닫기</button>
           <button type="button" id="bNo" class="bts site-btn" style="font-size: 13px; background-color: #7fad39; font-color: white; border-color: #7fad39; border-radius:4px;">확인</button>
         </div>
       </div>
     </div>
   </div>
   <!-- 사업자등록번호 Check Modal -->
			

            <!-- 개인 정보 수정 Start -->
            <div>
               <h4 class="text-left">
                  <strong>개인 정보 수정</strong>

               </h4>
                  <hr size="10px">



                  <table class="table table-hover"
                     style="width: 730px; heigh: 300px;">

                     <form class="form-horizontal" id="modifyUser">

               <c:if test="${sessionScope.user.role == '사용자' }">

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">아이디</label>
                           <div class="col-sm-6">
                              <input type="text" name="userId"
                                 class="form-control form-control" id="userId"
                                 value="${user.userId}" readonly oninput="this.value=this.value.replace(' ','');">
                           </div>
                           <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password"
                                 class="form-control form-control" id="password"
                                 value=""  onkeyup="this.value=this.value.replace(' ','');" oninput="pwCheck()" onclick="pwCheck1()">
                           </div>
                            <div class="col-sm-3"></div>
                            	 
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password2"
                                 class="form-control form-control" id="password2"
                                 value="" onkeyup="this.value=this.value.replace(' ','');" oninput="pwCheck()" onclick="pwCheck1()">
                           </div>
                            <div class="col-sm-3">
                            </div>
                            <div class="pw_ok " id="pw" >8자 이상의 영문/숫자/특수문자 조합</div>
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
                             <div class="pw2_ok" id="pw">동일한 비밀번호를 입력해주세요.</div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="userName"
                                 class="form-control form-control" id="userName"
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

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">닉네임</label>
                           <div class="col-sm-6">
                              <input type="text" name="nickName"
                                 class="form-control form-control" id="nickName"
                                 value="${user.nickName}" oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3">
                            	<button class="emailChk site-btn" type="button" id="nickNameChk" onclick="checkNickName()" value="N" style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">중복확인</button>
                            </div>
                        </div>

                        <div class="form-group row" >
                           <label for="colFormLabel" 
                              class="col-sm-3 col-form-label col-form-label">성별</label>
                              
                           <div class="col-sm-2" style="display:flex; margin-top:5px;">
                              <input type="radio" name="gender"
                                 class="form-control form-control" id="gender"
                                 value="${user.gender }" style="font-size:10px; background: transparent;" onfocus="this.blur()">
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
                              <input type="text" name="phone"
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
                              class="col-sm-3 col-form-label col-form-label">추천인 아이디</label>
                           <div class="col-sm-6">
                              <input type="text" name="rpId"
                                 class="form-control form-control" id="rpId"
                                 value="${user.rpId}" placeholder="x" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
                           </div>
                            <div class="col-sm-3"></div>
                        </div>
                        </c:if>
                        
                        
               		<c:if test="${sessionScope.user.role == '사장님' }">

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">아이디</label>
                           <div class="col-sm-6">
                              <input type="text" name="userId"
                                 class="form-control form-control" id="userId"
                                 value="${user.userId}" readonly oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password"
                                 class="form-control form-control" id="password"
                                 value=""  oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password2"
                                 class="form-control form-control" id="password2"
                                 value="" oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호 확인</label>
                           <div class="col-sm-6">
                              <input type="password" name="password3"
                                 class="form-control form-control" id="password3"
                                 value="" oninput="this.value=this.value.replace(' ','');">
                           </div>
                            <div class="col-sm-3"></div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="userName"
                                 class="form-control form-control" id="userName"
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
                              <input type="text" name="phone1"
                                 class="form-control form-control" id="phone1"
                                 value="${user.phone}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
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
                              <input type="text" name="phone"
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
                              <input type="text" name="phone"
                                 class="form-control form-control" id="authNo1"
                                 value="" placeholder="인증번호를 입력해주세요." oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
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
                              <input type="text" name="businessNo"
                                 class="form-control form-control" id="businessNo"
                                 value="${user.businessNo}"  readonly>
                           </div>
                            <div class="col-sm-3">
                            	 <button class="rpIdChk site-btn" type="button" data-toggle="modal" data-target="#checkBno"
                            	  style="border-radius:4px; height:38px; margin-right:50px;
                           			padding:5px; width:113px; color: #7fad39; background-color:white; border: 1px solid #7fad39;">진위확인</button> 
                            </div>
                        </div>
                        </c:if>
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
   </section>
   <!—   Blog Section End —>
   
                <!-- 쿠폰 Modal 시작  -->
            <div class="modal fade" id="staticBackdrop" data-backdrop="static"
               data-keyboard="false" tabindex="-1"
               aria-labelledby="staticBackdropLabel" aria-hidden="true">


               <div class="modal-dialog">
                  <div class="modal-content"
                     style="width: 802px;height: 500px;align-items: center;right: 150px;">
                     <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">
                           <strong style="padding-right: 550px;"><img
                              src="${path}/resources/static/img/coupon.png"
                              style="width: 50px; height: 40px;">&nbsp;&nbsp;&nbsp;쿠폰
                              목록 조회</strong></strong>
                        </h5>
                     </div>
                     <div class="modal-body">
                        <div>

                           <table class="table" style="width: 700px">
                              <thead>
                                 <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">쿠폰종류</th>
                                    <th scope="col">쿠폰할인율</th>
                                    <th scope="col">유효기간</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="coupon" items="${couponList}">
                                    <c:set var="i" value="${ i+1 }" />

                                    <tr>
                                       <th scope="row">${i}</th>
                                       <td><c:if test="${coupon.couponType==1}">
                              고객님의 회원가입을 축하합니다. (회원가입 쿠폰)
                           </c:if> <c:if test="${coupon.couponType==2}">
                              고객님의 첫 구매를 축하합니다. (첫구매 쿠폰)
                           </c:if> <c:if test="${coupon.couponType==3}">
                             고객님의 생일을 축하합니다. (생일축하 쿠폰)
                           </c:if> <c:if test="${coupon.couponType==4}">
                             고객님께 소중한 쿠폰 배달왔습니다. (추천인 쿠폰)
                           </c:if></td>
                                       <td style="padding-left: 35px;"><fmt:formatNumber value="${coupon.couponDc*100}" />%</td>
                                       <td>${coupon.couponValidDate}</td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>



                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           data-dismiss="modal">Close</button>
                     </div>
                  </div>
               </div>


            </div> 
            <!-- 쿠폰 Modal 끝 -->
   

   <!--  Footer Begin  --> 
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End --> 

</body>

</html>