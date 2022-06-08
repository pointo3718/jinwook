<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container text-center">
	<c:set var="param" value="${user}"/>
	<c:if test="${user != null and user.paginationInfo.totalRecordCount>0}">
		<nav>
			<!-- ũ������ :  pagination-lg pagination-sm-->
			<ul class="pagination">
				<!--  <<== ���� nav -->
				<c:if test="${ user.paginationInfo.hasPreviousPage == false }">
					<li>
				</c:if>
				<c:if test="${ user.paginationInfo.hasPreviousPage == true  }">
					<li
						onclick="javascript:void(0);">
				</c:if>
				<a	
					href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${user.makeQueryString(1)}');"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a>
				</li>

				<!--  <== ���� nav -->
				<c:if test="${ user.paginationInfo.hasPreviousPage == false }">
					<li>
				</c:if>
				<c:if test="${ user.paginationInfo.hasPreviousPage == true  }">
					<li
						onclick="javascript:void(0);">
				</c:if>
				<a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${user.makeQueryString(user.paginationInfo.firstPage-1)}');" aria-label="Previous"> <span
					aria-hidden="true">&lsaquo;</span>
				</a>
				</li>


				<!--  �߾�  ���߿� .....-->
				<c:forEach var="pageNo" begin="${user.paginationInfo.firstPage}"
					end="${user.paginationInfo.lastPage}" step="1">

					<c:if test="${ pageNo == user.currentPageNo }">
						<!--  ���� page ����ų��� : active -->
						<li class="active"><a
							href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${user.makeQueryString(pageNo)}');">${ pageNo }
								<span class="sr-only">(current)</span>
						</a></li>
					</c:if>

					<c:if test="${ pageNo != user.currentPageNo }">
						<li><a
							href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${user.makeQueryString(pageNo)}');">${ pageNo }</a>
						</li>
					</c:if>
				</c:forEach>

				<!--  <== ���� nav -->
				<c:if test="${ user.paginationInfo.hasNextPage == false }">
					<li>
				</c:if>
				<c:if test="${ user.paginationInfo.hasNextPage == true  }">
					<li
						onclick="javascript:void(0);">
				</c:if>
				<a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${user.makeQueryString(user.paginationInfo.lastPage+1)}');" aria-label="Next"> <span
					aria-hidden="true">&rsaquo;</span>
				</a>
				</li>


				<!--  <<== ���� nav -->
				<c:if test="${ user.paginationInfo.hasNextPage == false }">
					<li>
				</c:if>
				<c:if test="${ user.paginationInfo.hasNextPage == true  }">
					<li
						onclick= "javascript:void(0);">
				</c:if>
				<a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${user.makeQueryString(user.paginationInfo.totalPageCount)}');" aria-label="Next"> <span
					aria-hidden="true">&raquo;</span>
				</a>
				</li>

			</ul>
		</nav>
	</c:if>
</div>
