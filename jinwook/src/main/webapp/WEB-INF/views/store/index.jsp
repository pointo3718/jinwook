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
</style>

<script type="text/javascript">

$(function() {
	getStoreListByOrderCount();
});

function getStoreListByOrderCount() {
	
	   var uri = "/store/getStoreListByOrderCount"

	   $.get(uri, function(response) { 
	      
	         var storelistHtmlBody = "";
	         
	         $(response.storeList).each(function(idx,store) {

	        	 storelistHtmlBody += `
	 				<tr>
	 					<th scope="row">\${i}</th>
	 					<td>\${store.storeName}</td>
	 					<td>\${store.storeAddr}</td>
	 					<td></td>
	 				</tr>
	            `;
	         }
	         
	         $(".storeList").html(storelistHtmlBody);
	         //$(".userlisthead").html(blacklistHtmlBody);
	      
	   }, "json");
}

</script>




</head>
<body>

	<!-- Header Begin -->
	<!-- Header End -->

	<!-- Categories Section Begin -->
	<section class="categories" style="margin-top: 15px;">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${path}/resources/static/img/categories/cat-1.jpg">
							<h5>
								<a href="#">Fresh Fruit</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${path}/resources/static/img/categories/cat-2.jpg">
							<h5>
								<a href="#">Dried Fruit</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${path}/resources/static/img/categories/cat-3.jpg">
							<h5>
								<a href="#">Vegetables</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${path}/resources/static/img/categories/cat-4.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="${path}/resources/static/img/categories/cat-5.jpg">
							<h5>
								<a href="#">drink fruits</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Featured Product</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".oranges">Oranges</li>
							<li data-filter=".fresh-meat">Fresh Meat</li>
							<li data-filter=".vegetables">Vegetables</li>
							<li data-filter=".fastfood">Fastfood</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-1.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-2.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-3.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-4.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-5.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-6.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-7.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="${path}/resources/static/img/featured/feature-8.jpg">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${path}/resources/static/img/banner/banner-1.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="${path}/resources/static/img/banner/banner-2.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Latest Products</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-1.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-2.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-3.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a>
							</div>
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-1.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-2.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-3.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Top Rated Products</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-1.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-2.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-3.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a>
							</div>
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-1.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="${path}/resources/static/mg/latest-product/lp-2.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-3.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Review Products</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-1.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-2.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-3.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a>
							</div>
							<div class="latest-prdouct__slider__item">
								<a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-1.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-2.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a> <a href="#" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img
											src="${path}/resources/static/img/latest-product/lp-3.jpg"
											alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>Crab Pool Security</h6>
										<span>$30.00</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->
	<section class="from-blog spad" style="padding-bottom: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>지도 조회</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="map">

		<div class="row" style="align-items: flex-start;">

			<!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width: 600px; height: 500px; right: 50px"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e53eaf4dd896374cd449da869e2ddcdc"></script>
<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);
			</script>

<div>

	<h3 class="text-left">
		<strong style="font-size: 22px; padding-left: 100px;">진욱이네 상점
			TOP5</strong>
		</hr>
	</h3>

	<table class="table" style="width: 400px; height: 50px;">

		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">상점이름</th>
				<th scope="col">상점주소</th>
				<th scope="col">상점업종</th>
			</tr>
		</thead>

			<tbody class="storeList">

			</tbody>
	</table>
</div>
</div>



</section>

<!-- Blog Section End -->

</body>

</html>