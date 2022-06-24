<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   
   <script src="https://code.jquery.com/jquery-latest.min.js"></script>
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
     body {
            padding-top : 0px;
        }
        
     .rating svg:nth-chiled(-n+3) {
     	color:#f05522;
     }   
    </style>
<script type="text/javascript">
    /*<![CDATA[*/

    function movePage(uri, queryString) {
       location.href = uri + queryString;
    }

    /*]]>*/
    
    </script>
</head>
<body>

<form class="form-horizontal" name="getOrdersList">
<!-- Header Begin -->
<%--    <jsp:include page="../layout/top.jsp" /> --%>
   <!-- Header End -->
   
   <h2 class="text-center">주문내역</h2>

   <table class="table table-hover table-striped" >
         <br><br><br><br>

         <!-- 리뷰 div -->
         <!-- 리뷰 div -->

         <thead>
          <tr>
            <th align="center">주문번호</th>
            <th align="left" >주문날짜</th>
            <th align="left" >상품사진</th>
            <th align="left">상품이름</th>
            <th align="left">주문금액</th>
            <th align="left">픽업시간</th>
            <th align="left">주문현황</th>
            <th align="left">임시 </th>
          </tr>
       </thead>
        
      <tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="orders" items="${getOrdersList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center" value="${orders.orderNo}">${orders.orderNo}</td>
           <td align="left"><fmt:formatDate value="${orders.orderDate}" dateStyle="full"/></td>
           <td align="left">${orders.product.prodImg}</td>
           <td align="left">${orders.product.prodName}</td>
           <td align="left">${orders.orderPrice}</td>
           <td align="left"><fmt:formatDate value="${orders.pickupTime}" type="time" pattern="a hh:mm"/></td>
           <td align="left">
           <c:if test="${orders.orderStatus eq '1'}">주문 접수중</c:if>
           <c:if test="${orders.orderStatus eq '2'}">주문 거절</c:if>
           <c:if test="${orders.orderStatus eq '3'}">픽업 준비중</c:if>
           <c:if test="${orders.orderStatus eq '4'}">주문 취소</c:if>
           <c:if test="${orders.orderStatus eq '5'}">픽업 완료</c:if>
           </td>
         </tr>
          </c:forEach>
            
    </tbody>
      
</table>
</form>

<jsp:include page="../common/pageNavigator_new.jsp"/>
<%-- <jsp:include page="../layout/footer.jsp" /> --%>
</body>
</html>