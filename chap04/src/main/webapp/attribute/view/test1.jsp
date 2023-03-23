<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// Attribute는 Object 타입으로 등록되기 때문에 자유롭게 사용하기 위해서는 다운캐스팅이 필요하다
	chap04.model.Student student = 
		(chap04.model.Student)(request.getAttribute("info")); // 다운캐스팅 해야 함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1># 포워드 후 어트리뷰트 값들 확인하기</h1>
	<ul>
		<li>
			page: <%=pageContext.getAttribute("food") %>
			(포워드 하면 사라짐)
		</li>
		<li>
			request: <%=request.getAttribute("food") %>
			(포워드를 거치지 않은 새로운 요청인 경우 없음)
		</li>
		<li>
			session: <%=session.getAttribute("food") %>
			(한번 등록하고나면 웹 브라우저를 끌때까지 유지됨)
		</li>
		<li>
			application: <%=application.getAttribute("food") %>
			(한번 등록하고나면 서버를 끌때까지 유지됨)
		</li>
	</ul>
	
	<h3># 어트리뷰트 값 꺼내 쓰기</h3>
	
	Student name: <%=student.name %><br>
	Student kor: <%=student.kor %><br>
	Student eng: <%=student.eng %><br>
	Student math: <%=student.math %><br>
	
	<!-- index.jsp에서 실행하고 버튼 누르고 들어와야 잘 실행된다. -->
	<!-- Student.java에서는 바로 실행되지 않기 때문에 웹페이지상 에러가 나는게 정상 -->
	
	<h3># 어트리뷰트 값 아주 쉽게 꺼내 쓰기(EL, Expression Language)</h3>
	<!-- 
	Student info: chap04.model.Student@6a02c4cb 해결방법
	Student.java에서 toString을 override한다.
	--> 
	Student info: ${info } <br>
	Food info: ${food } <br>
	
	<h3># EL로 각 필드값에 접근하기 (해당 객체의 Getter가 구현되어 있어야 함)</h3>
	<!-- Student.java에 getMath()를 생성해야 함 -->
	Math: ${info.math } <br> <!-- 알아서 getMath를 찾는다 -->
	Average: ${info.avg } <br> <!-- 알아서 getAvg를 찾는다 -->
	(실제 필드가 없더라도 getter만 있으면 접근 가능) 
	<!-- view에서는 값을 꺼내기만 하도록 사용하는 것이 좋다! -->
</body>
</html>