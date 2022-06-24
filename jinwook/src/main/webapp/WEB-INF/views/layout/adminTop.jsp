<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>

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
	
	/////////////// 광고 요청 목록 이동 ////////////////
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
   
    /////////////// 요청대기 COUNT REST 끝    ////////////////

   
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
   padding-top: 0px
}

.blog__sidebar__item {
   width: 200px;
}

.row{
   display: flex;
    justify-content: center;
	align-items: flex-start;
}

input.form-control[readonly] {
    background-color: #ffffff;
    opacity: 1;
}

.swal-button{
	background-color: #7fad39;
	font-size: 12px;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}

</style>
 </head>   
 
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		style="background-color: #F2F2F2">
		<div class="container">
			<div class="row my-1">
				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 문의내역 &nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i></strong> <br/> <br/>
						<h1 class="mytop01-content " id="inquiry"><span class="countinq"></span></h1>
						건 <br/> <br/>

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

                     <br/>

                     <div class="list-group text-center" style="font-size: 15px;">
                        <button type="button"
                           class="list-group-item list-group-item-action"
                           aria-current="true">회원 목록</button>
                        <button type="button"
                           class="list-group-item list-group-item-action">상점 목록</button>
                        <button type="button"
                           class="list-group-item list-group-item-action">신고 접수 목록</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" class="addStore"><span class="addStore">상점 등록 요청 
                           </span>
                            </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">
                           <span class="deleteStore">상점 삭제 요청  
                           </span>
                        </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">
                           <span class="refundStore"> 
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
                         <button type="button"
                           class="list-group-item list-group-item-action">
						통계
                        </button>
                     </div>

                  </div>


               </div>
            </div>
