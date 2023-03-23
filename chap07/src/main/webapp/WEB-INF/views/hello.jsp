<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%
	// List<String> 타입으로 다운캐스팅이 필요
	List<String> employees = (List<String>)request.getAttribute("employees");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3> hello.jsp 입니다.</h3>
	
	<table border="1">
		<% for (String row : employees) { 
				out.print(row);
			}
		%>
	</table>

</body>
</html>