<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<meta charset="EUC-KR">
	
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>

</head>

<body>

	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">Test Complete!</h3>
	       <h5 class="text-muted">상품을 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>게시글 제목</strong></div>
			<div class="col-xs-7 col-md-5">${t}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>게시글 내용</strong></div>
			<div class="col-xs-7 col-md-5">${board}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>게시글 작성자</strong></div>
			<div class="col-xs-7 col-md-5">${w}</div>
		</div>
		
		<hr/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
	
</body>

</html>