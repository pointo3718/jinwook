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
	<style>
 		body {
            padding-top : 50px;
        }
     </style>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("button.btn.btn-primary").on("click", function() {
		fncAddBoardAnnouncement();
	});
});

//==> 추가된부분 : "취소"  Event 처리 및  연결
$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddBoardAnnouncement() {
	
	$("form").attr("method", "POST").attr("action", "/board/addBoardAnnouncement").submit();
}

<%-- var rcpNo = ${recipe.rcpNo}

function updateRecipeReco() {
	$.ajax({
		type : "POST",
		url : "/board/updateRecipeReco",
		dataType : "json",
		data : {'rcpNo' : rcpNo, 'userId' : userId},
		error : function() {
			alert("통신 에러");
		},
		success : function(recoCheck) {
			if (recoCheck == 0) {
				alert("추천 완료!");
				location.reload();
			}
			else if (recoCheck == 1) {
				alert("추천 취소!");
				location.reload();
			}
		}
	});
}--%>

</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<form action="board/addBoardAnnouncement" method="post" enctype="multipart/form-data">
						
			<div class="form-group">
		    <label for="boardTitle" class="col-sm-offset-1 col-sm-3 control-label">공지사항 제목</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="boardTitle" name="boardTitle">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
		   </div> 
			<hr/><br/><br/>
			
			<div class="form-group">
		    <label for="boardContent" class="col-sm-offset-1 col-sm-3 control-label">공지사항 내용</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="boardContent" name="boardContent">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
			</div>
 			<hr/><br/>
 			
						<div class="form-group">
							<label for="file" class="col-sm-offset-1 col-sm-3 control-label">다중 파일 업로드</label>
							<div class="col-sm-3">
								<!-- 입력칸 -->
								<input type="file" id="files" name="files"
									multiple="multiple" placeholder="파일 선택" class="form-control">
								<input type="submit" value="upload">
							</div>
						</div><br/><br/><br/><br/>
				
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
		<div class="col-sm-offset-4  col-sm-4 text-center">
		    <button type="submit" class="btn btn-primary">등 &nbsp;록</button>
			<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		</div>
		</div>
			</form>
		</div>

</body>

</html>