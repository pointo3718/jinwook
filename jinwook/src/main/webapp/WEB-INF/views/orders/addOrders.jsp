<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
function fncAddOrders() {
		
	/* document.addPurchase.submit(); action="/purchase/addPurchase*/
	$("form").attr("method" , "POST").attr("action" , "/orders/addOrders").submit();
}
	$(function(){
		$( "button" ).on("click" , function() {
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

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">진욱이네</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">상 품 구 매</h1>
<form class="form-horizontal" name="addOrders">

 <input type="hidden" name="userId" value="${user.userId}" /> 
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
		      <input type="text" class="ct_input_g" id="buyerPhone" name="buyerPhone" value="${user.phone}">
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">픽업희망시간</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="plusTime" name="plusTime">분
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="orderReq" name="orderReq">
		    </div>
		  </div>
		</br>
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		상품 정보 -->
		
<table class="table table-hover table-striped" >
         
       <thead>
          <tr>
            <th align="center">상품사진</th>
            <th align="left" >상품이름</th>
            <th align="left">상품설명</th>
            <th align="left">상품가격</th>
            <th align="left">상품수량</th>
          </tr>
       </thead>
        
   	<tbody>
        <c:forEach var="cart" items="${getCartList}">
         <tr>
           <td align="center">${cart.product.prodImg}</td>
           <td align="left">${cart.product.prodName}</td>
           <td align="left">${cart.product.prodInfo}</td>
           <td align="left">${cart.product.price}</td>
           <td align="left">${cart.prodCount}</td>
         </tr>
          </c:forEach>
        
    </tbody>
     
</table>

		  </br>
		 결제 정보 

		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">총 상품 금액</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="orderPrice" name="orderPrice" value="${cart.orders.orderPrice}" readonly>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">쿠 폰</label>
		    <div class="col-sm-4">
		    <select class="ct_input_g" id="couponType" name="couponType">
		    
		    <option>선택안함</option>
		    <option value="couponType=0">첫가입</option>
		    <option value="couponType=1">첫구매</option>
		    <option value="couponType=2">생일</option>
		    <option value="couponType=3">추천인</option>
		    </select>
		    
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
		     
		       <c:choose>
			       <c:when test="${user.grade=='프랜즈'}">
			      	 <input type="text" class="ct_input_g" id="finalPrice" name="finalPrice"   value="${cart.orders.orderPrice*0.99}" readonly>
			      </c:when>
			      <c:when test="${user.grade=='패밀리'}">
			      	 <input type="text" class="ct_input_g" id="finalPrice" name="finalPrice" value="${cart.orders.orderPrice*0.97}" readonly>
			      </c:when>
			      <c:when test="${user.grade=='퍼스트'}">
			      	 <%-- <fmt:parseNumber var= "total" integerOnly= "true" value= " ${cart.orders.orderPrice*0.95} " /> --%>
			      	 <%-- <fmt:parseNumber type="total" maxFractionDigits="0" value= " ${cart.orders.orderPrice*0.95} " /> --%>
			      <td align="left"><fmt:formatNumber var="total" pattern="###" value="${cart.orders.orderPrice*0.95}"/></td>
			      	 <input type="text" class="ct_input_g" id="finalPrice" name="finalPrice" value="${total}" readonly>
			      </c:when>
			     <c:when test="${user.grade=='일반'}">
			      	 <input type="text" class="ct_input_g" id="finalPrice" name="finalPrice" value="${cart.orders.orderPrice}" readonly>
			      </c:when>
		      </c:choose>
		                 
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
