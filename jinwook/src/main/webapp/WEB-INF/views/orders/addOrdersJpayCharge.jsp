<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  <style>
  .modal-header{
  	text-align: center;
  }
  .buttonType{
 	border: 1px solid #7fad39;
    cursor:pointer; cursor:hand;
  	background-color: #7fad39;
  	color: white;
  	padding: 6px;
  	border-radius: 1em;
  }
  </style>
</head>
<body>
<div class="modal fade" id="exampleModal" data-toggle="modal" 
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog " style="width: 530px; heigh: 300px;">
			<div class="modal-content" >
				<div class="modal-header" >
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<br>
					<h3 class="modal-title" id="exampleModalLabel" style="color : #7fad39">
						 <strong> 충전하기 </strong>
					</h3>
				</div>
				<div class="modal-body top" style="font-size : 19px; margin-left : 20px; ">
					<div class="form-check">
					<strong>결제상품</strong>  
					</div>
					<br>
					<div class="col sm-12">
					<strong style="font-size : 18px;">	진욱페이 </strong><span style="text-align:right;">값받아올거</span>
					</div>
				</div>
				<hr>
				<div class="modal-body middle" style="font-size : 18px; margin-left : 20px; padding-top: 0px;padding-bottom: 0px;">
					 <strong>결제금액</strong> <span>여기도 받아올거</span>
				</div>
				<hr>
				<div class="modal-body bottom" style="    padding-top: 0px; margin-left: 20px;">
				 <strong style="font-size : 18px;">결제수단</strong>
				 <br><br>
				 <span>카드 간편결제</span>
				  <br><br>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="register">등록</button>
				</div>
			</div>
		</div>
	</div>

<button type="button" class="btn btn-dark" id="preRegister"
													data-toggle="modal" data-target="#exampleModal"
													>등록</button> <!--  data-toggle="modal" data-target="#exampleModal -->
											</td>

</body>


</html>