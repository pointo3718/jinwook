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
</style>
</head>
<script>

/////////////// 상점 등록 시작 //////////////////////
$(function() {
	$( "#requestAdd:contains('등록 요청')" ).on("click" , function() {
		fncAddRequestStore();
	});
});

function fncAddRequestStore(){
//Form 유효성 검증


document.detailForm.action='/request/addRequestAddStore';
document.detailForm.submit();
}

/////////////// 상점 등록 끝 ///////////////////////

</script>

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
               <form name="detailForm" method="post">
               <input type="hidden" name="userId" value="${param.userId}" />
               <input type="hidden" name="businessCard" value="파일업로드_언제하지.jpg" />
               
               
               <div class="form-group row">
                     
                           <label for="colFormLabel"
                              class="col-sm-2 col-form-label col-form-label">상점이름</label>
                           <div class="col-sm-6">
                              <input type="text" name="storeName"
                                 class="form-control form-control" id="storeName"
                                 value="" placeholder="상점이름(상호명)을 입력해주세요.">
                           </div>
                        </div>
<!-- onchange="this.form.submit()" -->
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점업종</label>
                           <div class="col-sm-6">
                           <select name="storeType" size="5">
                                    <option selected>업종을 선택하세요</option>
                                    <option value="1">정육</option>
                                    <option value="2">수산</option>
                                    <option value="3">채소</option>
                                    <option value="4">과일</option>
                                    <option value="5">종합</option>
                           </select>

                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점주소</label>
                           <div class="col-sm-4">
                              <input type="text" name="storeAddr" id="storeAddr_main"
                                 class="form-control form-control" 
                                 value="" placeholder="상점 주소 검색 Click" readonly>
                           </div>
                           <div class="col-sm-2" style="font-size: 22px; padding-left: 0px; right: 5px;">
                           <i class="fa fa-search" aria-hidden="true"></i>
                           </div>
                        </div>
                        
                        <!--  카카오 주소 API 시작 -->
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						window.onload = function(){
						    document.getElementById("storeAddr_main").addEventListener("click", function(){ //주소입력칸을 클릭하면
						        //카카오 지도 발생
						        new daum.Postcode({
						            oncomplete: function(data) { //선택시 입력값 세팅
						                document.getElementById("storeAddr_main").value = data.address; // 주소 넣기
						                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
						            }
						        }).open();
						    });
						}
						</script>
                        <!--  카카오 주소 API 끝 -->
                        
                        
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점상세주소</label>
                           <div class="col-sm-6">
                              <input  class="form-control form-control" type="text" id="storeAddr_detail" name="address_detail" placeholder="상세 주소를 입력해주세요."/>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점시작날짜</label>
                           <div class="col-sm-6">
                            <input type="date" name="storeStart" id="storeStart" value="">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">상점소개</label>
                           <div class="col-sm-6">
                              <textarea class="form-control" id="storeIntro" name="storeIntro" cols="20" rows="5" 
                              placeholder="상점 소개를 50자 내로 입력해주세요. &#13;&#10; &#13;&#10; ex) 진욱이네는 산지직송 당일판매를 원칙으로 합니다. &#13;&#10; ex) 진욱이네 오픈 기념 10% 할인 해드려요~" ></textarea>
								<div class="text-right" id="test_cnt">(0 / 50)</div>
                           </div>
                        </div>
                        
                        <script>
	                        $(document).ready(function() {
	                            $('#storeIntro').on('keyup', function() {
	                                $('#test_cnt').html("("+$(this).val().length+" / 50)");
	                         
	                                if($(this).val().length > 50) {
	                                    $(this).val($(this).val().substring(0, 50));
	                                    $('#test_cnt').html("(50 / 50)");
	                                }
	                            });
	                        });
                        </script>

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
                                 <input type="file" id="storeImage" name="storeImage"/>
                                 <div>
                                      <div class="img_wrap_fir">
                                       <img id="img_fir" />
                                      </div>
                                  </div>
                              </span>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">영업신고증</label>
                           <div class="col-sm-6">
                              <span class="btn btn-default btn-file"
                                    style="padding-left: 0px; padding-bottom: 15px;">
                                 <input type="file" id="businessCard"  />
                                 <div>
                                      <div class="img_wrap_sec">
                                       <img id="img_sec" />
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
                                 <select size="5" name="bank">
                                    
                                    <option selected>은행명</option>
                                    <option value="카카오뱅크">카카오뱅크</option>
                                    <option value="농협">농협</option>
                                    <option value="신한">신한</option>
                                    <option value="IBK기업">IBK기업</option>
                                    <option value="하나">하나</option>
                                    <option value="우리">우리</option>
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
                                 value="" placeholder=" '-' 없이 입력해주세요">
                           </div>
                        </div>
                        </form>
          				<br/><br/>
          				<div class="form-group row">
	          				<button id="requestAdd" class="btn btn-success" style="background-color: #7fad39; border-color: #7fad39; width: 126px;">등록 요청</button>
          				</div>
         			<br/>				
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

                     </br> <strong class="mytop01">${store.user.userName} 사장님</strong> </br> </br>
                     
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
//////////////// 이미지 미리보기 1 시작 /////////////////
   var sel_file;
 
        $(document).ready(function() {
            $("#storeImage").on("change", handleImgFileSelect);
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
                    $("#img_fir").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
///////////////// 이미지 미리보기 1 끝 //////////////////


//////////////// 이미지 미리보기 2 시작 /////////////////
 
        $(document).ready(function() {
            $("#businessCard").on("change", handleImgFileSelect);
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
                    $("#img_sec").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
////////////////이미지 미리보기 2 끝 /////////////////


</script>

</body>
</html>