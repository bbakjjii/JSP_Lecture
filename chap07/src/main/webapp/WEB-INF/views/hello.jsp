<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%
	// List<String> Ÿ������ �ٿ�ĳ������ �ʿ�
	List<String> employees = (List<String>)request.getAttribute("employees");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3> hello.jsp �Դϴ�.</h3>
	
	<table border="1">
		<% for (String row : employees) { 
				out.print(row);
			}
		%>
	</table>

</body>
</html>