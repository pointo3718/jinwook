<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<html lang="ko">   
<style>
*{font-family: 'Noto Sans KR', sans-serif;}

.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  background: #ffffff;
  z-index: 10;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}

<<<<<<< HEAD
	.dropdown-toggle::after { transition: transform 0.15s linear;}
	.show.dropdown .dropdown-toggle::after {transform: translateY(3px);}
	.dropdown-menu {margin-top: 0;} /* hover 메뉴때문에 넣음 */
</style> 
<!-- Page Preloder -->
=======
.dropdown-toggle::after { transition: transform 0.15s linear;}
.show.dropdown .dropdown-toggle::after {transform: translateY(3px);}
.dropdown-menu {margin-top: 0;} /* hover 메뉴때문에 넣음 */
   
a{
   color: #7fad39;
}
   
.row.navbar{
    display: flex;
      justify-content: center;
   align-items: center;
}
>>>>>>> refs/remotes/origin/master

</style> 

   <!-- Humberger Begin -->
   <div class="humberger__menu__overlay"></div>
   <div class="humberger__menu__wrapper">
      <div class="humberger__menu__logo ">
         <a href="#" ><img src="${path}/resources/static/img/logo.png"
            alt="" ></a>
      </div>
      <div class="humberger__menu__cart">
         <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="/orders/getOrdersCartList"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
         </ul>
         <div class="header__cart__price">
            item: <span>$150.00</span>
         </div>
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
            <li class="active"><a href="index">Home</a></li>
            <li><a href="./shop-grid.html">Shop</a></li>
            <li><a href="#">Pages</a>
               <ul class="header__menu__dropdown">
                  <li><a href="./shop-details.html">Shop Details</a></li>
                  <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                  <li><a href="./checkout.html">Check Out</a></li>
                  <li><a href="./blog-details.html">Blog Details</a></li>
               </ul></li>
            <li><a href="/admin/blog">마이페이지</a></li>
            <li><a href="./contact.html">Contact</a></li>
         </ul>
      </nav>
      <div id="mobile-menu-wrap"></div>
      <div class="header__top__right__social">
         <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
            class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
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
      <div class="header__top" style="height: 30px; background: #7fad39">
         <div class="container">
            <div class="row" >
            <div class="col-lg-3"></div>
               <div class="col-lg-6">
                  <div class="header__top__left text-center" style="padding-top:5px; margin-bottom:5px; font-size: 13px; color: white">
                     진욱이네가 당신의 처음을 응원합니다! &nbsp;>
                  </div>
               </div>
               <div class="col-lg-3">
                  
               </div>
            </div>
         </div>
      </div>
      <div class="sub_header" style="height: 50px;">
         <div class="container">
            <div class="row">
            <div class="col-lg-3">
               <div class="header__top__left text-left">
               <c:if test="${sessionScope.user.role=='사용자'||sessionScope.user.role=='사장님'}">
               <button type="button" class="btn btn-outline-success" style="color: #7fad39; border-color: #7fad39" onclick="javascript:void(0);"> 픽업안내 > </button>
               </c:if>
                  </div>
            </div>
            <div class="col-lg-6">
            
            </div>
            <div class="col-lg-3">
               <div class="header__top__right text-right">
                  <div class="header__top__right__auth" style="display:flex;">
                  <c:if test="${user == null}">
                        <a href="/user/login" style="word-break: break-all; margin-right:20px;"><i class="fa fa-sign-in" aria-hidden="true"></i>로그인&nbsp;</a>
                        <a href="/user/addUser">회원가입 <i class="fa fa-user" aria-hidden="true"></i></a>
                  </c:if>
                  <c:if test="${user != null}">
                  <c:if test="${sessionScope.user.role == '사용자'}">
                 <div class="dropdown">
                        <a href="/admin/blog" style="word-break: break-all; margin-right:20px;" class="dropdown-toggle" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-star" aria-hidden="true"></i >${sessionScope.user.grade } ${sessionScope.user.nickName } 님</a>
<<<<<<< HEAD
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" >
					    <a class="dropdown-item" href="/user/login">마이페이지</a>
					    <a class="dropdown-item" href="#">xx action</a>
					    <a class="dropdown-item" href="#">xx else here</a>
					  </div>
					    </div>
=======
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                   <a class="dropdown-item" href="/user/login">마이페이지</a>
                   <a class="dropdown-item" href="#">xx action</a>
                   <a class="dropdown-item" href="#">xx else here</a>
                 </div>
                   </div>
>>>>>>> refs/remotes/origin/master
                  </c:if>
                  <c:if test="${sessionScope.user.role == '사장님'}">
                 <div class="dropdown">
                        <a href="/admin/blog" style="word-break: break-all; margin-right:20px;" class="dropdown-toggle" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i >${sessionScope.user.userName } 사장님</a>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                   <a class="dropdown-item" href="/admin/blog">사장님페이지</a>
                   <a class="dropdown-item" href="#">xx action</a>
                   <a class="dropdown-item" href="#">xx else here</a>
                 </div>
                   </div>
                  </c:if>
                  <c:if test="${sessionScope.user.role == '관리자'}">
                 <div class="dropdown">
                        <a href="/admin/blog" style="word-break: break-all; margin-right:20px;" class="dropdown-toggle" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-heart" aria-hidden="true"></i >${sessionScope.user.userName } 관리자님</a>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                   <a class="dropdown-item" href="/user/login">관리자페이지</a>
                   <a class="dropdown-item" href="#">xx action</a>
                   <a class="dropdown-item" href="#">xx else here</a>
                 </div>
                   </div>
                  </c:if>
                        <a href="/user/logout">로그아웃  <i class="fa fa-sign-out" aria-hidden="true"></i></a>
                  </c:if>
                     </div>
               </div>
            </div>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="row">
            <div class="col-lg-3" >
               <div class="header__logo">
                  <a href="/"><img
                     src="${path}/resources/static/img/logo.png" alt="" style="width: 200px"></a>
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
  <div>
   <section class="hero hero-normal sticky" style="padding-bottom: 0px; margin-top: 0px; height: 80px;">
      <div class="container" style="top: 0;">
         <div class="row navbar">
            <div class="col-lg-3">
               <div class="hero__categories">
                  <div class="hero__categories__all">
                     <i class="fa fa-bars"></i> <span style="font-size: small;">전체 카테고리</span>
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
            <div class="col-lg-5" style="top: 10px;">
            <nav class="header__menu" style="padding-top: 0px; padding-bottom: 15px; position:sticky;">
                  <ul>
                     
                     <li><a href="./shop-grid.html">Shop</a></li>
                     <li><a href="#">Pages</a>
                        <ul class="header__menu__dropdown">
                           <li><a href="/store/addStoreProduct?storeNo=10000">Shop Details</a></li>
                           <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                           <li><a href="./checkout.html">Check Out</a></li>
                           <li><a href="./blog-details.html">Blog Details</a></li>
                        </ul></li>
                     <li class="active"><a href="/admin/blog">마이페이지</a></li>
                     <li><a href="./contact.html">Contact</a></li>
                  </ul>
               </nav>
            </div>
            
            <div class="col-lg-2">
            
               <div class="hero__search" style="width: 200px;">
                  <div class="hero__search__form" style="width: 232px; bottom: 5px">
                     <form action="#" style="width: 230px; font-size: small; ">
                        
                        <input type="text" style="font-size: x-small;" placeholder="재료를 검색해보세요!">
                        <button type="submit" class="site-btn" style="width: 80px; font-size: x-small; left:120px;">검색</button>
                     </form>
                  </div>
               </div>
            </div>
            
            <div class="col-lg-2" style="bottom: 15px; right: 15px;">
               <div class="header__cart" style="padding-bottom: 0px; margin-top: 10px">
                  <ul>
                     <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>&nbsp;&nbsp;
                     <li><a href="/orders/getOrdersCartList"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Hero Section End -->   
      