<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Form</title>
</head>
<body>

	<h3># form 태그</h3>
	<ul>
		<li>서버로 요청을 보낼때 데이터를 함께 보내기 위한 태그</li>
		<li>
			form 태그 내부의 input 태그들을 통해
			사용자가 선택한 값을 서버로 보낼 수 있다
		</li>
		<li>데이터를 key-value 방식으로 실어 보낸다</li>
		<li>input 태그의 name 속성이 key 역할을 한다</li>
		<li>input 태그의 value 속성이 value 역할을 한다</li>
		<li>GET방식과 POST방식 중 원하는 방식을 선택할 수 있다</li>
	</ul>
	
	
	<!-- form + [Ctrl] + [E] -->
	<!-- 
		action: 어떤 주소로 요청을 보낼 것인가
		method: 어떤 방식으로 요청할 것인가
	-->
	<h3># Get 방식 요청</h3>
	<ul>
		<li>주소값 뒤에 데이터를 함께 실어 보낸다</li>
		<li>주소?key=value&key=value ...</li>
		<li>주소창에 URL을 직접 입력하거나, 링크를 클릭하는 방식은 기본적으로 GET방식이다</li>
	</ul>
	
	<a href="http://localhost:9000/chap02/test1?hobby=sleeping&coffee=latte">
		링크로 데이터 만들어서 보내기
	</a>
	
	<form action="http://localhost:9000/chap02/test1" method="GET">
		취미: <input type="text" name="hobby" value="movie"/><br> <!-- 옛날식 마감방식 -->
		버블티: <input type="text" name="boba" value="taro"><br>
		<!-- 주소창에 다 보이기 때문에 password는 GET방식으로 보내면 안된다 -->
		커피: <input type="password" name="coffee" value="americano"> 
		<input type="submit" value="OK!!">
	</form>
	
	<h3># Post 방식 요청</h3>
	<ul>
		<li>URL에 직접 입력하거나 링크를 통해 전달할 수 없다 (form 또는 javascript)</li>
		<li>
			주소 뒤에 함께 실려가는 방식이 아니라 눈에는 보이지 않는 형태로 전달된다
			(패킷을 열어보면 모든 정보를 볼 수는 있다)
		</li>
		<li>request 객체의 body라는 필드에 실려서 전송된다</li>
		<li>비밀번호 같은 것들은 GET방식으로 보내면 다 보이기 때문에 POST방식을 이용해야 한다</li>
	</ul>
	
	<!-- 
		웹 상에서 상대경로를 쓸 때 현재 URL이 무엇인지를 파악해야 한다
		현재 URL이 /chap02/form/index.jsp 일 때
		./는 /chap02/form/을 의미한다
		../는 /chap02/을 의미한다
	-->
	<form action="../test1" method="POST">
		<input type="hidden" name="hobby" value="drink">
		<input type="submit" value="Send to Servelt!"/>
	</form>
	
	<form action="./ReceiveFormDataJsp.jsp" method="POST">
		<input type="hidden" name="hobby" value="drunk">
		<input type="submit" value="Send to JSP!"/>
	</form>
	
	<hr>
	
	<h3># 방식별로 다르게 처리하기 (Servlet)</h3>
	
	<ul>
		<li>서블릿에서는 요청 방식별로 다르게 처리할 수 있는 기능을 제공한다</li>
		<li>service(): 모든 요청을 처리한다</li>
		<li>doGet(): Get방식 요청을 처리한다</li>
		<li>doPost(): Post방식 요청을 처리한다</li>
	</ul>
	
	<a href="/chap02/test2?name=john">GET방식 요청 보내기 (TEST2)</a>
	
	<form id="myform" action="/chap02/test2" method="POST"></form>
	
	<!-- form 바깥에 있는 input도 form속성을 설정하면 소속으로 만들 수 있다 -->
	<input type="text" form="myform" name="name" value="mike">
	<input type="submit" form="myform" value="Submit(Test2)"/>
</body>
</html>