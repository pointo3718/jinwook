<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<meta name="description" content="Ogani Template">
	<meta name="keywords" content="Ogani, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>회원가입</title>
	
	<!-- Google Font -->
	<link
	   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	   rel="stylesheet">
	 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- Css Styles -->
	<link rel="stylesheet"
	   href="${path}/resources/static/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet"
	   href="${path}/resources/static/css/font-awesome.min.css"
	   type="text/css">
	<link rel="stylesheet"
	   href="${path}/resources/static/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet"
	   href="${path}/resources/static/css/nice-select.css" type="text/css">
	<link rel="stylesheet"
	   href="${path}/resources/static/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet"
	   href="${path}/resources/static/css/owl.carousel.min.css"
	   type="text/css">
	<link rel="stylesheet"
	   href="${path}/resources/static/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${path}/resources/static/css/style.css"
	   type="text/css">
	<link rel="stylesheet"
	   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       /*  body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */
      /   .row{ 
            margin-top: 10px;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
         
        input{
        	width:300px;
        	height:50px;
        	text-indent: 1em;
        	font-size:15px;
        	
        }
		div{
		justify-content: center;
		 text-align: center;
		  align-items: center;
		}
		#role1{
			outline:none;
		}
		#role2{
			outline:none;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {
			$( "#role1" ).on("click" , function() {
				$("#role1").css({
					'color' : '#7fad39'	
				});
				$(".user").css({
					'color' : '#7fad39'	
				});
				setTimeout(function(){
				    alert("일반회원가입을 진행합니다.");
				}, 10);
				/* $("form").attr("method" , "GET").attr("action" , "/user/addUser?role="+$("#role").val()).submit(); */
				location.href = "/user/addUser?role="+$("#role1").val();
			});
		});	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#role2" ).on("click" , function() {
				$("#role2").css({
					'color' : '#7fad39'	
				});
				$(".ceo").css({
					'color' : '#7fad39'	
				});
					alert("사장님 회원가입을 진행합니다.");
				location.href = "/user/addUser?role="+$("#role2").val();
			});
		});	
		
		
		

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="../layout/top.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class="container">
		
		<div class="row">
		
	   	 	
	 	 	<div class="col-md-6" >
	 	 	
		 	 	<br/><br/>
				
				<div class="form-group">	 
		<h1 class="ss text-center">회 원 가 입</h1>
		<hr>
		<br><br>
	<!--  	//////////form Start ///////////////////////////////////// -->
		<form class="form-horizontal">
		<div class="text-center" style="display:flex;">
			<div class="user" style="font-size:20px; color:gray; text-align:center;"  >
			<input type="hidden" id="useruser">
			<button type="button" id="role1" class="" name="사용자" value="사용자" aria-hidden="true" style="background-color:white; margin-right:50px; border:none; color:#E6E6E6; font-size:300px;" >
			<img src="${path}/resources/static/affection.png"></button><br><br>
			 일반회원 회원가입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div> 
		<!-- <div class="">
		  <input type="radio" id="role" name="role" class="d-none" value="사용자">
		  <label class="btn fa fa-user-circle-o" for="pay_method2">카드</label>
		</div> -->
		
			 <div class="ceo" style="font-size:20px; color:gray;">
			<button type="button" id="role2" class="" name="사장님" value="사장님" aria-hidden="true" style="background-color:white; padding-left:50px; border-left:1px solid #E6E6E6; font-size:300px; border-top:none; border-right:none; border-bottom:none; 
			 color:#E6E6E6 
			"><img src="${path}/resources/static/change.png"></button><br><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사장님 회원가입</div>	
			 </div>
			<%--  <img src="${path}/resources/static/ceo.png"
         alt="">	 --%>
		<br><br>
		</form>
		</div>
	</div>
</div>
</div> 
	<!--  화면구성 div end /////////////////////////////////////-->
	<jsp:include page="../layout/footer.jsp" />
</body>

</html>