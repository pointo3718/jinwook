<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

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
function fncDeleteInquiry(e) {
	if (!confirm('상품을 삭제하시겠어요?')) {
		return false;
	}
	
	console.log(e);
	const no = $(e).data("value");
	 $.ajax({
			url : "/board/deleteBoardInquiry/"+no,
			dataType : "json",
			success : function(result){
				if(result != null){
					alert("삭제완료");
					self.location = "/board/getBoardInquiryList";
				}
			}
		
		});
	
}

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
   

   
</script>

</head>

<body>

   <!-- ToolBar Start /////////////////////////////////////-->
   <!-- ToolBar End /////////////////////////////////////-->

   <!--  화면구성 div Start /////////////////////////////////////-->
   <div class="container">

      <div class="page-header text-info">
         <h3>1:1문의 목록</h3>
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

      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">

         <thead>
            <tr>
               <th align="center">No</th>
               <th align="left">문의 제목</th>
               <th align="left">작성일</th>
               <th align="left">조회수</th>
            </tr>
         </thead>

         <tbody>

            <c:set var="i" value="0" />
            <c:forEach var="board" items="${getBoardInquiryList}">
               <c:set var="i" value="${ i+1 }" />
               <tr>
                  <td align="Center">${ board.boardNo }</td>
                  <td align="left">${board.boardTitle}</td>
                  <td align="left">${board.writeDate}</td>
                  <td align="left">${board.boardHits}</td>
                  <td align="left"><button data-value="${board.boardNo}" id="buttons" type="button" class="btn btn-primary" onClick="fncDeleteInquiry(this)">X</button></td>
             <%-- <c:choose>
				<c:when test="${board.boardInqStatus == false}">
					답변대기중
				</c:when>
				<c:otherwise>
					답변 완료
				</c:otherwise>
			</c:choose> --%>
               </tr>
            </c:forEach>

         </tbody>

      </table>
      <!--  table End /////////////////////////////////////-->

   </div>
   <!--  화면구성 div End /////////////////////////////////////-->


   <!-- PageNavigation Start... -->
 <jsp:include page="../common/pageNavigator_new.jsp"/>
   <!-- PageNavigation End... -->
</body>

</html>