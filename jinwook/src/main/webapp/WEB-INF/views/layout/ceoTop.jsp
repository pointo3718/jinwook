<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<html lang="ko">

<title>ceoTop</title>

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
	align-items: flex-start
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

.list-group {
	padding-top: 0px;
}

.blog__sidebar {
	align-items: flex-start;
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
</head>


<body>

	<!-- ceoTop Section Begin -->
	<section class="breadcrumb-section set-bg"
		style="background-color: #F2F2F2">
		<c:forEach var="store" items="${storeInfo}" begin="0" end="0">
			<div class="container">
				<div class="row my-1">
					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">${store.user.userName} 사장님</strong> </br> </br>
							<h6 class="mytop01"><strong>진욱이네와 처음 만난 날</strong>&nbsp;&nbsp;<i class="fa fa-heartbeat" aria-hidden="true" style="font-size:30px;"></i></h6>
							<div class="mytop01-content"><span style="font-size:20px;">${store.user.regDate}</span></div>
							</br> </br>

						</div>
					</div>

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">진욱페이</strong> </br> </br>
							<div class="mytop01-content"><span style="font-size:35px;">${store.user.jpBalance}</span>원</div>
							</br> </br>

						</div>
					</div>

					<div class="col-4">
						<div class="bg-white text-black mx-3">

							</br> <strong class="mytop01">${store.storeName}</strong> </br> </br>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-success btn-sm active"> <input
									type="radio" name="options" id="option1" checked> 오픈
								</label> <label class="btn btn-danger btn-sm"> <input
									type="radio" name="options" id="option2"> 마감
								</label>
							</div>
							</br>
							<div class="mytop01-content"><span style="font-size:15px;"><strong>${store.storeAddr}</strong></span></div>

							</br> </br>

						</div>
					</div>
				</div>

			</div>
			<!-- /container -->
		</c:forEach>
	</section>
	<!-- ceoTop Section End -->

</body>
</html>