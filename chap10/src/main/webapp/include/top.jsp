<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- 8 -->
<%
	// �� Service(����Ͻ� ����)���� �Ƿ��Դٰ� ����
	request.setAttribute("address", "����� �������� ���ǵ��� ...");

	// -- 14 --
	pageContext.setAttribute("address", "������"); // JSP include�� ����� �������� ���ǵ����� ���´�.
%>
<!-- 8 �� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>include-Top.jsp ���������� �ۼ��� Ÿ��Ʋ</title>
</head>
<body>

	<!-- 3 -->
	<table border="1">
		<tr>
			<!-- 6 -->
			<th><a href="./main.jsp">Ȩ</a></th>
			<th><a href="./menu.jsp">�޴�</a></th>
			<th><a href="./navi.jsp">ã�ƿ��±�</a></th>
			<th><a href="./chains.jsp">ü����</a></th>
			<th><a href="./sitemap.jsp">����Ʈ��</a></th>
		</tr>
		<tr>
			<th>
				<ul>
					<li>side menu1</li>
					<li>side menu2</li>
					<li>side menu3</li>
					<li>side menu4</li>
					<li>side menu5</li>
				</ul>
			</th>
			<th colspan="4">