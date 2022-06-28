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
<title>상점 상세</title>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 

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

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 수량 버튼 -->

<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
   /*<![CDATA[*/
</script>

<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}

.qty .count {
   color: #000;
   display: inline-block;
   vertical-align: top;
   font-size: 25px;
   font-weight: 700;
   line-height: 30px;
   padding: 0 2px;
   min-width: 35px;
   text-align: center;
}

.qty .plus {
   cursor: pointer;
   display: inline-block;
   vertical-align: top;
   color: white;
   width: 30px;
   height: 30px;
   font: 30px/1 Arial, sans-serif;
   text-align: center;
   border-radius: 50%;
}

.qty .minus {
   cursor: pointer;
   display: inline-block;
   vertical-align: top;
   color: white;
   width: 30px;
   height: 30px;
   font: 30px/1 Arial, sans-serif;
   text-align: center;
   border-radius: 50%;
   background-clip: padding-box;
}

div {
   text-align: center;
}

.minus:hover {
   background-color: #717fe0 !important;
}

.plus:hover {
   background-color: #717fe0 !important;
}
/*Prevent text selection*/
span {
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
}

input {
   border: 0;
   width: 2%;
}

nput::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
   -webkit-appearance: none;
   margin: 0;
}

input:disabled {
   background-color: white;
}

.imgborder {
   border: 15px solid #F2F2F2;
   border-radius: 10px;
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
   align-items: flex-start;
   justify-content: center;
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

.modal-body {
	text-align: left;
}
</style>


<script type="text/javascript">
   //===url 공유====//

   function clip() {

      var url = '';
      var textarea = document.createElement("textarea");
      document.body.appendChild(textarea);
      url = window.document.location.href;
      textarea.value = url;
      textarea.select();
      document.execCommand("copy");
      document.body.removeChild(textarea);
      alert("URL이 복사되었습니다.")
   }

   //======장바구니===========//

   function fncAddOrdersCart(e) {
      const prodNo = $(e).data("value");
      const storeNo = $("#stoNo").data("valuese");
      const storeName = $("#stoName").data("values");
      //const prodCount = prodCount;
      const prodCount = $(e).parent().parent().parent().parent().find(".product__item__text").find(".count").val();
      console.log(prodCount)
      const passdata = {
         'prodNo' : prodNo,
         'storeNo' : storeNo,
         'storeName' : storeName,
         'prodCount' : prodCount
         /* 'prodCount' : prodCount */
      };
      console.log(storeNo);
      console.log(prodNo);
      console.log(storeName);
      console.log(prodCount);
      console.log(passdata);
      /* console.log(prodCount); */
      $.ajax({
         anyne : true,
         url : "/orders/addOrdersCart/" + prodNo+"/"+storeNo+"/"+storeName+"/"+prodCount,
         contentType : 'application/json',
         dataType : "text",
         success : function(result) {
            if (result != null) {
               swal("진욱이네","담기완료","success");
            }
         }
      });
   }
   
   $('#myModal').on('shown.bs.modal', function () {
	     $('#myInput').trigger('focus')
	   })

/* 	$(function() {
		$("button.btn.btn-success").on("click", function() {
			fncReviewList();
		});
	});	
   
   function fncReviewList() {
		alert(STORENO);
		$('input[name=storeNo]').attr('value', STORENO);
		$("#reviewForm").attr("method", "GET").attr("action", "/board/getReviewList").submit();
	}
	
   //storeno를 가져옴
	var STORENO;
	$(document).ready(function() {

		$('#reviewModal').on('show.bs.modal', function(event) {
			STORENO = $(event.relatedTarget).data('storeno');
			alert(STORENO);
		});
	}); */

</script>


</head>

<body>


   <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
   <!-- Header End -->

   <!-- 상점 상세 Begin -->

   <div class="container">

      <!--상점 정보 Begin-->
      <hr>
      <c:forEach var="store" items="${getStore1}" begin="0" end="0">

         <div class="row store">

            <div class="imgborder">
             <img src="/resources/static/${store.attach.orgFileName}"
                        onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
                     alt="My Image" width="500" height="500">
            </div>


            <table class="table table-borderless" style="width: 600px;"
               id="storeInf">
               <thead>
               
               	

                  <tr>
                     <td><span  id="stoNo" data-valuese="${store.storeNo}"></span></td>
                     <td></td>
                     <th scope="row" style="width: 108px;"><span
                        style="color: blsck; font-size: 20px">상점이름</span></th>
                     <td><span style="color: #2E2E2E; font-size: 15px"><strong id="stoName" data-values="${store.storeName}">${store.storeName}</strong></span></td>
                     <td><c:if test="${store.open==true}">
                           <button type="button" class="btn btn-light">상점오픈</button>
                        </c:if> <c:if test="${store.open==false}">
                           <button type="button" class="btn btn-light">상점마감</button>
                        </c:if></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: red; font-size: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
                           class="bi bi-telephone-fill"></i></span></th>
                     <td><span style="color: #2E2E2E; font-size: 15px"><strong>${store.storePhone}</strong></span></td>
                     <td>
                         <!-- Button trigger modal -->
						<!-- <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalScrollable">
  							<strong>상점후기</strong>
						</button> -->
						<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#reviewModal" data-storeno="${store.storeNo}">
  							상점후기
						</button>
						<!-- Button trigger modal --> 
					</td>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: blsck; font-size: 20px">상점주소</span></th>
                     <td><span style="color: #2E2E2E; font-size: 15px" ><strong>${store.storeAddr}</strong></span></td>
         

                     <td style="width: 94px;"><span
                        style="color: #FACC2E; font-size: 20px"><i
                           class="bi bi-star-fill"></i></span>&nbsp;&nbsp;&nbsp;<span
                        style="color: #2E2E2E; font-size: 20px"><strong>${store.orders.reviewStar}</strong></span></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: blsck; font-size: 20px">업종</span></th>
                     <td><span style="color: #2E2E2E; font-size: 15px"><strong>${store.storeType}</strong></span></td>
                     <td></td>
                     <td></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: blsck; font-size: 20px">영업시간</span></th>
                     <td><span style="color: #2E2E2E; font-size: 15px"><strong>${store.startTime}~${store.endTime}</strong></span></td>
                     <td></td>
                     <td></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: blsck; font-size: 20px">휴무일</span></th>
                     <td><span style="color: red; font-size: 15px"><strong>${store.holiday}</strong></span></td>
                     <td></td>
                     <td></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: blsck; font-size: 20px">상점소개</span></th>
                     <td colspan="2"><span style="color: #2E2E2E; font-size: 15px"><strong>${store.storeIntro}</strong></span></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                  </tr>

                  <tr>
                     <td></td>
                     <td></td>
                     <th scope="row"><span style="color: blsck; font-size: 20px"></span></th>
                     <td><span style="color: #2E2E2E; font-size: 15px"><strong></strong></span></td>
                     <td><span class="button gray medium"><a href="#"
                           onclick="clip(); return false;"><i class="bi bi-share"></i>&nbsp;&nbsp;공유</a></span></td>
                  </tr>

               </tbody>
            </table>
         </div>
   </div>

   </c:forEach>
   <!--상점 정보 End-->

   <hr />

   <!--  상품 목록 Begin-->
   <div class="row store"
      style="display: flex; align-items: flex-start; justify-content: flex-start; margin-left: 370px; margin-right: 370px;">
      <c:forEach var="store" items="${getStore}">


         <div class="col-lg-4 col-md-6 col-sm-6">
            <div class="product__item">
               <div class="product__item__pic set-bg">
                      <img src="/resources/static/${store.attach.orgFileName}"
                        onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
                     alt="My Image" width="300" height="300">
                  <ul class="product__item__pic__hover">
                     <li>
                     <c:choose>
                     <c:when test="${store.open==false}"></c:when>
                     <c:when test="${store.product.soldout==false}"></c:when>
                     <c:otherwise><i class="fa fa-cart-arrow-down" style="color:white; font-size:50px" data-value="${store.product.prodNo}" 
                        onClick="fncAddOrdersCart(this)" style="font-size:25px;"></i></c:otherwise>
                        </c:choose>                     
                     </li>
                  </ul>
               </div>
               <div class="product__item__text">
                  <h6>
                     <a href="#">${store.product.prodName}
                        (${store.product.prodInfo}) 원산지: ${store.product.prodOrign}</a>
                  </h6>
                  <h5>

                     <c:if
                        test="${store.product.soldout=='false' || store.open=='false' }">
                        <span style="color: darkgray;"><del>${store.product.price}원</del></span>
                        <span style="color: red; font-size: 15px;"><strong>구매불가</strong></span>
                     </c:if>

                     <c:if
                        test="${store.product.soldout=='true' && store.open=='true'}">
                           ${store.product.price}원
                        </c:if>

                     <div class="qty mt-5">
                        <span class="minus bg-dark" onClick="minusCount(this)" data-prodno="${store.product.prodNo}">-</span> 
                        <input type="number" class="count" id="count" name="count" data-count="${prodCount}" value="${store.cart.prodCount+0}"> 
                        <span class="plus bg-dark" onClick="plusCount(this)" data-prodno="${store.product.prodNo}">+</span>
                     </div>
                     
                     <script type="text/javascript">
                        function minusCount(e){
                           console.log(e);
                           const prodNo = $(e).data("prodno");
                           var prodCount = $(e).parent("div").find("input[name='count']").val();
                           prodCount--;
                           if(prodCount<0){
                              swal("진욱이네","상품수량은 0보다 작아질수 없습니다.");
                              return;
                           }
                           console.log(prodCount+"--");
                           $(e).parent("div").find("input[name='count']").val(prodCount);
                        }
                        
                        
                        function plusCount(e){
                           console.log(e);
                           const prodNo = $(e).data("prodno");
                           var prodCount = $(e).parent("div").find("input[name='count']").val();
                           prodCount++;
                           console.log(prodCount+"++");
                           $(e).parent("div").find("input[name='count']").val(prodCount);
                           console.log(prodCount);
                        }
                     </script>
                  </h5>
               </div>
            </div>
         </div>



      </c:forEach>
   </div>
   <!--  상품 목록 End-->
   </div>
   <!-- 상점 상세 End -->
   
<!-- Modal -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:1060;">
  <div class="modal-dialog modal-dialog-scrollable modal-lg" role="document" style="z-index:1060;">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalScrollableTitle">상점후기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <!-- modal body 시작 -->
      <div class="modal-body">
      <input type="hidden" id="storeNo" name="storeNo" value=""/>
		<!-- Modal body 끝 -->
                        <!-- List Table Start -->
            <div>

               <table class="table table-hover"
                  style="width: 730px; heigh: 300px; font-size: small;">

         <thead>
          <tr>
            <th align="left">리뷰 작성자</th>
            <th align="left" style="width:500px;">리뷰 내용</th>
            <!-- <th align="left" >작성일</th> -->
            <th align="center">별점</th>
          </tr>
       </thead>
        
      <tbody>
        <c:set var="i" value="0" />
        <c:forEach var="orders" items="${getReviewList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center">${orders.reviewWriter}</td>
           <td align="left">${orders.reviewContent}</td>
           <%-- <td align="left"><fmt:formatDate value="${orders.reviewDate}" dateStyle="full"/></td> --%>
           <td align="center">${orders.reviewStar}</td>
         </tr>
          </c:forEach>      
          </tbody>
 
               </table>
            </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫 기</button>
      </div>
      
    </div>
  </div>
</div>	 
	 </div>
	
   <!-- Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->

</body>

</html>