<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
 
<html lang="ko">
	
<head>


<meta charset="EUC-KR">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
  <script type = "text/javascript">
  
  	/*<![CDATA[*/

	function movePage(uri, queryString) {
		location.href = uri + queryString;
	}

	/*]]>*/
  
  ////////////////  블랙리스트 REST API //////////////// 
	$(function() {
		printBlackList();
	});

	function printBlackList() {

		var uri = "/admin/listBlacklistAdmin"; 
		/*[[ @{/admin/listBlacklistAdmin} ]]*/

		$.get(uri, function(response) {
				var blacklistHtml = "";
				
				$(response.blacklist).each(function(user) {
					blacklistHtml += `
						
							<td class="name">${user.userId}</td>
							<td class="desc">${user.userName}</td>
						
					`;
				});

				$(".userlist").html(blacklistHtml);
			
		}, "json");
	}
	/*[- end of function -]*/
  </script>

</head>
<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상점목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
	    <button id="blacklist" onclick="">블랙리스트</button>
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default\">검색</button>

				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ID</th>
            <th align="left">이름</th>
            <th align="left">휴대전화번호</th>
            <th align="left">${storeList[0].user.phone}</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="store" items="${storeList}">
			<c:set var="i" value="${ i+1 }" />
			
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인"><a href="/admin/getUserAdmin?userId=${store.storeNo}">${store.storeNo}</a></td>
			  <td align="left">${store.storeName}</td>
			  <td align="left">${store.user.userName}</td>
			  <td align="left">${store.storePhone}</td>
			</tr>
          </c:forEach>

        </tbody>
      
      </table>

      
      <table>
      <tbody class="userlist">
      </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>