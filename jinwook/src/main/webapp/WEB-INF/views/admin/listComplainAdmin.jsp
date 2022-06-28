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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>	

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
	<!-- 블랙리스트 날짜지정 Modal 끝 -->
	
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

	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->

	<!-- adminTop Begin -->
    <jsp:include page="../layout/adminTop.jsp" />
    <!-- adminTop End -->

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
								<th scope="col">블랙 지정</th>
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>

						<tbody class="userlistbody">
							<tr class="userinfobody">
								<c:set var="i" value="0" />
								<c:forEach var="complain" items="${complainList}">
									<c:set var="i" value="${ i+1 }" />
									
									<c:if test="${complain.complainDeleteYn != true}">
									
									<tr>
										<td align="left">${complain.complainNo}</td>
										<td align="left">
										<a id="userdetail" data-toggle="modal" href="#myModal2" data-userid="${complain.userId}">${complain.userId}</a></td>
										<td align="left">${complain.complainId}</td>
										<td align="left">${complain.complainDate}</td>
										<!-- a:  -->
										<td align="left">${complain.complainCode}</td>
										<c:if test="${complain.rcpNo != 0}">
										<td align="left" data-rcpNo="${complain.rcpNo}"><a href="/board/getRecipe?rcpNo=${complain.rcpNo}">바로가기 <i class="fa fa-location-arrow" aria-hidden="true"></i> </a></td>
										</c:if>
										<c:if test="${complain.rcpNo == 0}">
										<td align="left">&nbsp;</td>
										</c:if>
										<c:if test="${complain.complainStatus == false}">
											<td align="left">
												<button type="button" class="btn btn-dark" id="preRegister"
													data-toggle="modal" data-target="#exampleModal"
													data-notifyid="${complain.userId}"
													data-complainno="${complain.complainNo}">등록</button> <!--  data-toggle="modal" data-target="#exampleModal -->
											</td>
										</c:if>
										<c:if test="${complain.complainStatus == true}">
											<td style="color: red;"><strong>지정완료</strong></td>
										</c:if>
										 <td class="shoping__cart__item__close">
                                        <span class="icon_close text-center" onClick="deleteComplain(${complain.complainNo});"></span>
                                    	</td>
									</tr>
									</c:if>
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


////////////////// 신고목록 삭제 REST ///////////////////////
	function deleteComplain(COMPLAINNO) {
	swal("진욱이네", "정말로 삭제하시겠습니까?");
	var uri = "/admin/deleteComplain/" + COMPLAINNO;
	var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "DELETE"};

		$.ajax({
			url: uri,
			type: "DELETE",
			headers: headers,
			dataType: "json",
			
			success: function(response) {
								
				if (response.result == true) {
					swal(COMPLAINNO+"번 신고를 삭제했습니다.");
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
</script>


</body>

</html>