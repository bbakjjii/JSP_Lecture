<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 5 -->
<%
	// request에는 항상 현재 경로에서 사용할 수 있는 쿠키값이 포함되어 있다
	
	// 사용할 수 있는 모든 쿠키를 열어보기
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
	<!-- 스파게티 만들기라고 함 -->
	<h3>현재 이 경로에서 사용할 수 있는 모든 쿠키 목록</h3>
	<% for (Cookie cookie : cookies) { %>
	<div><%=cookie.getName()  %>=<%=cookie.getValue() %></div>
	<% }%>

</body>
</html>