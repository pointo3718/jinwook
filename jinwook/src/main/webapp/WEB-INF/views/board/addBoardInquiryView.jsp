<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<html>
<head>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style type="text/css">
 		body {
            padding-top : 50px;
        }
        
     </style>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

$(function() {
	$("button.btn.btn-primary").on("click", function() {
		fncAddInquiry();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddInquiry() {
	$("form").attr("method", "POST").attr("action", "/board/addBoardInquiry").submit();
}

function fn_addFile(){
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}

</script>

</head>

<body>
<div class="container">
		<h1 class="bg-primary text-center">1:1 문의 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form name=addBoardInquiryForm method="post" action="board/addBoardInquiry" enctype="multipart/form-data">
			<div class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-3 control-label">1:1문의 제목</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
		   </div> 
			<hr/><br/><br/>
			<div class="form-group">
		    <label for="boardContent" class="col-sm-offset-1 col-sm-3 control-label">1:1문의 내용</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="boardContent" name="boardContent">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
			</div>
 			<hr/><br/>
			<div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">파일 업로드</label>
		    <div class="col-sm-3"><!-- 입력칸 -->
		      	<button class="fileAdd_btn" type="button">파일추가</button>	
		      	<input type="file" id="file" name="file" placeholder="파일 선택" class="form-control" >
		    </div>
		  </div>
 			
			<%-- <div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">업로드 사진</label>
		    <div class="col-sm-3"><!-- 입력칸 -->
		      	<input type="file" multiple="multiple" class="form-control" id="files" name="files">
		    </div>
		  </div>--%>
		<br/><br/><br/>  
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
	  		<div class="col-xs-5 col-md-3 "><strong>답변상태</strong></div>
			<c:choose>
				<c:when test="${board.boardInqStatus == false}">
					답변대기중
				</c:when>
				<c:otherwise>
					답변 완료
				</c:otherwise>
			</c:choose>
		</div>	
			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="submit" class="btn btn-primary">등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	

<div class="container">
	<div class="form-group">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			1:1문의 답변
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br></td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
			</table>
	</div>
</div>

</body>

</html>