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
<title>상점수정</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
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
* {
	font-family: 'Noto Sans KR', sans-serif;
}

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

.blog__sidebar {
	padding-bottom: 430px;
}

.blog__sidebar__item {
	width: 200px;
	/*  body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */ / . row { margin-top : 10px;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.id_ok {
	color: #7fad39;
	display: none;
	font-size: 10px;
}

.id_already {
	color: red;
	display: none;
	font-size: 10px;
	text-align: left;
}

.control-label {
	whidth: 250px;
	text-align: center;
	justify-content: center;
}

.site-btn {
	background-color: #7fad39; /* Green */
	border: none;
	color: white;
	width: 200px;
	text-align: center;
	font-size: 20px;
}

.userId {
	width: 300px;
	text-indent: 1em;
}

.ss {
	font-size: 30px;
	justify-content: center;
}

input {
	width: 300px;
	height: 50px;
	text-indent: 1em;
	font-size: 15px;
}

div {
	justify-content: center;
	text-align: center;
	align-items: center;
}

label {
	font-size: 15px;
	justify-content: top;
	text-align: left;
	display: flex;
	align-items: left;
}

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

<script type="text/javascript">
	//============= "수정"  Event 연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-outline-success").on("click", function() {
			fncUpdateStore();
		});
	});

	function fncUpdateStore() {

		var storeIntro = $("input[name='storeIntro']").val();
		if (storeIntro == null || storeIntro.length < 1) {
			alert("상점소개 반드시 입력하여야 합니다.");
			return;
		}

		var storePhone = $("input[name='storePhone']").val();
		if (storePhone == null || storePhone.length < 1) {
			alert("상품 전화번호는 반드시 입력하셔야 합니다.");
			return;
		}

		var storeImage = $("input[name='storeImage']").val();
		if (storeImage == null || storeImage.length < 1) {
			alert("상점사진은 반드시 입력하셔야 합니다.");
			return;
		}

		var startTime = $("input[name='startTime']").val();
		if (startTime == null || startTime.length < 1) {
			alert("영업시작시간은 반드시 입력하셔야 합니다.");
			return;
		}

		var endTime = $("input[name='endTime']").val();
		if (endTime == null || endTime.length < 1) {
			alert("영업종료시간은 반드시 입력하셔야 합니다.");
			return;
		}

		var holiday = $("input[name='holiday']").val();
		if (holiday == null || holiday.length < 1) {
			alert("상점휴일은 반드시 입력하셔야 합니다.");
			return;
		}

		var bank = $("input[name='bank']").val();
		if (bank == null || bank.length < 1) {
			alert("은행명은 반드시 입력하셔야 합니다.");
			return;
		}

		var accNo = $("input[name='accNo']").val();
		if (accNo == null || accNo.length < 1) {
			alert("계좌번호는 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method", "POST").attr("action",
				"/store/updateStore").submit();
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
		<c:forEach var="store" items="${storeInfo}" begin="0" end="0">
			<div class="container">
				<div class="row my-1">
					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">${store.user.userName} 사장님</strong> </br> </br>
							<h1 class="mytop01-content">5</h1>
							건 </br> </br>

						</div>
					</div>

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">진욱페이</strong> </br> </br>
							<h1 class="mytop01-content">${store.user.jpBalance}원</h1>
							</br> </br>

						</div>
					</div>

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">새로운 신고접수</strong> </br> </br>
							<h1 class="mytop01-content">7</h1>
							건 </br> </br>

						</div>
					</div>
				</div>

			</div>
			<!-- /container -->
		</c:forEach>
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
								<strong><h3>My Page</h3></strong>
							</h5>



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

					<c:forEach var="store" items="${storeInfo}" begin="0" end="0">

						<table class="table table-hover"
							style="width: 730px; heigh: 300px;">

							<form class="form-horizontal" id="profileUpdate">


								<div class="form-group row">
									<label for="colFormLabel"
										class="col-sm-2 col-form-label col-form-label">상점이름</label>
									<div class="col-sm-6">
										<input type="text" name="storeName"
											class="form-control form-control" id="storeName"
											value="${store.storeName}" placeholder="상점이름" readonly>
									</div>
								</div>


								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점업종</label>
									<div class="col-sm-6">
										<input type="email" name="storeType"
											class="form-control form-control" id="colFormLabelLg"
											value="
											
											<c:if test="${store.storeType.trim()=='1'}">
                								정육         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='2'}">
                								수산         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='3'}">
                								채소         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='4'}">
                								과일         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='5'}">
                								종합         
            								</c:if>"
											placeholder="상점업종" readonly>
									</div>
								</div>



								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점주소</label>
									<div class="col-sm-6">
										<input type="text" name="storeAddr"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.storeAddr}" placeholder="상점주소" readonly>
									</div>
								</div>



								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점시작날짜</label>
									<div class="col-sm-6">
										<input type="text" name="storeStart"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.storeStart}" placeholder="상점시작날짜" readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점소개</label>
									<div class="col-sm-6">
										<input type="text" name="storeIntro"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.storeIntro}" placeholder="상점소개">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점전화번호</label>
									<div class="col-sm-6">
										<input type="text" name="storePhone"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.storePhone}" placeholder="상점전화번호">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점사진</label>
									<div class="col-sm-6">
										<input type="text" name="storeImage"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.storeImage}" placeholder="상점사진">
									</div>
								</div>

								<span class="btn btn-default btn-file"
									style="padding-left: 260px; padding-bottom: 15px;"> 사진변경
									<input type="file">
								</span>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">영업시작시간</label>
									<div class="col-sm-6">
										<input type="time" name="startTime"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.startTime}" placeholder="영업시작시간">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">영업종료시간</label>
									<div class="col-sm-6">
										<input type="time" name="endTime"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.endTime}" placeholder="영업종료시간">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점휴무일</label>
									<div class="col-sm-6">
										<input type="text" name="holiday"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.holiday}" placeholder="상점휴무일">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label"
										style="padding-right: 4px;">사업자등록번호</label>
									<div class="col-sm-6">
										<input type="text" name="businessNo"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.user.businessNo}" placeholder="사업자등록번호"
											readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">영업신고증</label>
									<div class="col-sm-6">
										<input type="text" name="businessCard"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.businessCard}" placeholder="영업신고증" readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">계좌번호</label>
									<div class="col-sm-6" style="padding-left: 0px;">
										<div class="col-sm-6">
											<select name="bank" class="ct_input_g"
												style="width: 100px; height: 19px" maxLength="20">
												<option value="1">카카오뱅크</option>
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
										</div>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label"></label>
									<div class="col-sm-6">
										<input type="text" name="accNo"
											class="form-control form-control" id="colFormLabelLg"
											value="${store.accNo}" placeholder="계좌번호">
									</div>
								</div>



							</form>



						</table>

						<hr size="10px">

						<div style="padding-left: 320px;">
							<button type="button" id="button" class="btn btn-outline-success">
								수정</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" id="button" class="btn btn-outline-danger">상점삭제신청</button>
						</div>
				</div>


				</c:forEach>


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