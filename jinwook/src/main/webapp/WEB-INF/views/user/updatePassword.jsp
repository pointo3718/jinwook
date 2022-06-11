<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
	<main class="password_modify_page">
		<div class="find_info">	
			<h3>새로운 비밀번호로 재설정해주세요</h3>
			
			<div class="box">
				<span>새 비밀번호</span>
				<input type="password" class="password1" name="password">
			</div>
			
			<div class="box">
				<span>새 비밀번호 확인</span>
				<input type="password" class="password2">
				<div class="password_check_msg"></div>
			</div>
			<button class="modify_btn" >변경하기</button>
		</div>
	</main>
	
 
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 
 
<script>
const URLSearch = new URLSearchParams(location.search);
const username = URLSearch.get("username"); 
 
	
/* // 비밀번호 변경시 비밀번호입력 상태 확인
const isSubmit = (function() {
	let submit = false;
	
	const getSubmit =function() {
		return submit;
	}
	
	const setSubmit = function(set){
		submit = set;
		return submit;
	}
	return {getSubmit : getSubmit, setSubmit : setSubmit};
})();	 */
	
 
	
	
 
 
 
$(".modify_btn").click(function(){
	const password1 = $(".password1").val().replaceAll(" ", "");
	const password2 = $(".password2").val().replaceAll(" ", "");
 
	const msgBox = $(".password_check_msg");
	
	if (!password1 || !password2) {
		msgBox.text("비밀번호를 입력해주세요");
		return false;
	} else {
		msgBox.text("");
	}
	
	if(password1 != password2) {
		msgBox.text("비밀번호를 확인해 주세요");
		return false;
	} else {
		msgBox.text("");
	}
	alert("변경 완료되었습니다.");
	$("form").attr("method" , "GET").attr("action" , "updatePasswo1rd").submit();
})
 
 
// 패스워드 변경
/* $(".modify_btn").click(function(){
			$.ajax({
				url : "/user/updatePassword",
				type : "post",
				dataType : "json",
				data : {"password1" : $(".password1").val()},
				success : function(data){
					if(!pwdCheck()) {
						return;
					}
			self.location = "login";
				} */
/* $(".modify_btn").click(function(){
	if(!pwdCheck()) {
		return;
	}
	const data = {
		password: $(".password1").val(),
		userId : $(userId).val()
	}
	
	$.ajax({
		url: "/updatePassword",
		type: "PATCH",
		data: data
	}) */
	/* 
	.done(function(result){
		swal({
			text : result,
			closeOnClickOutside : false
		}) */
	/* .fail(function(){
		alert("에러");
	})
	})
			})
			 */
</script>
</body>
</html>
