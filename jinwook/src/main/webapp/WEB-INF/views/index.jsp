<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>[진욱이네] 진심을 담아 더욱더...</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">	


<!-- Css Styles -->
<link rel="stylesheet"
	href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/static/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/resources/static/css/elegant-icons.css" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/static/css/nice-select.css" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/static/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/resources/static/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/static/css/style.css"
	type="text/css">

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

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
}

.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>







</head>
<body>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>


	<!-- Header Begin -->
	<jsp:include page="./layout/top.jsp" />
	<!-- Header End -->
	<div class="row">
		<div class="scroll1" id="scroll1"></div>
		<div id="carouselExampleFade" class="carousel slide carousel-fade"
			data-ride="carousel"
			style="width: 1100px; height: 200px; right: 20px;">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${path}/resources/static/img/banner/선경이네.png"
						class="d-block w-100" class="img-responsive displayed" alt="...">
				</div>
				<div class="carousel-item">
					<img src="${path}/resources/static/img/banner/지호네.png"
						class="d-block w-100" alt="..."
						style="width: 1100px; height: 200px;">
				</div>
				<div class="carousel-item">
					<img src="${path}/resources/static/img/banner/진욱이생일.png"
						class="d-block w-100" alt="...">
				</div>
			</div>

		</div>
	</div>


	<!-- Blog Section Begin -->
	<section class="from-blog spad" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title ">
						<h2>진욱이네 상점 구경하기</h2>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="map">

		<div class="row" style="align-items: flex-start;">

			<!-- 지도를 표시할 div 입니다 -->


			<div id="map" style="width: 500px; height: 500px; right: 50px;">
			</div>
			<div>


				<h3 class="text-left">
					<strong style="font-size: 22px;">진욱이네 상점 TOP 7</strong><span
						style="font-size: 13px; color: #A4A4A4; padding-left: 220px;">*주문수
						기준</span>
					</hr>
				</h3>

				<table class="table" style="width: 500px; height: 50px;">

					<thead>
						<tr style="text-align: center">
							<th scope="col">상점이름</th>
							<th scope="col">상점주소</th>
							<th scope="col">상점업종</th>
						</tr>
					</thead>

					<tbody class="storeList">

					</tbody>

				</table>

			</div>

			<jsp:include page="map.jsp" />

		




	</section>

	<!-- Featured Section Begin -->
	<div class="scroll2" id="scroll2"></div>
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>화제의 레시피</h2>
					</div>

				</div>
			</div>
			<div class="row featured__filter recipelistBody">

				<!-- 컨텐츠 들어가는 부분 -->

			</div>
		</div>

	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="row">
		<div class="col-lg-12">
			<div class="section-title">
				<h2>광고</h2>
			</div>

		</div>
	</div>
	<div class="scroll3" id="scroll3"></div>
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${path}/resources/static/img/banner/진욱광고.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${path}/resources/static/img/banner/인규네.png" alt="">
						<img src="${path}/resources/static/img/banner/오싹할인.png" alt="">
						<img src="${path}/resources/static/img/banner/선경이네.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Youtube Begin -->
	<div class="row" style="margin-top: 80px;">
		<div class="col-lg-12">
			<div class="section-title">
				<h2>화제의 동영상</h2>
			</div>

		</div>
	</div>
	<div class="scroll3" id="scroll3"></div>
	<div class="banner">
		<div class="container">
			<div class="row">

				<iframe width="360" height="315" style="border-radius:50px;" class='preview_div'
					src="https://www.youtube.com/embed/AlK2Gl6kHZI?autoplay=1&mute=1&showinfo=0&controls=0&autohide=1"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				&nbsp;&nbsp;&nbsp;&nbsp;

				<iframe width="360" height="315" style="border-radius:50px;"
					src="https://www.youtube.com/embed/0cvI3iAk8Z0?autoplay=1&mute=1&showinfo=0&controls=0&autohide=1"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
					&nbsp;&nbsp;&nbsp;&nbsp;

				<iframe width="360" height="315" style="border-radius:50px;" class='preview_div'
					src="https://www.youtube.com/embed/rEnnfMFAijU?autoplay=1&mute=1&showinfo=0&controls=0&autohide=1"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>


			</div>
		</div>
	</div>
	<!-- Youtube End -->





	<br>
	<br>
	<br>

	<script type="text/javascript">
	
window.open("/adPopup.jsp","광고","width=600,height=300");

   
//======BEST 상점 목록=========//

$(function() {
   getStoreListByOrderCount();
});

function getStoreListByOrderCount() {
   
      var uri = "/store/getStoreListByOrderCount"

      $.get(uri, function(response) { 
         
            var storelistHtmlBody = "";
            
            $(response.storeList).each(function(idx,store) {
               
               

               storelistHtmlBody += `
                <tr style="text-align:center">
                   <td><a href="http://localhost:8082/store/getStore?storeNo=\${store.storeNo}" style="color:black;">\${store.storeName}</td>
                   <td>\${store.storeAddr}</td>
                   <td>\${store.storeType}</td>
                </tr>
               `;
            });
            
            
            $(".storeList").html(storelistHtmlBody);
            //$(".userlisthead").html(blacklistHtmlBody);
         
      }, "json");

}

//=============map 상점 정보 rest가져오기==================//

/*
$.ajax({
url: "/store/getStoreMap",
dataType: "json"
}).done(function(data){
console.log(data);
var storeList = data;
console.log(storeList);
});
*/


//============================================//

//////////////// 화제의 레시피 목록 REST 시작 /////////////////

 $(function() {
	 getRecipeHits();
	});

   function getRecipeHits() {

   var uri = "/admin/getRecipeHits"

   $.get(uri, function(response) { 
      
         var recipelistHtmlBody = "";

         $(response.recipelist).each(function(idx, recipe) {
            recipelistHtmlBody += `
            
										<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
										<div class="featured__item">
										 <img
					                     src="/resources/static/\${recipe.attach.orgFileName}"
					                        onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
					                     alt="My Image" width="210" height="210"  style="border-radius:5px;">
												
											
											<div class="featured__item__text" style="margin-right: 40px;">
												<span style="font-size: 10px;">
												<strong><i class="bi bi-eye"></i> &nbsp;\${recipe.rcpHits}</strong>
												</span>
												<a href="/board/getRecipe?rcpNo=\${recipe.rcpNo}"><h5>\${recipe.rcpTitle}</h5><a>
											</div>
										</div>
									</div>
									
            `;
         });
         
         $(".recipelistBody").html(recipelistHtmlBody);
         //$(".userlisthead").html(blacklistHtmlBody);
      
   }, "json");
}

//////////////// 화제의 레시피 목록 REST 끝   /////////////////



</script>

	<!-- Blog Section End -->
	<jsp:include page="layout/footer.jsp" />

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		type="text/javascript"></script>
	<script>
      // 마우스 진입 이벤트
      $(document).on('mouseenter', '.preview_div', function(){
        // 재생 버튼 감추기
        $(this).find('img').hide();
        // 썸네일 이미지를  gif 이미지로 변경
        $(this).css('background-image', 'url(https://t1.daumcdn.net/cfile/tistory/99D4F34B5BE6C2CE01?v='+Math.random()+')');
      });
      // 마우스 아웃 이벤트
      $(document).on('mouseleave', '.preview_div', function(){
        // 재생 버튼 보아기
        $(this).find('img').show();
        // gif 이미지를  썸네일 이미지로 변경
        $(this).css('background-image', 'url(https://t1.daumcdn.net/cfile/tistory/99AEF8505BE6BF582D)');
      });
    </script>



</body>

</html>