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
<title>공지사항 목록</title>

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
   align-items: flex-start;
}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	/*<![CDATA[*/

	function movePage(uri, queryString) {
		location.href = uri + queryString;
	}

	/*]]>*/
	
	
	
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
function fncDeleteAnnouncement(e) {
	if (!confirm('게시글을 삭제하시겠어요?')) {
		return false;
	}
	
	console.log(e);
	const no = $(e).data("value");
	 $.ajax({
			url : "/board/deleteBoardAnnouncement/"+no,
			dataType : "json",
			success : function(result){
				if(result != null){
					alert("삭제완료");
					self.location = "/board/getBoardAnnouncementList";
				}
			}
		
		});
	
}


   $(function() {

      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("td:nth-child(2)").on("click", function() {
         self.location = "/board/getBoardAnnouncement?boardNo="+$(this).data("param");
      });

   });

   //============= userId 에 회원정보보기  Event  처리 (double Click)=============
   $(function() {

      //==> userId LINK Event End User 에게 보일수 있도록 
      $(".ct_list_pop td:nth-child(3)").css("color", "red");
      $("h7").css("color", "red");

      //==> 아래와 같이 정의한 이유는 ??
      $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
   });
   
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


//////////////// 일반 유저 목록 REST 시작 /////////////////
$(function() {
		$("#option1").on(
				"click",
				function() {

	var uri = "/admin/listUserAdmin"

	$.get(uri, function(response) {
		// ë¹ì´ìì§ ìë¤ë©´ ì¤í
			var userListHtmlHead = "";
			userListHtmlHead += `
					<tr class="userinfohead">
						
						<th scope="col">#</th>
						<th scope="col">ID</th>
						<th scope="col">전화번호</th>
						<th scope="col">지정기간</th>
						<th scope="col">어쩌구</th>
					</tr>
			`;
		
			var userListHtmlBody = "";

			$(response.userList).each(function(idx, user) {
				userListHtmlBody += `
					<tr class="userinfobody">
						<td scope="row">\${idx}</td>
						<td align="left"
							style="color: forestgreen"><a
							href="/admin/getUserAdmin?userId=${user.userId}">\${user.userId}</a></td>
						<td align="left">\${user.phone}</td>
						<td align="left">\${user.blacklistEndDate}</td>
						<td align="left">\${user.role}</td>
					</tr>
				`;
			});
			$(".userinfohead").remove();
			$(".userinfobody").remove();
			
			$(".userlisthead").html(userListHtmlHead);
			$(".userlistbody").html(userListHtmlBody);
			//$(".userlisthead").html(blacklistHtmlBody);
		
	}, "json");
})
})
//////////////// 일반 유저 목록 REST 끝 /////////////////

$(function(){
	$("#addAnnouncementButton").on("click", function() {
		self.location = "/board/addBoardAnnouncementView"
	});
});

</script>

<style>
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

a{
color: #7fad39;
}
</style>


</head>

<body>

	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
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
									class="list-group-item list-group-item-action"><span class="addStore">상점 등록 요청</span>
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
						<strong>공지사항 목록</strong>
						<c:if test="${sessionScope.user.role == '관리자'}">
							<div><button type="submit" class="site-btn" id="addAnnouncementButton" style="margin-top:20px;">공지사항 등록 </button></div>
						</c:if>
						<p class="text-muted" style="display: inline; font-size: 12px;">
						</p>
						<!-- <div class="btn-group btn-group-toggle" data-toggle="buttons" style="left:300px;">
							
							<label class="btn btn-light active" style="font-size: 13px;"> 
							<input type="radio" name="options" id="option1" checked>
							 &nbsp; &nbsp; &nbsp; 일반 &nbsp; &nbsp; &nbsp;    
							</label> 
							
							<label class="btn btn-light" style="font-size: 13px;" >
							 <input type="radio" name="options" id="option3">
							  블랙리스트
							</label>
							
						</div> -->
						<hr size="10px">
					</h4>


					<table class="table table-hover"
						style="width: 730px; heigh: 300px;">
						
						<thead class="boardlisthead">
							<tr class="boardinfohead">
								<th scope="col">No</th>							
								<th scope="col">공지사항 제목</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<c:if test="${sessionScope.user.role == '관리자'}">
								<th scope="col">삭제</th>
								</c:if>
							</tr>
						</thead>

						<tbody class="boardlistbody">	
							<tr class="boardinfobody">
							<c:set var="i" value="0" />
							<c:forEach var="board" items="${getBoardAnnouncementList}">
								<c:set var="board" value="${board}" />
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="left" data-value="${board.boardNo}">${i}</td>									
									<td align="left" data-param="${board.boardNo}">${board.boardTitle}</td>
									<td align="left">${board.writeDate}</td>
									<td align="left">${board.boardHits}</td>
									<c:if test="${sessionScope.user.role == '관리자'}">
									<td align="left"><button data-value="${board.boardNo}" id="buttons" type="button" class="site-btn" onClick="fncDeleteAnnouncement(this)" style="padding-left: 10px; padding-right: 10px; padding-bottom: 5px; padding-top: 5px;">
										X</button></td>
									</c:if>
								</tr>
							</c:forEach>
							</tr>
							
						</tbody>
						
					</table>
				</div>
				<div class="text-center">
					<!-- PageNavigation Start... -->
					<div class="col-lg-12"style="left:120px; margin-top:70px; top:70px;">


<c:set var="params" value="${board}"/>

   <c:if test="${params != null and params.paginationInfo.totalRecordCount>0}">
      <div class="product__pagination blog__pagination" style="padding-top: 0px; bottom: 100px;">
            <!--  <<== ÁÂÃø nav -->
            <a   
               href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(1)}');"
               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
            </a>
           

            <!--  <== ÁÂÃø nav -->
            <a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.firstPage-1)}');" aria-label="Previous"> <span
               aria-hidden="true">&lsaquo;</span>
            </a>
           


            <!--  Áß¾Ó  ³ªÁß¿¡ .....-->
            <c:forEach var="pageNo" begin="${params.paginationInfo.firstPage}"
               end="${params.paginationInfo.lastPage}" step="1">

               <c:if test="${ pageNo == params.currentPageNo }">
                  <!--  ÇöÀç page °¡¸£Å³°æ¿ì : active -->
                  <a
                     href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(pageNo)}');">${ pageNo }
                        <span class="sr-only">(current)</span>
                  </a>
               </c:if>

               <c:if test="${ pageNo != params.currentPageNo }">
                  <a
                     href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(pageNo)}');">${ pageNo }</a>
                  
               </c:if>
            </c:forEach>

            <!--  <== ¿ìÃø nav -->
            <%-- <c:if test="${ params.paginationInfo.hasNextPage == false }">
               <li>
            </c:if>
            <c:if test="${ params.paginationInfo.hasNextPage == true  }">
               <li
                  onclick="javascript:void(0);">
            </c:if> --%>
            <a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.lastPage+1)}');" aria-label="Next"> <span
               aria-hidden="true">&rsaquo;</span>
            </a>
            


            <!--  <<== ¿ìÃø nav -->
          <%--   <c:if test="${ params.paginationInfo.hasNextPage == false }">
               <li>
            </c:if>
            <c:if test="${ params.paginationInfo.hasNextPage == true  }">
               <li
                  onclick= "javascript:void(0);">
            </c:if> --%>
            <a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.totalPageCount)}');" aria-label="Next"> <span
               aria-hidden="true">&raquo;</span>
            </a>
          
        </div>
       
   </c:if> 
</div>
					<!-- PageNavigation End... -->
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->


</body>

</html>