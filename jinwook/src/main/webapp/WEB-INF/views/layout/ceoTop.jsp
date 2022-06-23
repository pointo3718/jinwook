<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<html lang="ko">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey={e53eaf4dd896374cd449da869e2ddcdc}"></script>

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

<script type="text/javascript">
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

   

   //================상점 오픈======================//

   $(function() {
      $("#open").on("click", function fncIsOpen() {

         const btnElement = document.getElementById('open');
         var open = true

         alert(open)

         console.log(open);
         var storeNo = $("#open").data("value");

         $.ajax({
            url : "isOpen/" + storeNo + "/" + open,
            dataType : "json",
            method : "post",
            success : function(result) {
               if (result != null) {
                  alert("상점이 오픈되었습니다.");
               }
            }

         });

      });
   });

   //============= 상점 마감 =============//

   $(function() {
      $("#close").on("click", function fncIsOpen() {

         const btnElement = document.getElementById('close');
         var open = false

         alert(open)

         console.log(open);
         var storeNo = $("#close").data("value");

         $.ajax({
            url : "isOpen/" + storeNo + "/" + open,
            dataType : "json",
            method : "post",
            success : function(result) {
               if (result != null) {
                  alert("상점이 마감되었습니다.");
               }
            }

         });

      });
   });
   
   
 </script>




</head>
<body>


   <!-- 상점 등록 Modal -->
   <div class="modal" id="addRequestStoreModal" aria-hidden="true"
      style="display: none; z-index: 1060;">
      <div class="modal-dialog modal-xl">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismis
                  style="margin-left: 0px; text-align: center;">
                  상점 등록 요청<s ="modal" aria-label="Close"></s>
               </button>
            </div>
            <div class="container"></div>
            <div class="modal-body">

               <div class="container">
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네에 입점하기
                     위해 상점 정보를 입력해주세요.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;상점 등록 요청 후,
                     입점 완료까지 약 7일이 소요됩니다.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;확인절차에 따라
                     관리자의 연락이 갈 수 있습니다.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;진욱이네는 사장님들의
                     피드백을 언제나 환영합니다. 입점 등록시 더 추가하고 싶은 사항이 있다면 언제든 요청해주세요.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;입점 관련 문의 및
                     요청 사항은 1:1문의/고객센터(1644-0000)로 문의 바랍니다.
                  </div>
               </div>
               <hr>

               <form name="detailForm" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="userId" value="${param.userId}" /> <input
                     type="hidden" name="businessCard" value="파일업로드_언제하지.jpg" />


                  <div class="form-group row">

                     <label for="colFormLabel"
                        class="col-sm-2 col-form-label col-form-label">상점이름</label>
                     <div class="col-sm-6">
                        <input type="text" name="storeName"
                           class="form-control form-control" id="storeName" value=""
                           placeholder="상점이름(상호명)을 입력해주세요.">
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">상점업종</label>
                     <div class="col-sm-6">
                        <select size="5">
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
                     <div class="col-sm-6">
                        <input type="text" name="address"
                           class="form-control form-control" id="address_kakao" value=""
                           placeholder="상점 주소 검색" readonly>
                     </div>
                  </div>

                  <!--  카카오 주소 API 시작 -->
                  <script
                     src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                 
                  <script>
                  window.onload = function(){
                      document.getElementById("storeAddr_main").addEventListener("click", function(){ //주소입력칸을 클릭하면
                          //카카오 지도 발생
                          new daum.Postcode({
                              oncomplete: function(data) { //선택시 입력값 세팅
                                  document.getElementById("storeAddr_main").value = data.address; // 주소 넣기
                      document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
                          //카카오 지도 발생
                          new daum.Postcode({
                              oncomplete: function(data) { //선택시 입력값 세팅
                                  document.getElementById("address_kakao").value = data.address; // 주소 넣기
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
                        <input class="form-control form-control" type="text"
                           name="address_detail" placeholder="상세 주소를 입력해주세요." />
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">상점시작날짜</label>
                     <div class="col-sm-6">
                        <input type="text" name="storeStart"
                           class="form-control form-control" id="storeStart" value=""
                           placeholder="상점시작날짜">
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">상점소개</label>
                     <div class="col-sm-6">
                        <textarea class="form-control" id="storeIntro" name="storeIntro"
                           cols="20" rows="5"
                           placeholder="상점 소개를 50자 내로 입력해주세요. &#13;&#10; &#13;&#10; ex) 진욱이네는 산지직송 당일판매를 원칙으로 합니다. &#13;&#10; ex) 진욱이네 오픈 기념 10% 할인 해드려요~">
                              </textarea>
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
                           class="form-control form-control" id="storePhone" value=""
                           placeholder="상점전화번호">
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">상점사진</label>
                     <div class="col-sm-6">
                        <span class="btn btn-default btn-file"
                           style="padding-left: 0px; padding-bottom: 15px;"> <input
                           type="file" name="file" value="" />
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
                           class="form-control form-control" id="businessNo" value=""
                           placeholder="사업자등록번호" readonly>
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">영업신고증</label>
                     <div class="col-sm-6">
                        <span class="btn btn-default btn-file"
                           style="padding-left: 0px; padding-bottom: 15px;"> <input
                           type="file" id="input_img" />
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
                              <select size="5">

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
                           class="form-control form-control" id="accNo" value=""
                           placeholder="계좌번호">
                     </div>
                  </div>
               </form>
               <br />
               <br />
               <div class="form-group row">
                  <button id="requestAdd" class="btn btn-success"
                     style="background-color: #7fad39; border-color: #7fad39; width: 126px;">등록
                     요청</button>
               </div>
               <br />

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
      style="background-color: #F2F2F2; padding-left: 110px; padding-right: 110px;">
      <div class="container">



         <div class="row" style="justify-content: space-between;">
            <table class="table table-borderless"
               style="background-color: white; width: 350px; height: 170px; justify-content: space-around;">
               <thead>
                  <tr>

                     <th scope="col"><strong class="mytop01"
                        style="font-size: 20px;">${user.userName} 사장님</strong></th>

                  </tr>
               </thead>
               <tbody>
                  <tr>

                     <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;진욱이네와 처음
                           만난 날</strong></td>

                  </tr>
                  <tr>

                     <td><span
                        style="font-size: 25px; color: #7fad39; margin-left: 190px">${user.regDate}</span></td>

                  </tr>

               </tbody>
            </table>


            <table class="table table-borderless"
               style="background-color: white; width: 350px; height: 170px; justify-content: space-around">
               <thead>
                  <tr>

                     <th scope="col"><span style="font-size: 20px;">진욱페이&nbsp;<i
                           class="fa fa-chevron-right" aria-hidden="true"></i></span></th>

                  </tr>
               </thead>
               <tbody>
                  <tr>

                     <td style="padding-top: 60px;"><span
                        style="font-size: 25px; color: #7fad39; margin-left: 230px"><fmt:formatNumber
                              value="${user.jpBalance}" /></span>원</td>

                  </tr>


               </tbody>
            </table>


               <c:forEach var="store" items="${storeInfo}">
                  <c:if test="${store.storeStatus=='2'}">

                     <table class="table table-borderless"
                        style="background-color: white; width: 350px; height: 170px; justify-content: space-around table-layout:fixed">
                        <thead>
                           <tr>


                              <th scope="col" style="width: 124px;"><span
                                 style="font-size: 20px;">${store.storeName}&nbsp;<i
                                    class="fa fa-chevron-right" aria-hidden="true"></i></span></th>

                              <th scope="col"
                                 style="padding-left: 70px; padding-right: 0px;">
                                 <button type="button" id="open" data-value="${store.storeNo}"
                                    class="btn btn-success btn-sm">오픈</button>
                                 <button type="button" id="close"
                                    data-value="${store.storeNo}" class="btn btn-danger btn-sm">마감</button>
                              </th>
                              <th style="padding-left: 0px; padding-right: 0px;"><c:if
                                    test="${store.open==false}">
                                    <strong><img
                                       src="${path}/resources/static/img/close.png"
                                       style="width: 40px; height: 40px; padding-left: 5px"></strong>
                                 </c:if> <c:if test="${store.open==true}">
                                    <strong><img
                                       src="${path}/resources/static/img/open.png"
                                       style="width: 40px; height: 40px; padding-left: 5px"></strong>
                                 </c:if></th>


                           </tr>
                        </thead>
                        <tbody>
                           <tr>

                              <td colspan="2"><strong>${store.storeAddr}</strong></td>
                              <td></td>
                              <td></td>
                           </tr>
                           <tr>

                              <td><strong>총 매출액</strong></td>
                              <td colspan=2 style="padding-left: 80px; padding-right: 0px;"><span
                                 style="font-size: 25px; color: #7fad39;"><fmt:formatNumber
                                       value="${store.totalEarn}" /></span>원</td>
                              <td></td>
                           </tr>

                        </tbody>
                     </table>

                  </c:if>


                  <c:if test="${store.storeStatus=='1'}">
                     <table class="table table-borderless"
                        style="background-color: white; width: 350px; height: 170px; justify-content: space-around;">
                        <thead>
                           <tr>

                              <th scope="col"></th>
                              <th scope="col"></th>
                              <th scope="col"></th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>

                              <td></td>
                              <td style="padding-top: 45px; padding-left: 25px;"><strong
                                 style="font-size: 25px;">상점 등록 대기중입니다.</strong></td>
                              <td></td>
                           </tr>
                           <tr>

                              <td></td>
                              <td></td>
                              <td></td>
                           </tr>

                        </tbody>
                     </table>
                     </c:if>


                  <c:if test="${store.storeStatus=='4'}">
                  <table class="table table-borderless"
                     style="background-color: white; width: 350px; height: 170px; justify-content: space-around;">

                     <tbody>
                        <tr>

                           <td></td>
                           <td style="padding-top: 60px; padding-left: 90px;"><a
                              id="userdetail" data-toggle="modal"
                              href="#addRequestStoreModal" data-userid=""><strong
                                 style="font-size: 25px">상점 등록</strong></a></td>
                           <td></td>
                        </tr>


                     </tbody>
                  </table>
                  </c:if>
               </c:forEach>

         </div>




      </div>

      <!-- /container -->




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