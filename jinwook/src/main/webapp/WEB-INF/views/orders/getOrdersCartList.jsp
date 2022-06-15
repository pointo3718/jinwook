<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>진욱이네 | Template</title>

   <!-- Google Font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">   
   
    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/style.css" type="text/css">
    
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style type="text/css">
   *{font-family: 'Noto Sans KR', sans-serif;}

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
      align-items: center;
      
   }
   </style>
   <script type="text/javascript">
   function fncDeleteOrdersCart(e) {
      if (!confirm('상품을 삭제하시겠어요?')) {
         return false;
      }
      
      console.log(e);
      const no = $(e).data("value");
       $.ajax({
            url : "/orders/deleteOrdersCart/"+no,
            dataType : "json",
            success : function(result){
               if(result != null){
                  alert("삭제완료");
                  self.location = "/orders/getOrdersCartList";
               }
            }
         
         });
      
   }
   
    $(function(){
      $( "#button" ).on("click" , function() {
         $("form").attr("method" , "GET").attr("action" , "/orders/addOrders").submit();
      }); 
   }); 
   $(function(){
      $("a[href='#' ]").on("click" , function() {
         history.go(-1);
      });
   });
   </script>
   
</head>

<body>
   <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
   <!-- Header End -->
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${path}/resources/static/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>장 바 구 니</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>장 바 구 니</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <form class="form-horizontal">
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product " >상 품</th>
                                    <th class="text-center" style="width: 700px;">상 품 설 명</th>
                                    <th class="text-center" style="width: 300px;">가 격</th>
                                    <th class="text-center" style="width: 200px;">상 품 수 량</th>
                                    <th class="text-center" style="width: 300px;">상 품 별 총 액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <!--  /////////////////////////////////////////////////// -->
                            <c:set var="i" value="0" />
                                  <c:set var="total" value="0" />
                                  <c:forEach var="cart" items="${getCartList}">
                                  <c:set var="i" value="${ i+1 }" />
                                <tr>
                                 <td hidden="cartNo" id="cartNo" name="cartNo" value="${cart.cartNo}">+cart.cartNo</td>
                                    <td class="shoping__cart__item">
                                        <img src="${path}/resources/static/img/cart/cart-1.jpg" style="margin-right: 30px;">
                                        <strong style="font-size: 20px;">${cart.product.prodName}</strong>
                                    </td>
                                    <td> <strong style="font-size: 20px;">${cart.product.prodInfo}</strong> </td>
                                    <td class="shoping__cart__price">
                                        ${cart.product.price} 원
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text"onchange="changeCount(this)" value="${cart.prodCount}" >
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        ${cart.product.price*cart.prodCount} 원
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close" onClick="fncDeleteOrdersCart(this)" data-value="${cart.cartNo}"></span>
                                    </td>
                                    <c:set var="total" value="${total + (cart.product.price*cart.prodCount) }" />
                                </tr>
                               </c:forEach>
                        </table>
                        <!--  /////////////////////////////////////////////////// -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn" role="button">더 담으로 가기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>주문 총액</h5>
                        <ul>
                            <li >주문 금액 <span>${total}</span></li>
                        </ul>
                        <a><button class="primary-btn" style="max-width: 100%; width: 477px;" 
                        " id="button" name="orderPrice" value="${total}">주문하기</button></a>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- Shoping Cart Section End -->

    <!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->

      <a href="/board/getRecipe?rcpNo=6">레시피</a> <hr>
      <a href="/board/addBoardInquiryView">1:1문의 등록(파일 업로드)</a> <hr>
      <a href="/orders/getOrdersList">주문내역</a> <hr>
      <a href="/orders/getOrdersJpayList">진욱페이내역</a> <hr>
      <a href="/orders/getOrdersNoticeList">알림내역</a> <hr>
      <a href="/store/getStore?storeNo=10000" class="primary-btn">SHOP</a><hr>
      <a href="/orders/addOrdersJpayPassword">진욱페이비밀번호등록창</a> <hr>
      <a href="/orders/addOrdersJpayCharge">충전창</a> <hr>
      <a href="/orders/listOrdersJpayCharge">금액설정창</a> <hr>
</body>

</html>