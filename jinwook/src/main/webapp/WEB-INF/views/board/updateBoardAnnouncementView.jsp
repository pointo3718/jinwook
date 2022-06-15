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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script src="../javascript/calendar.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">	
		
		function fncUpdateAnnouncement() {

			$("form").attr("method", "POST").attr("action", "/board/updateBoardAnnouncement").submit();
		}
		
		//==> 추가된부분 : "수정"  Event 연결
		$(function() {
			$("button.btn.btn-primary").on("click", function() {
				fncUpdateAnnouncement();
			});
		});
		
		//==> 추가된부분 : "취소"  Event 연결 및 처리
		$(function() {
			$("a[href='#' ]").on("click", function() {
				$("form")[0].reset();
			});
		});
		
	</script>
	
</head>

<body>


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-center">
			<h3 class=" text-info">공지사항 정보수정</h3>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form action="board/updateBoardAnnouncement" method="post" class="form-horizontal">

			<div class="form-group">
				<label for="rcpNo" class="col-sm-offset-1 col-sm-3 control-label">공지사항 번호</label>
				<div class="col-sm-4">
					<input type="rcpNo" class="form-control" id="rcpNo" name="rcpNo" value="${recipe.rcpNo}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="rcpTitle" class="col-sm-offset-1 col-sm-3 control-label">공지사항 제목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="rcpTitle" name="rcpTitle" value="${recipe.rcpTitle}">
				</div>
			</div>

			<div class="form-group">
				<label for="rcpContent" class="col-sm-offset-1 col-sm-3 control-label">공지사항 내용</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="rcpContent"
						name="rcpContent" value="${recipe.rcpContent}">
						
				</div>
			</div>

			<div class="form-group">
				<label for="file" class="col-sm-offset-1 col-sm-3 control-label">공지사항 사진</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="files" name="files"
						value="${files.fileNo}">
						<input type="submit" value="upload">
				</div>
			</div>

			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="submit" class="btn btn-primary">수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>