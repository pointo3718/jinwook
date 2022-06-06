<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//============= "����"  Event ���� =============
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary").on("click", function() {
			fncUpdateProduct();
		});
	});

	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			history.go(-1);
		});
	});

	///////////////////////////////////////////////////////////////////////
	function fncUpdateProduct() {

		//Form ��ȿ�� ����
		//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;

		var name = $("input[name='prodName']").val();
		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}

		var detail = $("input[name='prodDetail']").val();
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		var manuDate = $("input[name='manuDate']").val();
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		var price = $("input[name='price']").val();
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		//document.detailForm.action='/product/updateProduct';
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action",
				"/product/updateProduct").submit();
	}
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-center">
			<h3 class=" text-info">��ǰ��������</h3>
			<h5 class="text-muted">
				��ǰ ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.
			</h5>
		</div>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id=""prodNo"" name="prodNo" value="${product.prodNo }" placeholder="��ǰ��ȣ"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">��ǰ��ȣ�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>


			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName"
						name="prodName" value="${product.prodName}" placeholder="�����ǰ��">
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail"
						name="prodDetail" value="${product.prodDetail}"
						placeholder="�����ǰ������">
				</div>
			</div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<input type="text" id="datePicker" class="form-control"
						id="manuDate" name="manuDate" value="${product.manuDate}"
						placeholder="��������">
				</div>
			</div>

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
				
			</script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js">
				
			</script>
			<script type="text/javascript">
				$('#datePicker').datepicker({
					format : "yyyy-mm-dd", // �޷¿��� Ŭ���� ǥ���� �� ����
					language : "kr" // ���(js �߰��� �ʿ��ϴ�.)
				});

				$('#click-btn').on('click', function() {
					var date = $('#dateRangePicker').val();
					alert(date);
				});
			</script>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						value="${product.price}" placeholder="���氡��">
				</div>
			</div>

			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fileName"
						name="fileName" value="${product.fileName}" placeholder="�����ǰ�̹���">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>