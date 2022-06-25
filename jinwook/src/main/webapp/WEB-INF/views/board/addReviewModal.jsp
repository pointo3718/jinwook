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
<title>상점후기 등록</title>

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
		fncAddReview();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddReview() {
	
	$("form").attr("method", "POST").attr("action", "/board/addReview").submit();
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
						<strong><i class="bi bi-hand-index"></i>&nbsp; 상점후기 등록</strong>
						<hr size="10px">
					</h4>

	
	<div class="form-group">
    <label for="reviewTitle">제목</label>
    <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" placeholder="제목">
  </div>
  <div class="form-group">
    <label for="reviewWriter">작성자</label>
    <input type="text" class="form-control" id="reviewWriter" name="reviewWriter" placeholder="작성자">
  </div>
  <div class="form-group">
    <label for="reviewStar">별점</label>
    <input type="number" class="form-control" id="reviewStar" name="reviewStar" placeholder="별점">
  </div>
  <div class="form-group">
    <label for="reviewContent">후기 내용</label>
    <textarea class="form-control" id="reviewContent" name="reviewContent" rows="3" placeholder="후기 내용"></textarea>
  </div>
  <div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
		<button type="submit" class="btn btn-success">등 &nbsp;록</button>
		<a class="btn btn-primary btn" href="#" role="button">취소</a>
						</div>
					</div>
				</div>
				
				<div class="text-center"></div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>