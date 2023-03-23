<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hello</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/hello.css" />
</head>
<body>

	<h1>Hello, ${name }</h1>
	
	<p>
		HTML(jsp ����), CSS, Javascript, image ���� �ڿ�����
		������ ��û�� ���� �޾ƿ��� ���� �ڿ�(static resource)���̴�
	</p>
	
	<!-- �������� : ������ �����ֱ� -->
	<!-- ��, web.xml�� �������� �� ��, @WebServlet�� ���� -->
	<a href="<%=request.getContextPath() %>/gugudan">������ ��������</a> <br>
	<!-- WEB-INF�� ����ֱ� ������ ���� �����ϸ� ������ �߰� http://localhost:9000/chap06/hello�� �����ؾ� �� �� �ִ�. -->
	
	<img width="300" src="https://static.hubzum.zumst.com/hubzum/2020/08/21/10/16af61affa8841f58caaedd241064824.jpg" alt="" /> <br>
	
	<!-- imag src : �̹����� ��û�ϴ� �� -->
	<!-- request.getContextPath() : ElseServlet���� ���� ��� (ElseServlet�� �̹����� ��� ���߱� ������ �̹����� �� ���) -->
	<!-- resource ������ ������ ��� �Ϳ� ���Ͽ� �����ְڴ�(?) -->
	<img class="fruit" width="300" src="<%=request.getContextPath() %>/resource/image/apple.jpg"/> <br>
	<img class="fruit" width="300" src="<%=request.getContextPath() %>/resource/image/kiwi.jpg"/> <br>
	<img class="fruit" width="300" src="<%=request.getContextPath() %>/resource/image/straw.jpg"/> <br>

	<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/hello.js"/></script>
</body>
</html>