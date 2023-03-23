<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Form</title>
</head>
<body>
	
	<a href="/icecream/robbins"></a>
	
	<form id="myservlet" action="/baskin/robbins" method="POST"></form>
	
	<!-- form 바깥에 있는 input도 form속성을 설정하면 소속으로 만들 수 있다 -->
	<input type="text" form="myservlet" name="flavor" value="딸기맛">
	
</body>
</html>