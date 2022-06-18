<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})

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
					</br>
					<h3 class="modal-title" id="exampleModalLabel" style="color : #7fad39">
						 <strong> 페이충전 </strong>
					</h3>
					<h4>
						<strong>충전하실 금액을 선택해주세요.</strong>					
					</h4>
				</div>
				<div class="modal-body" style="font-size : 20px; margin-left : 20px; ">
				<h3 class="h4" style="text-align: center; color: #F05441; font-weight:bold;"> 진욱페이는 결제금액에 10% 추가지급합니다. </br>
				</h3>
					</br>
					<div class="form-check">
						<i class="bi bi-coin"></i>
						<span class="form-check-label" style="margin-right : 85px;">진욱페이 </span>
						<strong style="margin-right : 70px;"> 5,500 원</strong>
						<button type="button" class="buttonType" style=" width: 110px;">5,000원</button>
					</div>
					</br>
					<div class="form-check">
						<i class="bi bi-coin"></i>
						<span class="form-check-label" style="margin-right : 75px;">진욱페이 </span>
						<strong style="margin-right : 70px;"> 11,000 원</strong>
						<button type="button" class="buttonType" style=" width: 110px;">10,000원</button>
					</div>
					</br>
					<div class="form-check">
						<i class="bi bi-coin"></i>
						<span class="form-check-label" style="margin-right : 75px;">진욱페이 </span>
						<strong style="margin-right : 70px;"> 33,000 원</strong>
						<button type="button" class="buttonType" style=" width: 110px;">30,000원</button>
					</div>
					</br>
					<div class="form-check">
						<i class="bi bi-coin"></i>
						<span class="form-check-label" style="margin-right : 75px;">진욱페이 </span>
						<strong style="margin-right : 70px;"> 55,000 원</strong>
						<button type="button" class="buttonType" style=" width: 110px;">50,000원</button>
					</div>
					</br>
					<div class="form-check">
						<i class="bi bi-coin"></i>
						<span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
						<strong style="margin-right : 65px;"> 110,000 원</strong>
						<button type="button" class="buttonType" style=" width: 110px;">100,000원</button>
					</div>
					</br>
					<div class="form-check">
						<i class="bi bi-coin"></i>
						<span class="form-check-label" style="margin-right : 70px;">진욱페이 </span>
						<strong style="margin-right : 65px;"> 330,000 원</strong>
						<button type="button" class="buttonType" style=" width: 110px;">300,000원</button>
						</br></br>
					</div>
				</div>
			</div>
		</div>
	</div>

<button type="button" class="btn btn-dark" id="preRegister"
													data-toggle="modal" data-target="#exampleModal"
													data-notifyid="${complain.userId}"
													data-complainno="${complain.complainNo}">등록</button> <!--  data-toggle="modal" data-target="#exampleModal -->
											</td>

</body>


</html>