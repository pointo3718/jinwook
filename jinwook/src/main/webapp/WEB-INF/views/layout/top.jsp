<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<html lang="ko">
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

.dropdown:hover .dropdown-menu {
   display: block;
   margin-top: 0;
}

.dropdown-toggle::after {
   transition: transform 0.15s linear;
}

.show.dropdown .dropdown-toggle::after {
   transform: translateY(3px);
}

.dropdown-menu {
   margin-top: 0;
} /* hover 메뉴때문에 넣음 */
.row.navbar {
   display: flex;
   justify-content: center;
   align-items: center;
}
</style>



<!-- Header Section Begin -->
<header class="header">
   <div class="header__top" style="height: 30px; background: #7fad39">
      <div class="container">
         <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
               <div class="header__top__left text-center"
                  style="padding-top: 5px; margin-left: 20px; margin-bottom: 5px; font-size: 13px; color: white">
                  진욱이가 당신의 처음을 응원합니다! &nbsp;></div>
            </div>
            <div class="col-lg-3"></div>
         </div>
      </div>
   </div>
   <div class="sub_header" style="height: 50px;">
      <div class="container">
         <div class="row">
            <div class="col-lg-3">
               <div class="header__top__left text-left">
                  <c:if
                     test="${sessionScope.user.role=='사용자'||sessionScope.user.role=='사장님'}">
                     <button type="button" class="btn btn-outline-success"
                        style="color: #7fad39; border-color: #7fad39"
                        onclick="javascript:void(0);">픽업안내 ></button>
                  </c:if>
               </div>
            </div>
            <div class="col-lg-6"></div>
            <div class="col-lg-3">
               <div class="header__top__right text-right">
                  <div class="header__top__right__auth" style="display: flex;">
                     <c:if test="${user == null}">
                        <a href="/user/login"
                           style="word-break: break-all; margin-right: 20px;"><i
                           class="fa fa-sign-in" aria-hidden="true"></i>로그인&nbsp;</a>
                        <a href="/user/addUserSelec">회원가입 <i class="fa fa-user"
                           aria-hidden="true"></i></a>
                     </c:if>
                     <c:if test="${user != null}">
                        <c:if test="${sessionScope.user.role == '사용자'}">
                           <div class="dropdown">
                              <a href="/admin/blog"
                                 style="word-break: break-all; margin-right: 20px;"
                                 class="dropdown-toggle" role="button" id="dropdownMenuLink"
                                 data-toggle="dropdown" aria-expanded="false"><i
                                 class="fa fa-star" aria-hidden="true"></i>${sessionScope.user.grade }
                                 ${sessionScope.user.nickName } 님</a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                 <a class="dropdown-item" href="/orders/getOrdersList">마이페이지</a>
                                 <a class="dropdown-item" href="/orders/getOrdersList">주문내역</a>
                                 <a class="dropdown-item"
                                    href="/user/confirmPasswordView?userId=${sessionScope.user.userId}">개인정보</a>
                                 <a class="dropdown-item" href="/board/getBoardInquiryList">1:1문의</a>
                                 <a class="dropdown-item"
                                    href="/board/getBoardAnnouncementList">공지사항</a> <a
                                    class="dropdown-item"
                                    href="/user/myArticle?userId=${sessionScope.user.userId }">작성한글</a>
                                 <a class="dropdown-item" href="#"></a> <a
                                    class="dropdown-item" href="/user/logout">로그아웃</a>
                              </div>
                           </div>
                        </c:if>
                        <c:if test="${sessionScope.user.role == '사장님'}">
                           <c:if test="${sessionScope.user.storeYn == true}">
                              <input type="hidden" name="userId" id="userId"
                                 value=${sessionScope.user.userId }>
                              <div class="dropdown">
                                 <a href="/admin/blog"
                                    style="word-break: break-all; margin-right: 20px;"
                                    class="dropdown-toggle" role="button" id="dropdownMenuLink"
                                    data-toggle="dropdown" aria-expanded="false"><i
                                    class="fa fa-thumbs-o-up" aria-hidden="true"></i>${sessionScope.user.userName }
                                    사장님</a>

                                 <div class="getStoreNoNo" name="getStoreNoNo"
                                    id="getStoreNoNo"></div>
                              </div>
                           </c:if>

                           <c:if test="${sessionScope.user.storeYn == false}">

                              <div class="dropdown">
                                 <a href="/admin/blog"
                                    style="word-break: break-all; margin-right: 20px;"
                                    class="dropdown-toggle" role="button" id="dropdownMenuLink"
                                    data-toggle="dropdown" aria-expanded="false"><i
                                    class="fa fa-heart" aria-hidden="true"></i>${sessionScope.user.userName }
                                    사장님</a>
                                 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="/store/storeNo">사장님페이지</a> <a
                                       class="dropdown-item"
                                       href="/user/confirmPasswordView?userId=${sessionScope.user.userId}">개인정보수정</a>
                                    <a class="dropdown-item" href="/board/getBoardInquiryList">1:1
                                       문의내역</a>
                                 </div>
                              </div>
                           </c:if>

                        </c:if>



                        <c:if test="${sessionScope.user.role == '관리자'}">
                           <div class="dropdown">
                              <a href="/admin/blog"
                                 style="word-break: break-all; margin-right: 20px;"
                                 class="dropdown-toggle" role="button" id="dropdownMenuLink"
                                 data-toggle="dropdown" aria-expanded="false"><i
                                 class="fa fa-heart" aria-hidden="true"></i>${sessionScope.user.userName }
                                 관리자님</a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                 <a class="dropdown-item" href="/user/login">관리자페이지</a> <a
                                    class="dropdown-item" href="/admin/blog">회원 목록</a> <a
                                    class="dropdown-item" href="/admin/listStoreAdmin">상점 목록</a>
                                 <a class="dropdown-item" href="/admin/listComplainAdmin">신고
                                    접수 목록</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=1">상점 등록
                                    요청</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=2">상점 삭제
                                    요청</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=3">환급 요청</a> <a
                                    class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=4">광고 등록
                                    요청</a><a class="dropdown-item" href="/board/getBoardInquiryList">1:1
                                    문의내역</a> <a class="dropdown-item" href="/admin/chart">통계</a> <a
                                    class="dropdown-item" href="#">로그아웃</a>
                              </div>
                           </div>
                        </c:if>
                        <!-- 카카오 사용자 -->
                        <%--   <c:if test="${sessionScope.access_Token ne null}">
                           <div class="dropdown">
                              <a href="/admin/blog"
                                 style="word-break: break-all; margin-right: 20px;"
                                 class="dropdown-toggle" role="button" id="dropdownMenuLink"
                                 data-toggle="dropdown" aria-expanded="false"><i
                                 class="fa fa-heart" aria-hidden="true"></i>${sessionScope.user.nickName }
                                 님</a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                 <a class="dropdown-item" href="/user/login">관리자페이지</a> <a
                                    class="dropdown-item" href="/admin/blog">회원 목록</a> <a
                                    class="dropdown-item" href="/admin/listStoreAdmin">상점 목록</a>
                                 <a class="dropdown-item" href="/admin/listComplainAdmin">신고
                                    접수 목록</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=1">상점 등록
                                    요청</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=2">상점 삭제
                                    요청</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=3">환급 요청</a> <a
                                    class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=4">광고 등록
                                    요청</a> <a class="dropdown-item"
                                    href="/request/getRequestListForAdmin?reqCode=4">문의 내역</a> <a
                                    class="dropdown-item" href="/user/kakoLogout"></a> <a class="dropdown-item"
                                    href="#">로그아웃</a>
                              </div>
                           </div>
                        </c:if> --%>
                        <c:if test="${sessionScope.access_Token ne null}">
                           <a href="/user/kakaoLogout">Logout <i
                              class="fa fa-sign-out" aria-hidden="true"></i></a>
                        </c:if>
                        <c:if
                           test="${sessionScope.user ne null && sessionScope.access_Token eq null}">
                           <a href="/user/logout">로그아웃 <i class="fa fa-sign-out"
                              aria-hidden="true"></i></a>
                        </c:if>
                     </c:if>
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
               <a href="/"><img src="${path}/resources/static/img/logo.png"
                  alt="" style="width: 200px; margin-left: 27px;"></a>
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
   <section class="hero hero-normal sticky"
      style="padding-bottom: 0px; margin-top: 0px; height: 80px;">
      <div class="container" style="top: 0;">
         <div class="row navbar">
            <div class="col-lg-3">
               <div class="hero__categories">
                  <div class="hero__categories__all">
                     <i class="fa fa-bars"></i> <span style="font-size: small;">전체
                        카테고리</span>
                  </div>
                  <ul>
                     <li><a href="/admin/listStoreForUser?storeType=정육">정육</a></li>
                     <li><a href="/admin/listStoreForUser?storeType=수산">수산</a></li>
                     <li><a href="/admin/listStoreForUser?storeType=채소">채소</a></li>
                     <li><a href="/admin/listStoreForUser?storeType=과일">과일</a></li>
                     <li><a href="/admin/listStoreForUser?storeType=종합">종합</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-7" style="top: 10px;">
               <nav class="header__menu"
                  style="padding-top: 0px; padding-bottom: 15px; position: sticky;">
                  <ul style="margin-left: 60px;">
                     <li><a href="/board/getRecipeList"><span
                           style="font-size: 18px;"> #레시피</span></a></li>
                     <li><a class="scroll_move" href="#scroll1"><span
                           style="font-size: 18px;"> #구경하기</span></a> <!-- <ul class="header__menu__dropdown">
                           <li><a href="/store/addStoreProduct?storeNo=10000">Shop
                                 Details</a></li>
                           <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                           <li><a href="./checkout.html">Check Out</a></li>
                           <li><a href="./blog-details.html">Blog Details</a></li>
                        </ul> --></li>
                     <li><a class="scroll_move" href="#scroll2"><span
                           style="font-size: 18px;"> #화제의 레시피</span></a></li>
                     <li><a class="scroll_move" href="#scroll3"><span
                           style="font-size: 18px;"> #광고</span></a></li>
                  </ul>
               </nav>
            </div>

            <div class="col-lg-2" style="bottom: 15px; right: 50px;">
               <div class="header__cart"
                  style="padding-bottom: 0px; margin-top: 10px">
                  <ul>

                     <li><a href="#" style="top: 1px;"><i
                           style="font-size: 25px;" class="fa fa-heart"></i> <c:if
                              test="${sessionScope.user ne null}">
                              <span class="countorders" style="width: 16px; height: 16px;"></span>
                           </c:if> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>



                     <li><a href="/orders/getOrdersCartList"><i
                           style="font-size: 25px;" class="fa fa-shopping-bag"></i> <c:if
                              test="${sessionScope.user ne null and sessionScope.user.role eq '사용자'}">
                              <span class="countCart" style="width: 16px; height: 16px;"></span>
                           </c:if> </a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Hero Section End -->


   <script type="text/javascript">
   
      $(function() {
            getStoreNo();
         });
      

         function getStoreNo() {
                 
               var userId = $("#userId").val();
            
               var uri = "/store/getStoreNo/"+userId
               

               $.get(uri, function(response) { 
                  
                     var getStoreNoNoHtmlBody = "";
                     
                     $(response.getStoreNo).each(function(idx,store) {              

                        getStoreNoNoHtmlBody += `
 
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item"
                               href="/store/addStoreProduct?storeNo=\${store.storeNo}">사장님페이지</a> <a
                               class="dropdown-item" href="/orders/getOrdersListCeo">주문내역</a> <a
                               class="dropdown-item"
                               href="/store/updateStore?storeNo=\${store.storeNo}">상점정보수정</a> <a
                               class="dropdown-item" href="/user/confirmPasswordViewC?userId=${sessionScope.user.userId}">개인정보수정</a> <a
                               class="dropdown-item"
                               href="/store/addStoreProduct?storeNo=\${store.storeNo}">상품등록</a> <a
                               class="dropdown-item" href="/request/addRequestAd?storeNo=\${store.storeNo}">광고등록</a> <a
                               class="dropdown-item" href="/request/getRequestAdStoreList?storeNo=\${store.storeNo}&userId=${sessionScope.user.userId}">내가 한 요청</a> <a
                               class="dropdown-item"
                               href="/store/getStoreWallet?storeNo=\${store.storeNo}">지갑</a> <a
                               class="dropdown-item" href="/board/getBoardInquiryList">1:1
                               문의</a> <a class="dropdown-item" href="#"></a> <a
                               class="dropdown-item" href="/user/logout">로그아웃</a>
                         </div>

                         
                            
                        `;
                        
                     });
                     
                     
                     $(".getStoreNoNo").html(getStoreNoNoHtmlBody);
                  
               }, "json");

         }   
   
  



////////////////주문내역 카운트 REST 시작   /////////////////

   $(function() {
   countOrders();
   });
   
   function countOrders() {
   
   var uri = "../admin/countOrders";
   
   $.get(uri, function(response) {
   
   
   $(".countorders").text(`\${response.countOrders}`);
   
   }, "json");
   }

////////////////주문내역 카운트 REST 끝   /////////////////


////////////////장바구니 카운트 REST 시작   ////////////////

   $(function() {
   countCart();
   });
   
   function countCart() {
   
   var uri = "../admin/countCart";
   
   $.get(uri, function(response) {
   
   
   $(".countCart").text(`\${response.countCart}`);
   
   }, "json");
   }
   
////////////////장바구니 카운트 REST 끝   /////////////////

//////////////// 스크롤 이동   /////////////////
$(document).ready(function($) {
            $(".scroll_move").click(function(event){
                console.log(".scroll_move");         
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
            });

        }); 

      
   </script>