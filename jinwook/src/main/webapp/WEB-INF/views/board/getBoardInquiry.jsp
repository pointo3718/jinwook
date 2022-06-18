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

$("#replyWriteBtn").on("click", function(){
	  var formObj = $("form[name='replyForm']");
	  formObj.attr("action", "/board/addComment");
	  formObj.submit();
	});
</script>

</head>

<body>
	<div class="container">
	<form name="readForm" role="form" method="post">
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
			<div class="col-xs-7 col-md-5">
			<fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd"/>
			</div>
		</div>
		<hr/>
		<span>파일 목록</span>
			
 			<div class="form-group">
 				<c:forEach var="file" items="${file}">
 				<input type="hidden" id="attach_no" name="attach_no" value="">
 					<a href="#" onclick="fn_fileDown('${file.attach_no}'); return false;">${file.org_file_name}</a>(${file.file_size}kb)<br>
 				</c:forEach>
 			</div>
 			</form>
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
		<hr/>
 <!-- 댓글 -->
<div class="row">
<div id="comment">
  <ol class="commentList">
    <c:forEach items="${commentList}" var="board">
      <li>
        <p>
        작성자 : ${board.comment.commentWriter}<br/></p>
         <p>
        작성 날짜 :  <fmt:formatDate value="${board.comment.commentDate}" pattern="yyyy-MM-dd" />
        </p> 

        <p>댓글: ${board.comment.commentContent}</p>
      </li>
    </c:forEach>   
  </ol>
</div>
</div>	

<form name="replyForm" method="post">
  <input type="hidden" id="boardNo" name="boardNo" value="${board.comment.boardNo}" />
  <div>
    <label for="writer">댓글 작성자: </label><input type="text" id="writer" name="writer" />
    <br/>
    <label for="content">댓글 내용: </label><input type="text" id="content" name="content" />
  </div>
  <div>
 	 <button type="button" id="replyWriteBtn" class="replyWriteBtn">작성</button>
  </div>
</form>

<%-- <form method="post" action="/board/addComment">
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
  
</form> --%>

<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="updateButton">수 &nbsp;정</button>
		    </div>
	</div>
</div>

</body>

</html>