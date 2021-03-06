<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<html lang="ko">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
/////////////// ?????? ?????? ?????? //////////////////////
$(function() {
   $( "#requestAdd:contains('?????? ??????')" ).on("click" , function() {
      fncAddRequestStore();
   });
});

function fncAddRequestStore(){
//Form ????????? ??????

document.detailForm.action='/request/addRequestAddStore';
document.detailForm.submit();
}

/////////////// ?????? ?????? ??? ///////////////////////

   

   //================?????? ??????======================//

   $(function() {
      $("#open").on("click", function fncIsOpen() {

         const btnElement = document.getElementById('open');
         var open = true

         console.log(open);
         var storeNo = $("#open").data("value");

         $.ajax({
            url : "isOpen/" + storeNo + "/" + open,
            dataType : "json",
            method : "post",
            success : function(result) {
               if (result != null) {
                  swal("????????? ?????????????????????.");
					$( "#point" ).load(window.location.href + " #point" );
               }
            }

         });

      });
   });

   //============= ?????? ?????? =============//

   $(function() {
      $("#close").on("click", function fncIsOpen() {

         const btnElement = document.getElementById('close');
         var open = false

         console.log(open);
         var storeNo = $("#close").data("value");

         $.ajax({
            url : "isOpen/" + storeNo + "/" + open,
            dataType : "json",
            method : "post",
            success : function(result) {
               if (result != null) {
                   swal("????????? ?????????????????????.");
					$( "#point" ).load(window.location.href + " #point" );
               }
            }

         });

      });
   });
   
   
 </script>




</head>
<body>


<!-- ?????? ?????? Modal -->
   <div class="modal" id="addRequestStoreModal" aria-hidden="true"
      style="display: none; z-index: 1060;">
      <div class="modal-dialog modal-xl">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismis
                  style="margin-left: 0px; text-align: center;">
                  ?????? ?????? ??????<s ="modal" aria-label="Close"></s>
               </button>
            </div>
            <div class="container"></div>
            <div class="modal-body">

               <div class="container">
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;??????????????? ????????????
                     ?????? ?????? ????????? ??????????????????.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;?????? ?????? ?????? ???,
                     ?????? ???????????? ??? 7?????? ???????????????.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;??????????????? ??????
                     ???????????? ????????? ??? ??? ????????????.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;??????????????? ???????????????
                     ???????????? ????????? ???????????????. ?????? ????????? ??? ???????????? ?????? ????????? ????????? ????????? ??????????????????.
                  </div>
                  <div>
                     <i class="fa fa-check" aria-hidden="true"></i> &nbsp;?????? ?????? ?????? ???
                     ?????? ????????? 1:1??????/????????????(1644-0000)??? ?????? ????????????.
                  </div>
               </div>
               <hr>

               <form name="detailForm" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="businessCard" value="???????????????.jpg" />
                  <input type="hidden" name="storeNo" value="10000" />


                  <div class="form-group row">

                     <label for="colFormLabel"
                        class="col-sm-2 col-form-label col-form-label">????????????</label>
                     <div class="col-sm-6">
                        <input type="text" name="storeName"
                           class="form-control form-control" id="storeName" value=""
                           placeholder="????????????(?????????)??? ??????????????????.">
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">????????????</label>
                     <div class="col-sm-6">
                        <select size="5">
                           <option selected>????????? ???????????????</option>
                           <option value="??????">??????</option>
                           <option value="??????">??????</option>
                           <option value="??????">??????</option>
                           <option value="??????">??????</option>
                           <option value="??????">??????</option>
                        </select>
            
                     </div>
                  </div>
                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">????????????</label>
                     <div class="col-sm-6">
                        <input type="text" name="storeAddr"
                           class="form-control form-control" id="address_kakao" value=""
                           placeholder="?????? ?????? ??????" readonly>
                     </div>
                  </div>

                  <!--  ????????? ?????? API ?????? -->
                  <script
                     src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                 
                  <script>
                  window.onload = function(){
                    
                      document.getElementById("address_kakao").addEventListener("click", function(){ //?????????????????? ????????????
                          //????????? ?????? ??????
                          new daum.Postcode({
                              oncomplete: function(data) { //????????? ????????? ??????
                                  document.getElementById("address_kakao").value = data.address; // ?????? ??????
                                  document.querySelector("input[name=address_detail]").focus(); //???????????? ?????????
                              }
                          }).open();
                      });
                  }

                      
                  </script>
                  <!--  ????????? ?????? API ??? -->

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">??????????????????</label>
                     <div class="col-sm-6">
                        <input class="form-control form-control" type="text"
                           name="address_detail" placeholder="?????? ????????? ??????????????????." />
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">??????????????????</label>
                     <div class="col-sm-6">
                        <input type="date" name="storeStart"
                           class="form-control form-control" id="storeStart" value=""
                           placeholder="??????????????????">
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">????????????</label>
                     <div class="col-sm-6">
                        <textarea class="form-control" id="storeIntro" name="storeIntro"
                           cols="20" rows="5"
                           placeholder="?????? ????????? 50??? ?????? ??????????????????. &#13;&#10; &#13;&#10; ex) ??????????????? ???????????? ??????????????? ???????????? ?????????. &#13;&#10; ex) ???????????? ?????? ?????? 10% ?????? ????????????~"></textarea>
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
                        class="col-sm-2 col-form-label col-form-label">??????????????????</label>
                     <div class="col-sm-6">
                        <input type="text" name="storePhone"
                           class="form-control form-control" id="storePhone" value=""
                           placeholder="??????????????????">
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">????????????</label>
                     <div class="col-sm-6">
                        <span class="btn btn-default btn-file"
                           style="padding-left: 0px; padding-bottom: 15px;"> <input
                           id="input_img" type="file" name="file" value="" />
                           <div>
                              <div class="img_wrap">
                                 <img id="img"/>
                              </div>
                           </div>
                        </span>
                     </div>
                  </div>

                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label"
                        style="padding-right: 4px;">?????????????????????</label>
                     <div class="col-sm-6">
                        <input type="text" name="businessNo"
                           class="form-control form-control" id="businessNo" value=""
                           placeholder="?????????????????????" readonly>
                     </div>
                  </div>


                  <div class="form-group row">
                     <label for="colFormLabelLg"
                        class="col-sm-2 col-form-label col-form-label">????????????</label>

                     <div class="col-sm-6" style="padding-left: 0px;">
                        <div class="col-sm-6">
                           <div class="wrapper">
                              <select size="5" name="bank">

                                 <option selected>?????????</option>
                                 <option value="1">???????????????</option>
                                 <option value="2">??????</option>
                                 <option value="3">??????</option>
                                 <option value="4">IBK??????</option>
                                 <option value="5">??????</option>
                                 <option value="6">??????</option>
                                 <option value="7">??????</option>
                                 <option value="8">SC??????</option>
                                 <option value="9">??????</option>
                                 <option value="10">??????</option>
                                 <option value="11">??????</option>
                                 <option value="12">???????????????</option>
                                 <option value="13">??????</option>
                                 <option value="14">??????</option>
                                 <option value="15">??????</option>
                                 <option value="16">??????</option>
                                 <option value="17">?????????</option>
                                 <option value="18">??????</option>
                                 <option value="19">??????</option>
                                 <option value="20">??????</option>
                                 <option value="21">????????????</option>
                                 <option value="22">????????????</option>
                                 <option value="24">????????????</option>

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
                           placeholder="????????????">
                     </div>
                  </div>
               </form>
               <br />
               <br />
               <div class="form-group row">
                  <button type="button" id="requestAdd" class="btn btn-success"
                     style="background-color: #7fad39; border-color: #7fad39; width: 126px;">?????? ??????</button>
               </div>
               <br />

               <div class="modal-footer">
                  <a href="#" data-dismiss="modal" class="btn" style="color:black;">??????</a>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- ?????? ?????? Modal -->

   <!-- ceoTop Section Begin -->
   <section class="breadcrumb-section set-bg"
      style="background-color: #F2F2F2; padding-left: 110px; padding-right: 110px;">
      <div class="container">



         <div class="row" style="justify-content: space-between;">
            <table class="table table-borderless"
               style="background-color: white; width: 350px; height: 197px; justify-content: space-around;">
               <thead>
                  <tr>
                     <th scope="col"><strong class="mytop01"
                        style="font-size: 20px;">${user.userName} ?????????</strong></th>

                  </tr>
               </thead>
               <tbody>
                  <tr>

                     <td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????????????? ??????
                           ?????? ???</strong></td>

                  </tr>
                  <tr>

                     <td>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-heart" aria-hidden="true" style="font-size:23px; color:#E6E6E6"></i><span
                        style="font-size: 22px; color: #7fad39; font-weight:bold; padding-left:5px;">
                        <fmt:formatDate value="${user.regDate}" dateStyle="full"/>
                        </span><i class="fa fa-heart" aria-hidden="true" style="font-size:23px; color:#E6E6E6"></i></td>
   
                  </tr>
                                    

               </tbody>
            </table>


            <table class="table table-borderless"
               style="background-color: white; width: 350px; height: 197px; justify-content: space-around">
               <thead>
                  <tr>

                     <th scope="col"><span style="font-size: 20px;"><a href="/store/getStoreWallet?storeNo=10000" style="color:black">????????????&nbsp;<i
                           class="fa fa-chevron-right" aria-hidden="true"></i></span></th>

                  </tr>
               </thead>
               <tbody>
                  <tr>

                     <td style="padding-top: 50px;"><span
                        style="font-size: 50px; color: #7fad39; margin-left: 150px"><fmt:formatNumber
                              value="${user.jpBalance}" /></span>???</td>

                  </tr>


               </tbody>
            </table>
            
                  <c:if test="${user.storeYn==false}">
                  <table class="table table-borderless"
                     style="background-color: white; width: 350px; height: 197px; justify-content: space-around;">

                     <tbody>
                        <tr>

                           <td></td>
                           <td style="padding-top: 80px; padding-left: 90px;"><a
                              id="userdetail" data-toggle="modal"
                              href="#addRequestStoreModal" data-userid=""><strong
                                 style="font-size: 25px">?????? ??????</strong></a></td>
                           <td></td>
                        </tr>


                     </tbody>
                  </table>
                  </c:if>
                       
            
         <c:if test="${user.storeYn==true}">
              <c:forEach var="store" items="${storeInfo}">
                  <c:if test="${store.storeStatus=='2'}">
					<div id="point" name="point" class="point">
                     <table class="table table-borderless"
                        style="background-color: white; width: 350px; height: 197px; justify-content: space-around table-layout:fixed">
                        <thead>
                           <tr>


                              <th scope="col" style="width: 124px;"><span
                                 style="font-size: 20px;"><a href="/store/getStore?storeNo=10000" style="color:black;">${store.storeName}&nbsp;<i
                                    class="fa fa-chevron-right" aria-hidden="true"></i></span></th>

                              <th scope="col"
                                 style="padding-left: 70px; padding-right: 0px;">
                                 <button type="button" id="open" data-value="${store.storeNo}"
                                    class="btn btn-success btn-sm">??????</button>
                                 <button type="button" id="close"
                                    data-value="${store.storeNo}" class="btn btn-danger btn-sm">??????</button>
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

                              <td><strong>??? ?????????</strong></td>
                              <td colspan=2 style="padding-left: 80px; padding-right: 0px;"><span
                                 style="font-size: 25px; color: #7fad39;"><strong><fmt:formatNumber
                                       value="${store.totalEarn}" /></strong></span>???</td>
                              <td></td>
                           </tr>

                        </tbody>
                     </table>
                     </div>

                  </c:if>


                  <c:if test="${store.storeStatus=='1'}">
                     <table class="table table-borderless"
                        style="background-color: white; width: 350px; height: 197px; justify-content: space-around;">
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
                                 style="font-size: 25px;">?????? ?????? ??????????????????.</strong></td>
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
                     </c:forEach>
                     </c:if>


         </div>




      </div>

      <!-- /container -->




   </section>
   <!-- ceoTop Section End -->


   <script>

////////////////???????????? REST ?????? (?????????) /////////////////
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

//?????? ??? ????????? ??? ?????? ??????????????? ?????? //
$(document).ready(function() {     

   $('#addRequestStoreModal').on('show.bs.modal', function(event) {          
      USERID = $(event.relatedTarget).data('userid');
       getUser();

    });
});
////////////////???????????? REST ???   /////////////////

//////////////// ????????? ???????????? /////////////////
   var sel_file;
 
        $(document).ready(function() {
            $("#input_img").on("change", handleImgFileSelect);
        }); 
 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("???????????? ????????? ???????????? ???????????????.");
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
////////////////????????? ???????????? /////////////////
       
        
</script>
</body>
</html>