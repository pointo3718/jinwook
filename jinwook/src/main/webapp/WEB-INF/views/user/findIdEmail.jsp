<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

	h3 {
	font-weight: normal;
}
 
main {
	width: 100%;
	text-align: center;
	min-height: calc(100vh - 341px);
}
 
main input {
	font-size: 1.5rem;
}
 
main button {
	background: #30DAD9;
	color: #fff;
	padding: 1px 5px;
	border: none;
	height: 30px;
	border-radius: 5px;
}
 
.find_info {
	width: 350px;
	max-width: 90%;
	margin: 0 auto;
	margin-top: 50px;
}
 
.find_id_page .find_info input, .find_password_page .find_info input {
	border-radius: 5px;
	border: 1px solid #666;
	width: 75%;
	min-width: 150px;
	height: 30px;
	padding: 0 5px;
}
 
.find_password {
	text-align: left;
	margin: 10px;
}
 
.find_password a {
	text-decoration: underline;
}
 
.send_email {
	margin-top: 50px;
}
 
.send_email h2 {
	display: inline;
}
 
.find {
	text-align: left;
}
 
.find>div {
	margin-bottom: 20px;
}
 
.find input[type=radio]:checked ~ .auth {
	display: block;
}
 
.auth {
	margin: 10px;
	display: none;
}
 
.auth input {
	border: 1px solid #ddd;
	padding: 0 5px;
	height: 30px;
	margin-bottom: 10px;
}
 
.password_modify_page .find_info {
	width: 450px;
}
 
.password_modify_page h3 {
	margin-bottom: 20px;
}
 
.password_modify_page .box {
	text-align: left;
	margin-bottom: 5px;
}
 
.password_modify_page .box span {
	display: inline-block;
	width: 120px;
}
 
.password_modify_page .box input {
	border: 1px solid #ddd;
	padding: 0 5px;
	height: 30px;
	max-width: 250px;
	width: 60%;
}
 
.password_modify_page .modify_btn {
	margin-top: 20px;
}
 
.password_modify_page .password_check_msg {
	text-align: center;
}
 
@media ( max-width : 767px) {
	body>div {
		min-height: calc(100vh - 276px);
		width: 90%;
		margin: 0 auto;
	}
}
 
@media ( max-width : 480px) {
	.password_modify_page .box span {
		width: 90px;
	}
}

    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
				
	$(document).ready(function() {
		$(".find_btn").click(function() {
			const email = $(".email").val();
			const userName = $(".userName").val();
			/* if (!emailCheck(email)) {
				swal("�̸����� ��Ȯ�� �Է����ּ���");
				return;
			} */
	 		
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1 )){
				alert("�̸��� ������ �ƴմϴ�.");
				return;
			}
			
			$.ajax({
				url: "findIdEmail",
				type: "POST",
				data: {email: email,
						userName : userName}
			})
			.done(function() {
				const html =
					"<div class='send_email'> "
						+ "<div> "
						+	"<h3>"+email+"</h3> "
						+	"<span>���� ���̵� �����߽��ϴ�</span><br> "
						+	"<div>������ ���� ���� �̸��� �ּҳ� �ùٸ��� ���� �̸��� �ּҸ� �Է��Ͻ� ��쿡�� ������ ���� �� �����ϴ�.</div> "
						+	"<button class='back_btn'>���ư���</button> "
						+"</div> "
					+"</div>";
	 
				$("main").html(html);
	 
			})
			.fail(function() {
				alert("�ٽ� Ȯ�����ּ���.");
				return;
			})
		})
	 
		$(document).on("click", ".back_btn", function() {
			location.href = "login";
		})
	})
		
		
	</script>		
	
</head>

<body>
	<main class="find_id_page">
		<div class="find_info">
			<h3>�����Ͻ� �̸��� �̸����� �Է����ּ���</h3>
			<input type="text" name="userName" class="userName">
			<input type="email" name="email" class="email">
			<button class="find_btn">Ȯ��</button>
		</div>
	</main>	
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>