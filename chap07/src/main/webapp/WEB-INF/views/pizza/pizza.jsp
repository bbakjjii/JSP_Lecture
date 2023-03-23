<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>피자</title>
</head>
<body>

	<h3># 피자로 연습하기</h3>

	<p>다음을 만드시오. (DB 테이블도 만드시오, 예전에 썼던 폼 참조 chap02 참조)</p>

	<ul>
		<!-- ① -->
		<!--  GET방식 요청 → DispatcherServlet에 무조건 들어오게 된다 -->
		<li><a href="./pizza/order/list">이전 주문 내역 보기</a>(DB의 피자 주문 테이블을 select)</li>
		<li><a href="./pizza/order/form">새 주문 만들기</a>(DB의 피자 테이블에 insert)</li>
	</ul>
</body>
</html>