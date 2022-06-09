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
    /*<![CDATA[*/

    function movePage(uri, queryString) {
       location.href = uri + queryString;
    }

    /*]]>*/
    </script>
</head>
<body>

<form class="form-horizontal" name="getOrdersJpayList">
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">진욱이네</a>
   		</div>
   	</div>

   <table class="table table-hover table-striped" >
         <br><br><br><br>
       <thead>
          <tr>
            <th align="center">번호</th>
            <th align="left">충전/결제날짜</th>
            <th align="left">충전금액</th>
            <th align="left">결제금액</th>
            <th align="left">충전/결제여부</th>
            <th align="left">결제한 상점</th>
          </tr>
       </thead>
        
   	<tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="jpay" items="${getJpayList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center">${i}</td>
           <td align="left">${jpay.jpDate}</td>
           <td align="left">${jpay.chargePay}</td>
           <td align="left">${jpay.finalPrice}</td>
           <td align="left">${jpay.jpStatus}</td>
           <td align="left">${jpay.orders.store.storeName}</td>
         </tr>
          </c:forEach>
         	
    </tbody>
      
</table>


<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
</html>