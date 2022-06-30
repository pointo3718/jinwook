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
    <title>문의 상세</title>

    <!-- Google Font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> 

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
 	<!-- jQuery UI toolTip 사용 CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 
<script type="text/javascript">
/*<![CDATA[*/

function movePage(uri, queryString) {
   location.href = uri + queryString;
}

/*]]>*/
	
	<!-- 수정 버튼 이벤트 -->
	$(function(){
		
		$("#updateButton").on("click", function() {
			self.location = "/board/updateBoardInquiryView?boardNo=${board.boardNo}"
		});
	});
	
	<!-- 1:1문의 답변 등록 버튼 이벤트 -->
	$(function() {
		$("#replyWriteBtn").on("click", function() {
			fncAddInquiryComment();
		});
	});
	
	<!-- 1:1문의 답변 삭제 -->
	function fncDeleteInquiryComment(e) {
		if (!confirm('답변을 삭제하시겠어요?')) {
			return false;
		}
		
		console.log(e);
		const no = $(e).data("value");
		 $.ajax({
				url : "/board/deleteInquiryComment/"+no,
				dataType : "json",
				success : function(result){
					if(result != null){
						alert("삭제완료");
						self.location = "/board/getBoardInquiry?boardNo=${board.boardNo}";
					}
				}
			
			});
	}
	
	<!-- 1:1문의 답변 등록 -->
	function fncAddInquiryComment() {
		
		 var commentContent = $("textarea[id='commentContent']").val();

		    if (commentContent == null || commentContent.length < 1) {
		       alert("댓글내용을 반드시 입력하여야 합니다.");
		       return;
		    }
		
		$("form").attr("method", "POST").attr("action", "/board/addInquiryComment").submit();
	}
</script>    
 
 
<style>
 *{font-family: 'Noto Sans KR', sans-serif;}

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
      align-items: center;

/* 상단 메뉴 */
.top {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.top .username {
  font-weight: bold;
}
.top .utility {
  display: flex;
  flex-direction: row;
  margin-left: auto;
}

/* 하단 메뉴 */
.bottom {
  display: flex;
  flex-direction: row;
  align-items: center;
  list-style: none;
  padding: 0;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: -0.5px;
  font-weight: bold;
  font-size: 14px;
}
.bottom .divider {
  width: 1px;
  height: 20px;
  background-color: #dbdbdb;
  margin: 0 20px;
}
.bottom .menu {
  margin: 0;
  padding: 0;
  color: #bebebe;
}
.bottom .menu.show-reply {
  color: #333;
}


</style>    
</head>

<body>
 <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
    <!-- Header Section Begin -->
    
      <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container" style="background-color: #F2F2F2;">
            <div class="row">
            
                <div class="col-lg-12" style="background-color: #F2F2F2;">
                    <div class="contact__form__title">
                        <h2 style="margin-top:20px;"><i class="bi bi-telegram"></i>&nbsp;문의</h2>
                    </div>
                </div>
            </div>
            <form>
                <div class="row" style="background-color: #F2F2F2; padding-bottom:100px; padding-right:30px; padding-left:30px;">
                <div>
                	<div class="col-sm-5 col-sm-5" style="margin: auto;">
                        <input type="text" readonly="readonly" value="${board.boardTitle}" style="text-align:center; width:500px; margin-left:50px; font-weight:bold;">
                    </div>
                <div style="margin:auto;">
                	<img attachNo="${attach.attachNo}" width="400" height="400" 
						src="/resources/static/${attach.orgFileName}" alt="..."
						onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'" 
						width="300" height="300" style="margin-left: 300px; margin-bottom: 20px;"/>
					</div>
                </div>
                    
                    <div class="col-sm-4 col-sm-4">
                        <i class="bi bi-eye"></i> ${board.boardHits}<br/><br/>
 						<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						
                    </div>
 						<br/><br/><br/>
                    
                    <div class="col-lg-12 text-center">
                    	<textarea readonly="readonly">${board.boardContent}</textarea>
                    </div>
                    
                    
                    <div class="col-lg-12 text-center">
                        <button type="button" class="btn btn-success" id="updateButton">수 &nbsp;정</button>
                    </div>
                    <br/><br/><br/>
                    <!-- 댓글 작성폼 start -->
                  <c:if test="${sessionScope.user.role == '관리자'}">
					<div class="card mb-2" style="margin-left:20px;">
						<!-- 댓글 헤더 -->
						<div class="card-header bg-light" style="font-weight:bold;">
							<i class="fa fa-comment fa"></i> 문의 답변
						</div>
					<form name="replyForm" method="post" action="addInquiryComment">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}"/>
									<div class="form-inline mb-2">
										<label for="commentWriter"><i class="fa fa-user-circle-o fa-2x"></i></label> 
										<input type="text" class="form-control ml-2" id="commentWriter" name="commentWriter" readonly="readonly" value="관리자"> 
									</div> 
									<textarea class="form-control" id="commentContent" name="commentContent" rows="3"></textarea>
									<button type="submit" class="btn btn-dark mt-3" id="replyWriteBtn">답변 작성</button>
								</li>
							</ul>
						</div>
					</div>
					</form>
				</c:if>
					<!-- 댓글 작성폼 end -->
					
					<!-- 댓글 리스트 조회 폼 start -->
					<div class="card" style="margin-left:30px;">
						<div class="card-header">답변 내역</div>
							<ul id="comment" class="commentList">
								<c:forEach items="${commentList}" var="board">
									<li id="comment--1" class="list-group-item d-flex justify-content-between">
											<div class="font-itatlic">작성자 :${board.comment.commentWriter} | &nbsp;</div>
											<br/>
										<div class="d-flex">
										<div>${board.comment.commentContent}</div>&nbsp;&nbsp;&nbsp;
											<%-- <button type="button" id="button" class="btn btn-outline-success"
                        					data-value="${recipe.comment.commentNo}" onClick="fncUpdateRecipeComment(this)">수정</button>&nbsp;&nbsp;&nbsp; --%>
											
											<c:if test="${sessionScope.user.role == '관리자'}">
											<button data-value="${board.comment.commentNo}" id="buttons" type="button" class="site-btn" 
											onClick="fncDeleteInquiryComment(this)" style="padding-left: 10px; padding-right: 10px; padding-bottom: 5px; padding-top: 5px;">X</button>
											</c:if>
										</div>
									</li>
								</c:forEach>
							</ul>
					</div>
					<!-- 댓글 조회 폼 end -->
                    
                                      
                </div>
        </div>
    </div>
    </form>
    <!-- Contact Form End -->

	<!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->



</body>

</html>