<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>레시피 상세</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
 
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 
<script type="text/javascript">
/*<![CDATA[*/

function movePage(uri, queryString) {
   location.href = uri + queryString;
}

$(function() {
	$("#replyWriteBtn").on("click", function() {
		fncAddRecipeComment();
	});
});

$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddRecipeComment() {
	$("form").attr("method", "POST").attr("action", "/board/addRecipeComment").submit();
}

/*]]>*/
<!-- 레시피 추천 -->
function updateRecipeReco() {
var rcpNo = ${recipe.rcpNo};
	$.ajax({
		type : "POST",
		url : "updateRecipeReco",
		dataType : "json",
		data : {'rcpNo' : rcpNo},
		error : function() {
			alert("통신 에러");
		},
		success : function(recoCheck) {
			if (recoCheck == 0) {
				alert("추천 완료!");
				location.reload();
			}
			else if (recoCheck == 2) {
				alert("이미 추천하셨습니다");
				location.reload();
					}
				}
			});
		} 
		
	//===url 공유====//
	function clip() {

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
	
	<!-- 수정 버튼 이벤트 -->
	$(function(){
		
		$("#updateButton").on("click", function() {
			self.location = "/board/updateRecipeView?rcpNo=${recipe.rcpNo}"
		});
	});
	
/* 	$("#replyWriteBtn").on("click", function(){
		  var formObj = $("form[name='replyForm']");
		  formObj.attr("action", "/board/addRecipeComment");
		  formObj.submit();
		}); */
</script>    
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${path}/resources/static/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="${path}/resources/static/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="${path}/resources/static/img/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">Spanis</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="${path}/resources/static/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li class="active"><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container" style="border: 1px solid green;" style="background-color: ivory;">
            <div class="row">
                <div class="col-lg-12" style="background-color: ivory;">
                    <div class="contact__form__title">
                        <h2 style="margin-top:20px;">레시피 상세</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row" style="background-color: ivory;">
                
                <div class="imgborder">
					<img src="https://media.istockphoto.com/photos/kimchi-stir-fried-with-pork-and-vegetables-sprinkle-sesame-seeds-on-picture-id1206518905?b=1&k=20&m=1206518905&s=170667a&w=0&h=9qzoXifvJg_E220JqkrDKmdWbGcSoOA47jz-gFMlFl0="
						alt="My Image" width="400" height="400" style="margin-left:20px;">
						<div class="form-group">
						
 				<c:forEach var="file" items="${file}">
 				<input type="hidden" id="attach_no" name="attach_no" value="">
 					<a href="#" onclick="fn_fileDown('${attach.attachNo}'); return false;">${attach.orgFileName}</a>(${attach.fileSize})<br>
 					<img attachNo="${ attach.attachNo }" width="400" height="400" src="../static/img/${attach.orgFileName}" alt="..." 
               onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"/>
 				</c:forEach>
 				
 						</div>
				</div>
                
                    <div class="col-sm-4 col-sm-4" style="width:100px; height:50px;">
                        <input type="text" readonly="readonly" value="${recipe.rcpTitle}">
                    </div>
                    <div class="col-sm-4 col-sm-4">
                        <i class="bi bi-eye"></i> ${recipe.rcpHits}<br/>
 						<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${recipe.rcpDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						<button type="button" class="btn btn-success" id="reco_btn" 
 						style="width:50px; height:30px; background-color: green; font-size: 12px;" onclick="updateRecipeReco();"><i class="bi bi-hand-thumbs-up"></i>${recipe.recommendCount}</button>
 						<a href="#" onclick="clip(); return false;"><i class="bi bi-paperclip"></i></a>
                    </div>
 						<br/><br/><br/>
                    
                    <div class="col-lg-12 text-center">
                    	<textarea readonly="readonly">${recipe.rcpInfo}</textarea>
                    </div>
                    
                    <div class="col-lg-12 text-center">
                    	<textarea readonly="readonly">${recipe.rcpIngredient}</textarea>
                    </div>
                    
                    <div class="col-lg-12 text-center">
                        <textarea readonly="readonly">${recipe.rcpContent}</textarea>
                        <button type="button" class="btn btn-success" id="updateButton">수 &nbsp;정</button>
                    </div>

					<!-- 댓글 작성폼 start -->
					<div class="card mb-2" style="margin-left:20px;">
						<!-- 댓글 헤더 -->
						<div class="card-header bg-light">
							<i class="fa fa-comment fa"></i> 댓글
						</div>
					<form name="replyForm" method="post" action="addRecipeComment">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<input type="hidden" id="rcpNo" name="rcpNo" value="${recipe.rcpNo}"/>
									<div class="form-inline mb-2">
										<label for="commentWriter"><i class="fa fa-user-circle-o fa-2x"></i></label> 
										<input type="text" class="form-control ml-2" id="commentWriter" name="commentWriter"> 
									</div> 
									<textarea class="form-control" id="commentContent" name="commentContent" rows="3"></textarea>
									<button type="submit" class="btn btn-dark mt-3" id="replyWriteBtn">댓글 작성</button>
								</li>
							</ul>
						</div>
					</div>
					</form>
					<!-- 댓글 작성폼 end -->
					
					<!-- 댓글 조회 폼 start -->
					<div class="card">
						<div class="card-header">댓글 리스트</div>
							<ul id="comment" class="commentList">
								<c:forEach items="${commentList}" var="recipe">
									<li id="comment--1" class="list-group-item d-flex justify-content-between">
										<div>${recipe.comment.commentContent}</div>
										<div class="d-flex">
											<div class="font-itatlic">작성자 :${recipe.comment.commentWriter} &nbsp;</div>
											<button class="badge">삭제</button>
										</div>
									</li>
								</c:forEach>
							</ul>
					</div>
					<!-- 댓글 조회 폼 end -->
					
					<%-- <!-- 댓글 작성 폼 start -->
					<form name="replyForm" method="post" action="addRecipeComment">
						<input type="hidden" id="rcpNo" name="rcpNo" value="${recipe.rcpNo}"/>

						<div>
							<label for="commentWriter">댓글 작성자</label>
							<input type="text" id="commentWriter" name="commentWriter" /> <br /> 
							<label for="content">댓글 내용</label><input type="text" id="commentContent" name="commentContent"/>
						</div>
						<div>
							<button type="submit" class="replyWriteBtn" id="replyWriteBtn">작성</button>
						</div>
					</form>
					<!-- 댓글 작성 폼 end --> --%>
					
					

			</div>
        </div>
    </div>
    <!-- Contact Form End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="${path}/resources/static/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="${path}/resources/static/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${path}/resources/static/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/static/js/bootstrap.min.js"></script>
    <script src="${path}/resources/static/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/static/js/jquery-ui.min.js"></script>
    <script src="${path}/resources/static/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/static/js/mixitup.min.js"></script>
    <script src="${path}/resources/static/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/static/js/main.js"></script>



</body>

</html>