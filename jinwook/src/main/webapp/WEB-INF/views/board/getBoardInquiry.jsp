<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<html>
<head>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	 <style type="text/css">
   
  </style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
     
<script type="text/javascript">

$(function(){
	
	$("#updateButton").on("click", function() {
		self.location = "/board/updateBoardInquiryView?boardNo=${board.boardNo}"
	});
});	

</script>

</head>

<body>
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">1:1문의 상세</h3>
	    </div>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>1:1문의번호</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardNo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>1:1문의 제목</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardTitle}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>1:1문의 내용</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardContent}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>작성자</strong></div>
			<div class="col-xs-7 col-md-5">${user.userId}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>조회수</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardHits}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>작성일</strong></div>
			<div class="col-xs-7 col-md-5">${board.writeDate}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>첨부 사진</strong></div>
			<div class="col-xs-7 col-md-5">${fileVO.fileName}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>답변상태</strong></div>
			<c:choose>
				<c:when test="${board.boardInqStatus == false}">
					답변대기중
				</c:when>
				<c:otherwise>
					답변 완료
				</c:otherwise>
			</c:choose>
			<!-- <div class="col-xs-7 col-md-5">${board.boardInqStatus}</div> -->
		</div>
<!-- 댓글 -->
<div id="comment">
  <ol class="commentList">
    <c:forEach items="${commentList}" var="board">
      <li>
        <p>
        작성자 : ${board.comment.commentWriter}<br/></p>
         <p>
        작성 날짜 :  <fmt:formatDate value="${board.comment.commentDate}" pattern="yyyy-MM-dd" />
        </p> 

        <p>${board.comment.commentContent}</p>
      </li>
    </c:forEach>   
  </ol>
</div>	

<form method="post" action="/board/addComment">
  <p>
  	<label>댓글 작성자</label><input type="text" name="writer">
  </p>
  <p>
  	<textarea rows="5" cols="50" name="content"></textarea>
  </p>
  <p>
  	<input type="hidden" name="boardNo" value="${getBoardInquiry.boardNo}">
  	<button type="submit">댓글 작성</button>
  </p>
  
</form>

<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="updateButton">수 &nbsp;정</button>
		    </div>
	</div>
</div>

</body>

</html>