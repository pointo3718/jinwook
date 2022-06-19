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
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
<script type="text/javascript">
	/*<![CDATA[*/
</script>

<style>
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

<script type="text/javascript">
$(function() {
	$("button.btn.btn-success").on("click", function() {
		fncAddRecipe();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddRecipe() {
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
		style="background-color: #F2F2F2">



		<!-- /container -->
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">

				<!-- 상점 정보 수정 -->
				<div>
					<h4 class="text-left">
						<strong>레시피 정보 등록</strong>

						<hr size="10px">
					</h4>



					<form id="MultiUpload" method="post" enctype="multipart/form-data">						
					<div class="row">
							<div class="form-group">
								<label for="rcpTitle"
									class="col-sm-offset-1 col-sm-5 control-label">레시피 제목</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="rcpTitle"name="rcpTitle" style="width:300px;height:50px;font-size:15px;"><span
										id="helpBlock" class="help-block"> </span>
								</div>
							</div>
					</div>


					<div class="row">
							<div class="form-group">
								<label for="rcpContent"
									class="col-sm-offset-1 col-sm-5 control-label">레시피 내용</label>
								<div class="col-sm-4" style="float: right;">
								<textarea id="summernote" class="form-control" rows="5" id="rcpContent" name="rcpContent" style="width:300px;height:200px;font-size:15px;"></textarea>
										<span id="helpBlock" class="help-block">
									</span>
								</div>
							</div>
						</div>

					<div class="row">
							<div class="form-group">
								<label for="rcpIngredient"
									class="col-sm-offset-1 col-sm-5 control-label">레시피 재료</label>
								<div class="col-sm-4" style="float: right;">
								<textarea id="summernote" class="form-control" rows="5" id="rcpIngredient" name="rcpIngredient" style="width:300px;height:200px;font-size:15px;"></textarea>
								</div>
							</div>
						</div>

					<div class="row">
							<div class="form-group">
								<label for="storeIntro"
									class="col-sm-offset-3 col-sm-5 control-label">레시피 소개</label>
								<div class="col-sm-4" style="float: right;">
								<textarea id="summernote" class="form-control" rows="5" id="rcpInfo" name="rcpInfo" style="width:300px;height:200px;font-size:15px;"></textarea>
								</div>
							</div>
						</div>

					<div class="row">
							<div class="form-group">
								<label for="file"
									class="col-sm-offset-3 col-sm-5 control-label">레시피 사진 업로드</label>
								<div class="col-sm-4" style="float: right;">
									<input type="file" class="form-control" id="file"
										name="file" style="width:250px;height:50px;font-size:15px;">
								</div>
							</div>
						</div>


					<div class="form-group">
						<div class="col-sm-offset-4  col-sm-4 text-center">
							<button type="button" class="btn btn-success"
								style="border-color: #7fad39; background-color: white;"
								style="color: #ffffff;">등 &nbsp;록</button>
							<a class="btn btn-primary btn" href="#" role="button">취소</a>
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