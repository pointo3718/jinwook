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
<title>요청 목록</title>

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


<style>
*{font-family: 'Noto Sans KR', sans-serif;}

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

.blog__sidebar__item {
	width: 200px;
}

a{
color: #7fad39;
}
</style>

</head>

<body>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">


	/////////////// 회원목록 이동 시작 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('회원 목록')").on("click" , function() {
			$(self.location).attr("href","/admin/blog");
		});
	});
	//////////////// 상점목록 이동 끝 /////////////////
	
	/////////////// 상점목록 이동 시작 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('상점 목록')").on("click" , function() {
			$(self.location).attr("href","/admin/listStoreAdmin");
		});
	});
	//////////////// 상점목록 이동 끝 /////////////////
	
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

	
//////////////// 모달창 열기 ////////////////////
var NOTIFYID="";
var COMPLAINNO="";
var BLACKPERIOD="";
	    
$(document).ready(function() {     
	$('#exampleModal').on('show.bs.modal', function(event) {          
		NOTIFYID = $(event.relatedTarget).data('notifyid');
	    COMPLAINNO = $(event.relatedTarget).data('complainno');
	    alert(NOTIFYID);
	    alert(COMPLAINNO);
	 });
});
///////////////////////////////////////////////	
	
	
///////////////// 블랙리스트 등록 REST 시작 /////////////////
$(function() {
			$("#register").on(
					"click",
	function updateBlacklist() {
	
		var BLACKPERIOD = $(".form-check-input:checked").val();
	
		var uri = "/admin/updateBlacklist/" + NOTIFYID+ "/" +BLACKPERIOD+ "/" +COMPLAINNO;
		alert(uri);
		var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "PATCH"};
	
		$.ajax({
			url: uri,
			type: "PATCH",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
				if (response.result == false) {
					alert("블랙리스트 등록에 실패하였습니다.");
					return false;
				}
				alert(NOTIFYID+"님을 블랙리스트로 등록했습니다.");
				  location.reload();
				  modal("hide");
			},
			error: function(xhr, status, error) {
				alert("에러가 발생하였습니다.");
				return false;
			}
		});
	}); 
});
</script>

	<!-- 블랙리스트 날짜 지정 Modal -->
	<div class="modal fade" id="exampleModal" data-toggle="modal"
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						블랙리스트 지정기간을</br>선택해주세요
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="blackPeriod" value="7days" checked> <label
							class="form-check-label" for="exampleRadios1"> 일주일 </label>
					</div>
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="exampleRadios2" value="1month"> <label
							class="form-check-label" for="exampleRadios2"> 한 달 </label>
					</div>
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="exampleRadios1" value="6month"> <label
							class="form-check-label" for="exampleRadios1"> 6개월 </label>
					</div>
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="exampleRadios1" value="1year"> <label
							class="form-check-label" for="exampleRadios1"> 1년 </label>
					</div>
					</br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="register">등록</button>
				</div>
			</div>
		</div>
	</div>

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
									class="list-group-item list-group-item-action">신고 접수
									목록</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="addStore">상점 등록 요청</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="deleteStore">상점 삭제 요청</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="refundStore">환급 요청</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">광고 등록 요청</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">1:1
									문의내역</button>
							</div>

						</div>


					</div>
				</div>

				<!-- UserList Table Start -->
				<div>
					<h4 class="text-left">
						<strong>신고 접수 목록</strong>
						<p class="text-muted" style="display: inline; font-size: 12px;">
							신고 접수건 조회와 블랙리스트 지정이 가능합니다.</p>
						<hr size="10px">
					</h4>


					<table class="table table-hover"
						style="width: 730px; heigh: 300px; font-size: small;">

						<thead class="userlisthead">
							<tr class="userinfohead">
								<th scope="col">no</th>
								<th scope="col">신고당한 ID</th>
								<th scope="col">신고한 ID</th>
								<th scope="col">신고 날짜</th>
								<th scope="col">신고 유형</th>
								<th scope="col">신고 위치</th>
								<th scope="col">블랙 지정 여부</th>
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>

						<tbody class="userlistbody">
							<tr class="userinfobody">
								<c:set var="i" value="0" />
								<c:forEach var="complain" items="${complainList}">
									<c:set var="i" value="${ i+1 }" />
									<tr>
										<td align="left">${complain.complainNo}</td>
										<td align="left">${complain.userId}</td>
										<td align="left">${complain.complainId}</td>
										<td align="left">${complain.complainDate}</td>
										<!-- a:  -->
										<td align="left">${complain.complainCode}</td>
										<td align="left">${complain.complainTarget}</td>
										<td align="left">${complain.complainStatus}</td>
										<c:if test="${complain.complainStatus == false}">
											<td align="left">
												<button type="button" class="btn btn-dark" id="preRegister"
													data-toggle="modal" data-target="#exampleModal"
													data-notifyid="${complain.userId}"
													data-complainno="${complain.complainNo}">등록</button> <!--  data-toggle="modal" data-target="#exampleModal -->
											</td>
										</c:if>
										<c:if test="${complain.complainStatus == true}">
											<td>&nbsp;</td>
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
	/*<![CDATA[*/

	function movePage(uri, queryString) {
		location.href = uri + queryString;
	}

	/*]]>*/
	
	 /////////////// 요청대기 COUNT REST 시작 ////////////////
	 $(function() {
		countAddRequest();
	});

	function countAddRequest() {

		var uri = "CountRequestWaiting/1";

		$.get(uri, function(response) {
		
				var countAddHtml = "";

					countAddHtml += `
						상점 등록 요청 <span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;

				$(".addStore").html(countAddHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	
	 $(function() {
		countDeleteRequest();
	});

	function countDeleteRequest() {

		var uri = "CountRequestWaiting/2";

		$.get(uri, function(response) {
			
				var countDeleteHtml = "";

				countDeleteHtml += `
						상점 삭제 요청 <span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;
				
				$(".deleteStore").html(countDeleteHtml); 
			
		}, "json");
	}
	/*[- end of function -]*/
	
	 $(function() {
		countRefundRequest();
	});

	function countRefundRequest() {

		var uri = "CountRequestWaiting/3";

		$.get(uri, function(response) {
		
				var countRefundHtml = "";

				countRefundHtml += `
						환급 요청 <span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;

				$(".refundStore").html(countRefundHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	
	
	$(function() {
		countAdRequest();
	});

	function countAdRequest() {

		var uri = "CountRequestWaiting/4";

		$.get(uri, function(response) {
		
				var countAdHtml = "";

				countAdHtml += `
						광고 등록 요청 <span class="badge badge-danger">\${response.CountRequestWaiting}</span>
					`;

				$(".adStore").html(countAdHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	 /////////////// 요청대기 COUNT REST 끝  ////////////////

</script>


</body>

</html>