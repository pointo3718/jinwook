<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<html>
<head>
<meta charset="EUC-KR">
	
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
	<style>
 		body {
            padding-top : 50px;
        }
     </style>

<script type="text/javascript">

</script>

</head>

<body>
<form action="/board/getBoardInquiry" method="post">
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">1:1문의 상세</h3>
	    </div>
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
			<div class="col-xs-7 col-md-5">${file.fileName}</div>
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
		<hr/>
		
		 <!--                     추가                         -->
    <!--  댓글  -->
    <div class="container">
        <label for="content">답변</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${board.boardNo}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
</div>
		<hr/>
</div>

</div>
</form>
	
</body>

</html>