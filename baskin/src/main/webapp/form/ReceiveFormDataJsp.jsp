<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- ��û�� �޴� �� -->
<%
	// JSP�� �����̱� ������ �����͸� ���� �� �ִ�
	String flavor = request.getParameter("flavor");
%>

<!-- �����ϴ� �� -->
<html>
	<head>
		<title>Form Data</title>
	</head>
	<body>
		<h1>Success!</h1>
		
		<div>flavor: <%=flavor %></div>
	</body>
</html>