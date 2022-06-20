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
                     "/request/getRequestListForAdmin?reqCode=1");
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
      $(".list-group-item:contains('1:1 문의내역')").on(
            "click",
            function() {
               //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
               $(self.location).attr("href",
                     "/request/getRequestListForAdmin?reqCode=2");
            });
   });

   //============= "수정"  Event 연결 =============
   function fncUpdateStore(e) {

      console.log(e);

      const storeNo = $(e).data("value");

      var storeIntro = $("input[id='storeIntro']").val();
      var storePhone = $("input[id='storePhone']").val();
      var storeImage = $("input[id='storeImage']").val();
      var startTime = $("input[id='startTime']").val();
      var endTime = $("input[id='endTime']").val();
      var bank = $("#bank option:selected").val();
      var holiday = $("input[id='holiday']").val();
      var accNo = $("input[id='accNo']").val();

      if (storeIntro == null || storeIntro.length < 1) {
         alert("상점소개 반드시 입력하여야 합니다.");
         return;
      }

      if (storePhone == null || storePhone.length < 1) {
         alert("상품 전화번호는 반드시 입력하셔야 합니다.");
         return;
      }

      if (storeImage == null || storeImage.length < 1) {
         alert("상점사진은 반드시 입력하셔야 합니다.");
         return;
      }

      if (startTime == null || startTime.length < 1) {
         alert("영업시작시간은 반드시 입력하셔야 합니다.");
         return;
      }

      if (endTime == null || endTime.length < 1) {
         alert("영업종료시간은 반드시 입력하셔야 합니다.");
         return;
      }

      if (bank == null || bank.length < 1) {
         alert("은행명은 반드시 입력하셔야 합니다.");
         return;
      }

      if (holiday == null || holiday.length < 1) {
         alert("상점휴일은 반드시 입력하셔야 합니다.");
         return;
      }

      if (accNo == null || accNo.length < 1) {
         alert("계좌번호는 반드시 입력하셔야 합니다.");
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
               alert("수정 완료되었습니다.");
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



                     <div class="list-group text-center" style="font-size: 15px;">
                        <button type="button"
                           class="list-group-item list-group-item-action"
                           aria-current="true">주문 내역</button>
                        <button type="button"
                           class="list-group-item list-group-item-action">상점 정보
                           수정</button>
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

            <!-- 상점 정보 수정 Begin-->
            <div>
               <h4 class="text-left">
                  <strong>상점 정보 수정</strong>

                  <hr size="10px">
               </h4>

               <c:forEach var="store" items="${storeInfo}" begin="0" end="0">


                  <table class="table table-hover"
                     style="width: 730px; heigh: 300px;">

                     <form class="form-horizontal" id="profileUpdate">


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
                                 value="
                                 
                                 <c:if test="${store.storeType.trim()=='1'}">
                                        정육         
                                    </c:if>
                                    <c:if test="${store.storeType.trim()=='2'}">
                                        수산         
                                    </c:if>
                                    <c:if test="${store.storeType.trim()=='3'}">
                                        채소         
                                    </c:if>
                                    <c:if test="${store.storeType.trim()=='4'}">
                                        과일         
                                    </c:if>
                                    <c:if test="${store.storeType.trim()=='5'}">
                                        종합         
                                    </c:if>"
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
                              <input type="text" name="storeImage"
                                 class="form-control form-control" id="storeImage"
                                 value="${store.storeImage}" placeholder="상점사진">
                           </div>
                        </div>
                        
                            <form method="post" th:action="@{/upload}" enctype="multipart/form-data">

                        <span class="btn btn-default btn-file"
                           style="padding-left: 260px; padding-bottom: 15px;"> 사진변경
                           <input type="file" name="file">
                        </span>
                        </form>

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
                              class="col-sm-2 col-form-label col-form-label">영업신고증</label>
                           <div class="col-sm-6">
                              <input type="text" name="businessCard"
                                 class="form-control form-control" id="businessCard"
                                 value="${store.businessCard}" placeholder="영업신고증" readonly>
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
                     <button type="button" id="button" class="btn btn-outline-success"
                        data-value="${store.storeNo}" onClick="fncUpdateStore(this)">
                        수정</button>
                     &nbsp;&nbsp;&nbsp;
                     <button type="button" id="button" class="btn btn-outline-danger">상점삭제신청</button>
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

</body>

</html>