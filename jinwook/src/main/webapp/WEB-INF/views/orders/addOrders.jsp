<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

	<style type="text/css">
	*{font-family: 'Noto Sans KR', sans-serif;}
	
	.checkout__input {
	width: 550px;
	}
	
	.row{
   	display: flex;
    justify-content: center;
  	 align-items: flex-start;
	}
	</style>
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function fncAddOrders() {
	
	const name=$("input[name='buyerName']").val();
	const phone=$("input[name='buyerPhone']").val();
	const pick=$("input[name='plusTime']").val();
	const storeNo=$("input[name='storeNo']").val();
	const couponNo=$("#couponNo").val();
	if(name == null || name.length <1){
		swal("진욱이네","이름은 반드시 입력하셔야 합니다.","error");
			name.focus();
			return; 
	}	
	
	if(phone == null || phone.length <1){
 		swal("진욱이네","전화번호는 반드시 입력하셔야 합니다.","error", {
			  button: "확인",
			  closeOnClickOutside: false,
			});
		phone.focus();
		return false; 
	}
	
	if(pick == null || pick.length <1){
		swal("진욱이네","픽업시간은 반드시 입력하셔야 합니다.", "error",).function(확인=>{
			pick.focus();
		    return false;
		});
	}
	/* document.addPurchase.submit(); action="/purchase/addPurchase*/
	$("form").attr("method" , "POST").attr("action" , "/orders/addOrders").submit();
	
}
	$(function(){
		$( "#order" ).on("click" , function() {
			fncAddOrders();
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
                        <h2>주문/결제</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>주문/결제</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
        <span class="addOrdersstoreName" style="align-items: right;">
            	<c:forEach var="cart" items="${getCartList}" begin="0" end="0" >
				<strong style="font-size: 30px; align-items: right; text-align: right;">${cart.storeName}</strong>
				<input type=hidden id="storeNo" name="storeNo" value="${cart.storeNo}">
				</c:forEach><br><br>
				</span>
            <div class="row">
            </div>
            <div class="checkout__form">
                <h4 style="font-size: 22px;">구매자 정보</h4>
                <form action="#" >
                    <div class="row" >
                        <div class="col-lg-6 col-md-6">
                           <div class="checkout__input" >
                           		<p>구매자 이름<span>*</span></p>
                            	<input type="text" name="buyerName" value="${user.userName}" style="color: black;">
                            </div>
                            <div class="checkout__input" >
                                <p>구매자 전화번호<span>*</span></p>
                                <input type="text" name="buyerPhone" value="${user.phone}" style="color: black;">
                            </div>
                            <div class="checkout__input">
                                <p>픽업희망시간<span>*</span></p>
                                <input type="number" name="plusTime" placeholder="분으로 숫자만 입력해주세요" class="checkout__input__add" style="color: black;" Min = "1" max="120" oninput="validity.valid||(value='');">
                            </div>
                            <div class="checkout__input">
                                <p>요청사항</p>
                                <input type="text" name="orderReq" placeholder="예)감자 10개를 5개씩 나눠 담아주세요." style="color: black;">
                            </div>
                            <div class="checkout__input">
                                <p>쿠폰<span></span></p>
                                <select size="10" name="couponType" id="couponType" style="color: black;" data-coupon="${coupon.couponDc}" name="couponNo"onchange="selectBoxChange(this);"> 
                                <option id="chargeType" selected>할인쿠폰을 선택하세요</option>
                                	<c:if test="${couponList != null}">
	                                    <c:forEach var="coupon" items="${couponList}">
                                    	<option value="${coupon.couponType}">
                                    	<c:if test="${coupon.couponType == '1'}">
                                    	<c:set var="cpNo" value="${coupon.couponNo}"/>
                                    	<c:set var="cpDc" value="${coupon.couponDc}"/>
                                    		고객님의 회원가입을 축하합니다.(회원가입 쿠폰 <fmt:formatNumber value="${coupon.couponDc*100}" />%할인)
                                    		<%-- <input type=hidden value="${coupon.couponNo}"> --%>
                                    	</c:if>
                                    	<c:if test="${coupon.couponType == '2'}">
                                    	<c:set var="cpNo" value="${coupon.couponNo}"/>
                                    	<c:set var="cpDc" value="${coupon.couponDc}"/>
                                    		고객님의 첫구매를 축하합니다.(첫구매 쿠폰 <fmt:formatNumber value="${coupon.couponDc*100}" />%할인)
                                    		<%-- <input type=hidden value="${coupon.couponNo}"> --%>
                                    	</c:if>
                                    	<c:if test="${coupon.couponType == '3'}">
                                    	<c:set var="cpNo" value="${coupon.couponNo}"/>
                                    	<c:set var="cpDc" value="${coupon.couponDc}"/>
                                    		고객님의 생일을 축하합니다.(생일축하 쿠폰 <fmt:formatNumber value="${coupon.couponDc*100}" />%할인)
                                    		<%-- <input type=hidden value="${coupon.couponNo}"> --%>
                                    	</c:if>
                                    	<c:if test="${coupon.couponType == '4'}">
                                    	<c:set var="cpNo" value="${coupon.couponNo}"/>
                                    	<c:set var="cpDc" value="${coupon.couponDc}"/>
                                    		고객님께 소중한 쿠폰 배달왔습니다.(추천인 쿠폰 <fmt:formatNumber value="${coupon.couponDc*100}" />%할인)
                                    		<%-- <input type=hidden value="${coupon.couponNo}"> --%>
                                    	</c:if>
                                    	</option>
                                    </c:forEach>
                                   </c:if>
                                </select>
                                <input type="hidden" id="couponNo" name="couponNo" value="${cpNo}">
                             	<script>
                             	/* var selectBoxChange = function(value){ */
                             	 function selectBoxChange(e){
                             	
									const va = e.value
									let finpr = $(e).parent().parent().parent().find("input[name='finalPrice2']").val();
									const ffinalprice =
									console.log(finpr)
									console.log(va)
                             	 	if(va ==="1"){
                             	 		$("#couponDc").text(parseInt("${cart.orders.orderPrice*0.20}")+"원");
                             	 		$("#finalPrice").text((finpr-"${cart.orders.orderPrice*0.20}")+"원");
                             	 		finpr=finpr-"${cart.orders.orderPrice*0.20}"
                             	 	}else if(va ==="2"){
                             	 		$("#couponDc").text(parseInt("${cart.orders.orderPrice*0.30}")+"원");
                             	 		$("#finalPrice").text((finpr-"${cart.orders.orderPrice*0.30}")+"원");
                             	 		finpr=finpr-"${cart.orders.orderPrice*0.30}"
                             	 	}else if(va ==="3"){
                             	 		$("#couponDc").text(parseInt("${cart.orders.orderPrice*0.30}")+"원");
                             	 		$("#finalPrice").text((finpr-"${cart.orders.orderPrice*0.30}")+"원");
                             	 		finpr=finpr-"${cart.orders.orderPrice*0.30}"
                             	 	}else if(va ==="4"){
                             	 		$("#couponDc").text(parseInt("${cart.orders.orderPrice*0.15}")+"원");
                             	 		$("#finalPrice").text((finpr-"${cart.orders.orderPrice*0.15}")+"원");
                             	 		finpr=finpr-"${cart.orders.orderPrice*0.15}"
                             	 	}
                             	 	console.log(finpr)
                             	 	$('input[name=finalPrice]').attr('value',finpr);
                             	}
                             	
                             	</script>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="checkout__order">
                                <h4>고객님 주문리스트</h4>
                                <div class="row">
                                <div class="checkout__order__products col-sm-4" style="text-align: left;">상 품</div>
                                <div class="checkout__order__products col-sm-4" style="text-align: center; ">수 량</div>
                                <div class="checkout__order__products col-sm-4" style="text-align: right;">총 액</div> 
                                <ul>
                                <c:forEach var="cart" items="${getCartList}">
                                	<input type=hidden id="storeNo" name="storeNo" value="${cart.storeNo}">
                                    <div class="col-sm-4" style="text-align: left; font-size:18px; width: 180px;">${cart.product.prodName}</div>
                                    <div class="col-sm" hidden="price" value="${cart.product.price}"></div>
                                    <div class="col-sm-4" style="text-align: center; font-size:18px;" >${cart.prodCount}</div>
                                    <input type="hidden" value="${cart.prodCount}" name="cart.prodCount">
                                    <div class="col-sm-4" style="text-align: right; font-size:18px;">${cart.product.price*cart.prodCount}원</div>
                                	<c:set var="total" value="${total + (cart.product.price*cart.prodCount) }" />
                                </c:forEach>
                                </ul>
                                </div>
                                <div class="checkout__order__subtotal">총상품금액 <span id="orderPrice" data-oprice="${total}">${total}원</span></div>
                                <input type="hidden" name="orderPrice" value="${cart.orders.orderPrice}">
                                <div class="checkout__order__total"> 쿠폰할인	<span id="couponDc">${total1}원</span></div>
                                <div class="checkout__order__total">회원등급할인<span id="grade" name="grade" value="${user.grade}">
	                               	<c:choose>
										<c:when test="${user.grade=='프랜즈'}">
											<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${cart.orders.orderPrice*0.01}"/>${total}원</td>
										</c:when>
									    <c:when test="${user.grade=='패밀리'}">
											<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${cart.orders.orderPrice*0.03}"/>${total}원</td>
									    </c:when>
									    <c:when test="${user.grade=='퍼스트'}">
									    	<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${cart.orders.orderPrice*0.05}"/>${total}원</td>
									    </c:when>
										<c:when test="${user.grade=='일반'}">
								    	<td align="left" ><fmt:formatNumber var="total" pattern="###" value="${cart.orders.orderPrice*0}"/>${total}원</td>
									    </c:when>
								     </c:choose>
							     </span></div>
								 <div class="checkout__order__total" > 실결제금액<span id=finalPrice style="color: black;">${cart.orders.orderPrice-total}원</span></div>
								 <input type=hidden name="finalPrice" value="${cart.orders.orderPrice-total}">
								 <input type=hidden name="finalPrice2" value="${cart.orders.orderPrice-total}">
                                <button type="submit" id="order" class="site-btn" value="${cart.cartStatus}" >주문하기</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

   <!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->

</body>

</html>