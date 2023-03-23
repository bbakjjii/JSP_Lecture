<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 12 -->
<%
	request.setAttribute("address", "종로구");
	
	// -- 13 --
	pageContext.setAttribute("address", "도봉구"); // file include는 도봉구가 나온다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- 10 -->
<title>file_include-메인입니다...</title>
<%@ include file="/file_include/header.jspf" %>
</head>
<body>
	<!-- 16 -->
	<%@ include file="/file_include/top.jspf" %>
	
	<h1 style="font-family: 'Unbounded';">Main.jsp</h1>
	
	<div class="fa-3x">
    <i class="fa-solid fa-snowboarding"></i>
    <i class="fa-solid fa-snowboarding fa-rotate-90"></i>
    <i class="fa-solid fa-snowboarding fa-rotate-180"></i>
    <i class="fa-solid fa-snowboarding fa-rotate-270"></i>
    <i class="fa-solid fa-snowboarding fa-flip-horizontal"></i>
    <i class="fa-solid fa-snowboarding fa-flip-vertical"></i>
    <i class="fa-solid fa-snowboarding fa-flip-both"></i>
  </div>
	
	<p style="font-family: 'Unbounded';">Whereas disregard and contempt for human rights have resulted</p>
	
	<%@ include file="/file_include/bottom.jspf" %>

</body>
</html>