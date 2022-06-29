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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
            <c:forEach var="orders" items="${getOrders}" begin="0" end="0">
            	<div class="top1" style="font-size:18px;">
					<div style="float: left;">
						<strong class="text-left">주문내역 상세</strong>
					</div>	
					<div class="text-right" style="float: right;">
					
					
						<strong class="text-right" style="text-align: right; align-items: right;">${orders.store.storeName}</strong>
						
 					</div>
 					<br>           	
            	</div>
            	<div class="top2">
					<div style="float:left;"><strong>주문번호 : ${orders.orderNo}</strong></div>            	
            		<div style="float:right;"><strong>${orders.orderDate}(<fmt:formatDate value="${orders.pickupTime}" type="time" timeStyle="short"/>)</strong></div>
            	</div>
				</c:forEach>
				<table class="table table-hover" style="width: 730px; heigh: 300px; font-size: small; ">
					<thead>
						<tr>
					        <th align="left">상품이름</th>
						    <th align="left">상품가격</th>
						    <th align="left">상품수량</th>
						    <th align="left">상품설명</th>
						    <th align="left">총액</th>
						</tr>
					</thead>	
			        
					<tbody>
						<c:forEach var="orders" items="${getOrders}">
							<tr>
								<td align="left">${orders.product.prodName}</td>
								<td align="left">${orders.product.price}</td>
								<td align="left">${orders.prodCount}</td>
								<td align="left">${orders.product.prodInfo}</td>
								<td align="left">${orders.product.price*orders.prodCount}</td>
				        	</tr>
						</c:forEach>    
					</tbody>
				</table>
				<hr>
				<div>
				<c:forEach var="orders" items="${getOrders}" begin="0" end="0">
					<div>
						<div class="buyer col-sm-4" style="float:left;"><strong style="font-size:18px;">구매자 정보</strong>
							<div style="font-size:14px;">구매자 이름 : ${orders.buyerName}</div>
							<div style="font-size:14px;">구매자 전화번호 : ${orders.buyerPhone}</div>
							<div style="font-size:14px;">요청사항 : ${orders.orderReq}</div>
							<div style="font-size:14px;">픽업시간 : <fmt:formatDate value="${orders.pickupTime}" type="time" timeStyle="short"/></div>						
						</div>
						<%--  <c:if test="${role==사용자}"> --%>
						<div class="buyer col-sm-2" style="float:left; font-size:15Spx;">
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문 금액<div class="text-center">${orders.orderPrice}</div>
						</div>
						<div class="buyer col-sm-2" style="float:left; font-size:15px;">
						<br>쿠폰할인 금액<div>${orders.coupon.couponType}</div>
						</div>
						<div class="buyer col-sm-2" style="float:left; font-size:15px;">
						<br>회원등급 할인<div value="${user.grade}"></div>
							                               	<c:choose>
										<c:when test="${user.grade=='프랜즈'}">
											<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${orders.orderPrice*0.01}"/>${total}원</td>
											<input type="hidden" value=${"total"}>
										</c:when>
									    <c:when test="${user.grade=='패밀리'}">
											<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${orders.orderPrice*0.03}"/>${total}원</td>
									    	<input type="hidden" value=${"total"}>
									    </c:when>
									    <c:when test="${user.grade=='퍼스트'}">
									    	<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${orders.orderPrice*0.05}"/>${total}원</td>
									    	<input type="hidden" value=${"total"}>
									    </c:when>
										<c:when test="${user.grade=='일반'}">
								    	<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${orders.orderPrice*0}"/>${total}원</td>
									    	<input type="hidden" value=${"total"}>
									    </c:when>
								     </c:choose>
						</div>
						<div class="buyer col-sm-2" style="float:left; font-size:15px;">
						<br>결제금액<div value="${orders.finalPrice }">${orders.orderPrice-total}</div>
						</div>
							
						
						<%-- </c:if>
						<%--  <c:if test="${rola==사장님}">
						<div class="buyer col-sm-2" style="float:left; font-size:15Spx;">
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문 금액<div class="text-center">${orders.orderPrice}</div>
						</div>
						<div class="buyer col-sm-3 text-right" style="float:left; font-size:15px; ">
						<br>
							<button class="site-btn" style="padding-left: 5px; padding-right: 5px; width: 80px;height: 36px; font-size:17px;">주문수락</button>
						</div>
						<div class="buyer col-sm-3" style="float:left; font-size:15px;">
						<br>
							<button class="site-btn" style="padding-left: 5px; padding-right: 5px; width: 80px;height: 36px; font-size:17px;">주문거절</button>
						</div>
						
						</c:if>  --%>    
					</div>
				</c:forEach>
				</div>
				<div>
				<br><br><br>
					<input type="hidden" value="${orders.orderStatus}" id="orderStatus">
					<button class="site-btn" style="padding-left: 5px; padding-right: 5px; width: 80px; height: 36px; font-size:17px; float:right; padding-top: 0px;padding-bottom: 0px; margin-right: 33px;" onclick="updateOrdersStatus(this)">주문거절</button>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function updateOrdersStatus(e){
			
			const orderStatus = ${"#orderStatus"}
			
			
		}
	</script>
	

	<!-- Footer Begin -->   
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End  -->
</body>

   
</html>