<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	
	
	
 
 
 
<script>
$(document).ready(function(){
	
	function usernameCheck() {
		let submit = false;
		const username = $("input[name=username]").val().replaceAll(" ", "");
		if(!username) {
			return false;
		}
		
		/* $.ajax({
			url: "/overlapCheck",
			type: "GET",
			async: false,
			data: {
				value : username,
				valueType : "username"
			}
		}); */
		.done(function(result){
			if(result == 1) {
				submit = true;
			} 
		});
		.fail(function(){
			alert("에러");
		});
		return submit;
	}
	 
	 
	 
	 
	$(".next_page").click(function(){
		if(!usernameCheck()) {
			alert("아이디를 정확히 입력해주세요");
			return;
		}
		const data = {
			username : $(".username").val(),	
		}
		
		$.ajax({
			url: "/user/auth",
			type: "POST",
			data: data
		})
		.then(function(result){
			location.href= "/user/auth?username=" + result;
		})
		.fail(function(){
			alert('에러');
		});
	});
	 
	 
	 
		
	 
		
	});
</head>

</script>

<body>
	<main class="find_password_page">
		<div class="find_info">
			<h3>가입하신 아이디를 입력해주세요</h3>
			<input type="text" name="username" class="username">
			<button type="button" class="next_page">다음</button>
		</div>
	</main>
</body>
</html>
