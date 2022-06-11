<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" /> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>문자인증</title>
</head>
<body>
	<form class="form-horizontal">
		<label for="phone">휴대폰 번호</label>
		<p>
			<input type="text" name="userId" class="userId"><br>
			<input id="phone" type="text" name="phone" title="전화번호 입력" required/>
			<span id="phoneChk" class="doubleChk">인증번호 보내기</span><br/>
			<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
			<span id="phoneChk2" class="doubleChk">본인인증</span>
			<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
			<input type="hidden" id="phoneDoubleChk"/>
		</p>
		<p class="tip">
			최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)
		</p>
</form>
</body>

<script type="text/javascript">

//휴대폰 번호 인증
var code2 = "";
$("#phoneChk").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#phone").val();
	var userId = $(".userId").val();
	$.ajax({
        type:"GET",
        url:"sendPasswordPhone?phone=" + phone+"&userId="+userId,
        cache : false,
        success:function(data){
        	alert("asdas"+data)
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneChk").css("color","red");
				$("#phone").attr("autofocus",true);
        	}else{	        		
        		$("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneChk").css("color","green");
        		$("#phone").attr("readonly",true);
        		code2 = data;
        		$("#phoneDoubleChk").val(data); 
        	}
        }
    });
});

$("#phoneChk2").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
   	const phone2 = $("#phone2").val();
	const data = $("#phoneDoubleChk").val();
    console.log(data);
    if(phone2 == null || phone2 == ""){
       alert("휴대폰으로 발송된 인증번호를 입력해주세요");
    } else{     
       if(phone2 == data){
           alert("성공");
       self.location = "/user/updatePassword";
        }
        else {
           alert("실패");
        }    
    }
        
 });

</script>

</html>