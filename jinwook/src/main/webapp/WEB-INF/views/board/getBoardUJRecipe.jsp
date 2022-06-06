<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>getBoardUJRecipe</title>
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
			alert("통신 에러");
		},
		success : function(recoCheck) {
			if (recoCheck == 0) {
				alert("추천 완료!");
				location.reload();
			}
			else if (recoCheck == 1) {
				alert("추천 취소!");
				location.reload();
			}
		}
		
	});
}

</script>

</head>

<body>

<h1>Test Complete!</h1>

<div style="margin-right:1px;">
	<button type="button" class="btn btn-warning" id="reco_btn" onclick="updateRecipeReco()">추천 ${recipe.recommendCount}</button>
	<button type="button" class="btn btn-danger" id="hate_btn">비추천</button>
</div>


</body>

</html>