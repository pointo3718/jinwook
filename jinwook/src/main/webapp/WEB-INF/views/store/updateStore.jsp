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
<title>상점수정</title>


<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
   /*<![CDATA[*/
</script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

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

.blog__sidebar {
	padding-bottom: 430px;
}

.blog__sidebar__item {
	width: 200px;
	/*  body > div.container{
           border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */ / . row { margin-top : 10px;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.id_ok {
	color: #7fad39;
	display: none;
	font-size: 10px;
}

.id_already {
	color: red;
	display: none;
	font-size: 10px;
	text-align: left;
}

.control-label {
	whidth: 250px;
	text-align: center;
	justify-content: center;
}

.site-btn {
	background-color: #7fad39; /* Green */
	border: none;
	color: white;
	width: 200px;
	text-align: center;
	font-size: 20px;
}

.userId {
	width: 300px;
	text-indent: 1em;
}

.ss {
	font-size: 30px;
	justify-content: center;
}

input {
	width: 300px;
	height: 50px;
	text-indent: 1em;
	font-size: 15px;
}

div {
	justify-content: center;
	text-align: center;
	align-items: center;
}

label {
	font-size: 15px;
	justify-content: top;
	text-align: left;
	display: flex;
	align-items: left;
}

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

<script type="text/javascript">


   //============= "수정"  Event 연결 =============
   function fncUpdateStore(e) {

      console.log(e);

      const storeNo = $(e).data("value");
      var storeIntro = $("input[id='storeIntro']").val();
	  var storePhone = $(e).parent().parent().find("#storePhone").val()      
      var storeImage = $("input[id='storeImage']").val();
      var startTime = $("input[id='startTime']").val();
      var endTime = $("input[id='endTime']").val();
      var bank = $("#bank option:selected").val();
      var holiday = $("input[id='holiday']").val();
    var accNo = $(e).parent().parent().find("#accNo").val()  
    

      if (storeIntro == null || storeIntro.length < 1) {
         Swal.fire("상점 소개를 입력해주세요");
         return;
      }

      if (storePhone == null || storePhone.length < 1) {
    	  Swal.fire("상품 전화번호를 입력해주세요");
         return;
      }

      if (storeImage == null || storeImage.length < 1) {
    	  Swal.fire("상점 사진을 입력해주세요");
         return;
      }

      if (startTime == null || startTime.length < 1) {
    	  Swal.fire("영업시작시간을 입력해주세요");
         return;
      }

      if (endTime == null || endTime.length < 1) {
    	  Swal.fire("영업종료시간을 입력해주세요");
         return;
      }

      if (bank == null || bank.length < 1) {
    	  Swal.fire("은행명을 입력해주세요");
         return;
      }

      if (holiday == null || holiday.length < 1) {
    	  Swal.fire("상점휴일을 입력해주세요");
         return;
      }

      if (accNo == null || accNo.length < 1) {
    	  Swal.fire("계좌번호를 입력해주세요");
         return;
      }

      $.ajax({
         url : "updateStore/" + storeNo + "/" + storeIntro + "/"
               + storePhone + "/" + storeImage + "/" + startTime + "/"
               + endTime + "/" + holiday + "/" + bank + "/" + accNo,
         dataType : "json",
         method : "POST",
         data : {

         },
         success : function(result) {
            if (result != null) {
          	Swal.fire({
          		title: '진욱이네',
                text: "수정이 완료됐습니다.",
                icon: 'sucess',
                confirmButtonColor: '#7fad39',
                confirmButtonText: '확인'
          	});
               self.location = "updateStore?storeNo=" + storeNo;
            }
         }

      });

   }
</script>



</head>

<body>


	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->

	<!-- ceoTop Section Begin -->
	<jsp:include page="../layout/ceoTop.jsp" />
	<!-- ceoTop Section End -->

	<!-- ceoLeft Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row" style="justify-content: space-around;">
				<div class="col-xs-4 col-xs-5"
					style="width: 200px; margin-right: 30px;">
					<div class="blog__sidebar" style="width: 200px;">

						<div class="blog__sidebar__item">

							<h5 class="text-center" style="margin-bottom: 0px;">
								<strong>사장님 페이지</strong>
							</h5>
							<br />

							<div class="getStoreNo"></div>

						</div>


					</div>
				</div>

				<!-- 상점 정보 수정 Begin-->
					<div>
						<h4 class="text-left">
							<strong>상점 정보 수정</strong>

							<hr size="10px">
						</h4>

						<c:forEach var="store" items="${storeInfo}" begin="0" end="0">


							<table class="table table-hover"
								style="width: 730px; heigh: 300px;">

								<form class="form-horizontal" id="profileUpdate"
									enctype="multipart/form-data">


									<div class="form-group row">
										<label for="colFormLabel"
											class="col-sm-2 col-form-label col-form-label">상점이름</label>
										<div class="col-sm-6">
											<input type="text" name="storeName"
												class="form-control form-control" id="storeName"
												value="${store.storeName}" placeholder="상점이름" readonly>
										</div>
									</div>


									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점업종</label>
										<div class="col-sm-6">
											<input type="email" name="storeType"
												class="form-control form-control" id="storeType"
												value="${store.storeType}"
												placeholder="상점업종" readonly>
										</div>
									</div>



									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점주소</label>
										<div class="col-sm-6">
											<input type="text" name="storeAddr"
												class="form-control form-control" id="storeAddr"
												value="${store.storeAddr}" placeholder="상점주소" readonly>
										</div>
									</div>



									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점시작날짜</label>
										<div class="col-sm-6">
											<input type="text" name="storeStart"
												class="form-control form-control" id="storeStart"
												value="${store.storeStart}" placeholder="상점시작날짜" readonly>
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점소개</label>
										<div class="col-sm-6">
											<input type="text" name="storeIntro"
												class="form-control form-control" id="storeIntro"
												value="${store.storeIntro}" placeholder="상점소개">
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점전화번호</label>
										<div class="col-sm-6">
											<input type="text" name="storePhone"
												class="form-control form-control" id="storePhone"
												value="${store.storePhone}" placeholder="상점전화번호">
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점사진</label>
										<div class="col-sm-6">
											<img src="/resources/static/${store.attach.orgFileName}"
												onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
												alt="My Image" width="300" height="300">
										</div>
									</div>



									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">영업시작시간</label>
										<div class="col-sm-6">
											<input type="time" name="startTime"
												class="form-control form-control" id="startTime"
												value="${store.startTime}" placeholder="영업시작시간">
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">영업종료시간</label>
										<div class="col-sm-6">
											<input type="time" name="endTime"
												class="form-control form-control" id="endTime"
												value="${store.endTime}" placeholder="영업종료시간">
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">상점휴무일</label>
										<div class="col-sm-6">
											<input type="text" name="holiday"
												class="form-control form-control" id="holiday"
												value="${store.holiday}" placeholder="상점휴무일">
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label"
											style="padding-right: 4px;">사업자등록번호</label>
										<div class="col-sm-6">
											<input type="text" name="businessNo"
												class="form-control form-control" id="businessNo"
												value="${store.user.businessNo}" placeholder="사업자등록번호"
												readonly>
										</div>
									</div>

									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">은행명</label>
										<div class="col-sm-6" style="padding-left: 0px;">
											<div class="col-sm-6">
												<select id="bank">
													<option>${store.bank}</option>
													<option>카카오뱅크</option>
													<option>농협</option>
													<option>신한</option>
													<option>IBK기업</option>
													<option>하나</option>
													<option>우리</option>
													<option>국민</option>
													<option>SC제일</option>
													<option>대구</option>
													<option>부산</option>
													<option>광주</option>
													<option>새마을금고</option>
													<option>경남</option>
													<option>전북</option>
													<option>제주</option>
													<option>산업</option>
													<option>우체국</option>
													<option>신협</option>
													<option>수협</option>
													<option>씨티</option>
													<option>케이뱅크</option>
													<option>토스뱅크</option>
													<option>산림조합</option>
													<option>저축은행</option>
												</select>
											</div>
										</div>
									</div>


									<div class="form-group row">
										<label for="colFormLabelLg"
											class="col-sm-2 col-form-label col-form-label">계좌번호</label>
										<div class="col-sm-6">
											<input type="text" name="accNo"
												class="form-control form-control" id="accNo"
												value="${store.accNo}" placeholder="계좌번호">
										</div>
									</div>



								</form>



							</table>

							<!-- 상점 정보 수정 End-->
							<!-- 수정, 삭제신청 버튼 Begin -->

							<hr size="10px">

							<div style="padding-left: 320px;">
								<button type="button" id="button"
									class="btn btn-outline-success" data-value="${store.storeNo}"
									onClick="fncUpdateStore(this)">수정</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" id="confirmStart"
									class="btn btn-outline-danger">상점삭제신청</button>
								<input type="hidden" id="userid"
									value="${sessionScope.user.userId}" /> <input type="hidden"
									id="storeno" value="${param.storeNo}" />
							</div>
							<!-- 수정, 삭제신청 버튼 End -->
						</c:forEach>
					</div>









			</div>
			<div class="text-center"></div>
		</div>

	</section>
	<!-- ceoLeft Section End -->
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

	<script>

var USERID;
var STORENO;

$().ready(function () {
    $("#confirmStart").click(function () {
       
       STORENO = $("input[id='storeno']").val();
       USERID = $("input[id='userid']").val();

        Swal.fire({
             title: '정말로 상점 삭제 요청을 하시겠습니까?',
            text: "확인 절차에 따라 관리자의 연락이 갑니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#7fad39',
            cancelButtonColor: '#d33',
            confirmButtonText: '삭제 신청',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
               
               fncAddRequestDeleteStore();   
            
                
            }
        })
    });
});



/////////////////// 상점 삭제 신청 /////////////////////
function fncAddRequestDeleteStore() {
       
   var uri = "/request/addRequestDeleteStore/" + USERID +"/" +STORENO;

   var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "POST"};

      $.ajax({
         url: uri,
         type: "POST",
         headers: headers,
         dataType: "json",
         
         success: function(response) {
                        
            if (response.result == true) {
               
               Swal.fire(
                            '삭제 신청이 완료되었습니다.',
                          '일주일 내로 관리자의 연락이 갈 예정입니다.',
                          'success'
                      );
            }
            swal(response.message, "", "error");
         },
         error: function(xhr, status, error) {
                  alert("에러가 발생하였습니다.");
            return false;
         }
      
      });
}
/////////////////// 상점 삭제 신청 끝 /////////////////////

</script>
	<script type="text/javascript">
   
   //======페이지 이동 상점번호 받아오기=========//
   
      $(function() {
            getStoreNo();
         });
      

         function getStoreNo() {
                 
               var userId = $("#userId").val();
            
               var uri = "/store/getStoreNo/"+userId
               

               $.get(uri, function(response) { 
                  
                     var getStoreNoHtmlBody = "";
                     
                     $(response.getStoreNo).each(function(idx,store) {              

                        getStoreNoHtmlBody += `
 
							<div class="list-group text-center" style="font-size: 15px;">
							<button type="button"
								class="list-group-item list-group-item-action"
								aria-current="true"><a href="/orders/getOrdersListCeo" style="color:black">주문 내역</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/store/updateStore?storeNo=\${store.storeNo}" style="color:black">상점 정보
								수정</button>
							<button type="button"
								class="list-group-item list-group-item-action" class="addStore">
								<span class="addStore"><a href="/user/confirmPasswordViewC?userId=${sessionScope.user.userId}" style="color:black">개인 정보 수정</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="deleteStore"><a href="/store/addStoreProduct?storeNo=\${store.storeNo}" style="color:black"> 상품 등록</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="refundStore"><a href="/request/addRequestAd?storeNo=\${store.storeNo}" style="color:black"> 광고 등록</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="adStore"><a href="/request/getRequestAdStoreList?storeNo=\${store.storeNo}&userId=${sessionScope.user.userId}" style="color:black"> 내가 한 요청</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<span class="adStore"><a href="/store/getStoreWallet?storeNo=\${store.storeNo}" style="color:black"> 지갑</span>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/store/getStore?storeNo=\${store.storeNo}" style="color:black">내 상점 가기</button>
							<button type="button"
								class="list-group-item list-group-item-action"><a href="/board/getBoardInquiryList" style="color:black">1:1
								문의내역</button>
						</div>

                         
                            
                        `;
                     });
                     
                     
                     $(".getStoreNo").html(getStoreNoHtmlBody);
                     //$(".userlisthead").html(blacklistHtmlBody);
                  
               }, "json");

         }   
     
</script>
</body>

</html>