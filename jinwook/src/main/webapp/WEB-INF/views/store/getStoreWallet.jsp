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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


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
.swal-button{
	background-color: #7fad39;
	font-size: 12px;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
</style>


<script type="text/javascript">
   /*<![CDATA[*/
   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }

   var storeNo = $("input[id='storeNo']").val();
   /*]]>*/

   $(function() {
      $(".list-group-item:contains('주문 내역')").on("click", function() {
         $(self.location).attr("href", "/admin/blog");
      });
   });

   $(function() {
      $(".list-group-item:contains('상점 정보 수정')").on("click", function() {
         $(self.location).attr("href", "/store/updateStore?storeNo=10000");
      });
   });

   $(function() {
      $(".list-group-item:contains('개인 정보 수정')").on("click", function() {
         //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         $(self.location).attr("href", "/admin/listComplainAdmin");
      });
   });

   $(function() {
      $(".list-group-item:contains('상품 등록')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/store/addStoreProduct?storeNo=10000");
            });
   });

   $(function() {
      $(".list-group-item:contains('광고 등록')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "../request/addRequestAd?storeNo=10011");
            });
   });

   $(function() {
      $(".list-group-item:contains('지갑')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/store/getStoreWallet?storeNo=10000");
            });
   });

   $(function() {
	      $(".list-group-item:contains('내가 한 요청')").on(
	            "click",
	            function() {
	               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	               $(self.location).attr("href",
	                     "../request/getRequestAdStoreList?storeNo=10000&userId=test05");
	            });
	   });

   
   $(function() {
      $(".list-group-item:contains('1:1 문의내역')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/request/getRequestListForAdmin?reqCode=2");
            });
   });

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
   
   
   <!-- Modal for Refund Begin -->
   <div class="modal fade" id="modalForRefund" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">환급 신청</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	      
	      
	       		<form id="detailForm" name="detailForm" method="post">
	               <input type="hidden" id="userId" name="userId" value="test01" />
	               <input type="hidden" name="storeNo" value="${param.storeNo}" />
	      			<div class="container">
                        <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;환급하실 금액을 숫자로만 입력해주세요.</div>
              			<div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;문의사항은 1:1문의/고객센터(1644-0000)로 문의 바랍니다.</div>
				    </div>      
				         <hr>
	      					      				
						<div class="form-group row">							
                           <label for="colFormLabelLg"
                              class="col-sm-3 col-form-label col-form-label"><strong>환급 금액</strong></label>
                           <div class="col-sm-7">
                              <input class="form-control form-control" type="text" id="refundMoney" name="refundMoney" placeholder="환급하실 금액을 입력해주세요."/>
                           
                           
                           </div>
                           <div class="col-sm-1" style="padding-left:0px; top:8px; right: 10px;">
                           원
                           </div>
                        </div>
                  </form>

	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" id="requestRefund" onClick="addRequestRefund(userId.value, ${param.storeNo}, refundMoney.value)" class="btn btn-primary" style="background-color: #7fad39; border-color: #7fad39;">요청 등록</button>
	      </div>
	    </div>
	  </div>
	</div>
   <!-- Modal for Refund End -->


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



                     <div class="list-group text-center" style="font-size: 15px;">
                        <button type="button"
                           class="list-group-item list-group-item-action"
                           aria-current="true">주문 내역</button>
                        <button type="button"
                           class="list-group-item list-group-item-action">상점 정보 수정</button>
                        <button type="button"
                           class="list-group-item list-group-item-action" class="addStore">
                           <span class="addStore">개인 정보 수정</span>
                        </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">
                           <span class="deleteStore">상품 등록</span>
                        </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">
                           <span class="refundStore">광고 등록</span>
                        </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">
                           <span class="adStore">내가 한 요청</span>
                        </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">
                           <span class="adStore">지갑</span>
                        </button>
                        <button type="button"
                           class="list-group-item list-group-item-action">1:1
                           문의내역</button>
                     </div>

                  </div>


               </div>
            </div>

            <!-- 지갑 조회 start-->
            <div style="margin-bottom: 1150px; width: 850px;">
               <h4 class="text-left">
                  <strong>지갑 조회</strong>&nbsp; <span
                     style="color: #6E6E6E; font-size: 13px">기간을 설정하지 않을시 오늘
                     날짜로 조회됩니다.</span>

                  <hr size="10px">
               </h4>

               <!-- 지갑조회 테이블 start -->
               <table class="table table-borderless">
                  <c:forEach var="store" items="${getStoreWallet}" begin="0" end="0">

                     <tbody>
                        <tr>
                           <th scope="row">기간별 상점매출액</th>
                           <td>${store.totalEarn}원</td>
                           <td><input id="orderDateStart" type="date"> <input
                              id="orderDateEnd" type="date">&nbsp;&nbsp;
                              <button type="button" id="selectOrder"
                                 class="btn btn-outline-success btn-sm"
                                 onClick="fncGetStoreWallet(this)">조회</button></td>
                        </tr>


                        <tr>
                           <th scope="row">진욱페이 잔액</th>
                           <td>${store.user.jpBalance}원</td>
                           <td><button type="button"
                                 class="btn btn-outline-success btn-sm" id="refund" data-toggle="modal" data-target="#modalForRefund">환급신청</button></td>
                        </tr>
                     </tbody>
                     <input type="hidden" id="storeNo" value="${store.storeNo}">
                  </c:forEach>
               </table>



               <!-- 지갑조회 테이블 End -->



               <!--지갑조회 주문내역 테이블 start-->

<<<<<<< HEAD
					<h6 class="text-left">

						<strong>기간별 주문내역</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="color: #6E6E6E; font-size: 13px">${store.orderDateStart}~${store.orderDateEnd}</span>
					</h6>
=======
>>>>>>> refs/remotes/origin/master
               <h6 class="text-left">
               
                  <strong>기간별 주문내역</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
                     style="color: #6E6E6E; font-size: 13px">${store.orderDateStart}~${store.orderDateEnd}</span>
               </h6>

               <table class="table table-hover table-striped">


                  <thead>
                     <tr>
                        <th align="center">No</th>
                        <th align="left">주문번호</th>
                        <th align="left">주문날짜</th>
                        <th align="left">구매자이름</th>
                        <th align="left">주문금액</th>
                     </tr>
                  </thead>

                  <tbody>

                     <c:set var="i" value="0" />
                     <c:forEach var="store" items="${getStoreWallet}" begin="0">
                        <c:set var="i" value="${ i+1 }" />

                        <tr>
                           <td align="Center">${ i }</td>
                           <td align="left">${store.orders.orderNo}</td>
                           <td align="left">${store.orders.orderDate}</td>
                           <td align="left">${store.orders.buyerName}</td>
                           <td align="left">${store.orders.orderPrice}원</td>


                        </tr>
                     </c:forEach>


                  </tbody>

               </table>
               <!--지갑조회 주문내역 테이블 End-->

               <!--지갑조회 환급내역 테이블 start-->
               <h6 class="text-left">
                  <strong>환급내역</strong>
               </h6>
               <table class="table table-hover table-striped">

                  <thead>
                     <tr>
                        <th align="center">No</th>
                        <th align="left">환급신청날짜</th>
                        <th align="left">환급완료날짜</th>
                        <th align="left">환급금액</th>
                        <th align="left">요청상태</th>
                     </tr>
                  </thead>

                  <tbody>

                     <c:set var="i" value="0" />
                     <c:forEach var="store" items="${getStoreRefund}">
                        <c:set var="i" value="${ i+1 }" />
                        <tr>
                           <td align="Center">${ i }</td>
                           <td align="left">${store.request.reqDate}</td>
                           <td align="left">${store.request.resDate}</td>
                           <td align="left">${store.request.refundMoney}</td>
                           <td align="left"><c:if
                                 test="${store.request.reqStatus.trim()=='1'}">
                                        요청중         
                              </c:if> <c:if
                                 test="${store.request.reqStatus.trim()=='2'}">
                                        수락완료         
                              </c:if> <c:if
                                 test="${store.request.reqStatus.trim()=='3'}">
                                        거절         
                              </c:if></td>


                        </tr>
                     </c:forEach>

                  </tbody>

               </table>
               <!--지갑조회 환급내역 테이블 start-->
            </div>
            <!-- 지갑조회 End -->
            <div class="text-center"></div>
         </div>
      </div>
   </section>
   <!-- ceoLeft Section End -->

   <!-- Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->
<script>
////////////////// 환급 요청 REST ///////////////////////
function addRequestRefund(USERID, STORENO, REFUNDMONEY) {
   		alert(USERID);
   		alert(STORENO);
   		alert(REFUNDMONEY);
		var uri = "../request/addRequestRefund/"+USERID+"/"+STORENO+ "/" +REFUNDMONEY;

		var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "POST"};
		swal
			$.ajax({
				url: uri,
				type: "POST",
				headers: headers,
				dataType: "json",
				
				success: function(response) {
					if (response.result == false) {
						swal("환급 요청에 실패했습니다.");
						return false;
						
					}
						swal("환급을 요청했습니다.", "", "success");
						location.reload();
						modal("hide");
						return true;
					
				},
				error: function(xhr, status, error) {
					
					alert("에러가 발생하였습니다.");
					return false;
				}
			
			});
}
	

//////////////////환급 요청 REST ////////////////////////

</script>
</body>

</html>