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
	
</script>


</head>

<body>


	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->

	<div class="container">
		<c:forEach var="store" items="${getStore}" begin="0" end="0">

			<h4 class="text-center">
				<strong>${store.storeName}</strong>

				<hr size="10px">
			</h4>

			<!-- table 위쪽 검색 Start /////////////////////////////////////-->


			<img
				src="https://cdn.pixabay.com/photo/2015/08/13/23/44/sweets-887722_960_720.jpg"
				alt="My Image" width="1100" height="400">

			<hr>

			<div class="row">
				<div class="col-xs-6 col-md-6">
					<strong>상점번호</strong>
				</div>
				<div class="col-xs-6 col-md-6">${store.storePhone}</div>

				<div class="col-xs-6 col-md-6 ">
					<strong>상점이름</strong>
				</div>
				<div class="col-xs-6 col-md-6" id="stoName"
					data-values="${store.storeName}">${store.storeName}</div>

				<div class="col-xs-6 col-md-6 ">
					<strong>상점종류</strong>
				</div>
				<div class="col-xs-6 col-md-6">
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
            </c:if>
				</div>
				<div class="col-xs-6 col-md-6 ">
					<strong>상점주소</strong>
				</div>
				<div class="col-xs-6 col-md-6">${store.storeAddr}</div>
				<div class="col-xs-6 col-md-6 ">
					<strong>상점영업시간</strong>
				</div>
				<div class="col-xs-6 col-md-6">${store.startTime}~${store.endTime}</div>
				<div class="col-xs-6 col-md-6 ">
					<strong>상점휴무일</strong>
				</div>
				<div class="col-xs-6 col-md-6">${store.holiday}</div>
				<div class="col-xs-6 col-md-6 ">
					<strong>상점소개</strong>
				</div>
				<div class="col-xs-6 col-md-6">${store.storeIntro}</div>
				<div class="col-xs-6 col-md-6 ">
					<strong>상점별점</strong>
				</div>
				<div class="col-xs-6 col-md-6">${store.orders.reviewStar}</div>
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
							<div class="col-xs-8 col-md-6">
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
	</div>
	</td>

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