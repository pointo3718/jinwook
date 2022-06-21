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
<title>레시피 수정</title>

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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
//==> 추가된부분 : "수정"  Event 연결
$(function() {
	$("button.btn.btn-success").on("click", function() {
		fncUpdateRecipe();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncUpdateRecipe() {

	$("form").attr("method", "POST").attr("action", "/board/updateRecipe").submit();
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
		<div class="container" style="background-color: ivory; border:1px solid green;">

				<!-- 상점 정보 수정 -->
				<div>
					<h4 class="text-left">
						<strong>레시피 정보 수정</strong>
						<hr size="10px">
					</h4>

	<form id="MultiUpload" action="updateRecipe" method="post" enctype="multipart/form-data">
	<input type="hidden" id="rcpNo" name="rcpNo" value="${recipe.rcpNo}"> 
	<div class="form-group">
	<input hidden>
    <label for="rcpTitle">레시피 제목</label>
    <input type="text" class="form-control" id="rcpTitle" name="rcpTitle" placeholder="ex) 제육볶음" value="${recipe.rcpTitle}">
  </div>
  <div class="form-group">
    <label for="rcpInfo">레시피 소개</label>
    <textarea class="form-control" id="rcpInfo" name="rcpInfo" rows="3" placeholder="ex) 집밥 제육볶음">${recipe.rcpInfo}</textarea>
  </div>
  <div class="form-group">
    <label for="rcpIngredient">레시피 재료</label>
    <textarea class="form-control" id="rcpIngredient" name="rcpIngredient" rows="3" placeholder="ex) 돼지고기,양파,감자,당근">${recipe.rcpIngredient}</textarea>
  </div>
  <div class="form-group">
    <label for="rcpContent">레시피 내용</label>
    <textarea class="form-control" id="rcpContent" name="rcpContent" rows="3" placeholder="ex) 1.재료는 먹기 좋은 크기로 썰어서 준비해주세요">${recipe.rcpContent}</textarea>
  </div>
  
  <div class="form-group">
    <label for="file">레시피 사진 수정</label>
    <input type="file" class="form-control" id="file" name="file" multiple="multiple" value="${files.fileNo}">
    <tr>
				<td id="fileIndex"><c:forEach var="file" items="${file}" varStatus="var">
						<div>
							<input type="hidden" id="attach_no" name="attach_no_${var.index}"value="${file.attach_no}"> 
							<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="attach_no_${var.index}">
							<a href="#" id="fileName" onclick="return false;">${file.org_file_name}</a>(${file.file_size}kb)
							<button id="fileDel"
								onclick="fn_del('${file.attach_no}','attach_no_${var.index}');"
								type="button">삭제</button>
							<br>
						</div>
					</c:forEach></td>
			</tr>
  </div>
  
  <div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="submit" class="btn btn-success">수 &nbsp;정</button>
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