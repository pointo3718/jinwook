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
   
   /*<![CDATA[*/
   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }
   /*]]>*/
   
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


<!-- modal TEST -->
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
            <input type="text" class="form-control" id="userid" placeholder="" value="" readonly>
          </div>
          
         <div class="container">  
         	<div class="row forModal">
          	<div class="col-md-6 mb-3">
            	<label for="userId">이름</label>
            	<input type="text" class="form-control" id="username" placeholder="" value="" readonly>
         	 </div>
          <div class="col-md-6 mb-3">
           	 	<label for="userId">닉네임</label>
           	 	<input type="text" class="form-control" id="nickname" placeholder="" value="" readonly>
          </div>
			</div>
        </div>

        <div class="col-md-12 mb-3">
            <label for="Name">이메일</label>
            <input type="text" class="form-control" id="email" placeholder="" value="홍길동" readonly>
          </div>

        <div class="container">  
         	<div class="row forModal">
          	<div class="col-md-6 mb-3">
            	<label for="userId">생년월일</label>
            	<input type="text" class="form-control" id="birth" placeholder="" value="" readonly>
         	 </div>
          <div class="col-md-6 mb-3">
           	 	<label for="userId">성별</label>
           	 	<input type="text" class="form-control" id="gender" placeholder="" value="" readonly>
          </div>
			</div>
        </div>

        <div class="col-md-12 mb-3">
            <label for="Name">전화번호</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" readonly>
          </div>

	 	<div class="col-md-12 mb-3">
            <label for="Name">구분</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" readonly>
         </div>
            
         <div class="col-md-12 mb-3">
            <label for="Name">가입일자</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" readonly>
         </div>
           
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">닫기</a>
            </div>
          </div>
        </div>
    </div>
    </div>
    </div>
<!-- modal TEST -->


	<!-- Modal Begin -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"/h5>
	        <button type="button" class="close" data-dismis>블랙리스트 목록<s="modal" aria-label="Close">
	        </button>
	      </div>
	      <div class="modal-body">
	        
	         <table class="table table-hover"
                  style="width: 730px; heigh: 300px;">
                  
                  <thead class="userlisthead">
                     <tr class="userinfohead">
                        <th scope="col"></th>
                     </tr>
                  </thead>

                  <tbody class="userlistbody">   
                     <tr class="userinfobody">
                        <tr>
                           <th scope="row"></th>
                        </tr>
                    </tr>      
                  </tbody>
                  
             </table>
	        	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		style="background-color: #F2F2F2">
		<div class="container">
			<div class="row my-1">
				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 문의내역</strong> </br> </br>
						<h1 class="mytop01-content " id="inquiry"><span class="countinq"></span></h1>
						건 </br> </br>

					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 요청접수</strong></br> </br>
						<h1 class="mytop01-content " id="request"><span class="countall"></span></h1>
						건 </br> </br>
					</div>
				</div>

				<div class="col-4">
					<div class="bg-white text-black mx-3">

						</br> <strong class="mytop01">새로운 신고접수</strong> </br> </br>
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
                     </div>

                  </div>


               </div>
            </div>

            <!-- UserList Table Start -->
            <div>
               <h4 class="text-left">
                  <strong>회원 목록</strong>
                  <p class="text-muted" style="display: inline; font-size: 12px;">
                  회원 목록을 조회할 수 있습니다
                  </p>
                     
                   <!--   <label class="btn btn-light active" style="font-size: 13px;"> 
                     <input type="radio" name="options" id="option1" checked>
                      &nbsp; &nbsp; &nbsp; 일반 &nbsp; &nbsp; &nbsp;    
                     </label>  -->
                     
                     <button type="button" class="btn btn-secondary" id="option3" style="font-size: 13px; margin-left: 355px;" data-toggle="modal" data-target="#exampleModal">
						블랙리스트
					</button>
                     
                    <!--  <label class="btn btn-light" style="font-size: 13px;" >
                      <input type="radio" name="options" id="option3">
                       블랙리스트
                     </label> -->
                     
                  <hr size="10px">
               </h4>


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
                           <td align="left"
                              style="color: #7fad39;"><a
                              href="/admin/getUserAdmin?userId=${user.userId}">${user.userId}</a></td>
                           <td align="left">${user.userName}</td>
                           <td align="left">${user.phone}</td>
                           <td align="left">${user.role}</td>
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
   <!--   Blog Section End -->

   <!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->
<script>

//////////////// 블랙리스트 목록 REST 시작 /////////////////
$(function() {
      $("#option3").on(
            "click",
            function() {

   var uri = "/admin/listBlacklistAdmin"

   $.get(uri, function(response) { 
         var blacklistHtmlHead = "";
         blacklistHtmlHead += `
               <tr class="userinfohead">
                  
                  <th scope="col">#</th>
                  <th scope="col">ID</th>
                  <th scope="col">전화번호</th>
                  <th scope="col">지정기간</th>
                  <th scope="col">어쩌구</th>
               </tr>
         `;
      
         var blacklistHtmlBody = "";

         $(response.blacklist).each(function(idx, user) {
            blacklistHtmlBody += `
               <tr class="userinfobody">
                  <td scope="row">\${idx}</td>
                  <td align="left" id="option4">
			        <a id="userdetail" data-toggle="modal" href="#myModal2" data-userid="\${user.userId}">\${user.userId}</a>
			      </td>
                  <td align="left">\${user.phone}</td>
                  <td align="left">\${user.blacklistEndDate}</td>
                  <td align="left">\${user.role}</td>
               </tr>
            `;
         });
         
         $(".userinfohead").remove();
         $(".userinfobody").remove();
         
         $(".userlisthead").html(blacklistHtmlHead);
         $(".userlistbody").html(blacklistHtmlBody);
         //$(".userlisthead").html(blacklistHtmlBody);
      
   }, "json");
})
})
//////////////// 블랙리스트 목록 REST 끝   /////////////////


function getUser(){
        	
	  var uri = "/admin/getUserRest/"+USERID;
	  		alert(uri);
		   $.get(uri, function(response) { 
			alert('\${response.userObj.gender}');
		   }, "json");
}



var USERID="";

$(document).ready(function() {     

	$('#myModal2').on('show.bs.modal', function(event) {          
		USERID = $(event.relatedTarget).data('userid');
		alert(USERID);
	    alert("아마 이게 실행되는듯");
	    
	    getUser();

	 });
});
//////////////// 유저 상세 REST 시작 /////////////////

  

//////////////// 유저 상세 REST 끝   /////////////////

</script>
</body>

</html>