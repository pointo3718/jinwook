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
<title>상점 목록</title>

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



<body>

	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->
	
   <!-- adminTop Begin -->
   <jsp:include page="../layout/adminTop.jsp" />
   <!-- adminTop End -->

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



				<!-- UserList Table Start -->
				<div>
					<h4 class="text-left">
						<strong>상점 목록</strong>
						<p class="text-muted" style="display: inline; font-size: 12px;">
						상점 목록을 조회할 수 있습니다
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
					
					<!--///////////////// 검색 시작 ////////////////////-->
				
				<div class="blog__sidebar__search" style="text-align:right; margin-bottom: 0px;">
                        <input type="text" id="mainSearchKeyword" value="${store.searchKeyword}" placeholder="상호명 검색..." style="width: 300px; height: 30px;" />
                        <button onclick="searchBoard(null)"><span class="icon_search"></span></button>
                 </div>
								<div >
									<div class="btn-group" role="group">
										<div class="dropdown dropdown-lg">
											<div class="dropdown-menu dropdown-menu-right" role="menu">
												<!--/* 검색 form */-->
												<form id="searchForm" action="/admin/listStoreAdmin" method="get" onsubmit="return searchBoard(this)" class="form-horizontal" role="form">
													<!-- /* 현재 페이지 번호, 페이지당 출력할 데이터 개수, 페이지 하단에 출력할 페이지 개수 Hidden 파라미터 */ -->
													<input type="hidden" name="currentPageNo" value="1" />
													<input type="hidden" name="recordsPerPage" value="${store.recordsPerPage}" />
													<input type="hidden" name="pageSize" value="${store.pageSize}" />
						
													
													<div>
														<label for="contain">키워드</label>
														<input type="text" name="searchKeyword" value="${store.searchKeyword}" />
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								
				<!--///////////////// 검색 끝 ////////////////////-->
				

					<table class="table table-hover"
						style="width: 730px; heigh: 300px; font-size: 15px;">
						
						<thead class="userlisthead">
							<tr class="userinfohead">
								<th scope="col">상점이름</th>							
								<th scope="col">사장님</th>
								<th scope="col">업종</th>
								<th scope="col">상점 주소</th>
								<th scope="col">전화번호</th>
							</tr>
						</thead>

						<tbody class="userlistbody">	
							<tr class="userinfobody">
							<c:set var="i" value="0" />
							<c:forEach var="store" items="${storeList}">
								<c:set var="store" value="${store}" />
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="left">${store.storeName}</td>									
									<td align="left"><a
										id="userdetail" data-toggle="modal" href="#myModal2" data-userid="${store.userId}">${store.user.userName}</a></td>
									
									<td align="left">${store.storeType}</td>
									<td align="left">${store.storeAddr}</td>
									<td align="left">${store.storePhone}</td>
									
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

<script>
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
</script>

</body>

</html>