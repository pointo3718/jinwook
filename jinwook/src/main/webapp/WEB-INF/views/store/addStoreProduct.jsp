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
	//============= "상품 삭제"  Event 연결 =============
	function fncDeleteStoreProduct(e) {
		if (!confirm('상품을 삭제하시겠습니까?')) {
			return false;
		}

		console.log(e);
		const no = $(e).data("value");
		$.ajax({
			url : "deleteStoreProduct/" + no,
			dataType : "json",
			success : function(result) {
				if (result != null) {
					alert("삭제완료");
					self.location = "addStoreProduct?storeNo=" + $
					{
						store[0].storeNo
					}
					;
				}
			}

		});

	}

	//============= "상품 수정"  Event 연결 =============
	
	const testId = $("#testId").val();

	$(document).on('click', '#btn_modify', function(e) {
		if (confirm("정말 수정하시겠습니까 ?") == true) {
			
			//데이터를 담아내는 부분
			const testTitle = $("#testTitle").val().trim();
			const testContent = $("#testContent").val().trim();
			const uploadFile = $("#uploadFile")[0].files[0];

			if(testTitle === ''){
				alert('제목을 입력해주세요.');
				return;
			}
			
			if(testContent === ''){
				alert('내용을 입력해주세요.');
				return;
			}

			//ajax 통신을 사용해 서버에 데이터를 전송하기 위해 
			//폼데이터 객체를 생성함
			//append를 통해서 프로퍼티에 바인딩이 가능하도록 세팅한다.
			var formData = new FormData();
			formData.append("testId",testId);
			formData.append("testTitle",testTitle);
			formData.append("testContent",testContent);

			//만약 uploadFile이 undifined거나 null일 경우 폼데이터에 보내지 않도록 한다.
			//이부분 체크하지 않을 경우 undifined가 데이터로 보내지기 때문에 서버에서 에러가 발생한다.
			if(uploadFile)
				formData.append("uploadFile",uploadFile);
			
			//ajax로 파일전송 폼데이터를 보내기위해
			//enctype, processData, contentType 이 세가지를 반드시 세팅해야한다.
			$.ajax({
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				url : "./updateTest.do",
				data : formData,
				type : "POST",
				success : function(res){
					alert('수정 완료');
					location.href='./testList.do';
				}
			})			
		} 
	});



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

						</br> <strong class="mytop01"><h5>${store[0].user.userName}
								사장님</h5></strong> </br> </br> </br> </br>

					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">진욱페이 ></strong> </br> </br>
						<h1 class="mytop01-content">${store[0].user.jpBalance}</h1>
						원 </br> </br>


					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">${store[0].storeName}</strong> </br> </br>
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
				<div style="margin-bottom: 880px;">
					<h4 class="text-left">
						<strong>상품 등록</strong>

						<hr size="10px">
					</h4>


					<table class="table table-hover"
						style="width: 730px; heigh: 300px;">

						<form class="form-horizontal" id="profileUpdate">

							</div>
							<div class="row" style="justify-content: space-between;">
								<div class="col-lg-8 col-md-6">
									<c:forEach var="store" items="${store}" begin="0" end="0">
										<div class="row" style="width: 900px;">
											<div class="col-lg-2">
												<div class="checkout__input">
													<p>
														<Strong>상품 이름<span>*</span></Strong>
													</p>
													<input type="text" value="${store.product.prodName}"
														placeholder="${store.product.prodName}"
														style="color: #595959;" readonly>
												</div>
											</div>
											<div class="col-lg-2">
												<div class="checkout__input">
													<p>
														<Strong>상품 가격<span>*</span></Strong>
													</p>
													<input type="text" value="${store.product.price}"
														placeholder="${store.product.price}"
														style="color: #595959;">
												</div>
											</div>
											<div class="col-lg-2">
												<div class="checkout__input">
													<p>
														<Strong>상품 설명<span>*</span></Strong>
													</p>
													<input type="text" value="${store.product.prodInfo}"
														placeholder="${store.product.prodInfo}"
														style="color: #595959;">
												</div>
											</div>
											<div class="col-lg-2">
												<div class="checkout__input">
													<p>
														<Strong>상품 사진<span>*</span></Strong>
													</p>
													<input type="text" value="${store.product.prodImg}"
														placeholder="${store.product.prodImg}"
														style="color: #595959;">
												</div>
											</div>
											<div class="col-lg-2">
												<div class="checkout__input">
													<p>
														<Strong>상품 원산지<span></span></Strong>
													</p>
													<input type="text" value="${store.product.prodOrign}"
														placeholder="${store.product.prodOrign}"
														style="color: #595959;">
												</div>
											</div>

											<button type="button" data-value="${store.product.prodNo}"
												id="buttons" class="btn btn-primary btn-sm"
												onClick="fncUpdateStoreProduct(this)">수정</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-danger btn-sm">매진</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button" data-value="${store.product.prodNo}"
												id="buttons" class="btn btn-secondary btn-sm"
												onClick="fncDeleteStoreProduct(this)">X</button>

										</div>
									</c:forEach>

									<div class="row" style="justify-content: space-between;">
										<div class="col-lg-8 col-md-6">
											<c:forEach var="store" items="${store}" begin="1">
												<div class="row" style="width: 900px;">
													<div class="col-lg-2">
														<div class="checkout__input">
															<p></p>
															<input type="text" value="${store.product.prodName}"
																placeholder="${store.product.prodName}"
																style="color: #595959;" id="prodName" name="prodName"
																readonly>
														</div>
													</div>
													<div class="col-lg-2">
														<div class="checkout__input">
															<p></p>
															<input type="text" value="${store.product.price}"
																placeholder="${store.product.price}"
																style="color: #595959;">
														</div>
													</div>
													<div class="col-lg-2">
														<div class="checkout__input">
															<p></p>
															<input type="text" value="${store.product.prodInfo}"
																placeholder="${store.product.prodInfo}"
																style="color: #595959;">
														</div>
													</div>
													<div class="col-lg-2">
														<div class="checkout__input">
															<p></p>
															<input type="text" value="${store.product.prodImg}"
																placeholder="${store.product.prodImg}"
																style="color: #595959;">
														</div>
													</div>
													<div class="col-lg-2">
														<div class="checkout__input">
															<p></p>
															<input type="text" value="${store.product.prodOrign}"
																placeholder="${store.product.prodOrign}"
																style="color: #595959;">
														</div>
													</div>



													<button type="button" data-value="${store.product.prodNo}"
														id="buttons" class="btn btn-primary btn-sm"
														onClick="fncUpdateStoreProduct(this)">수정</button>
													&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-danger btn-sm">매진</button>
													&nbsp;&nbsp;&nbsp;
													<button type="button" data-value="${store.product.prodNo}"
														id="buttons" class="btn btn-secondary btn-sm"
														onClick="fncDeleteStoreProduct(this)">X</button>
												</div>
											</c:forEach>

											<!-- 추가 버튼 -->

											<div id="plus">
												<p class="original"></p>
											</div>

											<div class="col-lg-2"
												style="justify-content: space-around; margin-left: 410px;">
												<button type="button" id="plus2"
													class="btn btn-outline-secondary btn-sm"
													style="border-color: #eeeeee;">+</button>
											</div>
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