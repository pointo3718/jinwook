<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 4px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
function fncAddPurchase() {
		
	/* document.addPurchase.submit(); action="/purchase/addPurchase*/
	$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
}
	$(function(){
		$( "button" ).on("click" , function() {
			fncAddPurchase();
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

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 구 매</h1>
<form class="form-horizontal" name="addOrders">

 <input type="hidden" name="userId" value="${userId}" /> 
		주문자 정보
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">이 름</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="buyerName" name="buyerName" value="${user.userName}">
		       <span id="helpBlock" class="help-block">
		      </span>
		     </div>
		</div>

		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">전 화 번 호</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="buyerPhone" name="buyerPhone" value="${user.userPhone}">
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">픽업희망시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="pickupTime" name="pickupTime">분
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="orderReq" name="orderReq">
		    </div>
		  </div>
		</br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		상품 정보
		
		   <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 사진</label >
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id=prodImg name="prodImg" value="${cart.product.prodImg}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="prodName" name="prodName" value="${cart.product.prodName}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 설명</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="prodInfo" name="" value="${cart.product.prodInfo}" readonly>
		    </div>
		  </div>

		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 가격</label>
			<div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="Price" name="Price" value="${cart.product.Price}" readonly>
		    </div>
		</div>
	
		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품 수량</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="prodCount" name="prodCount" value="${cart.prodCount}" readonly>
		    </div>
		  </div>
		  </br>
		 결제 정보 

		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">총 상품 금액</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="orderPrice" name="orderPrice" value="${orders.orderPrice}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">쿠 폰</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="couponType" name="couponType">
		    </div>
		  </div>
	
		   <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">쿠폰 할인금액</label>
		     <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="couponDc" name="couponDc" readonly>
		     </div>
		   </div>

			<div class="form-group">
		     <label for="price" class="col-sm-offset-1 col-sm-3 control-label">회원 등급할인</label>
		      <div class="col-sm-4">
		       <input type="text" class="ct_input_g" id="grade" name="grade" value="${user.grade}" readonly>
		      </div>
		    </div>

			<div class="form-group">
		     <label for="price" class="col-sm-offset-1 col-sm-3 control-label">총 결제금액</label>
		      <div class="col-sm-4">
		       <input type="text" class="ct_input_g" id="finalPrice" name="finalPrice" value="${orders.finalPrice}" readonly>
		      </div>
		    </div>


		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		      <button type="button" class="btn btn-primary"  >주&nbsp;문	</button>
			</div>
		</div>
		</form>

</body>
</html>
