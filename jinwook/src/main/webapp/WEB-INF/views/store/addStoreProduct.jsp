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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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


	//============= "상품 삭제"  Event 연결 =============
	function fncDeleteStoreProduct(e) {
		if (!swal('상품을 삭제하시겠습니까?')) {
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
					swal("삭제완료", "success");
//					self.location = "addStoreProduct?storeNo=" + STORENO
					$( "#pp" ).load(window.location.href + " #pp" );
				}
			}

		});

	}

	//================매진 상태 변경======================//

	function fncIsSoldout(e) {

		console.log(e);

		var STORENO = $("input[name='storeNo']").val();
		var prodNo = $(e).data("value");

		$.ajax({
			url : "isSoldout/" + prodNo,
			dataType : "json",
			method : "POST",
			success : function(result) {
				if (result != null) {
					swal("매진 처리되었습니다.");
//					self.location = "addStoreProduct?storeNo=" + STORENO
					$( "#pp" ).load(window.location.href + " #pp" );
				}
			}

		});

	}
	//============= 판매 상태 변경 =============//

	function fncIsSell(e) {

		console.log(e);

		var STORENO = $("input[name='storeNo']").val();
		var prodNo = $(e).data("value");

		$.ajax({
			url : "isSell/" + prodNo,
			dataType : "json",
			method : "POST",
			success : function(result) {
				if (result != null) {
					swal("판매 처리되었습니다.");
//					self.location = "addStoreProduct?storeNo=" + STORENO
					$( "#pp" ).load(window.location.href + " #pp" );
				}
			}

		});

	}

	//============= "상품 수정"  Event 연결 =============

	function fncUpdateStoreProduct(e) {

		console.log(e);

		var PRICE = $(e).parent().parent().find("#price").val()
		var STORENO = $("input[name='storeNo']").val();
		var prodNo = $(e).data("value");
		var PRODINFO = $(e).parent().parent().find("#prodInfo").val()
		var PRODIMG = $(e).parent().parent().find("#prodImg").val()
		var PRODORIGN = $(e).parent().parent().find("#prodOrign").val()

		if (PRICE == null || PRICE.length < 1) {
			swal("가격은 반드시 입력해야 합니다.");
			return;
		}

		if (PRODINFO == null || PRODINFO.length < 1) {
			swal("상품소개는 반드시 입력해야 합니다.");
			return;
		}

		//if (PRODIMG == null || PRODIMG.length < 1) {
		//	swal("상품사진은 반드시 입력해야 합니다.");
		//	return;
		//}

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
					swal("수정 완료");
//					self.location = "addStoreProduct?storeNo=" + STORENO
					$( "#pp" ).load(window.location.href + " #pp" );
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

											var STORENO = $(
													"input[name='storeNo']")
													.val();

											$('#plus')
													.append(
															'<form id="detailForm" name="detailForm" method="post" enctype="multipart/form-data"><input type="hidden" name="prodImg" value="상품.jpg"><div class="form-row"><div class="col-md-2 mb-3"><label for="validationDefault01"></label> <span class="btn btn-default btn-file"> <input type="file" id="file" name="file" multiple="multiple"></span></div><div class="col-md-2 mb-3"><label for="validationDefault02"></label><input type="text" class="form-control" name="prodName" placeholder="상품이름" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label> <input type="text" class="form-control" name="prodInfo" placeholder="예)100g당 가격" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label> <input type="text" class="form-control" name="prodOrign" placeholder="원산지" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label> <input type="text" class="form-control" name="price" placeholder="가격" required></div><div class="col-md-2 mb-3"><label for="validationDefault01"></label><br><button type="button" name="addStoreProduct" id="addStoreProduct" class="btn btn-warning" onClick="fncAddStoreProduct()" >상품등록</button></div></div></div></form>'); // end append                            
										}); // end click                                            
					}); // end ready

	//===============상품 등록===============//
	/*
	 function fncAddStoreProduct(e) {

	 console.log(e);

	 var PRICE = $(e).parent().parent().find("#addPrice").val()
	 var STORENO = $("input[name='storeNo']").val();
	 var prodNo = null;
	 var PRODINFO = $(e).parent().parent().find("#addProdInfo").val()
	 var PRODIMG = "사진.jpg";
	 //var PRODIMG = $(e).parent().parent().find("#addProdImg").val()
	 var PRODORIGN = $(e).parent().parent().find("#addProdOrign").val()
	 var PRODNAME = $(e).parent().parent().find("#addProdName").val()
	 var soldout = true;

	 if (PRODNAME == null || PRODNAME.length < 1) {
	 swal("상품이름은 반드시 입력해야 합니다.");
	 return;
	 }

	 if (PRICE == null || PRICE.length < 1) {
	 swal("가격은 반드시 입력해야 합니다.");
	 return;
	 }

	 if (PRODINFO == null || PRODINFO.length < 1) {
	 swal("상품소개는 반드시 입력해야 합니다.");
	 return;
	 }
	
	 alert(formData)

	 //if (PRODIMG == null || PRODIMG.length < 1) {
	 //   alert("상품사진은 반드시 입력해야 합니다.");
	 //   return;
	 //}

	 $.ajax({
	 url : "addStoreProduct/" + prodNo + "/" + STORENO + "/" + PRODNAME
	 + "/" + PRICE + "/" + PRODINFO + "/" + PRODIMG + "/"
	 + PRODORIGN + "/" + soldout,
	 dataType : "json",
	 method : "post",
	 processData : false,
	 contentType : false,
	 enctype: 'multipart/form-data',
	 success : function(result) {
	 if (result != null) {
	 swal("등록이 완료되었습니다.");
	 //$("#point").load("/store/addStoreProductView/STORENO #point");
	 }
	 }

	 });

	 }
	 */

	/*	
	 function fncAddStoreProduct(e) {
	
	 var price = $(e).parent().parent().find("#addPrice").val()
	 var storeNo = $("input[name='storeNo']").val();
	 var prodNo = null;
	 var prodInfo = $(e).parent().parent().find("#addProdInfo").val()
	 var prodImg = "사진.jpg";
	 //var PRODIMG = $(e).parent().parent().find("#addProdImg").val()
	 var prodOrign = $(e).parent().parent().find("#addProdOrign").val()
	 var prodName = $(e).parent().parent().find("#addProdName").val()
	 var soldout = true;
	
	 alert(price+prodName+storeNo+prodNo+prodInfo+prodImg+prodOrign+prodName+soldout)

	 if (prodName == null || prodName.length < 1) {
	 swal("상품이름은 반드시 입력해야 합니다.");
	 return;
	 }

	 if (price == null || price.length < 1) {
	 swal("가격은 반드시 입력해야 합니다.");
	 return;
	 }

	 if (prodInfo == null || prodInfo.length < 1) {
	 swal("상품소개는 반드시 입력해야 합니다.");
	 return;
	 }
	
	 $("form").attr("method", "POST").attr("action", "/store/addStoreProduct")
	 .submit();
	 }
	
	 var cnt = 1;
	 function fn_addFile() {
	 $("#d_file").append("<br>" + "<input type='file' name='file'" + cnt +"' />");
	 }

	 */

	/////////////// 상점 등록 시작 //////////////////////

	function fncAddStoreProduct() {
		//Form 유효성 검증

		document.detailForm.action = '/store/addStoreProduct';
		$('#detailForm').submit();
		swal("등록이 완료됐습니다");
	}

	/////////////// 상점 등록 끝 ///////////////////////
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


							<div class="getStoreNo"></div>

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
										<div id="pp" name="pp" class="pp">
											<table>
												<thead>
													<tr>
														<th class="shoping__product"
															style="width: 190px; height: 30px;">상품사진</th>
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

															<div>
																<input type="hidden" name="prodNo"
																	class="form-control form-control" id="prodNo"
																	value="${store.product.prodNo}">
															</div>
															<td class="shoping__cart__item"><img
																src="/resources/static/${store.attach.orgFileName}"
																onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
																alt="My Image" width="150" height="150"
																style="border-radius: 20px;"></td>
															<td><strong style="font-size: 20px;"> <c:if
																		test="${store.product.soldout=='false'}">
																		<span style="color: red;"><s>${store.product.prodName}</s></span>
																	</c:if> <c:if test="${store.product.soldout=='true'}">${store.product.prodName}</c:if>


															</strong></td>


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
																id="price" value="${store.product.price}"
																placeholder="가격"></strong></td>
															<td class="shoping__cart__price">
																<button type="button"
																	data-value="${store.product.prodNo}" name="buttons"
																	class="btn btn-primary btn-sm"
																	onClick="fncUpdateStoreProduct(this)">수정</button>
															</td>


															<td class="shoping__cart__price">
																<button type="button" id="sell" name="sell"
																	data-value="${store.product.prodNo}"
																	class="btn btn-success btn-sm sell"
																	onClick="fncIsSell(this)">판매</button>
																<button type="button" id="soldout" name="soldout"
																	data-value="${store.product.prodNo}"
																	class="btn btn-danger btn-sm soldout"
																	onClick="fncIsSoldout(this)">매진</button>

															</td>
															<td class="shoping__cart__price">
																<button type="button"
																	data-value="${store.product.prodNo}" name="buttons"
																	class="btn btn-light btn-sm"
																	onClick="fncDeleteStoreProduct(this)">X</button> <input
																type="hidden" id="storeNo" name="storeNo"
																data-store="${store.storeNo}" value="${store.storeNo}" />

															</td>

														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>
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
								aria-current="true"><a href="/orders/getOrdersList" style="color:black">주문 내역</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/store/updateStore?storeNo=\${store.storeNo}" style="color:black">상점 정보
								수정</button>
							<button type="button"
								class="list-group-item list-group-item-action" class="addStore">
								<span class="addStore"><a href="/user/confirmPasswordView?userId=${sessionScope.user.userId}" style="color:black">개인 정보 수정</span>
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