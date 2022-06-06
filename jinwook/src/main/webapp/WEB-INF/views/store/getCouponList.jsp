<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action",
				"/product/listProduct?menu=${menu}").submit();
	}
	//===========================================//

       $(function() {
          //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
          $( "button.btn.btn-default" ).on("click" , function() {
            fncGetUserList(1);
         });
       });


	
	<c:if test= "${param.menu=='manage'}" >	
    $(function() {
        
        //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $( "td:nth-child(2)" ).on("click" , function() {
            self.location ="/product/updateProduct?prodNo="+ $(this).attr("prodNo");
        });
                 
        //==> prodNo LINK Event End User ���� ���ϼ� �ֵ��� 
        $( "td:nth-child(2)" ).css("color" , "red");
        
     }); 
    </c:if>

	<c:if test= "${param.menu=='search'}" >
	$(function() {

		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("td:nth-child(2)").on(
				"click",
				function() {
					self.location = "/product/getProduct?prodNo="
							+ $(this).attr("prodNo");
				});

		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$("td:nth-child(2)").css("color", "red");

	});
	</c:if>
	

    $(function() {
        
        //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $(  "td:nth-child(6) > i" ).on("click" , function() {

              var prodNo = $(this).next().val();
           
              $.ajax( 
                    {
                       url : "/product/json/getProduct/"+prodNo ,
                       method : "GET" ,
                       dataType : "json" ,
                       headers : {
                          "Accept" : "application/json",
                          "Content-Type" : "application/json"
                       },
                       success : function(JSONData , status) {

                          var displayValue = "<h6>"
                  							+"��ǰ��ȣ    : "+JSONData.prodNo+"<br/>"
              								 +"��ǰ��       : "+JSONData.prodName+"<br/>"
              				 				+"��ǰ�̹���    : "+JSONData.fileName+"<br/>"
              				 				+"��ǰ��������    : "+JSONData.prodDetail+"<br/>"
               								+"����       : "+JSONData.price+"<br/>"
                                            +"</h6>";
                          					$("h6").remove();
                          					$( "#"+JSONData.prodNo+"" ).append(displayValue);
                       }
                 });
                 ////////////////////////////////////////////////////////////////////////////////////////////
        });
        
        //==> prodNo LINK Event End User ���� ���ϼ� �ֵ��� 
        $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
        $("h7").css("color" , "red");
        
        //==> �Ʒ��� ���� ������ ������ ??
        $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
     });   
    
    $(function () {	//ȭ�� �ε��� ����
		$("#searchKeyword").autocomplete({  //���� ���ø�Ʈ ����
			source: ["������","���弼Ʈ","������","�����","����ī","������","��Ʈ���ݸ�","�ε鷹","��Ʈ","����ǹ���","�α���","���ѹα�"],	// source�� data.js���� ������ List �迭
			focus : function(event, ui) { // ����Ű�� �ڵ��ϼ��ܾ� ���� �����ϰ� �������	
				return false;
			},
			minLength: 1,// �ּ� ���ڼ�
			delay: 100,	//autocomplete ������ �ð�(ms)
			//disabled: true, //�ڵ��ϼ� ��� ����
		});
	});
  
  </script>


</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-info">
			<h3>��ǰ�����ȸ</h3>
		</div>

		<!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>����</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">�˻�</button>

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">��ǰ��</th>
					<th align="left">����</th>
					<th align="left">�����</th>
					<th align="left">�������</th>
					<th align="left">��������</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="left" title="Click : ��ǰ ������ Ȯ��"
							prodNo="${product.prodNo}">${product.prodName}</td>
						<td align="left">${product.price}</td>
						<td align="left">${product.regDate}</td>
						<td align="left">

			<c:if test= "${param.menu=='search'}" >
				<c:if test= "${product.proTranCode.trim()=='0'}" >
				 	�Ǹ���				
				</c:if>
				<c:if test="${product.proTranCode.trim()!='0'}">
					������
				</c:if>
			</c:if>
			
			<c:if test= "${param.menu=='manage'}" >
				<c:if test="${product.proTranCode.trim()=='0'}">
					�Ǹ���
				</c:if>
				<c:if test="${product.proTranCode.trim()=='1'}">
					���ſϷ�&nbsp;<a href="/purchase/updateTranCode?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>
				</c:if>
				<c:if test="${product.proTranCode.trim()=='2'}">
					�����
				</c:if>
				<c:if test="${product.proTranCode.trim()=='3'}">
					��ۿϷ�
				</c:if>
			</c:if>

						</td>
						<td align="left"><i class="glyphicon glyphicon-ok"
							id="${product.prodNo}"></i> <input type="hidden"
							value="${product.prodNo}"></td>
					</tr>
				</c:forEach>


			</tbody>

		</table>
		<!--  table End /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->


	<!-- PageNavigation Start... -->
	<!-- PageNavigation End... -->

</body>

</html>