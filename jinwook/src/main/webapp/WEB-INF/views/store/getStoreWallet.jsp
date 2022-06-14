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
<title>지갑 조회</title>

<!-- Google Font -->


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
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


<script type="text/javascript">
	
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

						<div class="blog__sidebar__item" style="margin-bottom: 925px;">

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
				<div style="margin-bottom: 1150px; width: 850px;">
					<h4 class="text-left">
						<strong>지갑 조회</strong>

						<hr size="10px">
					</h4>

					<c:forEach var="store" items="${getStoreWallet}" begin="0" end="0">
						<div class="row">
							<div class="col-xs-4 col-md-2">
								<strong>상점 매출액</strong>
							</div>
							<div class="col-xs-8 col-md-4">${store.totalEarn}</div>
							<div class="col-xs-4 col-md-2 ">
								<strong>진욱페이 잔액</strong>
							</div>
							<div class="col-xs-8 col-md-4" id="stoName"
								data-values="${store.user.jpBalance}">${store.user.jpBalance}

							</div>
						</div>

						<hr />
					</c:forEach>

					<!--  table Start /////////////////////////////////////-->


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
									<td align="left">${store.request.reqStatus}</td>


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