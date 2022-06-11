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
 /*
 * start of file css
 */
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
.filebox.bs3-primary .col-sm-10>label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}
.filebox .col-sm-10>label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	font-weight: 600;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
.filebox .upload-name {
	display: inline-block;
	width: 350px;
	padding: .5em .75em;
	/* label�� �е����� ��ġ */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	/* ����Ƽ�� ���� ���߱� */
	-moz-appearance: none;
	appearance: none;
}
/*
 * end of file css
 */
     </style>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

function registerBoard(form) {

	form.noticeYn.value = form.noticeYn.checked == false ? 'N' : 'Y';
	form.secretYn.value = form.secretYn.checked == false ? 'N' : 'Y';

	var result = (
			   isValid(form.title, "����", null, null)
			&& isValid(form.writer, "�̸�", null, null)
			&& isValid(form.content, "����", null, null)
	);

	if ( result == false ) {
		return false;
	}
}
/*[- end of function -]*/
 
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
<form class="form-horizontal" method="post" enctype="multipart/form-data" onsubmit="return registerBoard(this)">
	<div class="container">
		<div class="row">
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
			<c:choose>
				<c:when test="${board.boardInqStatus == false}">
					�亯�����
				</c:when>
				<c:otherwise>
					�亯 �Ϸ�
				</c:otherwise>
			</c:choose>
		<hr/>  
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<!-- <a href="<c:url value='/board/addBoardInquiry'/>" role="button" class="btn btn-outline-info">�۾���</a> -->
		    <button type="button" class="btn btn-primary" onclick="fncAddBoardInquiry()">�� &nbsp;��</button>
			<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		</div>
		</div>
		</div>
	</div>

<div class="container">
	<div class="form-group">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			1:1���� �亯
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br></td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="������ �����ϴ� ����� ����ô�." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="��� �ۼ�"></td>
				</tr>
			</table>
	</div>
</div>

<!--/* ����� ������ ���� ���� ���� */-->
<div data-name="fileDiv" class="form-group filebox bs3-primary">
	<div class="col-sm-10">
		<input type="text" class="upload-name" value="���� ã��" readonly />
		<label for="file_0" class="control-label">ã�ƺ���</label> 
		<input multiple="multiple" type="file" name="files" id="file_0" class="upload-hidden" onchange="changeFilename(this)" />

	</div>
</div>


</form>
</body>

</html>