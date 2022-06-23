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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
 
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 

<style>
 div.replyModal { position:relative; z-index:1; display:none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 
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
</style>

<script type="text/javascript">
/*<![CDATA[*/

function movePage(uri, queryString) {
   location.href = uri + queryString;
}

<!-- 댓글 수정 모달창 -->
<!-- 댓글 수정 모달창 end-->

/* function fncUpdateRecipeComment(e) {

    console.log(e);

    const commentNo = $(e).data("value");

    var commentContent = $("div[id='commentContent']").val();

    $.ajax({
       url : "updateRecipeComment/" + commentNo + "/" + commentContent,
       dataType : "json",
       method : "POST",
       data : {

       },
       success : function(result) {
          if (result != null) {
             alert("댓글 수정이 완료되었습니다.");
             self.location = "getRecipe?commentNo=" + commentNo;
          }
       }

    });

 } */

function fncDeleteRecipeComment(e) {
	if (!confirm('댓글을 삭제하시겠어요?')) {
		return false;
	}
	
	console.log(e);
	const no = $(e).data("value");
	 $.ajax({
			url : "/board/deleteRecipeComment/"+no,
			dataType : "json",
			success : function(result){
				if(result != null){
					alert("삭제완료");
					self.location = "/board/getRecipe?rcpNo=${recipe.rcpNo}";
				}
			}
		
		});
	
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
	
	 var commentContent = $("textarea[id='commentContent']").val();

	    if (commentContent == null || commentContent.length < 1) {
	       alert("댓글내용을 반드시 입력하여야 합니다.");
	       return;
	    }
	
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
    <!-- Header Begin -->
   <jsp:include page="../layout/top.jsp" />
    <!-- Header Section Begin -->


    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container" style="background-color: #F2F2F2;">
            <div class="row rcp">
                <div class="col-lg-12" style="background-color: #F2F2F2;">
                    <div class="contact__form__title">
                        <h2 style="margin-top:20px;"><input type="text" readonly="readonly" value="${orders.reviewTitle}" style="text-align:center;"></h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row rcp" style="background-color: #F2F2F2;">
                
                <div class="imgborder">
					<img src="https://media.istockphoto.com/photos/kimchi-stir-fried-with-pork-and-vegetables-sprinkle-sesame-seeds-on-picture-id1206518905?b=1&k=20&m=1206518905&s=170667a&w=0&h=9qzoXifvJg_E220JqkrDKmdWbGcSoOA47jz-gFMlFl0="
						alt="My Image" width="400" height="400" style="margin-left:20px;">
						<div class="form-group">
						
						<img width="400" height="400"
											src="/resources/static/${recipe.attach.orgFileName}" alt="..."
											onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'" />
						
 				<%-- <c:forEach var="file" items="${file}">
 				<input type="hidden" id="attach_no" name="attach_no" value="">
 					<a href="#" onclick="fn_fileDown('${attach.attachNo}'); return false;">${attach.orgFileName}</a>(${attach.fileSize})<br>
 					<img attachNo="${ attach.attachNo }" width="400" height="400" src="/resources/static/${attach.orgFileName}" alt="..." 
               onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'"/>
 				</c:forEach> --%>
 				
 						</div>
				</div>
                
                    <div class="col-sm-4 col-sm-4" style="width:100px; height:50px;">
                        
                    </div>
                    <div class="col-sm-4 col-sm-4">
                        <i class="bi bi-eye"></i> ${recipe.rcpHits}<br/>
 						<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${orders.reviewDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						<button type="button" class="btn btn-success" id="reco_btn" 
 						style="width:50px; height:30px; background-color: green; font-size: 12px;" onclick="updateRecipeReco();"><i class="bi bi-hand-thumbs-up"></i>${recipe.recommendCount}</button>
 						&nbsp;<a href="#" onclick="clip(); return false;"><i class="bi bi-share-fill"></i></a>
                    </div>
 						<br/><br/><br/>
                    
                    <div class="col-lg-12 text-center">
                        <textarea readonly="readonly">${orders.reviewContent}</textarea>
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
					
					<!-- 댓글 리스트 조회 폼 start -->
					<div class="card">
						<div class="card-header">댓글 리스트</div>
							<ul id="comment" class="commentList">
								<c:forEach items="${commentList}" var="recipe">
									<li id="comment--1" class="list-group-item d-flex justify-content-between">
											<div class="font-itatlic">작성자 :${recipe.comment.commentWriter} | &nbsp;</div>
											<br/>
										<div class="d-flex">
										<div>${recipe.comment.commentContent}</div>&nbsp;&nbsp;&nbsp;
											<%-- <button type="button" id="button" class="btn btn-outline-success"
                        					data-value="${recipe.comment.commentNo}" onClick="fncUpdateRecipeComment(this)">수정</button>&nbsp;&nbsp;&nbsp; --%>
											
											<button data-value="${recipe.comment.commentNo}" id="buttons" type="button" class="btn btn-primary" 
											onClick="fncDeleteRecipeComment(this)">X</button>
										</div>
									</li>
								</c:forEach>
							</ul>
					</div>
					<!-- 댓글 조회 폼 end -->

			<!-- 댓글 수정 모달창 start -->
			
			<!-- 댓글 수정 모달창 end -->



				</div>
			</div>
		</div>
    <!-- Contact Form End -->

    <!-- Footer Section Begin -->
    <!--  Footer Begin -->
   <jsp:include page="../layout/footer.jsp" />
   <!-- Footer End -->



</body>

</html>