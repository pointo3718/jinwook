<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
     body {
            padding-top : 0px;
        }
        
     .rating svg:nth-chiled(-n+3) {
     	color:#f05522;
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
					self.location = "addStoreProduct?storeNo=" + STORENO
//					$( "#point" ).load(window.location.href + " #point" );
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
					self.location = "addStoreProduct?storeNo=" + STORENO
//					$( "#point" ).load(window.location.href + " #point" );
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
					self.location = "addStoreProduct?storeNo=" + STORENO
//					$( "#point" ).load(window.location.href + " #point" );
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
					self.location = "addStoreProduct?storeNo=" + STORENO
//					$( "#point" ).load(window.location.href + " #point" );
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
			<div>
               <h4 class="text-left">
                  <strong>주문 내역</strong>
                  <p class="text-muted" style="display: inline; font-size: 12px;">
                  주문 내역을 조회할 수 있습니다
                  </p>                  
                  <!-- Button trigger modal -->
				
                  <hr size="10px">
               </h4>
            

               <table class="table table-hover"
                  style="width: 730px; heigh: 300px; font-size: small;">

         <thead>
          <tr>
            <th align="center">주문번호</th>
            <th align="left">상품이름</th>
            <th align="left">주문금액</th>
            <th align="left" >주문날짜</th>
            <!-- <th align="left" >상품사진</th> -->
            <th align="left">픽업시간</th>
            <th align="left">주문현황</th>
            <th align="left">&nbsp;</th>
          </tr>
       </thead>
        
      <tbody>
        <c:set var="i" value="0" />
        <c:forEach var="orders" items="${getOrdersList}">
         <c:set var="i" value="${ i+1 }" />
         <tr>
           <td align="center" value="${orders.orderNo}">${orders.orderNo}</td>
           <td align="left">${orders.product.prodName}</td>
           <td align="left">${orders.orderPrice}</td>
           <td align="left"><fmt:formatDate value="${orders.orderDate}" dateStyle="full"/></td>
           <%-- <td align="left">${orders.product.prodImg}</td> --%>
           <td align="left"><fmt:formatDate value="${orders.pickupTime}" type="time" pattern="a hh:mm"/></td>
           <td align="left">
           <c:if test="${orders.orderStatus eq '1'}">주문 접수중</c:if>
           <c:if test="${orders.orderStatus eq '2'}">주문 거절</c:if>
           <c:if test="${orders.orderStatus eq '3'}">픽업 준비중</c:if>
           <c:if test="${orders.orderStatus eq '4'}">주문 취소</c:if>
           <c:if test="${orders.orderStatus eq '5'}">픽업 완료</c:if>
           </td>
           <td><a href="/orders/getOrdersCeo?orderNo=${orders.orderNo}" class="bi bi-caret-right"style="font-size :18px; text-decoration:none; color: #7fad39;"></a></td>
         </tr>
          </c:forEach>      
          </tbody>
               </table>
			</div>
			<div class="text-center">
               <!-- PageNavigation Start... -->
               <jsp:include page="../common/pageNavigator_new.jsp" />
               <!-- PageNavigation End... -->
            </div>		
				
            <!--  /////////////////////////////////////////////////// -->
			</div>
		</div>
				<!-- 상품등록 End -->
	</section>
	<!-- ceoLeft Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>

</html>