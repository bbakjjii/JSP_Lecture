<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		session.invalidate(); // 현재 이 페이지(로그아웃)에 접속한 회원은 session을 빼앗기도록 한다
	%>
	<script>
		location.href = 'main.jsp'; // 로그아웃시 메인 페이지로 이동
	</script>
</body>
</html>