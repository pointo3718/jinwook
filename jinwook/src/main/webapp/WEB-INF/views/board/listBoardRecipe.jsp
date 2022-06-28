<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
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
    <title>레시피 목록</title>

    <!-- Google Font -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/static/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
*{font-family: 'Noto Sans KR', sans-serif;}

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

.blog {
   padding-top: 50px;
}

.blog__sidebar {
   padding-top: 0px;
}

.list-group {
   padding-top: 0px;
}

.blog__sidebar__item {
   width: 200px;
}
.row{
   display: flex;
    justify-content: center;
    align-items: center;
}
.paging-div {
  padding: 15px 0 5px 10px;
  display: table;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  
#buttons{
    border: 1px solid #7fad39;
	color: #7fad39;  
	}
}
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>    
<script type="text/javascript">
/*<![CDATA[*/

function movePage(uri, queryString) {
   location.href = uri + queryString;
}

/*]]>*/

function fncDeleteRecipe(e) {
	if (!confirm('댓글을 삭제하시겠어요?')) {
		return false;
	}
	
	console.log(e);
	const no = $(e).data("value");
	 $.ajax({
			url : "/board/deleteRecipe/"+no,
			dataType : "json",
			success : function(result){
				if(result != null){
					alert("삭제완료");
					self.location = "/board/getRecipeList";
				}
			}
		
		});
}

function fncgetRecipe(rcpNo) {
    //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    //==> 레시피 리스트에서 레시피 상세로 이동
       self.location = "/board/getRecipe?rcpNo="+rcpNo;
    }

<!-- 레시피 등록하러가기 버튼 이벤트 -->
$(function(){
	$("#addRecipeButton").on("click", function() {
		self.location = "/board/addRecipeView"
	});
});

</script>   
</head>

<body>
    <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
    <!-- Header Section Begin -->

    <!-- Blog Section Begin -->
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-7">
                    <div><button type="submit" class="btn btn-success" id="addRecipeButton">레시피 등록하기</button></div>
                    
                    <div class="row">
                        	<c:set var="i" value="0" />
            					<c:forEach var="recipe" items="${getRecipeList}">
               						<c:set var="i" value="${ i+1 }" />
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
										<img width="300" height="300" style="margin-top:20px;"
											src="/resources/static/${recipe.attach.orgFileName}" alt="..."
											onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'" />
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> ${recipe.rcpDate}</li>
                                    	<li><i class="bi bi-eye"></i> ${recipe.rcpHits}</li>
                                    </ul>
                                     <input type="hidden" value="${recipe.rcpNo}"/>
                                     <button id="recipeDetail" type="button" class="btn btn-dark" data-param="${recipe.rcpNo}" onclick="fncgetRecipe(${recipe.rcpNo})">
                                     ${recipe.rcpTitle}</button>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                    </div>
                </div>
            </div>
        </div>
    <!-- Blog Section End -->
    
	<div class="text-center">
		<!-- PageNavigation Start... -->
			<jsp:include page="../common/pageNavigator_new.jsp" />
	</div>


	<!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->



</body>

</html>