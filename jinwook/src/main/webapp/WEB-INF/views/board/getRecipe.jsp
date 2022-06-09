<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

<meta charset="UTF-8">
   
   <!-- ì°¸ì¡° : http://getbootstrap.com/css/   ì°¸ì¡° -->
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
   
   
   <!-- jQuery UI toolTip ì‚¬ìš© CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ì‚¬ìš© JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
     body {
            padding-top : 50px;
        }
<<<<<<< HEAD
    </style>
=======
        
     .link-icon { position: relative; display: inline-block; width: auto;    font-size: 14px; font-weight: 500; color: #333; margin-right: 10px; padding-top: 50px; }
	 .link-icon.kakao { background-image: url(../images/icon-kakao.png); background-repeat: no-repeat; }
     </style>
     

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
>>>>>>> refs/heads/Song
<script type="text/javascript">
<<<<<<< HEAD
$(function() {
	$('#reco_btn').on('click',function() {	
		var rcpNo = ${recipe.rcpNo};
		var userId = "${usid}";

		/* function updateRecipeReco() { */
=======
<%--	var rcpNo = ${recipe.rcpNo};
		var userId = ${recipe.userId};
 $(function() {
	 
	$('#reco_btn').on('click', function() {
>>>>>>> refs/heads/Song
		
		$.ajax(
				{
			type : "POST",
			url : "/board/updateRecipeReco",
			dataType : "json",
			data : {'rcpNo' : rcpNo, 'userId' : userId},
			error : function() {
				alert("í†µì‹  ì—ëŸ¬");
			},
			success : function(recoCheck) {
				if (recoCheck == 0) {
					alert("ì¶”ì²œ ì™„ë£Œ!");
					location.reload();
				}
				else if (recoCheck == 1) {
					alert("ì¶”ì²œ ì·¨ì†Œ!");
					location.reload();
					}
<<<<<<< HEAD
				}
			});
		/* } */
=======
			}
		});
>>>>>>> refs/heads/Song
	});
}); --%>

<%-- function shareKakao() {
	 
	  // »ç¿ëÇÒ ¾ÛÀÇ JavaScript Å° ¼³Á¤
	  Kakao.init('a0a80d65a577c18111b0b6018483114f');
	 
	
	// Ä«Ä«¿À¸µÅ© ¹öÆ° »ı¼º
		Kakao.Link.createDefaultButton({
			container : '#btnKakao', // Ä«Ä«¿À°øÀ¯¹öÆ°ID
			objectType : 'feed',
			content : {
				title : "°³¹ß»õ¹ß", // º¸¿©Áú Á¦¸ñ
				description : "°³¹ß»õ¹ß ºí·Î±×ÀÔ´Ï´Ù", // º¸¿©Áú ¼³¸í
				imageUrl : "devpad.tistory.com/", // ÄÜÅÙÃ÷ URL
				link : {
					mobileWebUrl : "devpad.tistory.com/",
					webUrl : "devpad.tistory.com/"
				}
			}
		});
	}--%>
	
	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URLÀÌ º¹»çµÇ¾ú½À´Ï´Ù.")
	}
</script>

</head>

<body>

	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">ë ˆì‹œí”¼ ìƒì„¸ ì¡°íšŒ</h3>
	    </div>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>ë ˆì‹œí”¼ ì œëª©</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpTitle}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>ë ˆì‹œí”¼ ë‚´ìš©</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpContent}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>ì‘ì„±ì</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.user.userId}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ë ˆì‹œí”¼ ì¬ë£Œ</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpIngredient}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ë ˆì‹œí”¼ ì¸ë„¤ì¼</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpThumb}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ë ˆì‹œí”¼ ì†Œê°œ</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpInfo}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ì¡°íšŒìˆ˜</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpHits}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ì‘ì„±ì¼</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpDate}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ëŒ“ê¸€ìˆ˜</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.commentCount}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ì°œ</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.rcpJjimCnt}</div>
		</div>
		<hr/>
		 <div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>ì¶”ì²œìˆ˜</strong></div>
			<div class="col-xs-7 col-md-5">${recipe.recommendCount}</div>
		</div>
		<hr/>
<<<<<<< HEAD

</div>

	<button type="button" class="btn btn-warning" id="reco_btn">ì¶”ì²œ${recipe.recommendCount}</button>
	<button type="button" class="btn btn-danger" id="hate_btn">ë¹„ì¶”ì²œ</button>
=======
		<div class="row">
		
			<span class="button gray medium"><a href="#" onclick="clip(); return false;">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1Zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5v-1Zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2Z"/></svg>		
</a>urlº¹»ç</span>
		</div>
		<hr/>
	<button type="button" class="btn btn-warning" id="reco_btn">ÃßÃµ</button>
	<button type="button" class="btn btn-danger" id="hate_btn">ºñÃßÃµ</button>
	
	
>>>>>>> refs/heads/Song

	
</body>

</html>