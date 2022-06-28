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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   
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
   
   //개인정보 변경 페이지로 이동
   function confirm() {
      location.href="/user/confirmPasswordView?userId=${user.userId}"
   }
   
   //작성한 글 페이지로 이동
   function article() {
      location.href="/user/myArticle";
   }
   

$('#myModal').on('shown.bs.modal', function () {
     $('#myInput').trigger('focus')
   })

<!-- 상품 리뷰 등록 -->
$(function() {
	$("button.btn.btn-success").on("click", function() {
		fncAddReview();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddReview() {
	alert(ORDERNO);
	$('input[name=orderNo]').attr('value', ORDERNO);
	$("#reviewForm").attr("method", "POST").attr("action", "/board/addReview").submit();
}

var ORDERNO;
$(document).ready(function() {     

	   $('#reviewModal').on('show.bs.modal', function(event) {          
	      ORDERNO = $(event.relatedTarget).data('orderno');
	      alert(ORDERNO);

	    });
	});
<!-- 상품 리뷰 등록 -->	
	

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

.swal-button {
   background-color: #7fad39;
   font-size: 12px;
   text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
#modal{
   display : none;
   z-index : 1;
   background-color: rgba(0,0,0,.3);
   position:fixed;
   left:0;
   top: 0;
   height:100%;
   width: 100%;
   
}
#modal>#content{
   width: 80%;
   max-width: 350px;
   margin:100px auto;
   padding:20px;
   position: relative;
   background-color:#fff;
}

#modal .close{
   position:absolute;
   top:4px;
   right:4px;   
   font-size:20px;
   border:0;
   background-color: #fff;
}

#modal>#content .title {
   text-align: center;
}

#modal>#content .pwWrap .pwSection{
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 150px;
}

#modal>#content .pwWrap .pwSection .dot {
  display: block;
  width: 10px;
  height: 10px;
  background: darkgrey;
  border-radius: 100%;
  margin: 0 5px;
}

#modal>#content .pwWrap .pwSection .dot.active {
  background: rgba(0, 0, 0, 0.7);
}

#modal>#content .pwWrap .pwSection .message {
  position: absolute;
  bottom: 5px;
  left: 0;
  z-index: 1;
  min-width: 100%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: -0.03em;
  opacity: 0;
  transition: .2s ease-out;
}

#modal>#content .pwWrap .numberSection {
  overflow: hidden;
}

#modal>#content .pwWrap .numberSection .number {
  float: left;
  width: 33.33%;
  height: 60px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  padding: 20px 0;
  cursor: pointer;
  background: #7fad39;
  color: #ffffff;
  font-size: medium;
  outline:none;
}

#modal>#content .pwWrap .numberSection .number:last-child {
  margin-left: 0%;
  
}

#modal .close:hover,
#modal .close:focus {
  color : #000;
  text-decoration: none;
  cursor :pointer;
}
  .modal-header1{
     text-align: center;
  }
  .buttonType{
    border: 1px solid #7fad39;
    cursor:pointer; cursor:hand;
     background-color: #7fad39;
     color: white;
     padding: 6px;
     border-radius: 1em;
     outline:none;
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
                  &nbsp;&nbsp;<a href="#" id="preRegister" data-toggle="modal" data-target="#exampleModal" style="color:gray;">충전하기</a><br><br>
                  <div><h2 class="mytop01-content " id="request" style="padding-left:170px;"><span class="countall" id="iamportplus">${sessionScope.user.jpBalance}</span></h2> 원</div>
                  <br/> <br/>
               </div>
            </div>
               <div class="modal fade" id="exampleModal" data-toggle="modal" 
                  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog " style="width: 530px; heigh: 300px;">
                     <div class="modal-content" >
                        <div class="modal-header1 " >
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                           <br>
                           <h4 class="modal-title" id="exampleModalLabel" style="color : #7fad39">
                               <strong> 페이충전 </strong>
                           </h4>
                           <h5 >
                              <strong>충전하실 금액을 선택해주세요.</strong>               
                           </h5>
                           <hr>
                        </div>
                        <div class="modal-body" style="font-size : 20px; margin-left : 0px; ">
                        <h3 class="h6" style="text-align: center; color: #F05441; font-weight:bold;"> 진욱페이는 결제금액에 10% 추가지급합니다. <br>
                        </h3>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 80px;">진욱페이 </span>
                              <strong style="margin-right : 65px;" class="chargePay"> 5,500 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal" data-won="5000" onclick="PwCheck(this)">5,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 11,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal" data-won="10000" onclick="PwCheck(this)">10,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 33,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal" data-won="30000" onclick="PwCheck(this)">30,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 55,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal" data-won="50000" onclick="PwCheck(this)">50,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 60px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 110,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal" data-won="100000" onclick="PwCheck(this)">100,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 60px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 330,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal" data-won="300000" onclick="PwCheck(this)">300,000원</button>
                              <br><br>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
            <div class="modal" id="modal" style="z-index: 1060;">
               <div id='content'>
                  <!-- <input type='button' value='X' class="close" id='btnClose'/> -->
                  <input type="button" class="close" data-dismiss="modal" aria-label="Close" value="X">   
                  <div class="title">
                     <h2 class="h3">
                           <span style="color : #7fad39">진욱페이</span>
                      </h2>
                     <h3 class="h4"> 비밀번호 입력</h3><hr>
                  </div>
                  <div class="pwWrap">      
                     <div class="pwSection">
                          <span class="dot"></span>
                          <span class="dot"></span>
                          <span class="dot"></span>
                          <span class="dot"></span>
                          <span class="dot"></span>
                          <span class="dot"></span>
                        </div>
                        <div class="numberSection">
                          <button class="number">1</button>
                          <button class="number">2</button>
                          <button class="number">3</button>
                          <button class="number">4</button>
                          <button class="number">5</button>
                          <button class="number">6</button>
                          <button class="number">7</button>      
                          <button class="number">8</button>
                          <button class="number">9</button>
                          <button class="number" disabled></button>
                          <button class="number">0</button>
                          <button class="number" disabled>X</button>
                      </div>
                   </div>
               </div>
            </div>
            
            <script type="text/javascript">
            /* var btnOpen  = document.getElementById('btnOpen'); */
            /* var btnClose = document.getElementById('btnClose'); */
               
            // modal 창을 보여줌
/*             btnOpen.onclick = function(){
            var modal = document.getElementById('modal');
               modal.style.display = 'block';
            } */
            
            //modal 창을 감춤
           /*  var closeRtn = function(){
            var modal = document.getElementById('modal');
               modal.style.display = 'none';
            }
            btnClose.onclick = closeRtn; */
            
            function PwCheck(pw) {
                const _this = this;
                const cash = $(pw).data('won');
                var jpBalance = "${sessionScope.user.jpBalance}";
                var userName = "${sessionScope.user.userName}";
                var email	= "${sessionScope.user.email}";
                var phone	= "${sessionScope.user.phone}";
                _this.pwStr = pw.toString(); // 문자, 숫자열을 모두 허용하기 위해 무조건 한가지 타입으로 맞춤
                _this.password = []; // 지정된 패스워드
                _this.passwordNumber = []; // 입력할 패스워드
                _this.cnt = 0; // 입력횟수 체크
                _this.compChk = false; // 입력완료 체크 
                

                _this.parent = document.querySelector('.pwWrap');
                _this.dots = document.querySelectorAll('.dot');
                _this.numbers = document.querySelectorAll('.number');

            /*     // 비밀번호를 배열에 넣음 
                _this.getPw = function(){
                    for(let i=0; i<_this.pwStr.length; i++) {
                        _this.password[i] = _this.pwStr[i];
                    }
                } */

                // 숫자버튼 click이벤트 연동
                _this.handleListener = function(){
                    if(!_this.compChk) {
                        _this.numbers.forEach(function(number){
                            number.addEventListener('click', function(){_this.handleNumber(number)});
                        })
                    }
                }

                // 숫자키를 눌렀을때 이벤트 
                _this.handleNumber = function(number){
                    if(!_this.compChk) {
                        _this.passwordNumber[_this.cnt] = number.textContent;
                        _this.handleDotActive(true);
                        _this.cnt++;
                        if(_this.cnt === 6) {
                            _this.handleResult();
                        }
                    }
                    /* console.log(_this.passwordNumber); */
                }

                // dot 활성화 
                _this.handleDotActive = function(type){
                    if(type) {
                        _this.dots.forEach(function(dot, i){
                            if(i === _this.cnt) dot.classList.add('active'); 
                        })
                    } else {
                        _this.dots.forEach(function(dot){
                           dot.classList.remove('active'); 
                        })
                    }
                    console.log(type);
                }

                // 비밀번호 비교
                _this.handleCheckPw = function(){
                var compare ;
                  $.ajax({
                  url : "/orders/checkJpPassword",
                     type : "post",
                       dataType : "json",
                       async: false,
                        data : {"jpPassword" : _this.passwordNumber},
                        success : function(result){
                        	compare = result;
                       }
                    });
                  console.log(compare)
                return compare; 
                }
                // 결과처리 
                _this.handleResult = function(){
                    if(_this.handleCheckPw() === 1) {
                       /*  _this.parent.classList.add('confirm');
                        _this.compChk = true; */
                    	 //가맹점 식별코드
                        IMP.init('imp94304882'); // 콘솔에서 확인
                        IMP.request_pay({
                            pg : 'kcp',
                            pay_method : 'card',
                            merchant_uid : 'merchant_' + new Date().getTime(),
                            name : '진욱페이'+(100*1.1) , //결제창에서 보여질 이름
                            amount :100, //실제 결제되는 가격
                            buyer_email : email,
                            buyer_name : userName,
                            buyer_tel : phone,
                        }, function(rsp) {
                           console.log(rsp);
                            if ( rsp.success ) {
                            	alert(rsp.success)
                               var msg = '결제가 완료되었습니다.';
                               jpBalance = Number(jpBalance)+(100*1.1);
                               console.log(jpBalance);
                               
                                /* msg += '고유ID : ' + rsp.imp_uid;
                                msg += '상점 거래ID : ' + rsp.merchant_uid;
                                msg += '결제 금액 : ' + rsp.paid_amount;
                                msg += '카드 승인번호 : ' + rsp.apply_num; */
                                self.location="";
                            } else {
                                var msg = '결제에 실패하였습니다.';
                                 msg += '에러내용 : ' + rsp.error_msg;
                                 self.location="";
                            }
                            alert(msg);
                        });
                    } else {
                        _this.parent.classList.add('error');
                        // 입력상태 초기화 
                        _this.passwordNumber = [];
                        _this.cnt = 0; 
                        _this.compChk = true; // 일시적인 클릭 방지 
                        
                        setTimeout(function(){
                           swal("진욱이네","결제비밀번호가 잘못입력되었습니다.다시입력해주세요");
                            _this.compChk = false;   
                            _this.parent.classList.remove('error');
                            _this.handleDotActive();
                        }, 200);
                    }
                }

                _this.init = function(){
                    _this.handleListener();
                    /* _this.getPw(); */
                }();
            }

            //레시피 1:1문의 버튼 이벤트 
            function rcpL(){
            	$("#rcpLi").show();
            	$("#inqLi").hide();
            	$("#rcpL").css("color","white");
            	$("#rcpL").css("border-right", "1px solid white");
            	$("#inqL").css("border-left","1px solid white");
            	$("#rcpL").css("background-color","#7fad39");
            	$("#rcpL").css("border","2px solid #E6E6E6");
            	$("#inqL").css("color","gray");
            	$("#inqL").css("background-color","white");
            	$("#inqL").css("border","2px solid #E6E6E6");
            }
            
            function inqL(){
            	$("#rcpLi").hide();
            	$("#rcpL").css("color","gray");
            	$("#rcpL").css("border-right","1px solid white");
            	$("#inqL").css("border-left","1px solid white");
            	$("#rcpL").css("background-color","white");
            	$("#rcpL").css("border","2px solid #E6E6E6");
            	$("#inqL").css("color","white");
            	$("#inqL").css("background-color","#7fad39");
            	$("#inqL").css("border","2px solid #E6E6E6");
            	
            	$("#inqLi").show();
            }
            
            
            function fncgetRecipe(rcpNo) {
                //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
                //==> 레시피 리스트에서 레시피 상세로 이동
                   self.location = "/board/getRecipe?rcpNo="+rcpNo;
                }
            
            function fncgetInq(boardNo) {
                //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
                //==> 레시피 리스트에서 레시피 상세로 이동
                   self.location = "/board/getBoardInquiry?boardNo="+boardNo;
                }
            
            
            //let pwCheck = new PwCheck(123456);
            </script>
            <div class="col-4">
               <div class="bg-white text-black mx-3" style="height: 153px;">

                  <br/> <strong class="mytop01"><span style="font-size: 25px;"><a data-toggle="modal" style="color:black;" href="#staticBackdrop">보유쿠폰</a> &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong> <br/> <br/>
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
                           class="list-group-item list-group-item-action" onclick="article()">작성한 글 
                            </button>
                        <button type="button" class="list-group-item list-group-item-action" onclick="location.href='/orders/getOrdersJpayList'">진욱페이 내역</button>
                     </div>

                  </div>


               </div>
            </div>

              <!-- 지갑 조회 start-->
            <div style="margin-bottom: 1150px; width: 850px;">
               <h4 class="text-left">
                  <strong>내가 작성한 글</strong>&nbsp; <span
                     style="color: #6E6E6E; font-size: 13px">내가 작성한 글을 한 눈에 볼 수 있습니다.</span>
                  <hr size="10px">
               </h4>

               <!--지갑조회 주문내역 테이블 start-->
               <h6 class="text-center" style="display:flex;">
               	<button  type="button" class="rcpL site-btn" id="rcpL" onclick="rcpL()" 
               	style="width:430px; background-color:#7fad39; border-right:white; color:white; outline:none;"><strong>레시피 내역</strong></button>
				<button  type="button" class="inqL site-btn" id="inqL" onclick="inqL()" 
				style="width:430px; border: 2px solid #E6E6E6; border-left:white; background-color:white; color:gray; outline:none; ">1:1 문의 내역</button>
               </h6>
<br>
               <table class="table table-hover " id="rcpLi">

                  <thead>
                     <tr>
                        <th align="center">No</th>
                        <th align="left">레시피 제목</th>
                        <th align="left">조회수</th>
                        <th align="left">추천수</th>
                        <th align="left">작성일</th>
                     </tr>
                  </thead>

                  <tbody>

                     <c:set var="i" value="0" />
                     <c:forEach var="recipe" items="${myRecipe }" begin="0">
                        <c:set var="i" value="${ i+1 }" />
                        <tr class="" data-param="${recipe.rcpNo}" onclick="fncgetRecipe(${recipe.rcpNo})">
                           <td align="Center">${recipe.rcpNo }</td>
                           <td align="left">${recipe.rcpTitle}</td>
                           <td align="left">${recipe.rcpHits}</td>
                           <td align="left">${recipe.recommendCount}</td>
                           <td align="left">${recipe.rcpDate}</td>
                           <td>
                           <input type="hidden" value="${recipe.rcpNo}"/>   
                           <input type="hidden" name="userId" value="${sessionScope.user.userId}">	    
                           </td>
                        </tr>
                     </c:forEach>


                  </tbody>

               </table>
               <!--지갑조회 주문내역 테이블 End-->
			
               <!--지갑조회 환급내역 테이블 start-->
               <!-- <h6 class="text-left">
                  <strong>1:1문의 내역</strong>
               </h6> -->
               <table class="table table-hover " id="inqLi" style="display:none;">
	
                  <thead>
                     <tr>
                        <th align="left">No</th>
                        <th align="left">문의제목</th>
                        <th align="left">작성일</th>
                        <th align="left">답변상태</th>
                     </tr>
                  </thead>

                  <tbody>

                     <c:set var="i" value="0" />
                     <c:forEach var="board" items="${myInquiry}">
                        <c:set var="i" value="${ i+1 }" />
                         <tr class="" data-param="${board.boardNo}" onclick="fncgetInq(${board.boardNo})">
                         	<td align="Center">${ i }</td>
                           <td align="left">${board.boardTitle}</td>
                           <td align="left">${board.writeDate}</td>
                           <td align="left">
								<c:if test="${board.boardInqStatus == false}">답변대기중</c:if>
								<c:if test="${board.boardInqStatus == true}">답변완료</c:if>
							</td>
						   <td>
                           </td>
                        </tr>
                     </c:forEach>

                  </tbody>

               </table>
               <!--지갑조회 환급내역 테이블 start-->
            </div>
            <!-- 지갑조회 End -->
            <div class="text-center"></div>
         </div>
      </div>
   </section>
   <!--   Blog Section End -->
   
<!-- Modal -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">상점후기 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
      <form id="reviewForm" action="addReview" method="post">
      <input type="hidden" id="orderNo" name="orderNo" value=""/>
				<div>
					<div style="text-align:left;">
						<label for="reviewTitle">제목</label>
					</div>
					<div>
						 <input type="text"
							class="form-control" id="reviewTitle" name="reviewTitle">
					</div>
				</div>
				
				<div>
					<div style="text-align:left;">
						<label for="reviewWriter">작성자</label> 
					</div>
					<div>
						<input type="text" style="width:100px;"
							class="form-control" id="reviewWriter" name="reviewWriter">
					</div>
				</div>
				
				<div>
					<div style="text-align:left;">
						<label for="reviewStar">별점</label> 
					</div>
					<div>
						<input type="number" style="width:100px;" min="1" max="5" step="0.1"
							class="form-control" id="reviewStar" name="reviewStar">
					</div>
				</div>
				
				<div>
					<div style="text-align:left;">
						<label for="reviewContent">후기 내용</label> 
					</div>
					<div>
						<textarea class="form-control" id="reviewContent"
							name="reviewContent" rows="3"></textarea>
					</div>
				</div>

		</div><!-- Modal body 끝 -->
      
      <div class="modal-footer">
      
        <button type="button" class="btn btn-success">등 &nbsp;록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
      </div>
      </form>
      
    </div>
  </div>
</div>		
   
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
   
   
   

   <!—  Footer Begin —>
   <jsp:include page="../layout/footer.jsp" />
   <!— Footer End —>

</body>

   
</html>