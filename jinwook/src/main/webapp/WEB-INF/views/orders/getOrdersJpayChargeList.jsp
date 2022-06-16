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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
</head>
<body>
<div class="modal fade" id="exampleModal" data-toggle="modal"
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						블랙리스트 지정기간을</br>선택해주세요
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="blackPeriod" value="7days" checked> <label
							class="form-check-label" for="exampleRadios1"> 일주일 </label>
					</div>
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="exampleRadios2" value="1month"> <label
							class="form-check-label" for="exampleRadios2"> 한 달 </label>
					</div>
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="exampleRadios1" value="6month"> <label
							class="form-check-label" for="exampleRadios1"> 6개월 </label>
					</div>
					</br>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="blackPeriod"
							id="exampleRadios1" value="1year"> <label
							class="form-check-label" for="exampleRadios1"> 1년 </label>
					</div>
					</br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="register">등록</button>
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