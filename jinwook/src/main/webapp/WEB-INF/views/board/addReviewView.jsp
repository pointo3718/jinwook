<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("button.btn.btn-primary").on("click", function() {
		fncAddBoardInquiry();
	});
});

//==> �߰��Ⱥκ� : "���"  Event ó�� ��  ����
$(function() {
	$("a[href='#' ]").on("click", function() {
		$("form")[0].reset();
	});
});

function fncAddBoardInquiry() {
	
	$("form").attr("method", "POST").attr("action", "/board/addBoardInquiry").submit();
}

var rcpNo = ${recipe.rcpNo}
var userId = ${board.user.userId}

function updateRecipeReco() {
	$.ajax({
		type : "POST",
		url : "/board/updateRecipeReco",
		dataType : "json",
		data : {'rcpNo' : rcpNo, 'userId' : userId},
		error : function() {
			alert("��� ����");
		},
		success : function(recoCheck) {
			if (recoCheck == 0) {
				alert("��õ �Ϸ�!");
				location.reload();
			}
			else if (recoCheck == 1) {
				alert("��õ ���!");
				location.reload();
			}
		}
	});
}

</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<form method="post" action="board/addBoardInquiry">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eee; text-align: center;">1:1���� ���</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="1:1 ���� ������ ���ּ���." name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea type="text" class="form-control"
									placeholder="�� ����" name="bbsContent" maxlength="2048"
									style="height: 350px;">
                        </textarea></td>
						</tr>
					</tbody>
				
				</table>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${board.user.userId}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>��ȸ��</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardHits}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${board.writeDate}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3 "><strong>�亯����</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardInqStatus}</div>
		<hr/>  
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<!-- <a href="<c:url value='/board/addBoardInquiry'/>" role="button" class="btn btn-outline-info">�۾���</a> -->
		    <button type="button" class="btn btn-primary" onclick="fncAddBoardInquiry()">�� &nbsp;��</button>
			<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		</div>
		</div>
			</form>
		</div>
	</div>

</body>

</html>