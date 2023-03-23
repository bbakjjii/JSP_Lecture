<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Attribute Index</title>
</head>
<body>

	<h1>Attribute Test</h1>
	<ul>
		<li>
			Parameter는 클라이언트에서 form으로 함께 넘어오는 데이터였다면
			Attribute는 서버에서 활용하기 위해 개발자가 등록해놓는 값이다
		</li>
		<li>
			각 어트리뷰터 종류별로 유효한 범위(Scope)가 다르며 용도에 맞게 활용해야 한다
			(application, session, request, page)
		</li>
	</ul>
	
	<h3># Attribute Scopes</h3>
	<dl>
		<dt>page scope</dt>
		<dd>
			해당 JSP페이지 내부에서만 사용할 수 있는 어트리뷰트.
			page scope에 등록한 attribute는
			다른 곳으로 FORWARD만 해도 사라지게 된다.
		</dd>
		<dt>request scope</dt>
		<dd>
			하나의 요청이 응답될때까지 유지되는 어트리뷰트.
			forward 또는 include까지는 유지된다.
		</dd>
		<dt>session scope</dt>
		<dd>
			세션이 만료될때까지 수명이 유지되는 어트리뷰트.
			사용자가 서버에서 처음 접속하면 서버로부터 세션ID를 부여받는다.
			그 세션ID는 유일한 값이며 클라이언트 본인을 증명할 수 있는 유일한 수단이 된다.
			세션은 설정된 시간이 모두 지나거나 (은행 사이트) 웹 브라우저를 종료하면 만료된다.
		</dd>
		<dt>application scope</dt>
		<dd>
			웹 어플리케이션 서버에 저장해놓는 어트리뷰트.
			서버에 직접 저장되며 서버가 종료될때까지 유지된다.
			세션 객체는 접속자 수 만큼 존재하지만 서버는 1대이므로 전역 변수라고 볼 수 있다.
		</dd>
	</dl>
	
	<hr>
	
	<h3>Attribute Test</h3>
	
	<button id="test1">JSP에서 어트리뷰트 등록하고 포워드하기</button>
	<button id="test2">서블릿에서 어트리뷰트 등록하고 포워드하기</button>
	
	<script>
		const test1 = document.getElementById("test1");
		const test2 = document.getElementById("test2");
		
		test1.addEventListener('click', () => {
			location.href = '/chap04/attribute/process.jsp';
		});
		
		test2.addEventListener('click', () => {
			location.href = '/chap04/test2';
		});
	</script>

</body>
</html>