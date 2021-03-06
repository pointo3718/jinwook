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

</script>

<body>

<!-- ?????? ?????? Modal -->
    <div class="modal" id="addRequestStoreModal" aria-hidden="true" style="display: none; z-index: 1060;">
       <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismis style="margin-left: 0px; text-align: center;">?????? ?????? ??????<s="modal" aria-label="Close">
           </button>
            </div><div class="container"></div>
            <div class="modal-body">
            
           <div class="container">
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;??????????????? ???????????? ?????? ?????? ????????? ??????????????????.</div>
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;?????? ?????? ?????? ???, ?????? ???????????? ??? 7?????? ???????????????.</div>
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;??????????????? ?????? ???????????? ????????? ??? ??? ????????????.</div>
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;??????????????? ??????????????? ???????????? ????????? ???????????????. ?????? ????????? ??? ???????????? ?????? ????????? ????????? ????????? ??????????????????.</div>
               <div><i class="fa fa-check" aria-hidden="true"></i> &nbsp;?????? ?????? ?????? ??? ?????? ????????? 1:1??????/????????????(1644-0000)??? ?????? ????????????.</div>
         </div>      
         <hr>
               <form name="detailForm" method="post">
               <input type="hidden" name="userId" value="${param.userId}" />
               <input type="hidden" name="businessCard" value="???????????????_????????????.jpg" />
               
               
               <div class="form-group row">
                     
                           <label for="colFormLabel"
                              class="col-sm-2 col-form-label col-form-label">????????????</label>
                           <div class="col-sm-6">
                              <input type="text" name="storeName"
                                 class="form-control form-control" id="storeName"
                                 value="" placeholder="????????????(?????????)??? ??????????????????.">
                           </div>
                        </div>
<!-- onchange="this.form.submit()" -->
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">????????????</label>
                           <div class="col-sm-6">
                           <select name="storeType" size="5">
                                    <option selected>????????? ???????????????</option>
                                    <option value="1">??????</option>
                                    <option value="2">??????</option>
                                    <option value="3">??????</option>
                                    <option value="4">??????</option>
                                    <option value="5">??????</option>
                           </select>

                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">????????????</label>
                           <div class="col-sm-4">
                              <input type="text" name="storeAddr" id="storeAddr_main"
                                 class="form-control form-control" 
                                 value="" placeholder="?????? ?????? ?????? Click" readonly>
                           </div>
                           <div class="col-sm-2" style="font-size: 22px; padding-left: 0px; right: 5px;">
                           <i class="fa fa-search" aria-hidden="true"></i>
                           </div>
                        </div>
                        
                        <!--  ????????? ?????? API ?????? -->
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						window.onload = function(){
						    document.getElementById("storeAddr_main").addEventListener("click", function(){ //?????????????????? ????????????
						        //????????? ?????? ??????
						        new daum.Postcode({
						            oncomplete: function(data) { //????????? ????????? ??????
						                document.getElementById("storeAddr_main").value = data.address; // ?????? ??????
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
                              <input  class="form-control form-control" type="text" id="storeAddr_detail" name="address_detail" placeholder="?????? ????????? ??????????????????."/>
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">??????????????????</label>
                           <div class="col-sm-6">
                            <input type="date" name="storeStart" id="storeStart" value="">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">????????????</label>
                           <div class="col-sm-6">
                              <textarea class="form-control" id="storeIntro" name="storeIntro" cols="20" rows="5" 
                              placeholder="?????? ????????? 50??? ?????? ??????????????????. &#13;&#10; &#13;&#10; ex) ??????????????? ???????????? ??????????????? ???????????? ?????????. &#13;&#10; ex) ???????????? ?????? ?????? 10% ?????? ????????????~" ></textarea>
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
                                 class="form-control form-control" id="storePhone"
                                 value="" placeholder="??????????????????">
                           </div>
                        </div>

                        <div class="form-group row">
                           <label for="colFormLabelLg"
                              class="col-sm-2 col-form-label col-form-label">????????????</label>
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
                              class="col-sm-2 col-form-label col-form-label">???????????????</label>
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
                              class="col-sm-2 col-form-label col-form-label">????????????</label>
                                                      
                           <div class="col-sm-6" style="padding-left: 0px;">
                              <div class="col-sm-6">
                              <div class="wrapper">
                                 <select size="5" name="bank">
                                    
                                    <option selected>?????????</option>
                                    <option value="???????????????">???????????????</option>
                                    <option value="??????">??????</option>
                                    <option value="??????">??????</option>
                                    <option value="IBK??????">IBK??????</option>
                                    <option value="??????">??????</option>
                                    <option value="??????">??????</option>
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
                                 class="form-control form-control" id="accNo"
                                 value="" placeholder=" '-' ?????? ??????????????????">
                           </div>
                        </div>
                        </form>
          				<br/><br/>
          				<div class="form-group row">
	          				<button id="requestAdd" class="btn btn-success" style="background-color: #7fad39; border-color: #7fad39; width: 126px;">?????? ??????</button>
          				</div>
         			<br/>				
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">??????</a>
            </div>
          </div>
        </div>
    </div>
    </div>
    
    
    <!-- ?????? ?????? Modal -->

   <!-- ceoTop Section Begin -->
   <section class="breadcrumb-section set-bg"
      style="background-color: #F2F2F2">
      <c:forEach var="store" items="${storeInfo}" begin="0" end="0">
         <div class="container">
            <div class="row my-1">
               <div class="col-4">
                  <div class="bg-white text-black mx-3">

                     </br> <strong class="mytop01">${store.user.userName} ?????????</strong> </br> </br>
                     
                     <!-- ????????????  Modal ????????? ??? -->
                     <a id="userdetail" data-toggle="modal" href="#addRequestStoreModal" data-userid="">?????? ??????</a>
                     <!-- ????????????  Modal ????????? ??? -->

                     <h6 class="mytop01"><strong>??????????????? ?????? ?????? ???</strong>&nbsp;&nbsp;<i class="fa fa-heartbeat" aria-hidden="true" style="font-size:30px;"></i></h6>
                     <div class="mytop01-content"><span style="font-size:20px;">${store.user.regDate}</span></div>
                     </br> </br>

                  </div>
               </div>

               <div class="col-4">
                  <div class="bg-white text-black mx-3">

                     </br> <strong class="mytop01">????????????</strong> </br> </br>
                     <div class="mytop01-content"><span style="font-size:35px;">${store.user.jpBalance}</span>???</div>
                     </br> </br>

                  </div>
               </div>

               <div class="col-4">
                  <div class="bg-white text-black mx-3">

                     </br> <strong class="mytop01">${store.storeName}</strong> </br> </br>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-success btn-sm active"> <input
                           type="radio" name="options" id="option1" checked> ??????
                        </label> <label class="btn btn-danger btn-sm"> <input
                           type="radio" name="options" id="option2"> ??????
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
//////////////// ????????? ???????????? 1 ?????? /////////////////
   var sel_file;
 
        $(document).ready(function() {
            $("#storeImage").on("change", handleImgFileSelect);
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
                    $("#img_fir").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
///////////////// ????????? ???????????? 1 ??? //////////////////


//////////////// ????????? ???????????? 2 ?????? /////////////////
 
        $(document).ready(function() {
            $("#businessCard").on("change", handleImgFileSelect);
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
                    $("#img_sec").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
////////////////????????? ???????????? 2 ??? /////////////////


</script>

</body>
</html>