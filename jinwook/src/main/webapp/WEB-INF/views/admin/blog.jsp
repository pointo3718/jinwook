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
<link
   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
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
	
	/////////////// 상점등록요청 목록 이동 시작 ////////////////
		$(function() {
	 	$( ".list-group-item:contains('상점 등록 요청')").on("click" , function() {
			$(self.location).attr("href","/request/getRequestListForAdmin");
		});
	});
	//////////////// 상점등록요청 목록 이동 끝 /////////////////
   
   
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
   
   
    /////////////// 요청대기 COUNT REST 끝    ////////////////
    
   
   
   //////////////// 블랙리스트 목록 REST 시작 /////////////////
   $(function() {
         $("#option3").on(
               "click",
               function() {

      var uri = "/admin/listBlacklistAdmin"

      $.get(uri, function(response) {
         // ë¹ ì ´ì  ì§  ì  ë ¤ë©´ ì ¤í  
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
            
            $(".userlisthead").html(blacklistHtmlHead);
            $(".userlistbody").html(blacklistHtmlBody);
            //$(".userlisthead").html(blacklistHtmlBody);
         
      }, "json");
   })
   })
   //////////////// 블랙리스트 목록 REST 끝   /////////////////

   
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
    align-items: center;
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
                  <div class="btn-group btn-group-toggle" data-toggle="buttons" style="left:300px;">
                     
                     <label class="btn btn-light active" style="font-size: 13px;"> 
                     <input type="radio" name="options" id="option1" checked>
                      &nbsp; &nbsp; &nbsp; 일반 &nbsp; &nbsp; &nbsp;    
                     </label> 
                     
                     <label class="btn btn-light" style="font-size: 13px;" >
                      <input type="radio" name="options" id="option3">
                       블랙리스트
                     </label>
                     
                  </div>
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
                     </tr>
                  </thead>

                  <tbody class="userlistbody">   
                     <tr class="userinfobody">
                     <c:set var="i" value="0" />
                     <c:forEach var="user" items="${userList}">
                        <c:set var="user" value="${user}" />
                        <c:set var="i" value="${ i+1 }" />
                        <tr>
                           <th scope="row">${ i }</th>
                           <td align="left"
                              style="color: forestgreen"><a
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
   <!— Blog Section End —>

   <!— Footer Begin —>
   <jsp:include page="../layout/footer.jsp" />
   <!— Footer End —>

</body>

</html>