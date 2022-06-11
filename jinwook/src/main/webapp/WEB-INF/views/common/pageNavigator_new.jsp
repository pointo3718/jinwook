<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="col-lg-12" style="left:120px; margin-top:70px;">


<c:set var="params" value="${orders}"/>
<c:if test="${params == null}">
<c:set var="params" value="${jpay}"/>
</c:if>      
<c:if test="${params == null}">
<c:set var="params" value="${notice}"/>
</c:if>      
<c:if test="${params == null}">
<c:set var="params" value="${user}"/>
</c:if>      
<c:if test="${params == null}">
<c:set var="params" value="${store}"/>
</c:if>      
<c:if test="${params == null}">
<c:set var="params" value="${coupon}"/>
</c:if>      
<c:if test="${params == null}">
<c:set var="params" value="${request}"/>
</c:if>      
<c:if test="${params == null}">
<c:set var="params" value="${board}"/>
</c:if>      

   <c:if test="${params != null and params.paginationInfo.totalRecordCount>0}">
      <div class="product__pagination blog__pagination" style="padding-top: 0px;">
            <!--  <<== 좌측 nav -->
           <%--  <c:if test="${ params.paginationInfo.hasPreviousPage == false }">
               <li>
            </c:if>
            <c:if test="${ params.paginationInfo.hasPreviousPage == true  }">
               <li
                  onclick="javascript:void(0);">
            </c:if> --%>
            <a   
               href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(1)}');"
               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
            </a>
           

            <!--  <== 좌측 nav -->
            <%-- <c:if test="${ params.paginationInfo.hasPreviousPage == false }">
               <li>
            </c:if>
            <c:if test="${ params.paginationInfo.hasPreviousPage == true  }">
               <li
                  onclick="javascript:void(0);">
            </c:if> --%>
            <a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.firstPage-1)}');" aria-label="Previous"> <span
               aria-hidden="true">&lsaquo;</span>
            </a>
           


            <!--  중앙  나중에 .....-->
            <c:forEach var="pageNo" begin="${params.paginationInfo.firstPage}"
               end="${params.paginationInfo.lastPage}" step="1">

               <c:if test="${ pageNo == params.currentPageNo }">
                  <!--  현재 page 가르킬경우 : active -->
                  <a
                     href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(pageNo)}');">${ pageNo }
                        <span class="sr-only">(current)</span>
                  </a>
               </c:if>

               <c:if test="${ pageNo != params.currentPageNo }">
                  <a
                     href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(pageNo)}');">${ pageNo }</a>
                  
               </c:if>
            </c:forEach>

            <!--  <== 우측 nav -->
            <%-- <c:if test="${ params.paginationInfo.hasNextPage == false }">
               <li>
            </c:if>
            <c:if test="${ params.paginationInfo.hasNextPage == true  }">
               <li
                  onclick="javascript:void(0);">
            </c:if> --%>
            <a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.lastPage+1)}');" aria-label="Next"> <span
               aria-hidden="true">&rsaquo;</span>
            </a>
            


            <!--  <<== 우측 nav -->
          <%--   <c:if test="${ params.paginationInfo.hasNextPage == false }">
               <li>
            </c:if>
            <c:if test="${ params.paginationInfo.hasNextPage == true  }">
               <li
                  onclick= "javascript:void(0);">
            </c:if> --%>
            <a href="javascript:movePage('${requestScope['javax.servlet.forward.request_uri']}', '${params.makeQueryString(params.paginationInfo.totalPageCount)}');" aria-label="Next"> <span
               aria-hidden="true">&raquo;</span>
            </a>
          
        </div>
       
   </c:if> 
</div>