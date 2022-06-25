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



//============= "탈퇴"  Event 처리 및  연결 =============
$(function() {
	$("#deleteUser").on("click" , function() {
		$("form").attr("method" , "POST").attr("action" , "/user/deleteUser").submit();
	});
});	

//=============이메일" 유효성Check  Event 처리 =============
 $(function() {
	 
	 $("input[name='email']").on("change" , function() {
			
		 var email=$("input[name='email']").val();
	    
		 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
	    	alert("이메일 형식이 아닙니다.");
	     }
	});
	 
});	

////////////////////////////////수정 시작///////////////////////////////////////
	function fncUpdateUser() {
		var password=$("input[name='password']").val();
		
		if(password == null || password.length <1 || password == " "){
			alert("비밀번호를 입력하세요.");
			return;
		}
	
	
	
	
	
	$("#confirmPw").attr("method" , "POST").attr("action" , "/user/confirmPassword").submit();   
}

	function confirm() {
		location.href="/user/confirmPasswordView?userId=${user.userId}"
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

						<br/> <strong class="mytop01"><span style="font-size: 25px;"><a data-toggle="modal" style="color:black;" href="#staticBackdrop">보유쿠폰</a> &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></span></strong> <br/> <br/>
						<h2 class="mytop01-content " id="request"><span class="countall"><span class="countCoupon"></span></span></h2> 개 </br> </br>

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
                        <strong>마이 페이지</strong>
                     </h5>

                     <br/>

                     <div class="list-group text-center" style="font-size: 15px;">
                        <button type="button"
                           class="list-group-item list-group-item-action"
                           aria-current="true" onclick="location.href='/orders/getOrdersList'">주문내역</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" onclick="confirm()">개인정보</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" onclick="location.href='/board/getBoardInquiryList'">1:1문의</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" class="addStore"><span class="addStore">작성한 글 
                           </span>
                            </button>
                     </div>

                  </div>


               </div>
            </div>

            <!-- 개인 정보 수정 Start -->
            <div>
               <h4 class="text-left">
                  <strong>개인 정보 수정</strong>

               </h4>
                  <hr style="height:20px;">
               <h5 class="text-left">
                  <strong>비밀번호 확인</strong>
               </h5>
				<a>고객님의 정보를 보호하기 위해 비밀번호를 확인합니다.</a>
                  <hr size="10px">


                  <table class="table table-hover"
                     style="width: 730px; heigh: 300px;">

                     <form class="form-horizontal" id="confirmPw">


                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">아이디</label>
                           <div class="col-sm-6">
                              <input type="text" name="userId"
                                 class="form-control form-control" id="userId"
                                 value="${user.userId}" readonly>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabel"
                              class="col-sm-3 col-form-label col-form-label">비밀번호</label>
                           <div class="col-sm-6">
                              <input type="password" name="password"
                                 class="form-control form-control" id="password"
                                 value="" >
                           </div>
                        </div>

                        
                    </form>



                  </table>
                  
                  <!--비밀번호 확인 Start-->
                   <hr style="height:20px;">

                  <div class="text-center">
                     <button type="button" id="button11" class="site-btn" style="border-radius:4px;" onClick="fncUpdateUser()">
                        확인</button>
                  </div>
                  <!--비밀번호 확인 End-->
         </div>
      </div>
   </section>
   <!-- Blog Section End -->
   
         				<!-- 쿠폰 Modal 시작  -->
				<div class="modal fade" id="staticBackdrop" data-backdrop="static"
					data-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">


					<div class="modal-dialog">
						<div class="modal-content"
							style="width: 802px;height: 500px;align-items: center;right: 150px;">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">
									<strong style="padding-right: 550px;"><img
										src="${path}/resources/static/img/coupon.png"
										style="width: 50px; height: 40px;">&nbsp;&nbsp;&nbsp;쿠폰
										목록 조회</strong></strong>
								</h5>
							</div>
							<div class="modal-body">
								<div>

									<table class="table" style="width: 700px">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">쿠폰종류</th>
												<th scope="col">쿠폰할인율</th>
												<th scope="col">유효기간</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="coupon" items="${couponList}">
												<c:set var="i" value="${ i+1 }" />

												<tr>
													<th scope="row">${i}</th>
													<td><c:if test="${coupon.couponType==1}">
      								고객님의 회원가입을 축하합니다. (회원가입 쿠폰)
      							</c:if> <c:if test="${coupon.couponType==2}">
      								고객님의 첫 구매를 축하합니다. (첫구매 쿠폰)
      							</c:if> <c:if test="${coupon.couponType==3}">
     								고객님의 생일을 축하합니다. (생일축하 쿠폰)
      							</c:if> <c:if test="${coupon.couponType==4}">
     								고객님께 소중한 쿠폰 배달왔습니다. (추천인 쿠폰)
      							</c:if></td>
													<td style="padding-left: 35px;"><fmt:formatNumber value="${coupon.couponDc*100}" />%</td>
													<td>${coupon.couponValidDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>



							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>


				</div> 
				<!-- 쿠폰 Modal 끝 -->

   <!-- Footer Begin --> 
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->

</body>

</html>