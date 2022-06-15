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
<title>상점등록</title>

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
	//============= "수정"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-outline-primary").on("click", function() {
			fncUpdateStore();
		});
	});

	function fncUpdateStore() {

		$("form").attr("method", "POST").attr("action",
				"/store/updateStore?storeNo=${store[0].storeNo}").submit();
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



		<div class="container">
			<c:forEach var="store" items="${storeInfo}" begin="0" end="0">
				<input type="hidden" id="storeNo" data-value="${store.storeNo}"
					value="${store.storeNo}" />
				<div class="row my-1">

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01"><h5>${store.user.userName}
									사장님</h5></strong> </br> </br> </br> </br>

						</div>
					</div>

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">진욱페이 ></strong> </br> </br>
							<h1 class="mytop01-content">${store.user.jpBalance}</h1>
							원 </br> </br>


						</div>
					</div>

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">${store.storeName}</strong> </br> </br>
							<h1 class="mytop01-content"></h1>
							</br> </br>


						</div>
					</div>

				</div>
			</c:forEach>
		</div>
		<!-- /container -->
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row" style="justify-content: space-around;">
				<div class="col-xs-4 col-xs-5"
					style="width: 200px; margin-right: 30px;">
					<div class="blog__sidebar" style="width: 200px;">

						<div class="blog__sidebar__item">

							<h5 class="text-center" style="margin-bottom: 0px;">
								<strong>My Page</strong>
							</h5>

							</br>


							<div class="list-group text-center" style="font-size: 15px;">
								<button type="button"
									class="list-group-item list-group-item-action"
									aria-current="true">주문 내역</button>
								<button type="button"
									class="list-group-item list-group-item-action">상점 정보
									수정</button>
								<button type="button"
									class="list-group-item list-group-item-action">신고 접수
									목록</button>
								<button type="button"
									class="list-group-item list-group-item-action" class="addStore">
									<span class="addStore">개인 정보 수정</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="deleteStore">상품 등록</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="refundStore">광고 등록</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">내가 한 요청</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">지갑</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">1:1
									문의내역</button>
							</div>

						</div>


					</div>
				</div>

				<!-- 상점 정보 수정 -->
				<div>
					<h4 class="text-left">
						<strong>상점 정보 수정</strong>

						<hr size="10px">
					</h4>


					<table class="table table-hover"
						style="width: 730px; heigh: 300px;">

						<form class="form-horizontal" id="profileUpdate">


							<div class="form-group">
								<label for="storeName"
									class="col-sm-offset-1 col-sm-3 control-label">상점 이름</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="storeName"
										name="storeName" value="${store[0].storeName}"
										placeholder="${store[0].storeName}" readonly><span
										id="helpBlock" class="help-block"> </span>
								</div>
							</div>



							<div class="form-group">
								<label for="storeType"
									class="col-sm-offset-1 col-sm-3 control-label">상점 업종</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="storeType"
										name="storeType" value="${store[0].storeType}"
										placeholder="
										<c:if test="${store[0].storeType.trim()=='1'}">
										과일
										</c:if>
										<c:if test="${store[0].storeType.trim()=='2'}">
										기억안남
										</c:if>
										<c:if test="${store[0].storeType.trim()=='3'}">
										수산
										</c:if>
										<c:if test="${store[0].storeType.trim()=='4'}">
										정육
										</c:if>
										<c:if test="${store[0].storeType.trim()=='5'}">
										종합
										</c:if>"
										readonly> <span id="helpBlock" class="help-block">
									</span>
								</div>
							</div>


							<div class="form-group">
								<label for="storeAddr"
									class="col-sm-offset-1 col-sm-3 control-label">상점 주소</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="storeAddr"
										name="storeAddr" value="${store[0].storeAddr}"
										placeholder="${store[0].storeAddr}" readonly> <span
										id="helpBlock" class="help-block"> </span>
								</div>
							</div>
							<!-- 
							<div class="form-group">
								<label for="storeStart"
									class="col-sm-offset-1 col-sm-3 control-label">상점 시작 날짜</label>
								<div class="col-sm-4" style="float:right;">
									<input type="text" class="form-control" id="storeStart"
										name="storeStart" value="${store[0].storeStart}"
										placeholder="${store[0].storeStart}" readonly> <span
										id="helpBlock" class="help-block"> </span>
								</div>
							</div>
 -->
							<div class="form-group">
								<label for="storeIntro"
									class="col-sm-offset-1 col-sm-3 control-label">상점 소개</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="storeIntro"
										name="storeIntro" value="${store[0].storeIntro}"
										placeholder="${store[0].storeIntro}">
								</div>
							</div>

							<div class="form-group">
								<label for="storePhone"
									class="col-sm-offset-1 col-sm-3 control-label">상점 전화번호</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="storePhone"
										name="storePhone" value="${store[0].storePhone}"
										placeholder="${store[0].storePhone}">
								</div>
							</div>

							<div class="form-group">
								<label for="storeImage"
									class="col-sm-offset-1 col-sm-3 control-label">상점 사진</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="storeImage"
										name="storeImage" value="${store[0].storeImage}"
										placeholder="${store[0].storeImage}">
								</div>
							</div>
							<!-- 
							<div class="form-group">
								<label for="startTime"
									class="col-sm-offset-1 col-sm-3 control-label">영업 시작 시간</label>
								<div class="col-sm-4" style="float:right;">
									<input type="time" class="form-control" id="startTime"
										name="startTime" value="${store[0].startTime}"
										placeholder="${store[0].startTime}">
								</div>
							</div>

							<div class="form-group">
								<label for="endTime"
									class="col-sm-offset-1 col-sm-3 control-label">영업 종료 시간</label>
								<div class="col-sm-4" style="float:right;">
									<input type="time" class="form-control" id="endTime"
										name="endTime" value="${store[0].endTime}"
										placeholder="${store[0].endTime}">
								</div>
							</div>
 -->
							<div class="form-group">
								<label for="holiday"
									class="col-sm-offset-1 col-sm-3 control-label">상점 휴무일</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="holiday"
										name="holiday" value="${store[0].holiday}"
										placeholder="${store[0].holiday}">
								</div>
							</div>

							<div class="form-group">
								<label for="businessNo"
									class="col-sm-offset-1 col-sm-3 control-label">사업자등록번호</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="businessNo"
										name="businessNo" value="${store[0].user.businessNo}"
										placeholder="${store[0].user.businessNo}" readonly> <span
										id="helpBlock" class="help-block">
								</div>
							</div>

							<div class="form-group">
								<label for="businessCard"
									class="col-sm-offset-1 col-sm-3 control-label">영업신고증</label>
								<div class="col-sm-4" style="float: right;">
									<input type="text" class="form-control" id="businessCard"
										name="businessCard" value="${store[0].businessCard}"
										placeholder="${store[0].businessCard}" readonly> <span
										id="helpBlock" class="help-block">
								</div>
							</div>

							<div class="form-group">
								<label for="accNo"
									class="col-sm-offset-1 col-sm-3 control-label">계좌번호</label>
								<div class="col-sm-4" style="float: right;">
									<select name="bank" class="ct_input_g"
										style="width: 100px; height: 19px" maxLength="20">
										<option value="1" selected="selected">카카오뱅크</option>
										<option value="2">농협</option>
										<option value="3">신한</option>
										<option value="4">IBK기업</option>
										<option value="5">하나</option>
										<option value="6">우리</option>
										<option value="7">국민</option>
										<option value="8">SC제일</option>
										<option value="9">대구</option>
										<option value="10">부산</option>
										<option value="11">광주</option>
										<option value="12">새마을금고</option>
										<option value="13">경남</option>
										<option value="14">전북</option>
										<option value="15">제주</option>
										<option value="16">산업</option>
										<option value="17">우체국</option>
										<option value="18">신협</option>
										<option value="19">수협</option>
										<option value="20">씨티</option>
										<option value="21">케이뱅크</option>
										<option value="22">토스뱅크</option>
										<option value="23">산림조합</option>
										<option value="24">저축은행</option>
									</select>

									<button type="button" class="btn btn-light">실명조회</button>

								</div>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="accNo" name="accNo"
									value="${store[0].accNo}" placeholder="${store[0].accNo}">
							</div>
							</div>
					</table>


					<div class="form-group">
						<div class="col-sm-offset-4  col-sm-4 text-center">
							<button type="button" class="btn btn-outline-light"
								style="border-color: #7fad39; background-color: white;"
								style="color: #ffffff;">수 &nbsp;정</button>
							<a class="btn btn-primary btn" href="#" role="button">상점 삭제
								신청</a>
						</div>
					</div>
				</div>
				<div class="text-center"></div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>