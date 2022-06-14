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
<title>상점 등록 요청</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">	

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

	function movePage(uri, queryString) {
		location.href = uri + queryString;
	}

	/*]]>*/
	
	/////////////// 회원목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('회원 목록')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/admin/blog");
		});
	});
	
	/////////////// 상점목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('상점 목록')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/admin/listStoreAdmin");
		});
	});
	
	/////////////// 신고접수 목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('신고 접수 목록')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/admin/listComplainAdmin");
		});
	});
	
	/////////////// 상점등록요청 목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('상점 등록 요청')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/request/getRequestListForAdmin?reqCode=1");
		});
	});
	
	/////////////// 상점삭제요청 목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('상점 삭제 요청')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/request/getRequestListForAdmin?reqCode=2");
		});
	});

	/////////////// 환급요청 목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('환급 요청')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/request/getRequestListForAdmin?reqCode=3");
		});
	});

	/////////////// 광고 요청 목록 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('광고 등록 요청')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/request/getRequestListForAdmin?reqCode=4");
		});
	});

	
	 /////////////// 요청대기 COUNT REST 시작 ////////////////
	 $(function() {
		countAddRequest();
	});

	function countAddRequest() {

		var uri = "../admin/CountRequestWaiting/1";

		$.get(uri, function(response) {
		
				var countAddHtml = "";

					countAddHtml += `
						상점 등록 요청 &nbsp;<span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;

				$(".addStore").html(countAddHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	
	 $(function() {
		countDeleteRequest();
	});

	function countDeleteRequest() {

		var uri = "../admin/CountRequestWaiting/2";

		$.get(uri, function(response) {
				
			
				var countDeleteHtml = "";

				countDeleteHtml += `
						상점 삭제 요청 &nbsp;<span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;
				
				$(".deleteStore").html(countDeleteHtml); 
			
		}, "json");
	}
	/*[- end of function -]*/
	
	 $(function() {
		countRefundRequest();
	});

	function countRefundRequest() {

		var uri = "../admin/CountRequestWaiting/3";

		$.get(uri, function(response) {
		
				var countRefundHtml = "";

				countRefundHtml += `
						환급 요청 &nbsp;<span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;

				$(".refundStore").html(countRefundHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	
	
	$(function() {
		countAdRequest();
	});

	function countAdRequest() {

		var uri = "../admin/CountRequestWaiting/4";

		$.get(uri, function(response) {
		
				var countAdHtml = "";

				countAdHtml += `
						광고 등록 요청 &nbsp;<span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;

				$(".adStore").html(countAdHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	 /////////////// 요청대기 COUNT REST 끝  ////////////////

</script>

<style>
*{font-family: 'Noto Sans KR', sans-serif;}

.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  background: #ffffff;
  z-index: 10;
}

.row{
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

.btn-outline-success{
color: #7fad39;
border-color: #7fad39;
}

a{
color: #7fad39;
}
</style>


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

						</br> <strong class="mytop01">새로운 문의내역</strong> </br> </br>
						<h1 class="mytop01-content">5</h1>
						건 </br> </br>

					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 요청접수</strong> </br> </br>
						<h1 class="mytop01-content">13</h1>
						건 </br> </br>

					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 신고접수</strong> </br> </br>
						<h1 class="mytop01-content">7</h1>
						건 </br> </br>

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

						<div class="blog__sidebar__item">

							<h5 class="text-center" style="margin-bottom: 0px;">
								<strong>관리자 페이지</strong>
							</h5>

							</br>

							<div class="list-group text-center" style="font-size: 15px;">
								<button type="button"
									class="list-group-item list-group-item-action"
									aria-current="true">회원 목록</button>
								<button type="button"
									class="list-group-item list-group-item-action">상점 목록</button>
								<button type="button"
									class="list-group-item list-group-item-action">신고 접수 목록</button>
								<button type="button"
									class="list-group-item list-group-item-action" reqNo="1"><span class="addStore">상점 등록 요청
									</span>
									 </button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="deleteStore">상점 삭제 요청 
									</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="refundStore">
									환급 요청
									</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">
									광고 등록 요청
									</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
								1:1 문의내역
								</button>
							</div>

						</div>


					</div>
				</div>

				<!-- UserList Table Start -->
				<div>
					<h4 class="text-left">
						<c:if test="${param.reqCode eq 1}">
						<strong>상점 등록 요청</strong>
						<p class="text-muted" style="display: inline; font-size: 12px;">
						사장님들의 상점 등록 요청을 조회할 수 있습니다
						</p>
						</c:if>
						
						<c:if test="${param.reqCode eq 2}">
						<strong>상점 삭제 요청</strong>
						<p class="text-muted" style="display: inline; font-size: 12px;">
						사장님들의 상점 삭제 요청을 조회할 수 있습니다
						</p>
						</c:if>
						
						<c:if test="${param.reqCode eq 3}">
						<strong>환급 요청</strong>
						<p class="text-muted" style="display: inline; font-size: 12px;">
						사장님들의 환급 요청을 조회할 수 있습니다
						</p>
						</c:if>
						
						<c:if test="${param.reqCode eq 4}">
						<strong>광고 등록 요청</strong>
						<p class="text-muted" style="display: inline; font-size: 12px;">
						사장님들의 광고 등록 요청을 조회할 수 있습니다
						</p>
						</c:if>
						
						<hr size="10px">
					</h4>

					<table class="table table-hover"
						style="width: 730px; heigh: 300px;">
						
						<thead class="userlisthead">
							<tr class="userinfohead">
								<th scope="col">#</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">전화번호</th>
								<th scope="col">구분</th>
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>

						<tbody class="userlistbody">	
							<tr class="userinfobody">
							<c:set var="i" value="0" />
							<c:forEach var="request" items="${requestList}">
								<c:set var="request" value="${request}" />
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<th scope="row">${ i }</th>
									<td align="left"
										style="color: forestgreen"><a
										href="/admin/getUserAdmin?userId=${request.reqNo}">${request.reqNo}</a></td>
									<td align="left">${request.userId}</td>
									<td align="left">${request.user.userName}</td>
									<td align="left">${request.reqDate}</td>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '1'}">
									<td>
									<button type="button" class="btn btn-outline-success" id="acceptForAdd" value="${request.reqNo}">수락</button>
									<button type="button" class="btn btn-outline-warning" id="refuseForAdd">거절</button>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '2'}">
									<td>
									<button type="button" class="btn btn-outline-success" id="acceptForDelete" data-reqno="${request.reqNo}"  data-storeno="${request.store.storeNo}">수락</button>
									<button type="button" class="btn btn-outline-warning" id="refuseForDelete">거절</button>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '3'}">
									<td>
									<button type="button" class="btn btn-outline-success" id="acceptForRefund" value="${request.reqNo}">수락</button>
									<button type="button" class="btn btn-outline-warning" id="refuseForRefund">거절</button>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '4'}">
									<td>
									<button type="button" class="btn btn-outline-success" id="acceptForAd" data-reqno="${request.reqNo}">수락</button>
									<button type="button" class="btn btn-outline-warning" id="refuseForAd">거절</button>
									</td>
									</c:if>
								</tr>
							</c:forEach>
							</tr>
							
						</tbody>
						
					</table>
				</div>
				<div class="text-center">
					<!-- PageNavigation Start... -->
					<jsp:include page="../common/pageNavigator_new.jsp" />
					<!-- PageNavigation End... -->
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

<script type="text/javascript">

////////////////// 상점등록 REST ////////////////////
var REQNO;

$(function() {
	$("#acceptAdd").on(
			"click",
	function updateBlacklist() {

	var REQNO = $("#acceptAdd").val();
	alert(REQNO);

	var uri = "/request/updateRequestAddStore/" + REQNO;
	alert(uri);
	var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "PATCH"};

		$.ajax({
			url: uri,
			type: "PATCH",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
								
				if (response.result == false) {
					alert("요청 수락에 실패하였습니다.");
					return false;
				}
				alert(REQNO+"번 요청을 수락했습니다.");
				location.reload();
			},
			error: function(xhr, status, error) {
				alert("에러가 발생하였습니다.");
				return false;
			}
		});
	}); 
});
//////////////////상점등록 REST ////////////////////

////////////////// 상점삭제 REST ////////////////////
var REQNO;

$(function() {
	$("#acceptForDelete").on(
			"click",
	function updateBlacklist() {

	var REQNO = $("#acceptForDelete").data("reqno");
	var STORENO = $("#acceptForDelete").data("storeno");
	alert(REQNO);
	alert(STORENO);

	var uri = "/request/deleteStore/" + REQNO + "/" + STORENO;
	alert(uri);
	var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "PATCH"};

		$.ajax({
			url: uri,
			type: "PATCH",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
								
				if (response.result == false) {
					alert("요청 수락에 실패하였습니다.");
					return false;
				}
				alert(REQNO+"번 요청을 수락했습니다.");
				location.reload();
			},
			error: function(xhr, status, error) {
				alert("에러가 발생하였습니다.");
				return false;
			}
		});
	}); 
});
//////////////////상점삭제 REST ////////////////////


</script>


</body>

</html>