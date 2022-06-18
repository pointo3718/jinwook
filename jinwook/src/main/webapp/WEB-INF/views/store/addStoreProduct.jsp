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
	align-items: flex-start
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

.list-group {
	padding-top: 0px;
}

.blog__sidebar {
	align-items: flex-start;
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
	/*<![CDATA[*/
	function movePage(uri, queryString) {
		location.href = uri + queryString;
	}

	var storeNo = $("input[id='storeNo']").val();
	/*]]>*/

	$(function() {
		$(".list-group-item:contains('주문 내역')").on("click", function() {
			$(self.location).attr("href", "/admin/blog");
		});
	});

	$(function() {
		$(".list-group-item:contains('상점 정보 수정')").on("click", function() {
			$(self.location).attr("href", "/store/updateStore?storeNo=10000");
		});
	});

	$(function() {
		$(".list-group-item:contains('개인 정보 수정')").on("click", function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href", "/admin/listComplainAdmin");
		});
	});

	$(function() {
		$(".list-group-item:contains('상품 등록')").on(
				"click",
				function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/store/addStoreProduct?storeNo=10000");
				});
	});

	$(function() {
		$(".list-group-item:contains('광고 등록')").on(
				"click",
				function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/request/getRequestListForAdmin?reqCode=1");
				});
	});

	$(function() {
		$(".list-group-item:contains('지갑')").on(
				"click",
				function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/store/getStoreWallet?storeNo=10000");
				});
	});

	$(function() {
		$(".list-group-item:contains('1:1 문의내역')").on(
				"click",
				function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/request/getRequestListForAdmin?reqCode=2");
				});
	});

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
					self.location = "addStoreProduct?storeNo=10000"
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
					self.location = "addStoreProduct?storeNo=10000"
				}
			}

		});

	}

	//====입력창 추가=====//
	$(document)
			.ready(
					function() {
						$('.btn.btn-outline-success')
								.click(
										function() {
											$('#plus')
													.append(
															'<form id="inputitem"><div class="form-row"><div class="col-md-3 mb-3"><label for="validationDefault01"></label> <span class="btn btn-default btn-file"> <input type="file"></span></div><div class="col-md-2 mb-3"><label for="validationDefault02"></label><input type="text" class="form-control" name="addProdName" placeholder="이름" required></div><div class="col-md-3 mb-3"><label for="validationDefault01"></label> <input type="text" class="form-control" id="addProdInfo" placeholder="상품설명" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label> <input type="text" class="form-control" id="addProdOrign" placeholder="원산지" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label> <input type="text" class="form-control" id="addPrice" placeholder="가격" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label><br><button type="button" id="validationDefault01" class="btn btn-warning" onClick="fncAddStoreProduct(this)">상품등록</button></div></div></div></form>'); // end append                            
										}); // end click                                            
					}); // end ready

	//상품 등록//

	function fncAddStoreProduct(e) {

		console.log(e);

		var STORENO = $("input[id='storeNo']").val();
		var PRODNAME = $("input[id='addProdName']").val();
		var PRICE = $("input[id='addPrice']").val();
		var PRODINFO = $("input[id='addProdInfo']").val();
		var PRODIMG = $("input[id='addProdImg']").val();
		var PRODORIGN = $("input[id='addProdOrign']").val();

		alert(STORENO+PRICE+PRODINFO+PRODIMG+PRODORIGN);

		$.ajax({
			url : "addStoreProduct/" + PRICE + "/" + PRODORIGN + "/" + PRODINFO
					+ "/" + PRODIMG,
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
					alert("등록 완료");
					self.location = "addStoreProduct?storeNo=10000"
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

	<!-- ceoTop Section Begin -->
	<jsp:include page="../layout/ceoTop.jsp" />
	<!-- ceoTop Section End -->

	<!-- ceoLeft Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row" style="justify-content: space-around;">
				<div class="col-xs-4 col-xs-5"
					style="width: 200px; margin-right: 30px;">
					<div class="blog__sidebar" style="width: 200px; padding-top: 0px;">

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
				<!-- 상품등록  Begin -->
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
													<td><strong style="font-size: 20px;"><input
															type="text" name="storeName"
															class="form-control form-control" id="prodInfo"
															value="${store.product.prodInfo}" placeholder="상품설명"></strong></td>
													<td class="shoping__cart__price"><input type="text"
														name="storeName" class="form-control form-control"
														id="prodOrign" value="${store.product.prodOrign}"
														placeholder="원산지"></strong></td>
													<td class="shoping__cart__price"><input type="text"
														name="storeName" class="form-control form-control"
														id="price" value="${store.product.price}" placeholder="가격"></strong>
													</td>
													<td class="shoping__cart__price">
														<button type="button" data-value="${store.product.prodNo}"
															name="buttons" class="btn btn-primary btn-sm"
															onClick="fncUpdateStoreProduct(this)">수정</button>
													</td>
													<td class="shoping__cart__price">
														<div class="btn-group btn-group-toggle"
															data-toggle="buttons">
															<label class="btn btn-success btn-sm active"> <input
																type="radio" name="options" id="option1" checked>
																판매
															</label> <label class="btn btn-danger btn-sm"> <input
																type="radio" name="options" id="option2"> 매진
															</label>
														</div>
													</td>
													<td class="shoping__cart__price">
														<button type="button" data-value="${store.product.prodNo}"
															name="buttons" class="btn btn-light btn-sm"
															onClick="fncDeleteStoreProduct(this)">X</button> <input
														type="hidden" id="storeNo" name="storeNo"
														data-store="${store.storeNo}" value="${store.storeNo}" />

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
											class="btn btn-outline-success"
											style="border-color: #eeeeee;" value="Add">+</button>
									</div>

									<!--  /////////////////////////////////////////////////// -->
								</div>
							</div>
						</div>
					</div>
				</div>

	







			<!-- 상품등록 End -->

		</div>
	</section>
	<!-- ceoLeft Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>