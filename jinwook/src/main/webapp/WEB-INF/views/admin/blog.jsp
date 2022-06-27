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
</head>
<body>

   <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
   <!-- Header End -->

   <!-- adminTop Begin -->
   <jsp:include page="../layout/adminTop.jsp" />
   <!-- adminTop End -->

   <!-- 회원상세 모달 Begin -->
   <jsp:include page="./getUserAdminModal.jsp" />
   <!-- 회원상세 모달 End -->


	<!-- 블랙리스트 Modal Begin -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">
	        <button type="button" class="close" data-dismis>블랙리스트 목록<s="modal" aria-label="Close">
	        </button>
	        </h5>
	      </div>
	      <div class="modal-body">
	        
	         <table class="table table-hover"
                  style="width: 730px; heigh: 300px; font-size: 13px;">
                  
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
	<!-- 블랙리스트 Modal End -->

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
               
				
				<!--///////////////// 검색 시작 ////////////////////-->
				
				<div class="blog__sidebar__search" style="text-align:right; margin-bottom: 0px;">
                        <input type="text" id="mainSearchKeyword" value="${user.searchKeyword}" placeholder="ID or 이름 검색..." style="width: 300px; height: 30px;" 
                        	onKeypress="javascript:if(event.keyCode==13) {searchBoard(null)}"/>
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
                  <th scope="col">ID</th>
                  <th scope="col">이름</th>
                  <th scope="col">생년월일</th>
                  <th scope="col">이메일</th>
                  <th scope="col">휴대전화번호</th>
                  <th scope="col">기간</th>
                  <th scope="col">사유</th>
               </tr>
         `;
      
         var blacklistHtmlBody = "";

         $(response.blacklist).each(function(idx, user) {
            blacklistHtmlBody += `
               <tr class="userinfobody">
                  <td align="left" id="option4">
			        <a id="userdetail" data-toggle="modal" href="#myModal2" data-userid="\${user.userId}">\${user.userId}</a>
			      </td>
                  <td align="left">\${user.userName}</td>
                  <td align="left">\${user.birth}</td>
                  <td align="left">\${user.email}</td>
                  <td align="left">\${user.phone}</td>
                  <td align="left">~ &nbsp;\${user.blacklistEndDate}</td>
                  <td align="left">\${user.complainCode}</td>
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
</body>

</html>