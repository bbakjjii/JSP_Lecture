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
	
	<!-- form �ٱ��� �ִ� input�� form�Ӽ��� �����ϸ� �Ҽ����� ���� �� �ִ� -->
	<input type="text" form="myservlet" name="flavor" value="�����">
	
</body>
</html>