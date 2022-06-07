<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<html>
	<body>
	
		<h3> NumberFormatException page</h3>
		<%	Exception exception = (Exception)request.getAttribute("exception");	%>
		<%="Java Code을 이용한 예외 Message 보기 ::" +  exception.getMessage() %><br/>
		EL을 이용한 예외 Message 보기 :: ${ exception.message }<br/> 
		
		<hr/>
		<br/>
		<%=  request.getRequestURI() %>
		<br/>
		<%=  request.getRequestURL() %>
		<br/>
			
		<div style = "text-align:center";>
			<img src="../images/uploadFiles/공사중표지판.PNG"/>
		</div>
	</body>
</html>