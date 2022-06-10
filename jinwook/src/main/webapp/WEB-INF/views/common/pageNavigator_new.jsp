<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type = "text/javascript">
</script>

<div class="container text-center">
	<c:set var="params" value="${store}"/>
	<c:if test="${params != null and params.paginationInfo.totalRecordCount>0}">
		<nav>
			<!-- ũ������ :  pagination-lg pagination-sm-->
			<ul class="pagination">
				<!--  <<== ���� nav -->
				<c:if test="${ params.paginationInfo.hasPreviousPage == false }">
					<li>
				</c:if>
				<c:if test="${ params.paginationInfo.hasPreviousPage == true  }">
					<li
						onclick="javascript:void(0);">
				</c:if>
				<a	
					href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(1)}');"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a>
				</li>

				<!--  <== ���� nav -->
				<c:if test="${ params.paginationInfo.hasPreviousPage == false }">
					<li>
				</c:if>
				<c:if test="${ params.paginationInfo.hasPreviousPage == true  }">
					<li
						onclick="javascript:void(0);">
				</c:if>
				<a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.firstPage-1)}');" aria-label="Previous"> <span
					aria-hidden="true">&lsaquo;</span>
				</a>
				</li>


				<!--  �߾�  ���߿� .....-->
				<c:forEach var="pageNo" begin="${params.paginationInfo.firstPage}"
					end="${params.paginationInfo.lastPage}" step="1">

					<c:if test="${ pageNo == params.currentPageNo }">
						<!--  ���� page ����ų��� : active -->
						<li class="active"><a
							href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(pageNo)}');">${ pageNo }
								<span class="sr-only">(current)</span>
						</a></li>
					</c:if>

					<c:if test="${ pageNo != params.currentPageNo }">
						<li><a
							href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(pageNo)}');">${ pageNo }</a>
						</li>
					</c:if>
				</c:forEach>

				<!--  <== ���� nav -->
				<c:if test="${ params.paginationInfo.hasNextPage == false }">
					<li>
				</c:if>
				<c:if test="${ params.paginationInfo.hasNextPage == true  }">
					<li
						onclick="javascript:void(0);">
				</c:if>
				<a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.lastPage+1)}');" aria-label="Next"> <span
					aria-hidden="true">&rsaquo;</span>
				</a>
				</li>


				<!--  <<== ���� nav -->
				<c:if test="${ params.paginationInfo.hasNextPage == false }">
					<li>
				</c:if>
				<c:if test="${ params.paginationInfo.hasNextPage == true  }">
					<li
						onclick= "javascript:void(0);">
				</c:if>
				<a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.totalPageCount)}');" aria-label="Next"> <span
					aria-hidden="true">&raquo;</span>
				</a>
				</li>

			</ul>
		</nav>
	</c:if>
</div>
