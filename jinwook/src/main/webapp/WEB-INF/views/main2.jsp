<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
   
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 占쎄낀���띰옙��占� : ����占쏙옙��������占� ������嶺�占썲��占� �띰옙���뱄옙洹�占썲������ ������������ ����占쎌�㏆옙 :  ��占쏙옙源������������뱄옙源��� ������, ������ ������������-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ������������������ ����占쏙옙���⑼옙諭�����占� http://getbootstrap.com/getting-started/  嶺���占쏙옙占� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
     </div>
    </div>

	<!-- 嶺���占쏙옙占� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
      <h3>강진욱 홍선경 최인규 문수진 송지호</h3>
        <p>진욱이네입니다.</p>
  	 	<h3>할 수 있다.</h3>
         <h3>비트캠프 217기</h3>
         <p>6월 30일까지 화이팅.</p>
  	 </div>

</body>

</html>