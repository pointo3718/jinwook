<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script type="text/javascript">
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button.btn.btn-primary").on("click", function() {
			fncAddProduct();
		});
	});

	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click", function() {
			history.go(-1);
		});
	});

	function fncAddProduct() {

		var name = $("input[name='prodName']").val();
		var price = $("input[name='price']").val();
		var prodInfo = $("input[name='prodInfo']").val();
		var prodImg = $("input[name='prodImg']").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		if (prodInfo == null || prodInfo.length < 1) {
			alert("상품소개는 반드시 입력하셔야 합니다.");
			return;
		}
		if (prodImg == null || prodImg.length < 1) {
			alert("상품사진은 반드시 입력하셔야 합니다.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/store/addStoreProduct")
				.submit();
	}
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
		<div class="container">
			<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		</div>
	</div>
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<h1 class="bg-primary text-center">상 품 등 록</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">


			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<input type="prodName" class="form-control" id="prodName"
						name="prodName" placeholder="상품명">
				</div>
			</div>


			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="price" class="form-control" id="price"
						name="price" placeholder="상품상세정보">
				</div>
			</div>


			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품소개</label>
				<div class="col-sm-4">
					<input type="prodInfo" class="form-control" id="prodInfo"
						name="prodInfo" placeholder="상품소개">
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품사진</label>
				<div class="col-sm-4">
					<input type="prodImg" class="form-control" id="prodImg"
						name="prodImg" placeholder="상품사진">
				</div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품원산지</label>
				<div class="col-sm-4">
					<input type="prodOrign" class="form-control" id="prodOrign"
						name="prodOrign" placeholder="상품원산지">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">등&nbsp;록</button>
					<a class="btn btn-primary btn" href="#" role="button">이&nbsp;전</a>
				</div>
			</div>
			
			<input type="hidden" id="storeNo" name="storeNo" value="10000"/>
		
		<!-- form Start /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>