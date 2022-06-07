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

var rcpNo = ${recipe.rcpNo};
var userId = ${user.userId};

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

function addFile() {

	const fileDivs = $('div[data-name="fileDiv"]');
	if (fileDivs.length > 2) {
		alert('������ �ִ� �� ������ ���ε� �� �� �ֽ��ϴ�.');
		return false;
	}

	document.getElementById('changeYn').value = 'Y';
	fileIdx++;

	const fileHtml = `
		<div data-name="fileDiv" class="form-group filebox bs3-primary">
			<label for="file_${fileIdx}" class="col-sm-2 control-label"></label>
			<div class="col-sm-10">
				<input type="text" class="upload-name" value="���� ã��" readonly />
				<label for="file_${fileIdx}" class="control-label">ã�ƺ���</label>
				<input type="file" name="files" id="file_${fileIdx}" class="upload-hidden" onchange="changeFilename(this)" />

				<button type="button" onclick="removeFile(this)" class="btn btn-bordered btn-xs visible-xs-inline visible-sm-inline visible-md-inline visible-lg-inline">
					<i class="fa fa-minus" aria-hidden="true"></i>
				</button>
			</div>
		</div>
	`;

	$('#btnDiv').before(fileHtml);
}

function removeFile(elem) {
	document.getElementById('changeYn').value = 'Y';
	
	const prevTag = $(elem).prev().prop('tagName');
	if (prevTag === 'BUTTON') {
		const file = $(elem).prevAll('input[type="file"]');
		const filename = $(elem).prevAll('input[type="text"]');
		file.val('');
		filename.val('���� ã��');
		return false;
	}

	const target = $(elem).parents('div[data-name="fileDiv"]');
	target.remove();
}

function changeFilename(file) {
	document.getElementById('changeYn').value = 'Y';

	file = $(file);
	const filename = file[0].files[0].name;
	const target = file.prevAll('input');
	target.val(filename);
}

</script>

</head>

<body>

<form name="detailForm" method="post" enctype="multipart/form-data">
<div class="container">
<div class="page-header">
	       <h3 class=" text-info">�������� ��</h3>
	    </div>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>�������� ����</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardTitle}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>�������� ����</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardContent}</div>
		</div>
		<hr/>
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
		</div>
		<hr/>
<div data-name="fileDiv" class="form-group filebox bs3-primary">
	<label for="file_0" class="col-sm-2 control-label">���� ÷��</label>
	<div class="col-sm-10">
		<input type="text" class="upload-name" value="���� ã��" readonly />
		<label for="file_0" class="control-label">ã�ƺ���</label>
		<input type="file" name="files" id="file_0" class="upload-hidden" onchange="changeFilename(this)" />
	
		<button type="button" onclick="addFile()" class="btn btn-warning">
			<i class="fa fa-plus" aria-hidden="true">add</i>
		</button>
		<button type="button" onclick="removeFile(this)" class="btn btn-danger">
			<i class="fa fa-minus" aria-hidden="true">remove</i>
		</button>
	</div>
</div>
</div>
</form>
 	
<h1>Test Complete!</h1>

<div id="btnDiv" style="margin-right:1px;">
	<button type="button" class="btn btn-warning" id="reco_btn" onclick="updateRecipeReco(); return false;">��õ ${recipe.getRecommendCount}</button>
	<button type="button" class="btn btn-danger" id="hate_btn">����õ</button>
</div>
	
</body>

</html>