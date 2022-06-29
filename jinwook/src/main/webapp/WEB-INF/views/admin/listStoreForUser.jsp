<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상점 목록</title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">	

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.row{
   display: flex;
    justify-content: center;
	align-items: flex-start;
}
</style>
<body>

	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->
	
	
	 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${path}/resources/static/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                    
                       <c:if test="${param.storeType eq '정육'}">
                        <h2>정육 코너</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">진욱이네서만 즐길 수 있는 싱싱한 고기</a>
                        </div>
                        </c:if>
                         <c:if test="${param.storeType eq '수산'}">
                        <h2>수산 코너</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">진욱이네서만 즐길 수 있는 싱싱한 수산물</a>
                        </div>
                        </c:if>
                         <c:if test="${param.storeType eq '채소'}">
                        <h2>채소 코너</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">진욱이네서만 즐길 수 있는 싱싱한 채소</a>
                        </div>
                        </c:if>
                         <c:if test="${param.storeType eq '과일'}">
                        <h2>과일 코너</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">진욱이네서만 즐길 수 있는 싱싱한 과일</a>
                        </div>
                        </c:if>
                         <c:if test="${param.storeType eq '종합'}">
                        <h2>종합 코너</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">진욱이네서만 즐길 수 있는 다양한 식료품</a>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    	<div class="row">
                  <img src="${path}/resources/static/img/banner/선경이네.png" alt="" style="height: 120px;">
               </div>
    

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                
                <c:set var="i" value="0" />
				<c:forEach var="store" items="${storeList}">
					<c:set var="store" value="${store}" />
					<c:set var="i" value="${ i+1 }" />
             
                 <div class="col-lg-4">
                     <div class="blog__item">
                         <div class="blog__item__pic">
		                     <img
		                     src="/resources/static/${store.attach.orgFileName}"
		                        onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"
		                     alt="My Image" width="300" height="300" style="border-radius:50px">
                         </div>
                         <div class="blog__item__text">
                             <ul>
                                 <li><i class="fa fa-calendar-o"></i>${store.orders.reviewStar}</li>
                                 <c:if test="${store.open == true }">
                                 <li><i class="fa fa-comment-o"></i>운영중</li>
                                 </c:if>
                                 <c:if test="${store.open == false }">
                                 <li><i class="fa fa-comment-o"></i>운영종료</li>
                                 </c:if>
                             </ul>
                             <h5><a href="#">${store.storeName}</a></h5>
                             <p>${store.storeIntro} </p>
                             <a href="/store/getStore?storeNo=${store.storeNo}" class="blog__btn"><strong>구경하기</strong> <span class="arrow_right"></span></a>
                         </div>
                    </div>
                </div>
                </c:forEach>

            </div>
        </div>
    </section>
    <!-- Blog Section End -->
	
	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->

</body>
</html>