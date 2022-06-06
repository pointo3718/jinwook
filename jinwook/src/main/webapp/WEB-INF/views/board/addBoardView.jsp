<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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

<script type="text/javascript">

var rcpNo = ${recipe.rcpNo};
var userId = ${user.userId};

function updateRecipeReco() {
	$.ajax({
		type : "POST",
		url : "/board/updateRecipeReco",
		dataType : "json",
		data : {'rcpNo' : rcpNo, 'userId' : userId},
		error : function() {
			alert("통신 에러");
		},
		success : function(recoCheck) {
			if (recoCheck == 0) {
				alert("추천 완료!");
				location.reload();
			}
			else if (recoCheck == 1) {
				alert("추천 취소!");
				location.reload();
			}
		}
	});
}

</script>

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
			<div class="col-xs-7 col-md-5">${board.boardNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-3 col-md-1 "><strong>게시글 작성자</strong></div>
			<div class="col-xs-7 col-md-5">${w}</div>
		</div>
		
		<hr/>
		
 	</div>

<h1>Test Complete!</h1>

<div style="margin-right:1px;">
	<button type="button" class="btn btn-warning" id="reco_btn" onclick="updateRecipeReco(); return false;">추천 ${recipe.getRecommendCount}</button>
	<button type="button" class="btn btn-danger" id="hate_btn">비추천</button>
</div>
	
</body>

</html>