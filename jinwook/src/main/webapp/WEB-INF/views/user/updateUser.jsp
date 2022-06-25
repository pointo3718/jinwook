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
		
		if(id == null || id.length <1){
			alert("아이디는 반드시 입력하셔야 합니다.");
			return;
		}
		if(pw == null || pw.length <1){
			alert("패스워드는  반드시 입력하셔야 합니다.");
			return;
		}
		/* if(pw_confirm == null || pw_confirm.length <1){
			alert("패스워드 확인은  반드시 입력하셔야 합니다.");
			return;
		} */
		
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
      
   
	   var value = "";   
	   if( $("input[name='birth_year']").val() != ""  &&  $("input[name='birth_month']").val() != "" &&  $("input[name='birth_day']").val() != ""){
	      var value = $("input[name='birth_year']").val()  
	                     + $("input[name='birth_month']").val() 
	                     + $("input[name='birth_day']").val();
	   }
	   
	   $("input:hidden[name='birth']").val( value );
	   
	   $("#modifyUser").attr("method" , "POST").attr("action" , "/user/updateUser").submit();   
   
   
   /* f(pw.length < 8 || pw.length > 25){
        alert("8자리 ~ 25자리 이내로 입력해주세요.");
        return false;
       }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
        alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
        return false;
       }else {
         console.log("통과");    
       } */

   
   
}
   
   //개인정보 변경 페이지로 이동
   function confirm() {
      location.href="/user/confirmPasswordView?userId=${user.userId}"
   }
   
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
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password"
                                 class="form-control form-control" id="password"
                                 value=""  oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password2"
                                 class="form-control form-control" id="password2"
                                 value="" oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호 확인</label>
                           <div class="col-sm-6">
                              <input type="password" name="password3"
                                 class="form-control form-control" id="password3"
                                 value="" oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="userName"
                                 class="form-control form-control" id="userName"
                                 value="${user.userName}" readonly oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이메일</label>
                           <div class="col-sm-6">
                              <input type="text" name="email"
                                 class="form-control form-control" id="email"
                                 value="${user.email}" oninput="this.value=this.value.replace(' ','');">
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
                                 value="없음" style="font-size:10px;" onfocus="this.blur()">
                              <label for="" class="col-sm-1" style="margin-right:40px;">X</label>
                           </div>
                           
                        </div>

                        <div class="form-group row" style="display:flex;">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">생년월일</label>
                          
                           <div class="col-sm-2">
                              <input type="text" name="birth_year"
                                 class="form-control form-control text-center" id="birth"
                                 value="" placeholder="YYYY" size="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              <input type="hidden" name="birth"
                                 class="form-control form-control text-center" id="birth"
                                 value="">
                           </div>
                           <div class="col-sm-2">
                              <input type="text" name="birth_month"
                                 class="form-control form-control text-center" id="birth"
                                 value="" pattern="[0-9]*"  placeholder="MM" size="2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                           </div>
                           <div class="col-sm-2">
                              <input type="text" name="birth_day"
                                 class="form-control form-control text-center" id="birth"
                                 value=""  placeholder="DD" size="2" maxlength="2" min="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
                        </div>
                        </div>
                        
                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">휴대폰 번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="phone"
                                 class="form-control form-control" id="phone"
                                 value="${user.phone}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                           </div>
                        </div>
                        
                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">추천인 아이디</label>
                           <div class="col-sm-6">
                              <input type="text" name="rpId"
                                 class="form-control form-control" id="rpId"
                                 value="${user.rpId}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
                           </div>
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
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password"
                                 class="form-control form-control" id="password"
                                 value=""  oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password2"
                                 class="form-control form-control" id="password2"
                                 value="" oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">새 비밀번호 확인</label>
                           <div class="col-sm-6">
                              <input type="password" name="password3"
                                 class="form-control form-control" id="password3"
                                 value="" oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="userName"
                                 class="form-control form-control" id="userName"
                                 value="${user.userName}" readonly oninput="this.value=this.value.replace(' ','');">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">이메일</label>
                           <div class="col-sm-6">
                              <input type="text" name="email"
                                 class="form-control form-control" id="email"
                                 value="${user.email}" oninput="this.value=this.value.replace(' ','');">
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
                                 value="없음" style="font-size:10px;" onfocus="this.blur()">
                              <label for="" class="col-sm-1" style="margin-right:40px;">X</label>
                           </div>
                           
                        </div>

                        <div class="form-group row" style="display:flex;">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">생년월일</label>
                          
                           <div class="col-sm-2">
                              <input type="text" name="birth_year"
                                 class="form-control form-control text-center" id="birth"
                                 value="" placeholder="YYYY" size="4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              <input type="hidden" name="birth"
                                 class="form-control form-control text-center" id="birth"
                                 value="">
                           </div>
                           <div class="col-sm-2">
                              <input type="text" name="birth_month"
                                 class="form-control form-control text-center" id="birth"
                                 value="" pattern="[0-9]*"  placeholder="MM" size="2" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                           </div>
                           <div class="col-sm-2">
                              <input type="text" name="birth_day"
                                 class="form-control form-control text-center" id="birth"
                                 value=""  placeholder="DD" size="2" maxlength="2" min="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
                        </div>
                        </div>
                        
                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">휴대폰 번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="phone"
                                 class="form-control form-control" id="phone"
                                 value="${user.phone}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                           </div>
                        </div>
                        
                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">사업자등록번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="businessNo"
                                 class="form-control form-control" id="businessNo"
                                 value="${user.businessNo}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
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