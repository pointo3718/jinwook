<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
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
	
	<!--  CSS 異�媛� : �대��� ��硫� 媛�由щ�� ���� �닿껐 :  二쇱��泥�由� ��, �� ����-->
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

	<!--  ������ �댁�⑹�� http://getbootstrap.com/getting-started/  李몄“ -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
     </div>
    </div>

	<!-- 李몄“ : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <h3>���대���뱀�� �대��寃� 留�����.</h3>
        <p>"�ㅻ�� ���� 遺����� �몄��媛� �닿� ��紐� 蹂대�� ��媛��� 蹂대났�대��."</p>
  	 	<h3>"... �λ꼍�� ���ㅽ��寃� ����吏� ���� �щ���ㅼ�� 嫄몃�щ�대�ㅺ� 議댁�ы�⑸����. �λ꼍��. �뱀���� ������ '�ㅻⅨ' �щ���ㅼ�� 硫�異�寃� ���ㅺ� 嫄곌린 ���� 寃��댁���."</h3>
         <h3>��愿��ㅻ��</h3>
         <p>��蹂듯�� �띠�� 鍮�寃곗��.</p>
         <p>醫������� �쇱�� ���� 寃��� ��由щ��,</p>
         <p>吏�湲� ���� �쇱�� 醫������� 寃�������.</p>
  	 </div>

</body>

</html>