<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<html lang="ko">

<title>ceoTop</title>

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
   align-items: flex-start
}

.mytop01 {
   padding-left: 20px;
}

.mytop01-content {
   padding-left: 180px;
   color: #6A8F00;
   display: inline;
}

.blog {
   padding-top: 50px;
}

.list-group {
   padding-top: 0px;
}

.blog__sidebar {
   align-items: flex-start;
}

.blog__sidebar__item {
   width: 200px;
   /*  body > div.container{
           border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */ / . row { margin-top : 10px;
   justify-content: center;
   align-items: center;
   text-align: center;
}

.id_ok {
   color: #7fad39;
   display: none;
   font-size: 10px;
}

.id_already {
   color: red;
   display: none;
   font-size: 10px;
   text-align: left;
}

.control-label {
   whidth: 250px;
   text-align: center;
   justify-content: center;
}

.site-btn {
   background-color: #7fad39; /* Green */
   border: none;
   color: white;
   width: 200px;
   text-align: center;
   font-size: 20px;
}

.userId {
   width: 300px;
   text-indent: 1em;
}

.ss {
   font-size: 30px;
   justify-content: center;
}

input {
   width: 300px;
   height: 50px;
   text-indent: 1em;
   font-size: 15px;
}

div {
   justify-content: center;
   text-align: center;
   align-items: center;
}

label {
   font-size: 15px;
   justify-content: top;
   text-align: left;
   display: flex;
   align-items: left;
}

.btn-file {
   position: relative;
   overflow: hidden;
}

.btn-file input[type=file] {
   position: absolute;
   top: 0;
   right: 0;
   min-width: 100%;
   min-height: 100%;
   font-size: 100px;
   text-align: right;
   filter: alpha(opacity = 0);
   opacity: 0;
   outline: none;
   background: white;
   cursor: inherit;
   display: block;
}

.img_wrap {
            width: 300px;
            margin-top: 50px;
        }
.img_wrap img {
            max-width: 100%;
        }
</style>
</head>
<body>


    <!-- 상점 등록 Modal -->
    <div class="modal" id="addRequestStoreModal" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismis style="margin-left: 0px; text-align: center;">상점 등록 요청<s="modal" aria-label="Close">
	        </button>
            </div><div class="container"></div>
            <div class="modal-body">
            
           <div class="container">
					<div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네에 입점하기 위해 상점 정보를 입력해주세요.</div>
					<div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;상점 등록 요청 후, 입점 완료까지 약 7일이 소요됩니다.</div>
					<div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;확인절차에 따라 관리자의 연락이 갈 수 있습니다.</div>
					<div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네는 사장님들의 피드백을 언제나 환영합니다. 입점 등록시 더 추가하고 싶은 사항이 있다면 언제든 요청해주세요.</div>
					<div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;입점 관련 문의 및 요청 사항은 1:1문의/고객센터(1644-0000)로 문의 바랍니다.</div>
			</div>		
			<hr>
            	
					<div class="form-group row">
							
									<label for="colFormLabel"
										class="col-sm-2 col-form-label col-form-label">상점이름</label>
									<div class="col-sm-6">
										<input type="text" name="storeName"
											class="form-control form-control" id="storeName"
											value="" placeholder="상점이름(상호명)을 입력해주세요.">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점업종</label>
									<div class="col-sm-6">
									<select size="5" >
												<option selected>업종을 선택하세요</option>
												<option value="1">정육</option>
												<option value="2">수산</option>
												<option value="3">채소</option>
												<option value="4">과일</option>
												<option value="5">종합</option>
									</select>
<script src="https://www.jqueryscript.net/demo/Mobile-friendly-Custom-Scrollbar-Plugin-With-jQuery-NiceScroll/js/jquery.nicescroll.min.js"></script>

<script>
  $(document).ready(function () {
    $('select').niceSelect();
    $('.nice-select .list').niceScroll();
    
    $('select').niceSelect('update');
    $('.nice-select .list').niceScroll();
    
  });
</script>
									</div>
								</div>
								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점주소</label>
									<div class="col-sm-6">
										<input type="text" name="storeAddr"
											class="form-control form-control" id="storeAddr"
											value="" placeholder="상점 주소를 입력해주세요." >
									</div>
								</div>



								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점시작날짜</label>
									<div class="col-sm-6">
										<input type="text" name="storeStart"
											class="form-control form-control" id="storeStart"
											value="" placeholder="상점시작날짜">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점소개</label>
									<div class="col-sm-6">
										<input type="text" name="storeIntro"
											class="form-control form-control" id="storeIntro"
											value="" placeholder="상점 소개글을 입력해주세요.">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점전화번호</label>
									<div class="col-sm-6">
										<input type="text" name="storePhone"
											class="form-control form-control" id="storePhone"
											value="" placeholder="상점전화번호">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">상점사진</label>
									<div class="col-sm-6">
										<span class="btn btn-default btn-file"
												style="padding-left: 0px; padding-bottom: 15px;">
											<input type="file" id="input_img" />
											<div>
								        		<div class="img_wrap">
								            	<img id="img" />
								       		 </div>
								  			</div>
										</span>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label"
										style="padding-right: 4px;">사업자등록번호</label>
									<div class="col-sm-6">
										<input type="text" name="businessNo"
											class="form-control form-control" id="businessNo"
											value="" placeholder="사업자등록번호"
											readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">영업신고증</label>
									<div class="col-sm-6">
										<span class="btn btn-default btn-file"
												style="padding-left: 0px; padding-bottom: 15px;">
											<input type="file" id="input_img" />
											<div>
								        		<div class="img_wrap">
								            	<img id="img" />
								       		 </div>
								  			</div>
										</span>
									</div>
								</div>
								
								

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">계좌번호</label>
																		
									<div class="col-sm-6" style="padding-left: 0px;">
										<div class="col-sm-6">
										<div class="wrapper">
											<select size="5" >
												
												<option selected>은행명</option>
												<option value="1">카카오뱅크</option>
												<option value="2">농협</option>
												<option value="3">신한</option>
												<option value="4">IBK기업</option>
												<option value="5">하나</option>
												<option value="6">우리</option>
												<option value="7">국민</option>
												<option value="8">SC제일</option>
												<option value="9">대구</option>
												<option value="10">부산</option>
												<option value="11">광주</option>
												<option value="12">새마을금고</option>
												<option value="13">경남</option>
												<option value="14">전북</option>
												<option value="15">제주</option>
												<option value="16">산업</option>
												<option value="17">우체국</option>
												<option value="18">신협</option>
												<option value="19">수협</option>
												<option value="20">씨티</option>
												<option value="21">케이뱅크</option>
												<option value="22">토스뱅크</option>
												<option value="24">저축은행</option>
												
											</select>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label"></label>
									<div class="col-sm-6">
										<input type="text" name="accNo"
											class="form-control form-control" id="accNo"
											value="" placeholder="계좌번호">
									</div>
								</div>
          
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">닫기</a>
            </div>
          </div>
        </div>
    </div>
    </div>
    
    <!-- 상점 등록 Modal -->

   <!-- ceoTop Section Begin -->
   <section class="breadcrumb-section set-bg"
      style="background-color: #F2F2F2">
      <c:forEach var="store" items="${storeInfo}" begin="0" end="0">
         <div class="container">
            <div class="row my-1">
               <div class="col-4">
                  <div class="bg-white text-black mx-3">

                     </br> <strong class="mytop01">${store.user.userName} 사장님</strong>&nbsp;&nbsp; </br> </br>
                     
                     <!-- 상점등록  Modal 테스트 중 -->
                     <a id="userdetail" data-toggle="modal" href="#addRequestStoreModal" data-userid="">상점 등록</a>
                     <!-- 상점등록  Modal 테스트 중 -->
                     
                     <h6 class="mytop01"><strong>진욱이네와 처음 만난 날</strong>&nbsp;&nbsp;<i class="fa fa-heartbeat" aria-hidden="true" style="font-size:30px;"></i></h6>
                     <div class="mytop01-content"><span style="font-size:20px;">${store.user.regDate}</span></div>
                     </br> </br>

                  </div>
               </div>

               <div class="col-4">
                  <div class="bg-white text-black mx-3">

                     </br> <strong class="mytop01">진욱페이</strong> </br> </br>
                     <div class="mytop01-content"><span style="font-size:35px;">${store.user.jpBalance}</span>원</div>
                     </br> </br>

                  </div>
               </div>

               <div class="col-4">
                  <div class="bg-white text-black mx-3">

                     </br> <strong class="mytop01">${store.storeName}</strong> </br> </br>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-success btn-sm active"> <input
                           type="radio" name="options" id="option1" checked> 오픈
                        </label> <label class="btn btn-danger btn-sm"> <input
                           type="radio" name="options" id="option2"> 마감
                        </label>
                     </div>
                     </br>
                     <div class="mytop01-content"><span style="font-size:15px;"><strong>${store.storeAddr}</strong></span></div>

                     </br> </br>

                  </div>
               </div>
            </div>

         </div>
         <!-- /container -->
      </c:forEach>
   </section>
   <!-- ceoTop Section End -->
<script>

////////////////상점등록 REST 시작 (수정중) /////////////////
var USERID="";

function getUser(){
        	
	  var uri = "/admin/getUserRest/"+USERID;
		   $.get(uri, function(response) { 
			 $('input[name=userid]').attr('value',`\${response.userId}`);
			 $('input[name=username]').attr('value',`\${response.userName}`);
			 $('input[name=nickname]').attr('value',`\${response.nickName}`);
			 $('input[name=email]').attr('value',`\${response.email}`);
			 $('input[name=birth]').attr('value',`\${response.birth}`);
			 $('input[name=gender]').attr('value',`\${response.gender}`);
			 $('input[name=phone]').attr('value',`\${response.phone}`);
			 $('input[name=role]').attr('value',`\${response.role}`);
			 $('input[name=regdate]').attr('value',`\${response.regDate}`);
		   }, "json");
		}

//모달 창 오픈할 때 해당 유저아이디 전달 //
$(document).ready(function() {     

	$('#addRequestStoreModal').on('show.bs.modal', function(event) {          
		USERID = $(event.relatedTarget).data('userid');
	    getUser();

	 });
});
////////////////상점등록 REST 끝   /////////////////

//////////////// 이미지 미리보기 /////////////////
   var sel_file;
 
        $(document).ready(function() {
            $("#input_img").on("change", handleImgFileSelect);
        }); 
 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_file = f;
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
////////////////이미지 미리보기 /////////////////
       
        
</script>
</body>
</html>