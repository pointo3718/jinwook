<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<h3>sms인증페이지</h3>
<a href="/admin_main.do">홈</a>
<a href="/logout.do">로그아웃</a><br/>

<div id="contents"> 
<form action="#" method="post">
      받는사람 : <input type="text" id="to" name="to"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
    <input type="button" id="send" value="전송"/><br> <!-- 문자보내는 전송버튼 -->
     인증번호 :    <input type="text" id="userNum">   <!-- 인증번호 입력창 -->
  <input type="button" id="enterBtn" value="확인">   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
  
  
  <input type="hidden" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
 
</form>  
    </div>
  <script>
  var count = 0; /* 문자 중복을 막기 위한 인증번호 */
   
 $(document).ready(function() {

    $("#send").click(function() {
       
       var number = Math.floor(Math.random() * 100000) + 100000;
          if(number>100000){
             number = number - 10000;
          }

          $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
       
       var to = $("#to").val();
       
       if(to == "" || to == null){
          alert("빈칸이나 공백을 채워주세요");
       }
       
       else {
       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
          
          if(con_test == true){
               
             if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
                 
               $.ajax({
                   url:"sendSms.do",
                   type:"post",
                   data:{to: $("#to").val(),
                        text: $("#text").val()
                        },
                 success:function(){
                   alert("해당 휴대폰으로 인증번호를 발송했습니다");
                   count++;
                   
                   alert(count);
                   }
                  /*  error(){
                      
                   } */
                   
                });
             } else {
                alert("휴대폰 인증 그만하세요")
             }
          
          }
             else if(con_test == false){
                
             }
         }   
    })
    $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
       alert($("#text").val());
       var userNum = $("#userNum").val();
       
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       }     
       else{     
          if(userNum.trim() == sysNum.trim()){
              alert("성공");
           }
           else {
              alert("실패");
           }          
       }
    });
  });
  </script>
</body>
</html>