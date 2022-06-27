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

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		 crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	/*<![CDATA[*/

	function movePage(uri, queryString) {
		location.href = uri + queryString + "&reqCode=" + ${param.reqCode};
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
	
	/////////////// 통계 화면 이동 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('통계')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/admin/chart");
		});
	});
	
	
	 /////////////// 요청대기 COUNT REST 시작 ////////////////
	 
        //////////// 문의 대기 ////////////
	  $(function() {
		countInquiry();
	});

	function countInquiry() {

		var uri = "../admin/getWatingInquiryCount";

		$.get(uri, function(response) {
		
				var countInquiryHtml = "";

				countInquiryHtml += `
						<span>\${response.getWatingInquiryCount}</span>
					`;

				$(".countinq").html(countInquiryHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	 
	 //////////// 신고 대기 ////////////
	  $(function() {
		countCompain();
	});

	function countCompain() {

		var uri = "../admin/getComplainTotalCount";

		$.get(uri, function(response) {
		
				var countComplainHtml = "";

				countComplainHtml += `
						<span>\${response.countWaitingComplain}</span>
					`;

				$(".countcompl").html(countComplainHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	 
	
	 //////////// 요청 all ////////////
	  $(function() {
		countAll();
	});

	function countAll() {

		var uri = "../admin/CountRequestWaiting/0";

		$.get(uri, function(response) {
		
				var countAllHtml = "";

					countAllHtml += `
						<span>\${response.CountRequestWaiting}</span>
					`;

				$(".countall").html(countAllHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
	 
	 
	 
	 $(function() {
		countAddRequest();
	});

	function countAddRequest() {

		var uri = "../admin/CountRequestWaiting/1";

		$.get(uri, function(response) {
		
				var countAddHtml = "";
				if(`\${response.CountRequestWaiting}`>0){
					countAddHtml += `
						상점 등록 요청 &nbsp;<span class="badge badge-danger" id="addStore" value="\${response.CountRequestWaiting}">\${response.CountRequestWaiting}</span>
					`;

				$(".addStore").html(countAddHtml);
				}
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
				if(`\${response.CountRequestWaiting}`>0){
				countDeleteHtml += `
						상점 삭제 요청 &nbsp;<span class="badge badge-danger" id="delete" value="\${response.CountRequestWaiting}">\${response.CountRequestWaiting}</span>
					`;
				
				$(".deleteStore").html(countDeleteHtml); 
				}
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
				if(`\${response.CountRequestWaiting}`>0){
				countRefundHtml += `
						환급 요청 &nbsp;<span class="badge badge-danger" id="refund" value="\${response.CountRequestWaiting}">\${response.CountRequestWaiting}</span>
					`;

				$(".refundStore").html(countRefundHtml);
				}
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
				
				if(`\${response.CountRequestWaiting}`>0){
				countAdHtml += `
						광고 등록 요청 &nbsp;<span class="badge badge-danger" id="refund" value="\${response.CountRequestWaiting}">\${response.CountRequestWaiting}</span>
					`;

				$(".adStore").html(countAdHtml);
				}
		}, "json");
	}
	/*[- end of function -]*/
	
	
	////////////// 남은 픽업 /////////////
	$(function() {
			countPickup();
		});
	
		function countPickup() {
	
			var uri = "countPickup/STORENO";
	
			$.get(uri, function(response) {
			
					var countPickupHtml = "";
	
					countPickupHtml += `
						<a href="#" title="Homzzang.com" data-toggle="popover" data-trigger="hover" data-placement="bottom"  data-content="countPickup(\${response.countPickup});" >남은 픽업</a>
						`;
						
					 $(".countPick").remove();
					$(".countPickHead").html(countPickupHtml);
				
			}, "json");
		}
		
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

.swal-button{
	background-color: #7fad39;
	font-size: 12px;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
</style>


</head>

<body>

	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" flush="true" />
	<!-- Header End -->
	
	<!-- Modal2 Begin -->
    <!-- 회원 상세 modal -->
    <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismis style="margin-left: 0px; text-align: center;">회원 상세<s="modal" aria-label="Close">
	        </button>
            </div><div class="container"></div>
            <div class="modal-body">
          
         <div class="col-md-10 order-md-1">
          <div class="col-md-12 mb-3">
            <label for="Name">아이디</label>
            <input type="text" class="form-control" name="userid" placeholder="" value="" readonly>
          </div>
          
         <div class="container">  
         	<div class="row forModal">
          	<div class="col-md-6 mb-3">
            	<label for="userId">이름</label>
            	<input type="text" class="form-control" name="username" placeholder="" value="" readonly>
         	 </div>
          <div class="col-md-6 mb-3">
           	 	<label for="userId">닉네임</label>
           	 	<input type="text" class="form-control" name="nickname" placeholder="" value="" readonly>
          </div>
			</div>
        </div>

        <div class="col-md-12 mb-3">
            <label for="Name">이메일</label>
            <input type="text" class="form-control" name="email" placeholder="" value="" readonly>
          </div>

        <div class="container">  
         	<div class="row forModal">
          	<div class="col-md-6 mb-3">
            	<label for="userId">생년월일</label>
            	<input type="text" class="form-control" name="birth" placeholder="" value="" readonly>
         	 </div>
          <div class="col-md-6 mb-3">
           	 	<label for="userId">성별</label>
           	 	<input type="text" class="form-control" name="gender" placeholder="" value="" readonly>
          </div>
			</div>
        </div>

        <div class="col-md-12 mb-3">
            <label for="Name">전화번호</label>
            <input type="text" class="form-control" name="phone" placeholder="" value="" readonly>
          </div>

	 	<div class="col-md-12 mb-3">
            <label for="Name">구분</label>
            <input type="text" class="form-control" name="role" placeholder="" value="" readonly>
         </div>
            
         <div class="col-md-12 mb-3">
            <label for="Name">가입일자</label>
            <input type="text" class="form-control" name="regdate" placeholder="" value="" readonly>
         </div>
           
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">닫기</a>
            </div>
          </div>
        </div>
    </div>
    </div>
    </div>
	<!-- Modal2 End -->

	
	
	<!-- Modal4 Begin -->
    <!-- 광고등록요청 상세 modal -->
    <div class="modal" id="getRequestAd" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismis style="margin-left: 0px; text-align: center;">광고 요청<s="modal" aria-label="Close">
	        </button>
            </div><div class="container"></div>
            <div class="modal-body">
          
            <!-- 광고 등록 start-->
            <div style="margin-bottom: 0px; width: 700px; margin-left: 30px;">
                              
               <div class="container">
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네에 광고 등록을 위해 사장님께서 입력한 글입니다.</div>
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;요청글을 꼼꼼히 살펴보고 해당 사장님께 확인 연락해주세요.</div>
          
         </div>
          <hr size="10px">
				<form name="detailForm" id="adForm" method="post">		
				  
				   <div class="form-group">
				    <label for="exampleInputEmail1"><strong>제목</strong></label>
				    <input type="text" class="form-control" id="adTitle" name="adTitle" placeholder="ex) 진욱이네에서 광고 요청합니다.">
				  </div>
				  
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1"><strong>내용</strong></label>
				    <textarea class="form-control" id="adContent" name="adContent" rows="6"
				    ></textarea>
				  </div>
				  
				
				  <div class="form-group">
					 <label for="exampleFormControlFile1"><strong>사진</strong></label>
				  	
				  	 <div class="img_wrap_fir">
                      <img name="adImage"
				         src=""
				         onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
				         alt="My Image" width="700" height="400">
                     </div>
				  	
				  </div>
					
				  <br/><br/>
				  
				</form>
				               
            </div>
            <!-- 광고 등록 보기 End -->
        </div>

            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">닫기</a>
            </div>
          </div>
        </div>
    </div>
    </div>
    </div>
	<!-- Modal4 End -->
	
	
	<!-- Modal5 Begin -->	
	<!-- 상점 등록 Modal -->
    <div class="modal" id="getRequestAddStore" aria-hidden="true" style="display: none; z-index: 1060;">
       <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismis style="margin-left: 0px; text-align: center;">상점 등록 요청 상세<s="modal" aria-label="Close">
           </button>
            </div><div class="container"></div>
            <div class="modal-body">
            
           <div class="container">
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네에 등록 요청한 상점 정보입니다.</div>
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;상점 등록 절차대로 진행해주세요.</div>
         </div>      
         <hr>        
              		   <div class="form-group row">                    
                           <label for="colFormLabel"
                              class="col-sm-2 col-form-label col-form-label">사장님ID</label>
                           <div class="col-sm-6">
                              <input type="text" name="userIdForStore"
                                 class="form-control form-control" id="userIdForStore"
                                 value="" readonly>
                           </div>
                        </div>
                        
                         <div class="form-group row">                    
                           <label for="colFormLabel"
                              class="col-sm-2 col-form-label col-form-label">사장님 이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="userNameForStore"
                                 class="form-control form-control" id="userNameForStore"
                                 value="" readonly>
                           </div>
                        </div>
              
              
              			<div class="form-group row">
                     
                           <label for="colFormLabel"
                              class="col-sm-2 col-form-label col-form-label">상점이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="storeName"
                                 class="form-control form-control" id="storeName"
                                 value="" readonly>
                           </div>
                        </div>
<!-- onchange="this.form.submit()" -->
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점업종</label>
                           <div class="col-sm-6">
                           <input type="text" name="storeType"
                                 class="form-control form-control" id="storeType"
                                 value="" readonly>

                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점주소</label>
                           <div class="col-sm-4">
                              <input type="text" name="storeAddr" id="storeAddr_main"
                                 class="form-control form-control" 
                                 value="" placeholder="상점 주소 검색 Click" readonly>
                           </div>
                           <div class="col-sm-2" style="font-size: 22px; padding-left: 0px; right: 5px;">
                           <i class="fa fa-search" aria-hidden="true"></i>
                           </div>
                        </div>                                           

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점시작날짜</label>
                           <div class="col-sm-6">
                           <input type="text" name="storeStart"
                                 class="form-control form-control" id="storeType"
                                 value="" readonly>

                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점소개</label>
                           <div class="col-sm-6">
                              <textarea class="form-control" id="storeIntro" name="storeIntro" cols="20" rows="5" value="" 
                               readonly></textarea>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점전화번호</label>
                           <div class="col-sm-6">
                              <input type="text" name="storePhone"
                                 class="form-control form-control" id="storePhone"
                                 value="" readonly>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점사진</label>
                           <div class="col-sm-6">
                              <span class="btn btn-default btn-file"
                                    style="padding-left: 0px; padding-bottom: 15px;">
                                 <div>
                                      <div class="img_wrap_fir">
                                       <img name="storeImage"
					                     src=""
					                     onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
					                     alt="My Image" width="300" height="300">
                                      </div>
                                  </div>
                              </span>
                           </div>
                        </div>                                                    

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">계좌번호</label>
                                                      
                           <div class="col-sm-6" style="padding-left: 0px;">
                              <div class="col-sm-6">
                               <input type="text" name="bank"
                                 class="form-control form-control" id="bank"
                                 value="" readonly>
                              </div>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label"></label>
                           <div class="col-sm-6">
                              <input type="text" name="accNo"
                                 class="form-control form-control" id="accNo"
                                 value="" readonly>
                           </div>
                        </div>
                        </form>
          				
         			<br/>				
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">닫기</a>
            </div>
          </div>
        </div>
    </div>
    </div>
    
    
    <!-- 상점 등록요청 상세 Modal -->
	
	<!-- Modal5 End -->


	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		style="background-color: #F2F2F2">
		<div class="container">
			<div class="row my-1">
				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 문의내역 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></strong> </br> </br>
						<h1 class="mytop01-content " id="inquiry"><span class="countinq"></span></h1>
						건 </br> </br>

					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 요청접수 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></strong></br> </br>
						<h1 class="mytop01-content " id="request"><span class="countall"></span></h1>
						건 </br> </br>
					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 신고접수 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></strong> </br> </br>
						<h1 class="mytop01-content" id="compl"><span class="countcompl"></span></h1>
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
									class="list-group-item list-group-item-action" reqNo="1"><span class="addStore">상점 등록 요청</span>
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
									class="list-group-item list-group-item-action">
								1:1 문의내역
								</button>
								 <button type="button"
			                          class="list-group-item list-group-item-action">통계</button>
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
						style="width: 730px; heigh: 300px; font-size: small;">
						
						<thead class="userlisthead">
							<tr class="userinfohead">
								<th scope="col">상점이름</th>
								<th scope="col">사장님 ID</th>
								<th scope="col">이름</th>
								<c:if test="${param.reqCode eq 3}">
								<th scope="col">환급 금액</th>
								</c:if>
								<c:if test="${param.reqCode eq 4}">
								<th scope="col">요청 제목</th>
								</c:if>
								<th scope="col">날짜</th>
								<th scope="col">승인여부</th>
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
									<c:if test="${request.reqDeleteYn == false}">
									<c:if test="${param.reqCode eq 1}">
									<th scope="row"><a
										id="RequestAddDetail" data-toggle="modal" href="#getRequestAddStore" data-reqno="${request.reqNo}">${request.store.storeName} </a></th>
									</c:if>
									<c:if test="${param.reqCode ne 1}">
									<th scope="row">${request.store.storeName} </th>
									</c:if>
									<td align="left"
										style="color: forestgreen"><a
										id="userdetail" data-toggle="modal" href="#myModal2" data-userid="${request.userId}">${request.userId}</a></td>
									<td align="left">${request.user.userName}</td>
									
									<c:if test="${param.reqCode eq 3}">
									<td align="left"><strong style="color: red;">${request.refundMoney}</strong></td>
									</c:if>
									<c:if test="${param.reqCode eq 4}">
									<td align="left"><a style="color: black;" id="addetail" data-toggle="modal" href="#getRequestAd" data-reqno="${request.reqNo}"><strong>${request.adTitle}</strong></a></td>
									</c:if>
									
									<td align="left">${request.reqDate}</td>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '1'}">
									<td style="padding-top: 5px; padding-bottom: 5px;">
									<button type="button" class="btn btn-outline-success" id="acceptForAdd" onClick="updateRequestAddStore(${request.reqNo});">승인</button>
									<button type="button" class="btn btn-outline-warning" id="refuse" onClick="updateRequestStatusToRefuse(${request.reqNo});">거절</button>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '2'}">
									<td class="countPickHead"style="padding-top: 5px; padding-bottom: 5px;">
									<button type="button" class="btn btn-outline-success" id="acceptForDelete" onClick="deleteStore(${request.reqNo}, '${request.store.storeNo}');">승인</button>
									<button type="button" class="btn btn-outline-warning" id="refuse" onClick="updateRequestStatusToRefuse(${request.reqNo});">거절</button>
									<span class="countPick">
									남은 픽업
									</span>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '3'}">
									<td style="padding-top: 5px; padding-bottom: 5px;">
									<button type="button" class="btn btn-outline-success acceptForRefund" id="acceptForRefund" onClick="updateRequestRefund(${request.reqNo}, '${request.userId}');">승인</button>
									<button type="button" class="btn btn-outline-warning" id="refuse" onClick="updateRequestStatusToRefuse(${request.reqNo});">거절</button>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '1' and param.reqCode eq '4'}">
									<td style="padding-top: 5px; padding-bottom: 5px;">
									<button type="button" class="btn btn-outline-success" id="acceptForAd" onClick="updateRequestStatusToAccept(${request.reqNo});">승인</button>
									<button type="button" class="btn btn-outline-warning" id="refuse" onClick="updateRequestStatusToRefuse(${request.reqNo});">거절</button>
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '2'}">
									<td>
									<span style="color: blue;">승인</span> &nbsp;(${request.resDate})
									</td>
									</c:if>
									
									<c:if test="${request.reqStatus eq '3'}">
									<td>
									<span style="color: red;">거절</span> &nbsp;(${request.resDate})
									</td>
									</c:if>
									
									 <td class="shoping__cart__item__close">
                                        <span class="icon_close text-center" onClick="deleteRequest(${request.reqNo})"></span>
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
	
	<div class="container">

	<a href="#" title="Homzzang.com" data-toggle="popover" data-trigger="hover" data-placement="top"  data-content="홈페이지제작관리">홈짱닷컴</a>
	</div>
	
	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

<script type="text/javascript">

$(document).ready(function(){

    $('[data-toggle="popover"]').popover();   

});

////////////////// 상점등록 REST ////////////////////
	
	var REQNO;
	var USERID;
	var STORENO;
	
	function updateRequestAddStore(REQNO) {

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
	} 
////////////////// 상점 등록 REST ////////////////////

////////////////// 상점 삭제 REST ////////////////////
	function deleteStore(REQNO, STORENO) {

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
	}
////////////////// 상점 삭제 REST //////////////////////

//////////////////환급 수락 REST ///////////////////////
	function updateRequestRefund(REQNO, USERID) {

	alert(REQNO);
	alert(USERID);
	
	swal("요청을 수락할까요?", "", "warning");
	
	var uri = "/request/updateRequestRefund/" + REQNO + "/" + USERID;
	
	var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "PATCH"};

		$.ajax({
			url: uri,
			type: "PATCH",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
								
				if (response.result == true) {
					swal(REQNO+"번 요청을 수락했습니다.", "", "success");
					location.reload();
					return true;
				}
				swal(response.message, "", "error");
				
			},
			error: function(xhr, status, error) {
				alert("에러가 발생하였습니다.");
				return false;
			}
		});
		
	}
////////////////// 환급 수락 REST ///////////////////////

////////////////// 광고 수락 REST ///////////////////////
	function updateRequestStatusToAccept(REQNO, USERID) {

	alert(REQNO);
	
	var uri = "/request/updateRequestStatusToAccept/" + REQNO;
	
	var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "PATCH"};

		$.ajax({
			url: uri,
			type: "PATCH",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
								
				if (response.result == true) {
					swal(REQNO+"번 요청을 수락했습니다.", "", "success");
					location.reload();
					return true;
				}
				swal(response.message, "", "error");
				
			},
			error: function(xhr, status, error) {
				alert("에러가 발생하였습니다.");
				return false;
			}
		});
		
	}
////////////////// 광고 수락 REST ///////////////////////


////////////////// 요청 거절 REST ///////////////////////
	function updateRequestStatusToRefuse(REQNO) {

	alert(REQNO);

       
			var uri = "/request/updateRequestStatusToRefuse/" + REQNO;
	
			var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "PATCH"};

				$.ajax({
					url: uri,
					type: "PATCH",
					headers: headers,
					dataType: "json",
					
					success: function(response) {
										
						if (response.result == true) {
							swal(REQNO+"번 요청을 거절했습니다.");
							location.reload();
							return true;
						}
						swal(response.message, "", "error");
						
					},
					error: function(xhr, status, error) {
						alert("에러가 발생하였습니다.");
						return false;
					}
				
				});
	}
		
	
////////////////// 요청 거절 REST ////////////////////////

////////////////// 목록 삭제 REST ///////////////////////
	function deleteRequest(REQNO) {
	swal("요청을 삭제하시겠습니까?","","warning");
	var uri = "/request/deleteRequest/" + REQNO;
	
	var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "DELETE"};

		$.ajax({
			url: uri,
			type: "DELETE",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
								
				if (response.result == true) {
					swal(REQNO+"번 요청을 삭제했습니다.");
					location.reload();
					return true;
				}
				swal(response.message, "", "error");
				
			},
			error: function(xhr, status, error) {
				alert("에러가 발생하였습니다.");
				return false;
			}
		})
}

////////////////유저 상세 REST 시작 /////////////////
	var USERID="";

	function getUser(){
	        	
		  var uri = "/admin/getUserRest/"+USERID;
			   $.get(uri, function(response) { 
				 $('input[name=userid]').attr('value',`\${response.userId}`);
				 $('input[name=username]').attr('value',`\${response.userName}`);
				 $('input[name=nickname]').attr('value',`\${response.nickName}`);
				 $('input[name=email]').attr('value',`\${response.email}`);
				 $('input[name=birth]').attr('value',`\${response.birth}`);
				 $('input[name=gender]').attr('value',`\${response.gender}`);
				 $('input[name=phone]').attr('value',`\${response.phone}`);
				 $('input[name=role]').attr('value',`\${response.role}`);
				 $('input[name=regdate]').attr('value',`\${response.regDate}`);
			   }, "json");
			}

	//모달 창 오픈할 때 해당 유저아이디 전달 //
	$(document).ready(function() {     

		$('#myModal2').on('show.bs.modal', function(event) {          
			USERID = $(event.relatedTarget).data('userid');
		    getUser();

		 });
	});
//////////////// 유저 상세 REST 끝   /////////////////


////////////////상점등록요청 상세 REST 시작 /////////////////
	var REQNO="";

	function getRequestStore(){
	        	
		  var uri = "/request/getRequestStore/"+REQNO;
		  $.get(uri, function(response) { 
				 $('input[name=storeName]').attr('value',`\${response.store.storeName}`);
				 $('input[name=storeType]').attr('value',`\${response.store.storeType}`);
				 $('input[name=storeAddr]').attr('value',`\${response.store.storeAddr}`);
				 $('input[name=storeStart]').attr('value',`\${response.store.storeStart}`);
				 $("textarea#storeIntro").val(`\${response.store.storeIntro}`);
				 $('input[name=storePhone]').attr('value',`\${response.store.storePhone}`);
				 $('img[name=storeImage]').attr('src',`/resources/static/\${response.attach.orgFileName}`);
				 $('input[name=bank]').attr('value',`\${response.store.bank}`);
				 $('input[name=accNo]').attr('value',`\${response.store.accNo}`);
				 $('input[name=userIdForStore]').attr('value',`\${response.userId}`);
				 $('input[name=userNameForStore]').attr('value',`\${response.user.userName}`);
			   }, "json");
			}

	
	
	
	//모달 창 오픈할 때 해당 유저아이디 전달//
	$(document).ready(function() {     

		$('#getRequestAddStore').on('show.bs.modal', function(event) {          
			REQNO = $(event.relatedTarget).data('reqno');
			getRequestStore();

		 });
	});
//////////////// 상점등록요청 상세 REST 끝   /////////////////


//////////////// 광고등록요청 상세 REST 시작   /////////////////

	function getRequestAd(){
	        	
		  var uri = "/request/getRequestAd/"+REQNO;
		  $.get(uri, function(response) { 
				 $('input[name=adTitle]').attr('value',`\${response.adTitle}`);
				 $("textarea#adContent").val(`\${response.adContent}`);
				 $('img[name=adImage]').attr('src',`/resources/static/\${response.attach.orgFileName}`);
				 $('input[name=userName]').attr('value',`\${response.user.userName}`);		
			   }, "json");
			}

	//모달 창 오픈할 때 해당 유저아이디 전달 //
	$(document).ready(function() {     

		$('#getRequestAd').on('show.bs.modal', function(event) {          
			REQNO = $(event.relatedTarget).data('reqno');
			getRequestAd();

		 });
	});

//////////////// 광고등록요청 상세 REST 끝   /////////////////

</script>

</body>

</html>