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
 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
   
   .modal-header{
  	text-align: center;
  	}
  
  .buttonType{
 	border: 1px solid #7fad39;
    cursor:pointer; cursor:hand;
  	background-color: #7fad39;
  	color: white;
  	padding: 6px;
  	border-radius: 1em;
  	}
  	
</style>

<script type="text/javascript">
/*<![CDATA[*/

function movePage(uri, queryString) {
   location.href = uri + queryString;
}

///// 레시피 신고 등록 시작 /////
$(function() {
   $( "#addComplain:contains('신고하기')" ).on("click" , function() {
      fncAddComplain();
   });
});

function fncAddComplain(){
//Form 유효성 검증

document.detailForm.action='/admin/addComplainRecipe';
document.detailForm.submit();

swal("진욱이네","신고가 등록되었습니다.");

}
///// 레시피 신고 등록 끝 /////


<!-- 레시피 댓글 리스트 불러오는 함수 -->
$(document).on(function(){
	getCommentList();
});

<!-- 레시피 댓글 리스트 함수 -->
function getCommentList() {
	var commentUrl = "/board/commentList/";
	var rcpNo = $('#rcpNo').val();
		
	$.ajax({
		url: commentUrl+rcpNo,
		type: 'POST',
		dataType: 'json',
		success : function(result) {
			var comments = "";
			if(result.length<1) {
				comments = "등록된 댓글이 없습니다.";
			}else {
				$(result).each(function(){
					comments += '<br/>';
					comments += '<strong>';
					comments += '작성자 : '+this.commentWriter;
					comments += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;';
					comments += '작성 날짜 : '+this.commentDate;
					comments += '<br/> <p>';
					comments += '댓글 내용 : &nbsp;&nbsp;&nbsp;';
					comments += this.commentContent;
					comments += '</p>';
					comments += '<br/>';
					comments += '<button type="button" class="btn btn-outline-success" id="replyupdateBtn"';
					comments += 'data-rno='+this.commentNo+'>'
					comments += '댓글수정';
					comments += '</button>';
					comments += '<br/>';
				});
			}
				$("#replylist").html(comments);
		}
	});
}

<!-- 레시피 댓글 수정 버튼 이벤트 -->
function fncUpdateBtn(commentNo, commentContent) {
	console.log("들어옴?");
	var updateUrl = "/board/commentUpdate/";
	var commentContent = $("#commentContentInfo").val(); //어디서 불러와?
	
	$.ajax({
		url: updateUrl+commentNo+'/'+commentContent,
		type: 'POST',
		dataType: 'json',
		success: function(result) {
			getCommentList();//답변 리스트?
		}
		, error: function(error) {
			swal("진욱이네","에러 : "+error);
		}
	});
};

//삭제 버튼 클릭 
$("#btnDelete").click(function(){
    // 댓글이 존재하는 게시물의 삭제처리 방지
    var count = "${count}";
    // 댓글의 수가 0보다 크면 팝업, 함수 종료
    if(count > 0) {
        alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
        return;
    }
    // 댓글의 수가 0이면 삭제처리
    if(confirm("삭제하시겠습니까?")){
        document.form1.action = "${path}/board/delete.do";
        document.form1.submit();
        }
});


<!-- 레시피 게시물 삭제 -->
function fncDeleteRecipe(e) {
	if (!confirm('레시피를 삭제하시겠어요?')) {
		return false;
	}
	
	console.log(e);
	const no = $(e).data("value");
	 $.ajax({
			url : "/board/deleteRecipe/"+no,
			dataType : "json",
			success : function(result){
				if(result != null){
					swal("진욱이네","레시피 삭제가 완료되었습니다.");
					self.location = "/board/getRecipeList";
				}
			}
		
		});
}

<!-- 레시피 댓글 삭제 -->
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
					swal("진욱이네","댓글 삭제가 완료되었습니다.");
					self.location = "/board/getRecipe?rcpNo=${recipe.rcpNo}";
				}
			}
		
		});
	
}

<!-- 레시피 댓글 등록 버튼 이벤트 -->
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
			swal("진욱이네","로그인 후 이용해주세요.");
		},
		success : function(recoCheck) {
			if (recoCheck == 0) {
				swal("진욱이네","추천 완료!");
				location.reload();
			}
			else if (recoCheck == 2) {
				swal("진욱이네","이미 추천하셨습니다..");
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

	<!-- 신고하기 Modal Begin -->
	<div class="modal fade" id="complainModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="font-size: 15px;">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"><strong>신고사유</strong></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <div class="container">
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;신고 사유를 선택해주세요.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;관리자의 확인절차에 따라 해당 회원이 블랙리스트로 지정됩니다.
                  </div>
                  
          </div>
          <hr>
	         <form name="detailForm" method="post" enctype="multipart/form-data">
	         <input type="hidden" name="rcpNo" value="${param.rcpNo}">	         	        
	         <input type="hidden" name="userId" value="${sessionScope.user.userId}">	         	        
	         <input type="hidden" name="complainId" value="${recipe.userId}">	         	        
	        <div style="margin-left: 30px; font-size: 18px;">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="blackPeriod" value="욕설" checked> <label
							class="form-check-label" for="exampleRadios1"> 욕설 </label>
					</div>
					<br/>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="exampleRadios2" value="비방"> <label
							class="form-check-label" for="exampleRadios2"> 비방 </label>
					</div>
					<br/>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="exampleRadios1" value="도배"> <label
							class="form-check-label" for="exampleRadios1"> 도배 </label>
					</div>
					<br/>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="exampleRadios1" value="음란성"> <label
							class="form-check-label" for="exampleRadios1"> 음란성 </label>
					</div>
					<br/>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="exampleRadios1" value="불법도용"> <label
							class="form-check-label" for="exampleRadios1"> 불법도용 </label>
					</div>
					<br/>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="exampleRadios1" value="광고성"> <label
							class="form-check-label" for="exampleRadios1"> 광고성 </label>
					</div>
					<br/>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="complainCode"
							id="exampleRadios1" value="기타"> <label
							class="form-check-label" for="exampleRadios1"> 기타 </label>
					</div>
					<br/>				
				</div>
				</form>
			</div>
	      
	      <div class="modal-footer" >
	        <button type="button" id="addComplain" class="btn btn-primary" style="background-color: #7fad39; margin-right:200px; border-color: #7fad39;">신고하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 신고하기 Modal End -->



    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container" style="background-color: #F2F2F2;">
            <div class="row rcp" >
                <div class="col-lg-12" style="background-color: #F2F2F2; text-align: center;">
                    <div class="contact__form__title">
                        <h3 style="margin-top:20px;"><input class="form-control" type="text" readonly="readonly" value="${recipe.rcpTitle}" style="width:500px; height:100px; text-align:center; background-color: #ffffff;  margin-left:300px;"></h3>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row rcp" style="background-color: #F2F2F2;">
                
                <div class="imgborder">
					<!-- <img src="https://media.istockphoto.com/photos/kimchi-stir-fried-with-pork-and-vegetables-sprinkle-sesame-seeds-on-picture-id1206518905?b=1&k=20&m=1206518905&s=170667a&w=0&h=9qzoXifvJg_E220JqkrDKmdWbGcSoOA47jz-gFMlFl0="
						alt="..." width="400" height="400" style="margin-left:20px;"> -->
						 <img width="400" height="400"
						src="/resources/static/${attach.orgFileName}" alt="..."
						onerror="this.src='https://dummyimage.com/280x250/1af0d4/000000.gif'" />
				</div>
                
                    <div class="col-sm-4 col-sm-4" style="width:100px; height:50px;">
                       <i class="bi bi-eye"></i> ${recipe.rcpHits}<br/>
 						<i class="fa fa-calendar-o"></i> <fmt:formatDate value="${recipe.rcpDate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 						<br/>
 						<button type="button" class="btn btn-success" id="reco_btn" 
 						style="width:50px; height:30px; background-color: green; font-size: 12px;" onclick="updateRecipeReco();"><i class="bi bi-hand-thumbs-up"></i>${recipe.recommendCount}</button>
 						&nbsp;<a href="#" onclick="clip(); return false;"><i class="bi bi-share-fill"></i></a>
 						<br/>
 						<br/><a type="button" class="badge badge-danger" data-toggle="modal" data-target="#complainModal" style="font-size:15px;">신고하기</a> 
                    </div>
                   
 					
                    
                    <div class="col-lg-12 text-center">
                    	<textarea readonly="readonly" style="margin-top: 50px;">${recipe.rcpInfo}</textarea>
                    </div>
                    
                    <div class="col-lg-12 text-center">
                    	<textarea readonly="readonly">${recipe.rcpIngredient}</textarea>
                    </div>
                    
                    <div class="col-lg-12 text-center">
                        <textarea readonly="readonly">${recipe.rcpContent}</textarea>
                        <button type="button" class="btn btn-success" id="updateButton">수 정</button>&nbsp;
                        <button data-value="${recipe.rcpNo}" id="buttons" type="button" class="btn btn-danger" onClick="fncDeleteRecipe(this)">삭 제</button>
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
											<div class="font-itatlic">작성자 :${recipe.comment.commentWriter} | &nbsp;</div><br/>
										<!-- 댓글 리스트 div -->
										<div class="d-flex">
											<div class="commentContentInfo">${recipe.comment.commentContent}</div>&nbsp;&nbsp;&nbsp;
											
											<%-- <button type="button" class="btn btn-outline-success" id="replyupdateBtn" data-rno="${recipe.comment.commentNo}" onclick="fncUpdateBtn();">댓글 수정</button> --%>
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