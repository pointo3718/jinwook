<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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

<script type="text/javascript">

var commentNo = ${comment.commentNo};

function updateCommentReco() {
	$.ajax({
		type : "POST",
		url : "updateCommentReco",
		dataType : "json",
		data : {'commentNo' : commentNo},
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
	
	<div class="page-header">
	       <h3 class=" text-info">1:1���� ��</h3>
	    </div>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>1:1���� ����</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardTitle}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>1:1���� ����</strong></div>
			<div class="col-xs-7 col-md-5">${board.boardContent}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-5 col-md-3"><strong>�ۼ���</strong></div>
			<div class="col-xs-7 col-md-5">${user.userId}</div>
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
			<!-- <div class="col-xs-7 col-md-5">${board.boardInqStatus}</div> -->
		</div>
		<hr/>
		
		 <!--                     �߰�                         -->
    <!--  ���  -->
    <div class="container">
        <label for="content">�亯</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${board.boardNo}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="������ �Է��ϼ���.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">���</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
</div>
	<hr/>
	<div id="btnDiv" style="margin-right:1px;">
		<button type="button" class="btn btn-warning" id="reco_btn" onclick="updateCommentReco();">��õ ${comment.recommendCount}</button>
		<button type="button" class="btn btn-danger" id="hate_btn">����õ</button>
	</div>

</body>

</html>