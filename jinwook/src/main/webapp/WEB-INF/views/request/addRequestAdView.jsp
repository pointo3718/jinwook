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
<title>상품등록</title>

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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- date picker -->


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
 
   //=======기간별 조회========//
   function fncGetStoreWallet(e) {

      var STORENO = $("input[id='storeNo']").val();
      var ORDERDATESTART = $("#orderDateStart").val();
      var ORDERDATEEND = $("#orderDateEnd").val();

      $.ajax({
         type : "get",
         url : "getStoreWallet/" + STORENO + "/" + ORDERDATESTART + "/"
               + ORDERDATEEND,
         data : {},
         dataType : "json",
         success : function(d) { //성공
            $("#ajaxResult").html(d);
            self.location = "getStoreWallet?storeNo=" + STORENO
                  + "&orderDateStart=" + ORDERDATESTART
                  + "&orderDateEnd=" + ORDERDATEEND;
         },
         error : function(e) { //실패
            alert("에러: " + e);
         }
      });
   };//ajaxBtn
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


					<!-- 광고 등록 start-->
					<div style="margin-bottom: 1150px; width: 850px;">
						<h4 class="text-left">
							<strong>광고 등록</strong>&nbsp; <span
								style="color: #6E6E6E; font-size: 13px">진욱이네에 광고를 등록하세요</span>

							<hr size="10px">
						</h4>

						<div class="container">
							<div>
								<i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네에 광고
								등록을 위해 상점에 대한 정보를 입력해주세요.
							</div>
							<div>
								<i class="fa fa-check" aria-hidden="true"></i> &nbsp;광고 요청 후, 등록
								완료까지 2주 가량 소요됩니다.
							</div>
							<div>
								<i class="fa fa-check" aria-hidden="true"></i> &nbsp;등록된 광고는 이벤트
								페이지에서 확인 가능합니다.
							</div>
							<div>
								<i class="fa fa-check" aria-hidden="true"></i> &nbsp;확인절차에 따라
								관리자의 연락이 갈 수 있습니다.
							</div>
							<div>
								<i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네는 사장님들의
								피드백을 언제나 환영합니다. 광고 등록시 더 추가하고 싶은 사항이 있다면 언제든 요청해주세요.
							</div>
							<div>
								<i class="fa fa-check" aria-hidden="true"></i> &nbsp;광고 관련 문의 및
								요청 사항은 1:1문의/고객센터(1644-0000)로 문의 바랍니다.
							</div>
						</div>
						<hr size="10px">
						<form name="detailForm" id="adForm" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="userId" value="test01" /> <input
								type="hidden" name="storeNo" value="${param.storeNo}" />

							<div class="form-group">
								<label for="exampleInputEmail1"><strong>제목</strong></label> <input
									type="text" class="form-control" id="adTitle" name="adTitle"
									placeholder="ex) 진욱이네에서 광고 요청합니다.">
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1"><strong>내용</strong></label>
								<textarea class="form-control" name="adContent" id="adContent"
									rows="6"></textarea>
							</div>


							<div class="form-group">
								<label for="exampleFormControlFile1"><strong>사진</strong></label>
								<input type="file" class="form-control-file" id="file"
									name="file"> <small id="emailHelp"
									class="form-text text-muted">사진 확인 후 절차에 따라 관리자의 연락이 갈
									수 있습니다.</small>

							</div>

							<br /> <br />
							<div class="form-group row">
								<button type="button" id="requestAd" class="btn btn-success"
									style="background-color: #7fad39; border-color: #7fad39; width: 126px;">등록
									요청</button>
							</div>
							<br />

						</form>

					</div>
					<!-- 광고 등록 End -->
				<div class="text-center"></div>
			</div>
		</div>
	</section>
	<!-- ceoLeft Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->


	<script>
/////////////// 광고 등록 시작 //////////////////////

$().ready(function () {
    $("#requestAd").click(function () {
    	
        Swal.fire({
       		title: '광고를 등록을 신청하시겠습니까?',
            text: "확인절차에 따라 관리자의 연락이 갈 수 있습니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#7fad39',
            cancelButtonColor: '#d33',
            confirmButtonText: '신청',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
            	fncAddRequestStore();	 
            } 
				fncSwal();
        })
        
    });
    
   
});

function fncAddRequestStore() {
    
	//Form 유효성 검증 필요
		document.detailForm.action='/request/addRequestAd';
		$("#adForm").submit(); 
}

function fncSwal() {
    
	Swal.fire(
   		  	'광고 신청이 완료되었습니다.',
            '일주일 내로 관리자의 연락이 갈 예정입니다.',
            'success'
        ); 
}
/////////////// 광고 등록 끝 ///////////////////////
</script>

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