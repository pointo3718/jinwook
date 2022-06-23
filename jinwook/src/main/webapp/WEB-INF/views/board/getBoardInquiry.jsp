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
    <title>1:1문의 상세</title>

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
	
	function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
	
	$("#replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/board/addInquiryComment");
		  formObj.submit();
		});
	
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
                        <h2><i class="bi bi-question-lg"></i>&nbsp;1:1문의 상세</h2>
                    </div>
                </div>
            </div>
            <form>
                <div class="row" style="background-color: #F2F2F2;">
                
                <div class="imgborder">
                <img width="400" height="400"
					src="/resources/static/${board.attach.orgFileName}" alt="..."
					onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'" 
					width="300" height="300" style="margin-left: 20px; margin-bottom: 20px;"/>
					                ${board.attach.orgFileName}
				</div>
                
                    <div class="col-sm-4 col-sm-4" style="width:100px; height:50px;">
                        <input type="text" readonly="readonly" value="${board.boardTitle}" style="text-align:center;">
                    </div>`
                    <div class="col-sm-4 col-sm-4">
                        <i class="bi bi-eye"></i> ${board.boardHits}<br/>
 						<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
 						<br/><br/><br/>
                    
                    <div class="col-lg-12 text-center">
                    	<textarea readonly="readonly">${board.boardContent}</textarea>
                    </div>
                    
                    
                    <div class="col-lg-12 text-center">
                        <button type="button" class="btn btn-success" id="updateButton">수 &nbsp;정</button>
                    </div>
                    
                   <%--  <!-- 답변 리스트 조회 -->
					<div class="replies" style="margin-left:20px; margin-top:20px; margin-bottom:20px;">
						<div class="reply">
							<div class="content">
								<ol class="commentList">
									<c:forEach items="${commentList}" var="board">
										<li>
											<p>
												작성자 : ${board.comment.commentWriter}<br />
											</p>
											<p>
												작성 날짜 :
												<fmt:formatDate value="${board.comment.commentDate}"
													pattern="yyyy-MM-dd" />
											</p>

											<p>댓글: ${board.comment.commentContent}</p>
										</li>
									</c:forEach>
								</ol>
							</div>
						</div>
					</div> --%>
                    
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