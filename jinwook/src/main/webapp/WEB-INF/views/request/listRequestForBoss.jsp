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
					<div class="blog__sidebar" style="width: 200px;">

						<div class="blog__sidebar__item">

							<h5 class="text-center" style="margin-bottom: 0px;">
								<strong>사장님 페이지</strong>
							</h5>
							<br />


							<div class="getStoreNo">

							</div>

						</div>


					</div>
				</div>

				<!-- 지갑 조회 start-->
				<div style="margin-bottom: 1150px; width: 850px;">
					<h4 class="text-left">
						<strong>내가 한 요청</strong>&nbsp; <span
							style="color: #6E6E6E; font-size: 13px">요청 내역들을 한 눈에 볼 수
							있습니다.</span>
						<hr size="10px">
					</h4>

					<!--지갑조회 주문내역 테이블 start-->
					<h6 class="text-left">

						<strong>광고 요청 내역</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="color: #6E6E6E; font-size: 13px">${store.orderDateStart}~${store.orderDateEnd}</span>
					</h6>

					<table class="table table-hover table-striped">

						<thead>
							<tr>
								<th align="center">No</th>
								<th align="left">광고 요청 제목</th>
								<th align="left">요청 날짜</th>
								<th align="left">요청 상태</th>
							</tr>
						</thead>

						<tbody>

							<c:set var="i" value="0" />
							<c:forEach var="adRequest" items="${requestList}" begin="0">
								<c:set var="i" value="${ i+1 }" />
								<c:if test="${adRequest.reqCode eq 4}">
									<tr>
										<td align="Center">${ i }</td>
										<td align="left">${adRequest.adTitle}</td>
										<td align="left">${adRequest.reqDate}</td>
										<td><c:if test="${adRequest.reqStatus.trim()=='1'}">
												<span>요청중</span>
											</c:if> <c:if test="${adRequest.reqStatus.trim()=='2'}">
												<span style="color: blue;">수락완료</span> &nbsp;(${adRequest.resDate})
                           </c:if> <c:if
												test="${adRequest.reqStatus.trim()=='3'}">
												<span style="color: red;">거절</span>
											</c:if></td>
									</tr>
								</c:if>
							</c:forEach>


						</tbody>

					</table>
					<!--지갑조회 주문내역 테이블 End-->
					<br />
					<hr>

					<!--지갑조회 환급내역 테이블 start-->
					<h6 class="text-left">
						<strong>상점 등록 요청 내역</strong>
					</h6>
					<table class="table table-hover table-striped">

						<thead>
							<tr>
								<th align="left">상점이름</th>
								<th align="left">사장님ID</th>
								<th align="left">요청 날짜</th>
								<th align="left">요청 상태</th>
							</tr>
						</thead>

						<tbody>

							<c:set var="i" value="0" />
							<c:forEach var="addRequest" items="${requestList}">
								<c:set var="i" value="${ i+1 }" />
								<c:if test="${addRequest.reqCode eq 1}">
									<tr>
										<td align="left">${addRequest.store.storeName}</td>
										<td align="left">${addRequest.userId}</td>
										<td align="left">${addRequest.reqDate}</td>
										<td><c:if test="${addRequest.reqStatus.trim()=='1'}">
												<span>요청중</span>
											</c:if> <c:if test="${addRequest.reqStatus.trim()=='2'}">
												<span style="color: blue;">수락완료</span> &nbsp;(${addRequest.resDate})
                           </c:if> <c:if
												test="${addRequest.reqStatus.trim()=='3'}">
												<span style="color: red;">거절</span>
											</c:if></td>
									</tr>
								</c:if>
							</c:forEach>

						</tbody>

					</table>
					<!--지갑조회 환급내역 테이블 start-->
				</div>
				<!-- 지갑조회 End -->
				<div class="text-center"></div>
			</div>
		</div>
	</section>
	<!-- ceoLeft Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->
	</script>
	
	<script type="text/javascript">
   
   //======페이지 이동 상점번호 받아오기=========//
   
     $(function() {
            getStoreNo();
         });
      

         function getStoreNo() {
                 
               var userId = $("#userId").val();
            
               var uri = "/store/getStoreNo/"+userId
               

               $.get(uri, function(response) { 
                  
                     var getStoreNoHtmlBody = "";
                     
                     $(response.getStoreNo).each(function(idx,store) {              

                        getStoreNoHtmlBody += `
 
							<div class="list-group text-center" style="font-size: 15px;">
							<button type="button"
								class="list-group-item list-group-item-action"
								aria-current="true"><a href="/orders/getOrdersListCeo" style="color:black">주문 내역</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/store/updateStore?storeNo=\${store.storeNo}" style="color:black">상점 정보
								수정</button>
							<button type="button"
								class="list-group-item list-group-item-action" class="addStore">
								<span class="addStore"><a href="/user/confirmPasswordViewC?userId=${sessionScope.user.userId}" style="color:black">개인 정보 수정</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="deleteStore"><a href="/store/addStoreProduct?storeNo=\${store.storeNo}" style="color:black"> 상품 등록</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="refundStore"><a href="/request/addRequestAd?storeNo=\${store.storeNo}" style="color:black"> 광고 등록</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="adStore"><a href="/request/getRequestAdStoreList?storeNo=\${store.storeNo}&userId=${sessionScope.user.userId}" style="color:black"> 내가 한 요청</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="adStore"><a href="/store/getStoreWallet?storeNo=\${store.storeNo}" style="color:black"> 지갑</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/store/getStore?storeNo=\${store.storeNo}" style="color:black">내 상점 가기</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/board/getBoardInquiryList" style="color:black">1:1
								문의내역</button>
						</div>

                         
                            
                        `;
                     });
                     
                     
                     $(".getStoreNo").html(getStoreNoHtmlBody);
                     //$(".userlisthead").html(blacklistHtmlBody);
                  
               }, "json");

         }    
     
</script>

</body>

</html>