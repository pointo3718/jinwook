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
<title>1:1문의 등록</title>

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
   align-items: flex-start;
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
		fncAddInquiry();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddInquiry() {
	
	var boardTitle = $("input[name='boardTitle']").val();
	var boardContent = $("textarea[name='boardContent']").val();

	if (boardTitle == null || boardTitle.length < 1) {
		alert("1:1문의 제목은 반드시 입력하여야 합니다.");
		return;
	}
	if (boardContent == null || boardContent.length < 1) {
		alert("1:1문의 내용은 반드시 입력하여야 합니다.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action", "/board/addBoardInquiry").submit();
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
						<strong>1:1문의 정보 등록</strong>
						<hr size="10px">
					</h4>

	<form name=addBoardInquiryForm method="post" action="addBoardInquiry" enctype="multipart/form-data">
	
	<div class="form-group">
    <label for="boardTitle">1:1문의 제목</label>
    <input type="text" class="form-control" id="boardTitle" name="boardTitle" >
  </div>
  <div class="form-group">
    <label for="boardContent">1:1문의 내용</label>
    <textarea class="form-control" id="boardContent" name="boardContent" rows="3"></textarea>
  </div>
  <div class="form-group">
    <label for="file">1:1문의 사진 업로드</label>
    <input type="file" class="form-control" id="file" name="file" multiple="multiple">
  </div>
  <div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="submit" class="btn btn-success"
								>등 &nbsp;록</button>
		<a class="btn btn-primary btn" href="#" role="button">취소</a>
						</div>
					</div>
				</div>
				
				</form>
				<div class="text-center"></div>
		</div>
	</section>
	<!-- Blog Section End -->
	
	<div class="container">
	<div class="form-group">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			1:1문의 답변
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br></td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
			</table>
	</div>
</div>

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>