<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 5 -->
<%
	// request���� �׻� ���� ��ο��� ����� �� �ִ� ��Ű���� ���ԵǾ� �ִ�
	
	// ����� �� �ִ� ��� ��Ű�� �����
	Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 5 -->
	<!-- ���İ�Ƽ ������� �� -->
	<h3>���� �� ��ο��� ����� �� �ִ� ��� ��Ű ���</h3>
	<% for (Cookie cookie : cookies) { %>
	<div><%=cookie.getName()  %>=<%=cookie.getValue() %></div>
	<% }%>

</body>
</html>