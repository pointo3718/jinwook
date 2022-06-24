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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></scrip

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

$('#myModal').on('shown.bs.modal', function () {
     $('#myInput').trigger('focus')
   }) 
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
                              <strong style="margin-right : 65px;"> 5,500 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal"   >5,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 11,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal"   >10,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 33,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal"   >30,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 55,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal"   >50,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 60px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 110,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal"   >100,000원</button>
                           </div>
                           <br>
                           <div class="form-check" style="font-size: 18px;">
                              <i class="bi bi-coin"></i>
                              <span class="form-check-label" style="margin-right : 60px;">진욱페이 </span>
                              <strong style="margin-right : 65px;"> 330,000 원</strong>
                              <button type="button" class="buttonType" style=" width: 110px;" data-toggle="modal" data-target="#modal" data-dismiss="modal"   >300,000원</button>
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
                _this.pwStr = pw.toString(); // 문자, 숫자열을 모두 허용하기 위해 무조건 한가지 타입으로 맞춤
                _this.password = []; // 지정된 패스워드
                _this.passwordNumber = []; // 입력할 패스워드
                _this.cnt = 0; // 입력횟수 체크
                _this.compChk = false; // 입력완료 체크 

                _this.parent = document.querySelector('.pwWrap');
                _this.dots = document.querySelectorAll('.dot');
                _this.numbers = document.querySelectorAll('.number');

                // 비밀번호를 배열에 넣음 
                _this.getPw = function(){
                    for(let i=0; i<_this.pwStr.length; i++) {
                        _this.password[i] = _this.pwStr[i];
                    }
                }

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
                    console.log(_this.passwordNumber);
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
                    let compare = JSON.stringify(_this.password) === JSON.stringify(_this.passwordNumber);
                    return compare; 
                }

                // 결과처리 
                _this.handleResult = function(){
                    if(_this.handleCheckPw()) {
                       /*  _this.parent.classList.add('confirm');
                        _this.compChk = true; */
                        iamport();
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
                    _this.getPw();
                }();
            }

            let pwCheck = new PwCheck(123456);
           
            function iamport(){
               var jpBalance = $(iamportplus).val();
               //가맹점 식별코드
               IMP.init('imp94304882'); // 콘솔에서 확인
               IMP.request_pay({
                   pg : 'kcp',
                   pay_method : 'card',
                   merchant_uid : 'merchant_' + new Date().getTime(),
                   name : '진욱페이 5500원' , //결제창에서 보여질 이름
                   amount : '5000', //실제 결제되는 가격
                   buyer_email : 'asd@naver.com',
                   buyer_name : '최인규',
                   buyer_tel : '010-1111-9990',
               }, function(rsp) {
                  console.log(rsp);
                   if ( rsp.success ) {
                      var msg = '결제가 완료되었습니다.';
                      jpBalance = jpBalance+5000;
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
            }
            </script>
            <div class="col-4">
               <div class="bg-white text-black mx-3" style="height: 153px;">

                  <br/> <strong class="mytop01"><span style="font-size: 25px;">보유쿠폰 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong> <br/> <br/>
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

                       <!-- List Table Start -->
            <div>
               <h4 class="text-left">
                  <strong>구매 내역</strong>
                  <p class="text-muted" style="display: inline; font-size: 12px;">
                  구매 내역을 조회할 수 있습니다
                  </p>                   
                     
                  <hr size="10px">
               </h4>
            

               <table class="table table-hover"
                  style="width: 730px; heigh: 300px; font-size: small;">
                 

         <!-- 리뷰 div -->
         
         <!-- 리뷰 div -->

         <thead>
          <tr>
            <th align="center">주문번호</th>
            <th align="left">상품이름</th>
            <th align="left">주문금액</th>
            <th align="left" >주문날짜</th>
            <!-- <th align="left" >상품사진</th> -->
            <th align="left">픽업시간</th>
            <th align="left">주문현황</th>
            <!-- <th align="left">&nbsp; </th> -->
          </tr>
       </thead>
        
      <tbody>
        <c:set var="i" value="0" />
        <c:forEach var="orders" items="${getOrdersList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center" value="${orders.orderNo}">${orders.orderNo}</td>
           <td align="left">${orders.product.prodName}</td>
           <td align="left">${orders.orderPrice}</td>
           <td align="left"><fmt:formatDate value="${orders.orderDate}" dateStyle="full"/></td>
           <%-- <td align="left">${orders.product.prodImg}</td> --%>
           <td align="left"><fmt:formatDate value="${orders.pickupTime}" type="time" pattern="a hh:mm"/></td>
           <td align="left">
           <c:if test="${orders.orderStatus eq '1'}">주문 접수중</c:if>
           <c:if test="${orders.orderStatus eq '2'}">주문 거절</c:if>
           <c:if test="${orders.orderStatus eq '3'}">픽업 준비중</c:if>
           <c:if test="${orders.orderStatus eq '4'}">주문 취소</c:if>
           <c:if test="${orders.orderStatus eq '5'}">픽업 완료</c:if>
           </td>
         <%--   <td><div class="reply_button_wrap">
               <button value="${orders.orderNo}">리뷰 작성</button>
            </div>
         </td> --%>
         </tr>
          </c:forEach>      
          </tbody>
 
               </table>
            </div>
            <div class="text-center">
               <!-- PageNavigation Start... -->
               <jsp:include page="../common/pageNavigator_new.jsp" />
               <!-- PageNavigation End... -->
            </div>

         </div>
      </div>
   </section>
   <!--   Blog Section End -->

   <!—  Footer Begin —>
   <jsp:include page="../layout/footer.jsp" />
   <!— Footer End —>

</body>

   
</html>