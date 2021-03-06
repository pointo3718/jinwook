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

.id_ok {
   color: #7fad39;
   display: none;
   font-size: 10px;
}

.id_already {
   color: red;
   display: none;
   font-size: 10px;
   text-align: left;
}

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

label {
   font-size: 15px;
   justify-content: top;
   text-align: left;
   display: flex;
   align-items: left;
}

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
</style>

<script type="text/javascript">




   /*<![CDATA[*/
   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }

   var storeNo = $("input[id='storeNo']").val();
   /*]]>*/


  
   
////////////////////////////////수정 시작///////////////////////////////////////
   function fncUpdateUser() {
      var password=$("input[name='password']").val();
      
      if(password == null || password.length <1 || password == " "){
         alert("비밀번호를 입력하세요.");
         return;
      }
   
   
   
   
   
   $("#confirmPw").attr("method" , "POST").attr("action" , "/user/confirmPasswordC").submit();   
}

   function confirm() {
      location.href="/user/confirmPasswordViewC?userId=${user.userId}"
   }

   
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


                     <div class="getStoreNo"></div>

                  </div>

               </div>

            </div>

            <!-- 개인 정보 수정 Start -->
            <div>
               <h4 class="text-left">
                  <strong>개인 정보 수정</strong>

               </h4>
               <hr style="height: 20px;">
               <h5 class="text-left">
                  <strong>비밀번호 확인</strong>
               </h5>
               <a>고객님의 정보를 보호하기 위해 비밀번호를 확인합니다.</a>
               <hr size="10px">


               <table class="table table-hover"
                  style="width: 730px; heigh: 300px;">

                  <form class="form-horizontal" id="confirmPw">


                     <div class="form-group row">
                        <label for="colFormLabel"
                           class="col-sm-3 col-form-label col-form-label">아이디</label>
                        <div class="col-sm-6">
                           <input type="text" name="userId"
                              class="form-control form-control" id="userId"
                              style="background-color: white; border: none;"
                              value="${user.userId}" readonly>
                        </div>
                     </div>

                     <div class="form-group row">
                        <label for="colFormLabel"
                           class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                        <div class="col-sm-6">
                           <input type="password" name="password"
                              class="form-control form-control" id="password" value="">
                        </div>
                     </div>


                  </form>


               </table>

               <!--비밀번호 확인 Start-->
               <hr style="height: 20px;">

               <div class="text-center">
                  <button type="button" id="button11" class="site-btn"
                     style="border-radius: 4px;" onClick="fncUpdateUser()">
                     확인</button>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- ceoLeft Section End -->
   <!-- Blog Section End -->

   <!-- Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->

   <script type="text/javascript">
   
   //======페이지 이동 상점번호 받아오기=========//
     $(function() {
            getStoreNo();
         });
      

         function getStoreNo() {
                 
               var userId = $("#userId").val();
            
               var uri = "/store/getStoreNo/"+userId
               

               $.get(uri, function(response) { 
                  
                     var getStoreNoHtmlBody = "";
                     
                     $(response.getStoreNo).each(function(idx,store) {              

                        getStoreNoHtmlBody += `
 
                     <div class="list-group text-center" style="font-size: 15px;">
                     <button type="button"
                        class="list-group-item list-group-item-action"
                        aria-current="true"><a href="/orders/getOrdersListCeo" style="color:black">주문 내역</button>
                     <button type="button"
                        class="list-group-item list-group-item-action"><a href="/store/updateStore?storeNo=\${store.storeNo}" style="color:black">상점 정보
                        수정</button>
                     <button type="button"
                        class="list-group-item list-group-item-action" class="addStore">
                        <span class="addStore"><a href="/user/confirmPasswordViewC?userId=${sessionScope.user.userId}" style="color:black">개인 정보 수정</span>
                     </button>
                     <button type="button"
                        class="list-group-item list-group-item-action">
                        <span class="deleteStore"><a href="/store/addStoreProduct?storeNo=\${store.storeNo}" style="color:black"> 상품 등록</span>
                     </button>
                     <button type="button"
                        class="list-group-item list-group-item-action">
                        <span class="refundStore"><a href="/request/addRequestAd?storeNo=\${store.storeNo}" style="color:black"> 광고 등록</span>
                     </button>
                     <button type="button"
                        class="list-group-item list-group-item-action">
                        <span class="adStore"><a href="/request/getRequestAdStoreList?storeNo=\${store.storeNo}&userId=${sessionScope.user.userId}" style="color:black"> 내가 한 요청</span>
                     </button>
                     <button type="button"
                        class="list-group-item list-group-item-action">
                        <span class="adStore"><a href="/store/getStoreWallet?storeNo=\${store.storeNo}" style="color:black"> 지갑</span>
                     </button>
                     <button type="button"
                        class="list-group-item list-group-item-action"><a href="/store/getStore?storeNo=\${store.storeNo}" style="color:black">내 상점 가기</button>
                     <button type="button"
                        class="list-group-item list-group-item-action"><a href="/board/getBoardInquiryList" style="color:black">1:1
                        문의내역</button>
                  </div>

                         
                            
                        `;
                     });
                     
                     
                     $(".getStoreNo").html(getStoreNoHtmlBody);
                     //$(".userlisthead").html(blacklistHtmlBody);
                  
               }, "json");

         }     
     
</script>

</body>

</html>