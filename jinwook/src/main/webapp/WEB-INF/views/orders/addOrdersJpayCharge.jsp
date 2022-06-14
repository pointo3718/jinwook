<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modal</title>
    <style>
         #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>모달창 예제</h2>
        <div id="">모달창 예제 입니다.</div>
    </div>

    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <h2>모달</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">1. 첫번쨰 공지사항</div>
            <div class="content">2. 두번째 공지사항</div>
            <div class="content">3. 세번째 공지사항</div>
            <div class="content">4. 네번째 공지사항</div>
        </div>
    </div>

    <script>
        const modal = document.getElementById("modal")
        function modalOn() {
            modal.style.display = "flex"
        }
        function isModalOn() {
            return modal.style.display === "flex"
        }
        function modalOff() {
            modal.style.display = "none"
        }
        
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modalOff();
        })
    </script>
    
</body>
</html> --%>
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
            padding-top : 0px;
        }
     #buttons{
     border: 1px solid #7fad39;
			  color: #7fad39;
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
	
/* 	function addOrders(){
		$("form").attr("method" , "GET").attr("action" , "/orders/addOrders").submit();
	} */
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
		
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/user/index">진욱이네</a>
   		</div>
   	</div>
   	
   			<h2 class="text-center">장바구니</h2>
<br><br><br><br>
<form class="form-horizontal">
   <table class="table table-hover table-striped" >
         
       <thead>
          <tr>
            <th align="center">상품사진</th>
            <th align="left" >상품이름</th>
            <th align="left">상품설명</th>
            <th align="left">상품가격</th>
            <th align="left">상품수량</th>
            <th align="left">상품별총액</th>
            <th align="left"></th>
          </tr>
       </thead>
        
   	<tbody>
        <c:set var="i" value="0" />
        <c:set var="total" value="0" />
        <c:forEach var="cart" items="${getCartList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td hidden="cartNo" id="cartNo" name="cartNo" value="${cart.cartNo}">+cart.cartNo</td>
           <td align="center">${cart.product.prodImg}</td> //사진
           <td align="left">${cart.product.prodName}</td> //이름
           <td align="left">${cart.product.prodInfo}</td> //설명
           <td align="left">오후 5:55 2022. 6. 14.</td> //가격
           <td align="left">${cart.prodCount}</td> //수량
           <td align="left">${cart.product.price*cart.prodCount}</td> //별 총액
           <td align="left"><button data-value="${cart.cartNo}" id="buttons" type="button" class="btn btn-primary" onClick="fncDeleteOrdersCart(this)">X</button></td>
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
		      <a class="btn btn-outline btn" href="#" role="button">더담으러가기</a>
		      <button class="btn btn-outline" id="button" name="button" >주문하기</button>
			</div>
		</div>
</form>
		<br><br>
		<hr>
		<a href="/board/getRecipe?rcpNo=6">레시피</a> <hr>
		<a href="/board/addBoardInquiryView">1:1문의 등록(파일 업로드)</a> <hr>
		<a href="/orders/getOrdersList">주문내역</a> <hr>
		<a href="/orders/getOrdersJpayList">진욱페이내역</a> <hr>
		<a href="/orders/getOrdersNoticeList">알림내역</a> <hr>
		<a href="/store/getStore?storeNo=10000" class="primary-btn">SHOP</a><hr>
		<a href="/orders/addOrdersJpayPassword">진욱페이비밀번호등록창</a> <hr>
		<a href="/orders/addOrdersJpayCharge">충전창</a> <hr>
		<a href="/orders/listOrdersJpayCharge">금액설정창</a> <hr>
		
     <!--  table End /////////////////////////////////////-->
      
    <!--  화면구성 div End /////////////////////////////////////-->  
    
    <!-- PageNavigation Start... -->
   <!--  PageNavigation End... -->    

</body>

</html>
    