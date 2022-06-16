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
        .select_img img { margin:20px 0; }
     </style>
     
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

$(function() {
	$("button.btn.btn-primary").on("click", function() {
		fncAddRecipe();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddRecipe() {
	$("form").attr("method", "POST").attr("action", "/board/addRecipe").submit();
}

var cnt = 1;
function fn_addFile() {
	$("#d_file").append("<br>" + "<input type='file' name='file'" + cnt +"' />");
}

</script>

</head>

<body>
	<div class="container">
		<h1 class="bg-primary text-center">레시피 등록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form id="MultiUpload" action="addRecipe" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="rcpTitle" class="col-sm-offset-1 col-sm-3 control-label">레시피 제목</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="rcpTitle" name="rcpTitle">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
		   </div>
		<hr/><br/><br/>    
		<div class="form-group">
			<label for="rcpContent" class="col-sm-offset-1 col-sm-3 control-label">레시피 내용</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="rcpContent" name="rcpContent">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
		   </div>
		<hr/><br/>
		<div class="form-group">
			<label for="rcpIngredient" class="col-sm-offset-1 col-sm-3 control-label">레시피 재료</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="rcpIngredient" name="rcpIngredient">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
		   </div>
		<hr/><br/>
		<div class="form-group">
			<label for="rcpInfo" class="col-sm-offset-1 col-sm-3 control-label">레시피 소개</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="rcpInfo" name="rcpInfo">
		       <span id="helpBlock" class="help-block"></span>
		    </div>
		   </div>
		<hr/><br/>
		
		<div class="form-group">
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">파일 업로드</label>
		    <div class="col-sm-3"><!-- 입력칸 -->
		    <input type="button" class="form-control" value="파일 추가" onclick="fn_addFile()"><br>
		      	<div id="d_file">
		      	
		      	</div>
		      	<input type="file" id="files" name="files" multiple="multiple" placeholder="파일 선택" class="form-control" >
		      	<input type="submit" value="upload">
		    </div>
		  </div>
		<hr/><br/><br/><br/>
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="submit" class="btn btn-primary">등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  </form>
		<hr/><br/><br/><br/>
</div>
	
</body>

</html>