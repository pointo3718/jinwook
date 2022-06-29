<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>레시피 등록</title>

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

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 
<style>
*{font-family: 'Noto Sans KR', sans-serif;}

 .sticky {
     position: -webkit-sticky;
     position: sticky;
     top: 0;
     background: #ffffff;
     z-index: 10;
   }
   

.row {
      display: flex;
      justify-content: center;
      align-items: center;
   }

.mytop01 {
	padding-left: 20px;
}

.mytop01-content {
	padding-left: 180px;
	color: #6A8F00;
	display: inline;
}

.blog {
	padding-top: 50px;
}

.blog__sidebar {
	padding-top: 0px;
}

.list-group {
	padding-top: 0px;
}

.blog__sidebar__item {
	width: 200px;
}


</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("button.btn.btn-success").on("click", function() {
		fncAddRecipe();
	});
});

$(function() {
	$("#cancel").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddRecipe() {
	
	var rcpTitle = $("input[name='rcpTitle']").val();
	var rcpInfo = $("textarea[name='rcpInfo']").val();
	var rcpIngredient = $("textarea[name='rcpIngredient']").val();
	var rcpContent = $("textarea[name='rcpContent']").val();

	if (rcpTitle == null || rcpTitle.length < 1) {
		alert("레시피 제목은 반드시 입력하여야 합니다.");
		return;
	}
	if (rcpInfo == null || rcpInfo.length < 1) {
		alert("레시피 소개는 반드시 입력하여야 합니다.");
		return;
	}
	if (rcpIngredient == null || rcpIngredient.length < 1) {
		alert("레시피 재료는 반드시 입력하셔야 합니다.");
		return;
	}
	if (rcpContent == null || rcpContent.length < 1) {
		alert("레시피 내용은 반드시 입력하셔야 합니다.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action", "/board/addRecipe").submit();
}

var cnt = 1;
function fn_addFile() {
	$("#d_file").append("<br>" + "<input type='file' name='file'" + cnt +"' />");
}


</script>


</head>

<body>


	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		style="background-color: #F2F2F2;">



		<!-- /container -->
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container" style="background-color: #F2F2F2;">

				<!-- 상점 정보 수정 -->
				<div>
					<h4 class="text-left" style="margin-top:30px;">
						<strong><i class="bi bi-hand-index"></i>&nbsp; 레시피 정보 등록</strong>
						<hr size="10px">
					</h4>

	<form id="MultiUpload" action="addRecipe" method="post" enctype="multipart/form-data">
	
	<div class="form-group">
    <label for="rcpTitle">레시피 제목</label>
    <input type="text" class="form-control" id="rcpTitle" name="rcpTitle" placeholder="ex) 제육볶음">
  </div>
  <div class="form-group">
    <label for="rcpInfo">레시피 소개</label>
    <textarea class="form-control" id="rcpInfo" name="rcpInfo" rows="3" placeholder="ex) 집밥 제육볶음"></textarea>
  </div>
  <div class="form-group">
    <label for="rcpIngredient">레시피 재료</label>
    <textarea class="form-control" id="rcpIngredient" name="rcpIngredient" rows="3" placeholder="ex) 돼지고기,양파,감자,당근"></textarea>
  </div>
  <div class="form-group">
    <label for="rcpContent">레시피 내용</label>
    <textarea class="form-control" id="rcpContent" name="rcpContent" rows="3" placeholder="ex) 1.재료는 먹기 좋은 크기로 썰어서 준비해주세요"></textarea>
  </div>
  <div class="form-group">
    <label for="file">레시피 사진 업로드</label>
    <input type="file" class="form-control" id="file" name="file" multiple="multiple">
  </div>
  <div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="submit" class="btn btn-success" style="text-align:center;">등 &nbsp;록</button>
		<!-- <input type="button" class="btn btn-danger" id="cancel" value="취소"/> -->
						</div>
					</div>
				</div>
				
				</form>
				<div class="text-center"></div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>