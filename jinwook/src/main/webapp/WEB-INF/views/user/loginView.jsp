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
<title>로그인</title>

<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
   rel="stylesheet">

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
    	 .row{ 
            margin-top: 10px;
            justify-content: center;
            align-items: center;
           
        }
        .find_id{
        	
        }
         .form-group{
       		 justify-content: center;
           	 align-items: center;
        } 
        input{
          width:100px;
		  height:50px;
		  font-size:15px;
		  text-indent: 1em;
        }
        a{
        justify-content: center;
        align-items: center;
        font-size:15px;
        color:black;
        text-indent:-1em;
        }
        .zz{
        justify-content: center;
        font-size:"30px";
        }
        .userId{
       		 justify-content: center;
           	 align-items: center;
           	  width : 350px;
        }
        .password{
       		 justify-content: center;
           	 align-items: center;
           	  width : 350px;
        }
        .button1{
			  background-color: #7fad39; 
			  border: none;
			  color: white;
			  width : 350px;
			  }
        .button2{
			  background-color: white; 
			  width : 350px;
			  border: 1px solid #7fad39;
			  color: #7fad39;
			  }
		.swal-button 
				{
					background-color: #7fad39;
					font-size: 12px;
					text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
				}
    </style> 
    <!-- 카카오 로그인 -->
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	<!-- 카카오 로그인 -->
	 $(document).ready(function(){
	        Kakao.init('7a50e1995f458ef51a98c92f52419d00');
	        Kakao.isInitialized();
	    });

	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: 'http://localhost:8082/index' 
	        }); // 등록한 리다이렉트uri 입력
	    }	
	
		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(".button1").on("click" , function() {
				var id=$(".userId").val();
				var pw=$(".password").val();
				
				
				if(id == null || id.length <1) {
					swal("진욱이네", "ID를 입력해주세요.");
					$(".userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					swal("진욱이네", "비밀번호를 입력해주세요.");
					$(".password").focus();
					return;
				}
				
				
				/* var messege = "${msg}";
				var url = "${url}"
				alert(messege);
				document.location.href= url;
				 */
				 
				 
 			 
				$(".form-horizontal").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(".button2").on("click" , function() {
				/* self.location = "/user/addUser" */
				$("form").attr("method" , "GET").attr("action" , "/user/addUser").submit();
			});
		});
		
	</script>		
	
</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
 	<jsp:include page="../layout/top.jsp" />
    	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
		<!--  row Start /////////////////////////////////////-->
		<div class="container">
		
		<div class="row">
		
	   	 	
	 	 	<div class="col-md-6" >
	 	 	
		 	 	<br/><br/>
				
				<div class="form-group">	 	 	
		 	 		<h1 class="zz text-center" >로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>
					<br/><br/>
					
			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-2 control-label"></label>
					    <div class="col-sm-3" style="font-size:15px;">
					      <input type=   "text" class="userId" name="userId" id="userId"  placeholder="아이디를 입력해주세요" required="required" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-2 control-label"></label>
					    <div class="col-sm-6" style="font-size:15px;">
					      <input type="password" class="password" name="password" id="password" placeholder="패스워드를 입력해주세요" >
					    </div>
					  </div>
					  	<br/><br/>
					  <div class="form-group text-center">
					    <a class="find_id" href="findIdEmail"> &nbsp;아이디 찾기</a><a> | </a><a class="find_password" href="findPhone">비밀번호 찾기</a>
					  </div>
					  <div class="form-group" style="text-align: center">
					    <div class="col-sm-offset-2 col-sm-5 text-center">
					      <button type="button" class="button1 site-btn"  >로 &nbsp;그 &nbsp;인</button>
					    </div>
					    </div>

					  <div class="form-group" style="text-align: center">
					    <div class="col-sm-offset-2 col-sm-5 text-center">
				      <button type="button" class="button2 site-btn"  >회 &nbsp;원 &nbsp;가 &nbsp;입</button>
 					     <!--  <a class="button2 site-btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a> -->
					    </div>
					  </div>
					  <hr>
					  <div id="kakao_login" style="text-align: center">
                     <a href="#">
                     <img width="350" height="50" 
                        src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs_esG5vNalcfhJ7BalYK2Uk06Dkp9JIK_KA&usqp=CAU" /></a>
       				 </div>	
						 <!--  <div class="form-group row">
							<div class="or-seperator"><b>or</b></div>
						</div> -->
					</form>
			
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	</div>
  	 	<br/><br/>	<br/><br/>	<br/><br/>	<br/><br/>	<br/><br/>	<br/><br/>
 	<!--  화면구성 div end /////////////////////////////////////-->
 <jsp:include page="../layout/footer.jsp" />
 </body>

</html>