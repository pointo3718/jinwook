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
<title>유저/사장/관리자 페이지 </title>

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
   
   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }


   function searchBoard(form) {
		/*[- 드롭다운이 아닌 메인 검색 키워드로 검색했을 때 -]*/
	if (isEmpty(form) == true) {
		var searchKeyword = document.getElementById("mainSearchKeyword");
		if (isEmpty(searchKeyword.value) == true) {
				alert("키워드를 입력해 주세요.");
				searchKeyword.focus();
				return false;
			}

			form = document.getElementById("searchForm");
			form.searchKeyword.value = searchKeyword.value;
			form.submit();
		}

		if (isEmpty(form.searchKeyword.value) == true) {
			alert("키워드를 입력해 주세요.");
			form.searchKeyword.focus();
			return false;
		}
	}
			
   /*[- end of function -]*/
   
   
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

/////////////// 가지고 있는 쿠폰 개수 ///////////////
 $(function() {
	getCouponCount();
});

function getCouponCount() {

	var uri = "/store/getCouponCount";

	$.get(uri, function(response) {
	
			var countCouponHtml = "";

			countCouponHtml += `
					<span>\${response.getCouponCount}</span>
				`;

			$(".countCoupon").html(countCouponHtml);
		
	}, "json");
}

   
</script>

<style>


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

.row{
   display: flex;
    justify-content: center;
	align-items: flex-start;
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

						<br/> <button type="button" class="btn btn-outline-success" style="margin-left: 20px; margin-bottom: 10px; color:#7fad39; border-color:#7fad39;" disabled>${sessionScope.user.grade}</button>
						<span>
						<strong class="mytop01"><span style="font-size: 30px;">${sessionScope.user.nickName}</span>&nbsp;님&nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></strong><br/>
						</span>
						<h1 class="mytop01-content " id="inquiry"><span class="countinq"></span></h1>
						<a href="#" style="color: gray;">전체등급보기</a> <br/> <br/>
						
					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3" style="height: 153px;">

						<br/> <strong class="mytop01"><span style="font-size: 25px;">진욱페이 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong>
						&nbsp;&nbsp;<a href="#" style="color:gray;">충전하기</a></br> </br>
						<div><h2 class="mytop01-content " id="request" style="padding-left:170px;"><span class="countall">${sessionScope.user.jpBalance}</span></h2> 원</div>
						<br/> <br/>
					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3" style="height: 153px;">

						<br/> <strong class="mytop01"><span style="font-size: 25px;">보유쿠폰 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong> <br/> <br/>
						<h2 class="mytop01-content " id="request"><span class="countall"><span class="countCoupon"></span></span></h2> 개 </br> </br>

					</div>
				</div>
			</div>

		</div>
		<!-- /container -->
	</section>
	<!-- Breadcrumb Section End -->
	
	<div class="row">
                  <img src="${path}/resources/static/img/banner/선경이네.png" alt="" style="height: 120px;">
               </div>

   <!-- Blog Section Begin -->
   <section class="blog spad">
      <div class="container">
         <div class="row" style="justify-content: space-around;">
            <div class="col-xs-4 col-xs-5"
               style="width: 200px; margin-right: 30px;">
               <div class="blog__sidebar" style="width: 200px;">

                  <div class="blog__sidebar__item">

                     <h5 class="text-center" style="margin-bottom: 0px;">
                        <strong>마이 페이지</strong>
                     </h5>

                     <br/>

                     <div class="list-group text-center" style="font-size: 15px;">
                        <button type="button"
                           class="list-group-item list-group-item-action"
                           aria-current="true">구매내역</button>
                        <button type="button"
                           class="list-group-item list-group-item-action">개인정보</button>
                        <button type="button"
                           class="list-group-item list-group-item-action">1:1문의</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" class="addStore"><span class="addStore">작성한 글 
                           </span>
                            </button>
                     </div>

                  </div>


               </div>
            </div>

            <!-- List Table Start -->
            <div>
               <h4 class="text-left">
                  <strong>구매 내역</strong>
                  <p class="text-muted" style="display: inline; font-size: 12px;">
                  구매 내역을 조회할 수 있습니다
                  </p>                   
                     
                  <hr size="10px">
               </h4>
               
				
				<!--///////////////// 검색 시작 ////////////////////-->
				
				<div class="blog__sidebar__search" style="text-align:right; margin-bottom: 0px;">
                        <input type="text" id="mainSearchKeyword" value="${user.searchKeyword}" placeholder="ID or 이름 검색..." style="width: 300px; height: 30px;" />
                        <button onclick="searchBoard(null)"><span class="icon_search"></span></button>
                 </div>
								<div >
									<div class="btn-group" role="group">
										<div class="dropdown dropdown-lg">
											<div class="dropdown-menu dropdown-menu-right" role="menu">
												<!--/* 검색 form */-->
												<form id="searchForm" action="/admin/blog" method="get" onsubmit="return searchBoard(this)" class="form-horizontal" role="form">
													<!-- /* 현재 페이지 번호, 페이지당 출력할 데이터 개수, 페이지 하단에 출력할 페이지 개수 Hidden 파라미터 */ -->
													<input type="hidden" name="currentPageNo" value="1" />
													<input type="hidden" name="recordsPerPage" value="${user.recordsPerPage}" />
													<input type="hidden" name="pageSize" value="${user.pageSize}" />
						
													
													<div>
														<label for="contain">키워드</label>
														<input type="text" name="searchKeyword" value="${user.searchKeyword}" />
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								
				<!--///////////////// 검색 끝 ////////////////////-->
				

               <table class="table table-hover"
                  style="width: 730px; heigh: 300px;">
                  
                  <thead>
                     <tr>
                        <th scope="col">#</th>
                        <th scope="col">ID</th>
                        <th scope="col">이름</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">구분</th>
                     </tr>
                  </thead>

                  <tbody>   
                     <tr>
                     <c:set var="i" value="0" />
                     <c:forEach var="user" items="${userList}">
                        <c:set var="user" value="${user}" />
                        <c:set var="i" value="${ i+1 }" />
                        <tr>
                           <th scope="row">${ i }</th>
                           <td align="left"><a 
                              data-toggle="modal" href="#myModal2" data-userid="${user.userId}">${user.userId}</a></td>
                           <td align="left">${user.userName}</td>
                           <td align="left">${user.phone}</td>
                           <td align="left">${user.role}</td>
                        </tr>
                     </c:forEach>
                     </tr>
                     
                  </tbody>
                  
               </table>
            </div>

         </div>
      </div>
   </section>
   <!--   Blog Section End -->

   <!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->

</body>

</html>