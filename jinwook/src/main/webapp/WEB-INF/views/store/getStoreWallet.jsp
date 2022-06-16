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
<title>상품등록</title>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- date picker -->


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

	function fncaddOrdersCart(e) {
		const prodNo = $(e).data("value");
		const storeName = $("#stoName").data("values");

		const passdata = {
			'prodNo' : prodNo,
			'storeName' : storeName
		};
		console.log(storeName);
		console.log(prodNo);
		$.ajax({
			anyne : true,
			url : "/orders/addOrdersCart/" + prodNo,
			contentType : 'application/json',
			data : JSON.stringify(passdata).e,
			dataType : "text",
			success : function(result) {
				if (result != null) {
					alert("담기완료");
				}
			}
		});
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
							<h6 class="mytop01">진욱이네와 처음 만난 날</h6>
							<h3 class="mytop01-content">${store.user.regDate}</h3>
							</br> </br>

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

							</br> <strong class="mytop01">${store.storeName}</strong> </br> </br>
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-success btn-sm active"> <input
									type="radio" name="options" id="option1" checked> 오픈
								</label> <label class="btn btn-danger btn-sm"> <input
									type="radio" name="options" id="option2"> 마감
								</label>
							</div>
							<h6 class="mytop01-content">${store.storeAddr}</h6>

							</br> </br>

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
								<strong>사장님 페이지</strong>
							</h5>
							<br />



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
				<div style="margin-bottom: 1150px; width: 850px;">
					<h4 class="text-left">
						<strong>지갑 조회</strong>

						<hr size="10px">
					</h4>

					<table class="table table-borderless">
						<c:forEach var="store" items="${getStoreWallet}" begin='0' end='0'>
							<tbody>
								<tr>
									<th scope="row">기간별 상점매출액</th>
									<td>${store.totalEarn}원</td>
									<td><input id="fromDate" type="date"> <input
										id="toDate" type="date">&nbsp;&nbsp;
										<button type="button" class="btn btn-outline-success btn-sm">조회</button></td>
								</tr>
								<tr>
									<th scope="row">진욱페이 잔액</th>
									<td>${store.user.jpBalance}원</td>
									<td><button type="button"
											class="btn btn-outline-success btn-sm">환급신청</button></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>



					<!--  table Start /////////////////////////////////////-->

					<h6 class="text-left">
						<strong>기간별 주문내역</strong>&nbsp; <span
							style="color: #6E6E6E; font-size: 13px">설정하지 않을시 오늘 날짜로
							조회됩니다.</span>
					</h6>
					<table class="table table-hover table-striped">

						<thead>
							<tr>
								<th align="center">No</th>
								<th align="left">주문번호</th>
								<th align="left">주문날짜</th>
								<th align="left">구매자이름</th>
								<th align="left">주문금액</th>
							</tr>
						</thead>

						<tbody>

							<c:set var="i" value="0" />
							<c:forEach var="store" items="${getStoreWallet}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="Center">${ i }</td>
									<td align="left">${store.orders.orderNo}</td>
									<td align="left">${store.orders.orderDate}</td>
									<td align="left">${store.orders.buyerName}</td>
									<td align="left">${store.orders.orderPrice}</td>


								</tr>
							</c:forEach>

						</tbody>

					</table>


					<!--  table Start /////////////////////////////////////-->
					<h6 class="text-left">
						<strong>환급내역</strong>
					</h6>
					<table class="table table-hover table-striped">

						<thead>
							<tr>
								<th align="center">No</th>
								<th align="left">환급신청날짜</th>
								<th align="left">환급완료날짜</th>
								<th align="left">환급금액</th>
								<th align="left">요청상태</th>
							</tr>
						</thead>

						<tbody>

							<c:set var="i" value="0" />
							<c:forEach var="store" items="${getStoreRefund}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="Center">${ i }</td>
									<td align="left">${store.request.reqDate}</td>
									<td align="left">${store.request.resDate}</td>
									<td align="left">${store.request.refundMoney}</td>
									<td align="left"><c:if
											test="${store.request.reqStatus.trim()=='1'}">
                								요청중         
            						</c:if> <c:if test="${store.request.reqStatus.trim()=='2'}">
                								수락완료         
            						</c:if> <c:if test="${store.request.reqStatus.trim()=='3'}">
                								거절         
            						</c:if></td>


								</tr>
							</c:forEach>

						</tbody>

					</table>

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