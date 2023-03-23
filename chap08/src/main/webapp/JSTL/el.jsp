<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="chap08.dto.*" %>
<%
	// 비즈니스 로직을 거쳐 어트리뷰트에 데이터가 실려있다고 가정
	pageContext.setAttribute("waffle", "strawberry");
	request.setAttribute("waffle", "blueberry");
	session.setAttribute("waffle", "apple");
	application.setAttribute("waffle", "choco");
	
	pageContext.setAttribute("menu", new Menu("Americano", 2000, "/resource/image/coffee1.png"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL (Expression Language)</title>
</head>
<body>

	<h3># JSP Expression Language (EL)</h3>
	<ul>
		<li>JSP 특정 버전 이후부터 추가된 기본 기능</li>
		<li>어트리뷰트에 실려있는 값에 쉽게 접근할 수 있는 기능이다</li>
		<li>DTO로부터 값을 꺼내는 등의 간단한 자바 메서드 호출은 가능하지만
			모든 메서드를 자바철머 자유롭게 사용할 수 있는 것은 아니다</li>
	</ul>
	
	<h3># EL로 각 영역의 값 출력해보기 <br> (같은 어트리뷰트 이름이 모든 영역에 있는 경우)</h3>
	<ul>
		<li>범위의 크기 : page &lt; request &lt; session &lt; application </li>
		<li>그냥 출력 (waffle 중 가장 가까운 것에 접근) : ${waffle }</li>
		<li>page: ${pageScope.waffle }</li>
		<li>request: ${requestScope.waffle }</li>
		<li>session: ${sessionScope.waffle }</li>
		<li>application: ${applicationScope.waffle }</li>
	</ul>
	
	<h3># EL로 dto 활용하기</h3>
	<ul>
		<li>그냥 출력 (해당 객체의 toString()을 호출한다) : ${menu }</li>
		<li>menu.name : ${menu.name }</li>
		<li>menu.price : ${menu.price }</li>
		<li>menu.image : ${menu.image }</li>
		<li>Getter가 만들어져있는 경우 해당 필드값을 꺼내쓸 수 있다</li>
	</ul>
	
	<h3># EL의 리터럴</h3>
	
	<%
		pageContext.setAttribute("a", 13);
		pageContext.setAttribute("even", true);
	%>
	
	<ul>
		<li>boolean  ${true }, ${false }, ${not even }</li>
		<li>정수 : ${123 }, ${123 * 10 }, ${a * 2 }</li>
		<li>실수 : ${123.123 }, ${123.123 * 2 }</li>
		<li>문자열 : ${'hello, world!' }, ${"hello, world!" }</li>
	</ul>
	
		<h3># EL의 연산자</h3>
	<dl>
		<dt><li>산술 : +, -, *, /, %, mod(나머지연산)</li></dt>
		<dd>ex: ${'${10 mod 7 }'} = ${10 mod 7 }</dd>
		<dt><li>비교 : ==, !=, eq(==), ne(!=), lt(less than), 
			gt(greater than), le(less than equal), ge(greater than equal)</dt>
		<dd>
			ex: ${a > 10 }, ${a gt 10 }, ${a == 10 }, ${a eq 10 }, ${waffle == 'blueberry' }, ${waffle == 'starwberry' }
		</dd>
		<dt><li>논리 : and, or, not, &&, ||, !</li></dt>
		<dd>ex: ${true and false }, ${true && false }</dd>
		<%
			pageContext.setAttribute("empty1", null);
			pageContext.setAttribute("empty2", "");
		%>
		<dt><li>empty : 해당 값이 "" 또는 null일때 true</li></dt>
		<dd>
			ex: null check의 경우 : ${empty1 eq null }, ${empty2 eq null }<br>
			ex: empty check의 경우 : ${empty empty1 }, ${empty empty2 }<br>
		</dd>
		<dt><li>삼항연산</li></dt>
		<!-- 몫을 구할 수는 없다.. 바구니 개수는 다른데서 구해야 한다. 나머지만 구할 수 있다. -->
		<dd>basket = ${a % 10 == 0 ? a / 10 : a / 10 + 1 }</dd>
	</dl>
</body>
</html>