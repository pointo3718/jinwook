<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<html>
<head>
<meta charset="UTF-8">
	
	<!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
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
            min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
        }
        
     </style>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("button.btn.btn-success").on("click", function() {
		fncAddBoardAnnouncement();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddBoardAnnouncement() {
	$("form").attr("method", "POST").attr("action", "addBoardAnnouncement").submit();
}

function fncAddBoardAnnouncement() {
	
	$("form").attr("method", "POST").attr("action", "/board/addBoardAnnouncement").submit();
}

var cnt = 1;
function fn_addFile() {
	$("#d_file").append("<br>" + "<input type='file' name='file'" + cnt +"' />");
}

</script>

</head>

<body>
	<div class="container">
		<h1 class="text-success text-center">공지사항 등록</h1>
			<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__text">
						<h2>
							공지사항
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
			<!-- form Start /////////////////////////////////////-->
		<form name=addBoardAnnouncementForm method="post" action="addBoardAnnouncement" enctype="multipart/form-data">
		<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
		<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					<div class="row">
						<div class="col-lg-12 col-md-6">
							<div class="row">
								<div class="col-lg-8">
									<div class="checkout__input">
										<p>
											<h4>공지사항 제목</h4>
										</p>
										<input type="text" name="boardTitle" id="boardTitle" size="100">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="checkout__input">
										<p>
										</p>
									</div>
								</div>
							</div>
							<br/>
							<div class="form-group">
								<label for="boardContent">공지사항 내용</label>
									<textarea id="summernote" class="form-control" rows="5" id="boardContent" name="boardContent"></textarea>
									<!-- <input type="text" style="width:800px;height:200px;font-size:20px;" name="boardContent" id="boardContent" id="summernote"/> -->
								</div>
							</div>
							<br>
			<tr>
							<td id="fileIndex"><c:forEach var="file" items="${file}" varStatus="var">
							<div>
							<input type="hidden" id="attach_no" name="attach_no_${var.index}"value="${file.attach_no}"> 
							<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="attach_no_${var.index}">
							<a href="#" id="fileName" onclick="return false;">${file.org_file_name}</a>(${file.file_size}kb)
							<button id="fileDel"
								onclick="fn_del('${file.attach_no}','attach_no_${var.index}');"
								type="button">삭제</button>
							<br>
						</div>
					</c:forEach></td>
			</tr>
							<div class="form-group">
								<label for="file" class="col-sm-offset-1 col-sm-3 control-label">파일 업로드</label>
								<div class="col-sm-3">
									<input type="file" id="file" name="file" placeholder="파일 선택"
										class="form-control">
									 <input type="button" class="form-control" value="파일 추가" onclick="fn_addFile()"><br>
		      						<div id="d_file">
		      	
		      						</div>
								</div>
							</div>
						</div>
 			<br>
			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="submit" class="btn btn-success">등 &nbsp;록</button>
		    </div>
		  </div>
					</div>
				</form>
			</div>
		</div>
	</section>
 	</div>

</body>

</html>