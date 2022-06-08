<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<meta charset="UTF-8">
   
   <!-- 참조 : http://getbootstrap.com/css/   참조 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
     body {
            padding-top : 50px;
        }
    </style>
	<script type="text/javascript">
	function fncAddOrders() {
		
		/* document.addOrders.submit(); action="/orders/addOrders*/
	$("form").attr("method" , "GET").attr("action" , "/orders/addOrders").submit();
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

<form class="form-horizontal" name="addPurchase">

   <table class="table table-hover table-striped" >
         
       <thead>
          <tr>
            <th align="center">상품사진</th>
            <th align="left" >상품이름</th>
            <th align="left">상품설명</th>
            <th align="left">상품가격</th>
            <th align="left">상품수량</th>
            <th align="left">상품별총액</th>
          </tr>
       </thead>
        
   	<tbody>
      
        <c:set var="i" value="0" />
        <c:set var="total" value="0" />
        <c:forEach var="cart" items="${getCartList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center">${cart.product.prodImg}</td>
           <td align="left">${cart.product.prodName}</td>
           <td align="left">${cart.product.prodInfo}</td>
           <td align="left">${cart.product.price}</td>
           <td align="left">${cart.prodCount}</td>
           <td align="left">${cart.product.price*cart.prodCount}</td>
           <c:set var="total" value="${total + (cart.product.price*cart.prodCount) }" />
         </tr>
          </c:forEach>
         	
    </tbody>
      
</table>
<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">총 상품 금액</label>
		    <div class="col-sm-4">
		      <input type="text" class="ct_input_g" id="orderPrice" name="orderPrice" value="${total}" readonly>
		    </div>
		  </div>

  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <a class="btn btn-primary btn" href="#" role="button">더담으러가기</a>
		      <button type="button" class="btn btn-primary"  >주문하기</button>
			</div>
		</div>
		
</form>
     <!--  table End /////////////////////////////////////-->
     
      
    <!--  화면구성 div End /////////////////////////////////////-->  
    
    <!-- PageNavigation Start... -->
   <!--  PageNavigation End... -->    

</body>

</html>
    