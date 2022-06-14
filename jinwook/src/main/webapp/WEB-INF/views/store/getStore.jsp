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

	<div class="container">

		<div class="page-header text-info">
			<h3>상점정보</h3>
		</div>


		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">


					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		<c:forEach var="store" items="${getStore}" begin="0" end="0">
			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>상점번호</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.storePhone}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점이름</strong>
				</div>
				<div class="col-xs-8 col-md-4" id="stoName"
					data-values="${store.storeName}">${store.storeName}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점종류</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${store.storeType.trim()=='1'}">
                종합         
            </c:if>
				</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점주소</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.storeAddr}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점시작시간</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.startTime}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점종료시간</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.endTime}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점휴무일</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.holiday}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점소개</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.storeIntro}</div>
				<div class="col-xs-4 col-md-2 ">
					<strong>상점별점</strong>
				</div>
				<div class="col-xs-8 col-md-4">${store.orders.reviewStar}점</div>
			</div>

			<hr />



		</c:forEach>

		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">상품번호</th>
					<th align="left">상품명</th>
					<th align="left">상품사진</th>
					<th align="left">가격</th>
					<th align="left">원산지</th>
					<th align="left">상품소개</th>
					<th align="left">매진여부</th>
					<th align="left" style="padding-left: 35px";>수량</th>
					<th align="left">장바구니</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="store" items="${getStore}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="Center">${ i }</td>
						<td align="left">${store.product.prodNo}</td>
						<td align="left">${store.product.prodName}</td>
						<td align="left">${store.product.prodImg}</td>
						<td align="left">${store.product.price}</td>
						<td align="left">${store.product.prodOrign}</td>
						<td align="left">${store.product.prodInfo}</td>
						<td align="left"><c:if test="${store.product.soldout==true}">
                   판매중         
                  </c:if> <c:if test="${store.product.soldout==false}">
                   매진         
                  </c:if></td>
						<td align="left">
							<div class="col-xs-8 col-md-4">
								<select name=prodCount class="ct_input_g"
									style="width: 100px; height: 19px" maxLength="20">
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</td>
						<td align="left"><button type="button"
								data-value="${store.product.prodNo}" class="btn btn-primary"
								onClick="fncaddOrdersCart(this)">담&nbsp;기</button>
							</div></td>

					</tr>
				</c:forEach>

			</tbody>

		</table>
		<!--  table End /////////////////////////////////////-->

	</div>

	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>