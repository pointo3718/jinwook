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
	justify-content: space-around;
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
	//============= "상품 삭제"  Event 연결 =============
	function fncDeleteStoreProduct(e) {
		if (!confirm('상품을 삭제하시겠습니까?')) {
			return false;
		}

		console.log(e);

		var STORENO = $("input[id='storeNo']").val();
		const no = $(e).data("value");

		$.ajax({
			url : "deleteStoreProduct/" + no,
			dataType : "json",
			success : function(result) {
				if (result != null) {
					alert("삭제완료");
					self.location = "addStoreProduct?storeNo=" + STORENO;
				}
			}

		});

	}

	$(function() {
		$("#soldout").on("click", function fncIsSoldout() {

			const btnElement = document.getElementById('soldout');
			var soldout = $("#soldout").data("soldout");

			alert(soldout)

			if (btnElement.innerText === '매진') {
				btnElement.innerText = '판매';
			} else
				btnElement.innerText = '매진';

			console.log(soldout);
			var prodNo = $("#soldout").data("value");

			$.ajax({
				url : "isSoldout/" + prodNo + "/" + soldout,
				dataType : "json",
				method : "post",
				success : function(result) {
					if (result != null) {
						alert("매진");
					}
				}

			});

		});
	});

	//============= "매진 버튼 변경"  Event 연결 =============

	//============= "상품 수정"  Event 연결 =============

	function fncUpdateStoreProduct(e) {

		console.log(e);

		var STORENO = $("input[id='storeNo']").val();
		var prodNo = $(e).data("value");

		var PRICE = $("input[id='price']").val();
		var PRODINFO = $("input[id='prodInfo']").val();
		var PRODIMG = $("input[id='prodImg']").val();
		var PRODORIGN = $("input[id='prodOrign']").val();

		alert(prodNo);

		$.ajax({
			url : "updateStoreProduct/" + prodNo + "/" + PRICE + "/"
					+ PRODORIGN + "/" + PRODINFO + "/" + PRODIMG,
			dataType : "json",
			method : "POST",
			data : {

				"PRICE" : PRICE,
				"PRODINFO" : PRODINFO,
				"PRODIMG" : PRODIMG,
				"PRODORIGN" : PRODORIGN

			},
			success : function(result) {
				if (result != null) {
					alert("수정 완료");
					self.location = "addStoreProduct?storeNo=" + STORENO;
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



		<div class="container">
			<c:forEach var="store" items="${storeInfo}" begin="0" end="0">
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
			<div class="row">
				<div class="col-xs-4 col-xs-5"
					style="width: 200px; margin-right: 30px;">
					<div class="blog__sidebar" style="width: 200px;">

						<div class="blog__sidebar__item" style="padding-bottom: 450px;">

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
				<!-- 상품등록 Section Begin -->
				<div class="shoping-cart spad"
					style="width: 900px; padding-top: 0px;">
					<div class="container" style="width: 830px;">
						<div class="row"
							style="justify-content: space-between; width: 1150px;">
							<div class="col-lg-9">
								<div class="shoping__cart__table">
									<table>
										<thead>
											<tr>
												<th class="shoping__product">상품사진</th>
												<th class="text-center" style="width: 300px;">이름</th>
												<th class="text-center" style="width: 700px;">상품설명</th>
												<th class="text-center" style="width: 400px;">원산지</th>
												<th class="text-center" style="width: 200px;">가격</th>
												<th class="text-center" style="width: 200px;">수량</th>
												<th class="text-center" style="width: 200px;"></th>
												<th class="text-center" style="width: 200px;"></th>
												<th class="text-center" style="width: 100px;"></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<!--  /////////////////////////////////////////////////// -->
											<c:set var="i" value="0" />
											<c:set var="total" value="0" />
											<c:forEach var="store" items="${store}">
												<c:set var="i" value="${ i+1 }" />
												<tr>
													<td hidden="prodNo" id="prodNo" name="prodNo"
														value="${store.product.prodNo}">+store.product.prodNo</td>
													<td class="shoping__cart__item"><img
														src="${path}/resources/static/img/cart/cart-1.jpg"></td>
													<td><strong style="font-size: 20px;">${store.product.prodName}</strong>
													</td>
													<td><strong style="font-size: 20px;">${store.product.prodInfo}</strong></td>
													<td class="shoping__cart__price">${store.product.prodOrign}
													</td>
													<td class="shoping__cart__price">${store.product.price}원
													</td>
													<td class="shoping__cart__quantity">
														<div class="quantity">
															<div class="pro-qty">
																<input type="text" value="">
															</div>
														</div>
													</td>
													<td class="shoping__cart__price">
														<button type="button" data-value="${store.product.prodNo}"
															name="buttons" class="btn btn-primary btn-sm"
															onClick="fncUpdateStoreProduct(this)">수정</button>
													</td>
													<td class="shoping__cart__price">
														<button type="button" id="soldout"
															data-value="${store.product.prodNo}"
															data-soldout="${store.product.soldout}"
															class="btn btn-danger btn-sm">매진</button>
													</td>
													<td class="shoping__cart__price">
														<button type="button" data-value="${store.product.prodNo}"
															name="buttons" class="btn btn-secondary btn-sm"
															onClick="fncDeleteStoreProduct(this)">X</button>
															
															<input type="hidden" id="storeNo"
															data-value="${store.storeNo}" value="${store.storeNo}" />
															
													</td>

												</tr>
											</c:forEach>
									</table>
									<div id="plus">
										<p class="original"></p>
									</div>

									<div class="col-lg-2"
										style="justify-content: space-around; margin-left: 410px;">
										<button type="button" id="plus2"
											class="btn btn-outline-secondary btn-sm"
											style="border-color: #eeeeee;">+</button>
									</div>
									<!--  /////////////////////////////////////////////////// -->
								</div>
							</div>
						</div>
					</div>
					<!-- 상품등록 Section End -->


				</div>

			</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>