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

<form class="form-horizontal" name="getOrdersNoticeList">
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/user/index">진욱이네</a>
   		</div>
   	</div>

   <table class="table table-hover table-striped" >
         <br><br><br><br>
       <thead>
          <tr>
            <th align="center">번호</th>
            <th align="left">알림날짜</th>
            <th align="left">보낸사람아이디</th>
            <th align="left">받는사람아이디</th>
            <th align="left">알림내용</th>
            <th align="left">상점이름</th>
            <th align="left">구매자이름</th>
          </tr>
       </thead>
        
   	<tbody>
      
        <c:set var="i" value="0" />
        <c:forEach var="notice" items="${noticeList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center">${i}</td>
           <td align="left">${notice.notiDate}</td>
           <td align="left">${notice.sendId}</td>
           <td align="left">${notice.receiveId}</td>
           <td align="left">${notice.notiContent}</td>
           <td align="left">${notice.storeName}</td>
           <td align="left">${notice.buyerName}</td>
         </tr>	
          </c:forEach>
         	
    </tbody>
      
</table>


<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
</html>