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
<title>1:1문의 수정</title>

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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//==> 추가된부분 : "수정"  Event 연결
$(function() {
	$("button.btn.btn-success").on("click", function() {
		fncUpdateInquiry();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncUpdateInquiry() {

	$("form").attr("method", "POST").attr("action", "/board/updateBoardInquiry").submit();
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
		<div class="container" style="background-color: #F2F2F2;">

				<!-- 상점 정보 수정 -->
				<div>
					<h4 class="text-left">
						<strong>1:1문의 정보 수정</strong>
						<hr size="10px">
					</h4>

	<form id="MultiUpload" action="updateRecipe" method="post" enctype="multipart/form-data">
	<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}"> 
	
	<div class="form-group">
	<input hidden>
    <label for="boardTitle">1:1문의 제목</label>
    <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${board.boardTitle}">
  </div>
  
  <div class="form-group">
    <label for="boardContent">1:1문의 내용</label>
    <textarea class="form-control" id="boardContent" name="boardContent" rows="3" placeholder="ex) 집밥 제육볶음">${board.boardContent}</textarea>
  </div>
  
  <div class="form-group">
    <label for="file">1:1문의 사진 수정</label>
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