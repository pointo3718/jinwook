<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container text-center">
		 
		 <nav>
		  <!-- ũ������ :  pagination-lg pagination-sm-->
		  <ul class="pagination" >
		    <!--  <<== ���� nav -->
		  	<c:if test="${ user.pagenationInfo.hasPreviousPage <= resultPage.pageUnit }">
		 		<li class="disabled" onclick="movePage( [[${request.requestURI}]], [[${user.makeQuryString(1)}]] )">
			</c:if>
			<c:if test="${ user.pagenationInfo.currentPage > user.pagenationInfo.pageUnit }">
				<li>
			</c:if>
		      <a href="javascript:fncGetUserList('${ user.pagenationInfo.currentPage-1}')" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    
		    <!--  �߾�  -->
			<c:forEach var="i"  begin="${user.pagenationInfo.beginUnitPage}" end="${user.pagenationInfo.endUnitPage}" step="1">
				
				<c:if test="${ user.pagenationInfo.currentPage == i }">
					<!--  ���� page ����ų��� : active -->
				    <li class="active">
				    	<a href="javascript:fncGetUserList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				    </li>
				</c:if>	
				
				<c:if test="${ user.pagenationInfo.currentPage != i}">	
					<li>
						<a href="javascript:fncGetUserList('${ i }');">${ i }</a>
					</li>
				</c:if>
			</c:forEach>
		    
		     <!--  ���� nav==>> -->
		     <c:if test="${ user.pagenationInfo.endUnitPage >= user.pagenationInfo.maxPage }">
		  		<li class="disabled">
			</c:if>
			<c:if test="${ user.pagenationInfo.endUnitPage < user.pagenationInfo.maxPage }">
				<li>
			</c:if>
		      <a href="javascript:fncGetUserList('${user.pagenationInfo.endUnitPage+1}')" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
</div>
 


<div class="container">
		<nav>
		  <ul class="pager">
		    <li><a href="#">Previous</a></li>
		    <li><a href="#">Next</a></li>
		  </ul>
		</nav>
</div>


<div class="container">
		<nav>
		  <ul class="pager">
		    <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
		    <!-- <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>  -->
		    <li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
		  </ul>
		</nav>
</div>