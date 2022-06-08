<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

<script type="text/javascript">


	//==> �߰��Ⱥκ� : "����" Event ���� �� ó��
	$(function() {

		$("button").on("click", function() {
			self.location = "/product/updateProductView?prodNo=${product.prodNo}"
		});
		
	});
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">���� �ı�</h3>
	</div>
	
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>�� �� �� ��</strong></div>
			<div class="col-xs-7 col-md-5">${orders.store.storeName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${orders.user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>�ı� ����</strong></div>
			<div class="col-xs-7 col-md-5">${orders.reviewTitle}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>�ı� ����</strong></div>
			<div class="col-xs-7 col-md-5">${orders.reviewContent}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1"><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${orders.reviewDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>����</strong></div>
			<div class="col-xs-7 col-md-5">${orders.reviewStar}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" data-param="${product.prodNo}" class="btn btn-primary">��ǰ��������</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	
</body>

</html>