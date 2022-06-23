<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 회원 상세 모달 Begin -->
    <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismis style="margin-left: 0px; text-align: center;">회원 상세<s="modal" aria-label="Close">
	        </button>
            </div><div class="container"></div>
            <div class="modal-body" >
          
         <div class="col-md-10 order-md-1">
          <div class="col-md-12 mb-3">
            <label for="Name">아이디</label>
            <input type="text" class="form-control" name="userid" placeholder="" value="" readonly>
          </div>
          
         <div class="container">  
         	<div class="row forModal">
          	<div class="col-md-6 mb-3">
            	<label for="userId">이름</label>
            	<input type="text" class="form-control" name="username" placeholder="" value="" readonly>
         	 </div>
          <div class="col-md-6 mb-3">
           	 	<label for="userId">닉네임</label>
           	 	<input type="text" class="form-control" name="nickname" placeholder="" value="" readonly>
          </div>
			</div>
        </div>

        <div class="col-md-12 mb-3">
            <label for="Name">이메일</label>
            <input type="text" class="form-control" name="email" placeholder="" value="" readonly>
          </div>

        <div class="container">  
         	<div class="row forModal">
          	<div class="col-md-6 mb-3">
            	<label for="userId">생년월일</label>
            	<input type="text" class="form-control" name="birth" placeholder="" value="" readonly>
         	 </div>
          <div class="col-md-6 mb-3">
           	 	<label for="userId">성별</label>
           	 	<input type="text" class="form-control" name="gender" placeholder="" value="" readonly>
          </div>
			</div>
        </div>

        <div class="col-md-12 mb-3">
            <label for="Name">전화번호</label>
            <input type="text" class="form-control" name="phone" placeholder="" value="" readonly>
          </div>

	 	<div class="col-md-12 mb-3">
            <label for="Name">구분</label>
            <input type="text" class="form-control" name="role" placeholder="" value="" readonly>
         </div>
            
         <div class="col-md-12 mb-3">
            <label for="Name">가입일자</label>
            <input type="text" class="form-control" name="regdate" placeholder="" value="" readonly>
         </div>
           
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">닫기</a>
            </div>
          </div>
        </div>
    </div>
   </div>
</div>
<!-- 회원 상세 모달 End -->


<script>
//////////////// 유저 상세 REST 시작 /////////////////
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

// 모달 창 오픈할 때 해당 유저아이디 전달 //
$(document).ready(function() {     

	$('#myModal2').on('show.bs.modal', function(event) {          
		USERID = $(event.relatedTarget).data('userid');
		alert(USERID);
	    getUser();

	 });
});
//////////////// 유저 상세 REST 끝   /////////////////

</script>
</body>
</html>