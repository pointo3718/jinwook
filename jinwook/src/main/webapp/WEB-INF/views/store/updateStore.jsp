<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>ìì ìì </title>

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	/*<![CDATA[*/
</script>

<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.sticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	background: #ffffff;
	z-index: 10;
}

.row {
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

.mytop01 {
	padding-left: 20px;
}

.mytop01-content {
	padding-left: 180px;
	color: #6A8F00;
	display: inline;
}

.blog {
	padding-top: 50px;
}

.blog__sidebar {
	padding-top: 0px;
}

.list-group {
	padding-top: 0px;
}

.blog__sidebar {
	padding-bottom: 430px;
}

.blog__sidebar__item {
	width: 200px;
	/*  body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }  */ / . row { margin-top : 10px;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.id_ok {
	color: #7fad39;
	display: none;
	font-size: 10px;
}

.id_already {
	color: red;
	display: none;
	font-size: 10px;
	text-align: left;
}

.control-label {
	whidth: 250px;
	text-align: center;
	justify-content: center;
}

.site-btn {
	background-color: #7fad39; /* Green */
	border: none;
	color: white;
	width: 200px;
	text-align: center;
	font-size: 20px;
}

.userId {
	width: 300px;
	text-indent: 1em;
}

.ss {
	font-size: 30px;
	justify-content: center;
}

input {
	width: 300px;
	height: 50px;
	text-indent: 1em;
	font-size: 15px;
}

div {
	justify-content: center;
	text-align: center;
	align-items: center;
}

label {
	font-size: 15px;
	justify-content: top;
	text-align: left;
	display: flex;
	align-items: left;
}

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

<script type="text/javascript">




	/*<![CDATA[*/
	function movePage(uri, queryString) {
		location.href = uri + queryString;
	}

	var storeNo = $("input[id='storeNo']").val();
	/*]]>*/

	$(function() {
		$(".list-group-item:contains('ì£¼ë¬¸ ë´ì­')").on("click", function() {
			$(self.location).attr("href", "/admin/blog");
		});
	});

	$(function() {
		$(".list-group-item:contains('ìì  ì ë³´ ìì ')").on("click", function() {
			$(self.location).attr("href", "/store/updateStore?storeNo=10000");
		});
	});

	$(function() {
		$(".list-group-item:contains('ê°ì¸ ì ë³´ ìì ')").on("click", function() {
			//==> DOM Object GET 3ê°ì§ ë°©ë² ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href", "/admin/listComplainAdmin");
		});
	});

	$(function() {
		$(".list-group-item:contains('ìí ë±ë¡')").on(
				"click",
				function() {
					//==> DOM Object GET 3ê°ì§ ë°©ë² ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/store/addStoreProduct?storeNo=10000");
				});
	});

	$(function() {
		$(".list-group-item:contains('ê´ê³  ë±ë¡')").on(
				"click",
				function() {
					//==> DOM Object GET 3ê°ì§ ë°©ë² ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/request/getRequestListForAdmin?reqCode=1");
				});
	});

	$(function() {
		$(".list-group-item:contains('ì§ê°')").on(
				"click",
				function() {
					//==> DOM Object GET 3ê°ì§ ë°©ë² ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/store/getStoreWallet?storeNo=10000");
				});
	});

	$(function() {
		$(".list-group-item:contains('1:1 ë¬¸ìë´ì­')").on(
				"click",
				function() {
					//==> DOM Object GET 3ê°ì§ ë°©ë² ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$(self.location).attr("href",
							"/request/getRequestListForAdmin?reqCode=2");
				});
	});

	//============= "ìì "  Event ì°ê²° =============
	function fncUpdateStore(e) {

		console.log(e);

		const storeNo = $(e).data("value");

		var storeIntro = $("input[id='storeIntro']").val();
		var storePhone = $("input[id='storePhone']").val();
		var storeImage = $("input[id='storeImage']").val();
		var startTime = $("input[id='startTime']").val();
		var endTime = $("input[id='endTime']").val();
		var bank = $("#bank option:selected").val();
		var holiday = $("input[id='holiday']").val();
		var accNo = $("input[id='accNo']").val();

		if (storeIntro == null || storeIntro.length < 1) {
			alert("ìì ìê° ë°ëì ìë ¥íì¬ì¼ í©ëë¤.");
			return;
		}

		if (storePhone == null || storePhone.length < 1) {
			alert("ìí ì íë²í¸ë ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		if (storeImage == null || storeImage.length < 1) {
			alert("ìì ì¬ì§ì ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		if (startTime == null || startTime.length < 1) {
			alert("ìììììê°ì ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		if (endTime == null || endTime.length < 1) {
			alert("ììì¢ë£ìê°ì ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		if (bank == null || bank.length < 1) {
			alert("ìíëªì ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		if (holiday == null || holiday.length < 1) {
			alert("ìì í´ì¼ì ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		if (accNo == null || accNo.length < 1) {
			alert("ê³ì¢ë²í¸ë ë°ëì ìë ¥íìì¼ í©ëë¤.");
			return;
		}

		$.ajax({
			url : "updateStore/" + storeNo + "/" + storeIntro + "/"
					+ storePhone + "/" + storeImage + "/" + startTime + "/"
					+ endTime + "/" + holiday + "/" + bank + "/" + accNo,
			dataType : "json",
			method : "POST",
			data : {

			},
			success : function(result) {
				if (result != null) {
					alert("ìì  ìë£ëììµëë¤.");
					self.location = "updateStore?storeNo=" + storeNo;
				}
			}

		});

	}
</script>


</head>

<body>


	<!-- Header Begin -->
	<jsp:include page="../layout/top.jsp" />
	<!-- Header End -->

	<!-- ceoTop Section Begin -->
	<jsp:include page="../layout/ceoTop.jsp" />
	<!-- ceoTop Section End -->

	<!-- ceoLeft Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row" style="justify-content: space-around;">
				<div class="col-xs-4 col-xs-5"
					style="width: 200px; margin-right: 30px;">
					<div class="blog__sidebar" style="width: 200px;">

						<div class="blog__sidebar__item">

							<h5 class="text-center" style="margin-bottom: 0px;">
								<strong>ì¬ì¥ë íì´ì§</strong>
							</h5>
							<br />



							<div class="list-group text-center" style="font-size: 15px;">
								<button type="button"
									class="list-group-item list-group-item-action"
									aria-current="true">ì£¼ë¬¸ ë´ì­</button>
								<button type="button"
									class="list-group-item list-group-item-action">ìì  ì ë³´
									ìì </button>
								<button type="button"
									class="list-group-item list-group-item-action" class="addStore">
									<span class="addStore">ê°ì¸ ì ë³´ ìì </span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="deleteStore">ìí ë±ë¡</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="refundStore">ê´ê³  ë±ë¡</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">ë´ê° í ìì²­</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">
									<span class="adStore">ì§ê°</span>
								</button>
								<button type="button"
									class="list-group-item list-group-item-action">1:1
									ë¬¸ìë´ì­</button>
							</div>

						</div>


					</div>
				</div>

				<!-- ìì  ì ë³´ ìì  Begin-->
				<div>
					<h4 class="text-left">
						<strong>ìì  ì ë³´ ìì </strong>

						<hr size="10px">
					</h4>

					<c:forEach var="store" items="${storeInfo}" begin="0" end="0">


						<table class="table table-hover"
							style="width: 730px; heigh: 300px;">

							<form class="form-horizontal" id="profileUpdate">


								<div class="form-group row">
									<label for="colFormLabel"
										class="col-sm-2 col-form-label col-form-label">ìì ì´ë¦</label>
									<div class="col-sm-6">
										<input type="text" name="storeName"
											class="form-control form-control" id="storeName"
											value="${store.storeName}" placeholder="ìì ì´ë¦" readonly>
									</div>
								</div>


								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì ìì¢</label>
									<div class="col-sm-6">
										<input type="email" name="storeType"
											class="form-control form-control" id="storeType"
											value="
											
											<c:if test="${store.storeType.trim()=='1'}">
                								ì ì¡         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='2'}">
                								ìì°         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='3'}">
                								ì±ì         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='4'}">
                								ê³¼ì¼         
            								</c:if>
            								<c:if test="${store.storeType.trim()=='5'}">
                								ì¢í©         
            								</c:if>"
											placeholder="ìì ìì¢" readonly>
									</div>
								</div>



								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì ì£¼ì</label>
									<div class="col-sm-6">
										<input type="text" name="storeAddr"
											class="form-control form-control" id="storeAddr"
											value="${store.storeAddr}" placeholder="ìì ì£¼ì" readonly>
									</div>
								</div>



								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì ììë ì§</label>
									<div class="col-sm-6">
										<input type="text" name="storeStart"
											class="form-control form-control" id="storeStart"
											value="${store.storeStart}" placeholder="ìì ììë ì§" readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì ìê°</label>
									<div class="col-sm-6">
										<input type="text" name="storeIntro"
											class="form-control form-control" id="storeIntro"
											value="${store.storeIntro}" placeholder="ìì ìê°">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì ì íë²í¸</label>
									<div class="col-sm-6">
										<input type="text" name="storePhone"
											class="form-control form-control" id="storePhone"
											value="${store.storePhone}" placeholder="ìì ì íë²í¸">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì ì¬ì§</label>
									<div class="col-sm-6">
										<input type="text" name="storeImage"
											class="form-control form-control" id="storeImage"
											value="${store.storeImage}" placeholder="ìì ì¬ì§">
									</div>
								</div>
								
								    <form method="post" th:action="@{/upload}" enctype="multipart/form-data">

								<span class="btn btn-default btn-file"
									style="padding-left: 260px; padding-bottom: 15px;"> ì¬ì§ë³ê²½
									<input type="file" name="file">
								</span>
								</form>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìììììê°</label>
									<div class="col-sm-6">
										<input type="time" name="startTime"
											class="form-control form-control" id="startTime"
											value="${store.startTime}" placeholder="ìììììê°">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ììì¢ë£ìê°</label>
									<div class="col-sm-6">
										<input type="time" name="endTime"
											class="form-control form-control" id="endTime"
											value="${store.endTime}" placeholder="ììì¢ë£ìê°">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìì í´ë¬´ì¼</label>
									<div class="col-sm-6">
										<input type="text" name="holiday"
											class="form-control form-control" id="holiday"
											value="${store.holiday}" placeholder="ìì í´ë¬´ì¼">
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label"
										style="padding-right: 4px;">ì¬ììë±ë¡ë²í¸</label>
									<div class="col-sm-6">
										<input type="text" name="businessNo"
											class="form-control form-control" id="businessNo"
											value="${store.user.businessNo}" placeholder="ì¬ììë±ë¡ë²í¸"
											readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ììì ê³ ì¦</label>
									<div class="col-sm-6">
										<input type="text" name="businessCard"
											class="form-control form-control" id="businessCard"
											value="${store.businessCard}" placeholder="ììì ê³ ì¦" readonly>
									</div>
								</div>

								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ìíëª</label>
									<div class="col-sm-6" style="padding-left: 0px;">
										<div class="col-sm-6">			
											<select id="bank">
											<option>${store.bank}</option>
												<option>ì¹´ì¹´ì¤ë±í¬</option>
												<option>ëí</option>
												<option>ì í</option>
												<option>IBKê¸°ì</option>
												<option>íë</option>
												<option>ì°ë¦¬</option>
												<option>êµ­ë¯¼</option>
												<option>SCì ì¼</option>
												<option>ëêµ¬</option>
												<option>ë¶ì°</option>
												<option>ê´ì£¼</option>
												<option>ìë§ìê¸ê³ </option>
												<option>ê²½ë¨</option>
												<option>ì ë¶</option>
												<option>ì ì£¼</option>
												<option>ì°ì</option>
												<option>ì°ì²´êµ­</option>
												<option>ì í</option>
												<option>ìí</option>
												<option>ì¨í°</option>
												<option>ì¼ì´ë±í¬</option>
												<option>í ì¤ë±í¬</option>
												<option>ì°ë¦¼ì¡°í©</option>
												<option>ì ì¶ìí</option>
											</select>
										</div>
									</div>
								</div>


								<div class="form-group row">
									<label for="colFormLabelLg"
										class="col-sm-2 col-form-label col-form-label">ê³ì¢ë²í¸</label>
									<div class="col-sm-6">
										<input type="text" name="accNo"
											class="form-control form-control" id="accNo"
											value="${store.accNo}" placeholder="ê³ì¢ë²í¸">
									</div>
								</div>



							</form>



						</table>

						<!-- ìì  ì ë³´ ìì  End-->
						<!-- ìì , ì­ì ì ì²­ ë²í¼ Begin -->

						<hr size="10px">

						<div style="padding-left: 320px;">
							<button type="button" id="button" class="btn btn-outline-success"
								data-value="${store.storeNo}" onClick="fncUpdateStore(this)">
								ìì </button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" id="confirmStart" class="btn btn-outline-danger">ìì ì­ì ì ì²­</button>
							<input type="hidden" id="storeno" value="${param.storeNo}" />
							<input type="hidden" id="userid" value="${sessionScope.user.userId}" />
						</div>
						<!-- ìì , ì­ì ì ì²­ ë²í¼ End -->
					</c:forEach>
				</div>





			</div>
			<div class="text-center"></div>
		</div>

	</section>
	<!-- ceoLeft Section End -->
	<!-- Blog Section End -->

	<!-- Footer Begin -->
	<jsp:include page="../layout/footer.jsp" />
	<!-- Footer End -->
<script>

var USERID;
var STOREID;

$().ready(function () {
    $("#confirmStart").click(function () {
    	
    	STORENO = $("input[id='storeno']").val();
    	USERID = $("input[id='userid']").val();
    		alert(STORENO);
    		alert(USERID);
        Swal.fire({
            title: 'ì ë§ë¡ ê·¸ë ê² íìê² ìµëê¹?',
            text: "ë¤ì ëëë¦´ ì ììµëë¤. ì ì¤íì¸ì.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'ì­ì  ì ì²­',
            cancelButtonText: 'ì·¨ì'
        }).then((result) => {
            if (result.isConfirmed) {
            	
            	fncAddRequestDeleteStore();	
            
                Swal.fire(
                    'ì­ì  ì ì²­ì´ ìë£ëììµëë¤.',
                    'íëíìë¤ì~!',
                    'success'
                )
            }
        })
    });
});



/////////////////// ìì  ì­ì  ì ì²­ /////////////////////
function fncAddRequestDeleteStore() {
       
			var uri = "/request/addRequestDeleteStore/" + USERID +"/" +STORENO;
	
			var headers = {"Content-Type": "application/json", "X-HTTP-Method-Override": "POST"};

				$.ajax({
					url: uri,
					type: "POST",
					headers: headers,
					dataType: "json",
					
					success: function(response) {
										
						if (response.result == true) {
							return true;
						}
						swal(response.message, "", "error");
						
					},
					error: function(xhr, status, error) {
						alert("ìë¬ê° ë°ìíììµëë¤.");
						return false;
					}
				
				});
	}
	
/////////////////// ìì  ì­ì  ì ì²­ ë /////////////////////

</script>
</body>

</html>