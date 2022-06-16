<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<script type="text/javascript">
   /*<![CDATA[*/

   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }

   /*]]>*/
</script>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/jquery.twbsPagination.js"></script>

<!-- jQuery -->
<script src="/js/jquery-3.6.0.min.js"></script>

<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css" />



<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
   padding-top: 50px;
}

.paging-div {
   padding: 15px 0 5px 10px;
   display: table;
   margin-left: auto;
   margin-right: auto;
   text-align: center;
}
</style>




<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
   /*<![CDATA[*/

   function movePage(uri, queryString) {
      location.href = uri + queryString;
   }

   /*]]>*/
</script>


<script type="text/javascript">
   $(function dataSend() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("button.btn.btn-primary").on("click", function() {

         var data = $("#input").val();

         var Cart = {
            result : data
         };

         $.ajax({
            url : "getStore",
            data : Cart,
            type : "POST",
         }).done(function(fragment) {
            $("#resultDiv").replaceWith(fragment);
         });
      });
   });

   //=============    검색 / page 두가지 경우 모두  Event  처리 =============   
   function fncGetUserList(currentPage) {
      $("#currentPage").val(currentPage)
      $("form").attr("method", "POST").attr("action",
            "/purchase/listPurchase").submit();
   }

   //============= "검색"  Event  처리 =============   
   $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("button.btn.btn-default").on("click", function() {
         fncGetUserList(1);
      });
   });

   //============= userId 에 회원정보보기  Event  처리(Click) =============   
   $(function() {

      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("td:nth-child(1)").on(
            "click",
            function() {
               self.location = "/purchase/getPurchase?tranNo="
                     + $(this).attr("tranNo");
            });

      //==> userId LINK Event End User 에게 보일수 있도록 
      $("td:nth-child(2)").css("color", "red");

   });

   $(function() {

      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("td:nth-child(2)").on("click", function() {
         self.location = "/user/getUser?userId=" + $(this).text().trim();
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

   function fncaddOrdersCart(e) {
      const prodNo = $(e).data("value");
      const storeName = $("#stoName").data("values");
      const prodCount = $()

      const passdata = {
         'prodNo' : prodNo,
         'storeName' : storeName
      };
      console.log(storeName);
      console.log(prodNo);
      $.ajax({
         anyne : true,
         url : "/orders/addOrdersCart/" + prodNo,
         contentType : 'application/json',
         data : JSON.stringify(passdata).e,
         dataType : "text",
         success : function(result) {
            if (result != null) {
               alert("담기완료");
            }
         }
      });
   }
</script>

</head>

<body>

   <div class="navbar  navbar-default">
      <div class="container">
         <a class="navbar-brand" href="/user/index">진욱이네</a>
      </div>
   </div>

   <!-- ToolBar Start /////////////////////////////////////-->
   <!-- ToolBar End /////////////////////////////////////-->

   <!--  화면구성 div Start /////////////////////////////////////-->
   <div class="container">

      <div class="page-header text-info">
         <h3>상점정보</h3>
      </div>


      <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      <div class="row">

         <div class="col-md-6 text-left">
            <p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
               ${resultPage.currentPage} 페이지</p>
         </div>

         <div class="col-md-6 text-right">
            <form class="form-inline" name="detailForm">


               <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
               <input type="hidden" id="currentPage" name="currentPage" value="" />

            </form>
         </div>

      </div>
      <!-- table 위쪽 검색 Start /////////////////////////////////////-->
      <c:forEach var="store" items="${getStore}" begin="0" end="0">
         <div class="row">
            <div class="col-xs-4 col-md-2">
               <strong>상점번호</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.storePhone}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점이름</strong>
            </div>
            <div class="col-xs-8 col-md-4" id="stoName"
               data-values="${store.storeName}">${store.storeName}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점종류</strong>
            </div>
            <div class="col-xs-8 col-md-4">
               <c:if test="${store.storeType.trim()=='1'}">
                종합         
            </c:if>
            </div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점주소</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.storeAddr}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점시작시간</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.startTime}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점종료시간</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.endTime}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점휴무일</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.holiday}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점소개</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.storeIntro}</div>
            <div class="col-xs-4 col-md-2 ">
               <strong>상점별점</strong>
            </div>
            <div class="col-xs-8 col-md-4">${store.orders.reviewStar}점</div>
         </div>

         <hr />



      </c:forEach>

      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">

         <thead>
            <tr>
               <th align="center">No</th>
               <th align="left">상품번호</th>
               <th align="left">상품명</th>
               <th align="left">상품사진</th>
               <th align="left">가격</th>
               <th align="left">원산지</th>
               <th align="left">상품소개</th>
               <th align="left">매진여부</th>
               <th align="left">수량</th>
               <th align="left">장바구니</th>
            </tr>
         </thead>

         <tbody>

            <c:set var="i" value="0" />
            <c:forEach var="store" items="${getStore}">
               <c:set var="i" value="${ i+1 }" />
               <tr>
                  <td align="Center">${ i }</td>
                  <td align="left">${store.product.prodNo}</td>
                  <td align="left">${store.product.prodName}</td>
                  <td align="left">${store.product.prodImg}</td>
                  <td align="left">${store.product.price}</td>
                  <td align="left">${store.product.prodOrign}</td>
                  <td align="left">${store.product.prodInfo}</td>
                  <td align="left"><c:if test="${store.product.soldout==true}">
                   판매중         
                  </c:if> <c:if test="${store.product.soldout==false}">
                   매진         
                  </c:if></td>
                  <td align="left">
                        <div class="col-xs-8 col-md-4">
                           <select name=prodCount class="ct_input_g"
                              style="width: 100px; height: 19px" maxLength="20">
                              <option value="1" selected="selected">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                           </select>
                     </div></td>
                  <td align="left"><button type="button"
                        data-value="${store.product.prodNo}" class="btn btn-primary"
                        onClick="fncaddOrdersCart(this)">담&nbsp;기</button>
                     </div></td>

               </tr>
            </c:forEach>

         </tbody>

      </table>
      <!--  table End /////////////////////////////////////-->

   </div>
   <!--  화면구성 div End /////////////////////////////////////-->


   <!-- PageNavigation Start... -->
   <!-- PageNavigation End... -->
   <jsp:include page="../common/pageNavigator_new.jsp" />
</body>

</html>