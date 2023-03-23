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
		HTML(jsp 말고), CSS, Javascript, image 등의 자원들은
		서버로 요청을 보내 받아오는 정적 자원(static resource)들이다
	</p>
	
	<!-- 연습문제 : 구구단 보여주기 -->
	<!-- 단, web.xml은 수정하지 말 것, @WebServlet도 금지 -->
	<a href="<%=request.getContextPath() %>/gugudan">구구단 보러가기</a> <br>
	<!-- WEB-INF에 들어있기 때문에 직접 실행하면 에러가 뜨고 http://localhost:9000/chap06/hello로 수정해야 볼 수 있다. -->
	
	<img width="300" src="https://static.hubzum.zumst.com/hubzum/2020/08/21/10/16af61affa8841f58caaedd241064824.jpg" alt="" /> <br>
	
	<!-- imag src : 이미지를 요청하는 것 -->
	<!-- request.getContextPath() : ElseServlet으로 가는 경로 (ElseServlet에 이미지를 등록 안했기 때문에 이미지가 안 뜬다) -->
	<!-- resource 밑으로 들어오는 모든 것에 대하여 보여주겠다(?) -->
	<img class="fruit" width="300" src="<%=request.getContextPath() %>/resource/image/apple.jpg"/> <br>
	<img class="fruit" width="300" src="<%=request.getContextPath() %>/resource/image/kiwi.jpg"/> <br>
	<img class="fruit" width="300" src="<%=request.getContextPath() %>/resource/image/straw.jpg"/> <br>

	<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/hello.js"/></script>
</body>
</html>