<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
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

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(()=>{
	$('#reco_btn').click(function() {	
		var rcpNo = ${recipe.rcpNo}
		var userId = ${recipe.user.userId};
		function updateRecipeReco() {
		
		$.ajax({
			type : "POST",
			url : "/board/updateRecipeReco",
			dataType : "json",
			data : {'rcpNo' : rcpNo, 'userId' : userId},
			error : function() {
				alert("��� ����");
			},
			success : function(recoCheck) {
				if (recoCheck == 0) {
					alert("��õ �Ϸ�!");
					location.reload();
				}
				else if (recoCheck == 1) {
					alert("��õ ���!");
					location.reload();
					}
				}
			});
		}
	});
})
	


</script>

</head>

<body>

	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">������ �� ��ȸ</h3>
	    </div>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>������ ����</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpTitle}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>������ ����</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpContent}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.user.userId}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>������ ���</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpIngredient}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>������ �����</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpThumb}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>������ �Ұ�</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpInfo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>��ȸ��</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpHits}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpDate}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>��ۼ�</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.commentCount}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>��</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpJjimCnt}</div>
		</div>
		<hr/>
		 <div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>��õ��</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.recommendCount}</div>
		</div>
		<hr/>

</div>

	<button type="button" class="btn btn-warning" id="reco_btn" onclick="updateRecipeReco()">��õ${recipe.recommendCount}</button>
	<button type="button" class="btn btn-danger" id="hate_btn">����õ</button>

	
</body>

</html>