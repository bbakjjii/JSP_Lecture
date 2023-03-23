<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// ※ 비즈니스 로직에서 어트리뷰트에 추가한 후 포워드로 받았다고 가정한다
	String[] animals = {"cat", "dog", "monkey", "tiger", "lion", "rabbit"};

	List<String> fruits = new ArrayList<>();

	pageContext.setAttribute("animals", animals);
	pageContext.setAttribute("fruits", fruits);
	
	fruits.add("apple");
	fruits.add("banana");
	fruits.add("orange");
	fruits.add("kiwi");
	fruits.add("mango");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jsp Standard Tag Library</title>
</head>
<body>

	<h3>JSTL (Jsp Standard Tag Library)</h3>
	<ul>
		<li>JSP에서 Java 코드를 사용하면 코드가 너무 지저분해져서 등장한 라이브러리</li>
		<li>자바에서 자주 쓰는 기능들을 태그 모양으로 사용할 수 있도록 만들어 둠</li>
		<li>자바의 모든 기능을 사용할 수 있는 것은 아니지만 뷰를 만들기에는 충분한 기능들이다</li>
		<li>JSTL 특유의 import문을 맨 위에 추가한 후 사용해야 한다</li>
	</ul>
	
	<!-- 테스트용
	<ul>
		<c:forEach items="${animals }" var="animal">
			<li>${animal }</li>
		</c:forEach>
	</ul>
	 -->
	 
	 <h3># JSTL Core</h3>
	 	<p>자바 주요 문법들이 포함되어 있는 커스텀 태그 라이브러리</p>
	 <dl>
	 	<dt>&lt;c:set&gt;</dt>
	 	<dd>setAttribute를 편리하게 수행할 수 있다</dd>
	 	<dt>&lt;c:if&gt;</dt>
	 	<dd>if문을 편리하게 수행할 수 있지만, else if와 else는 없다</dd>
	 	<dt>&lt;c:choose&gt;, &lt;c:when&gt;, &lt;c:otherwise&gt;</dt>
	 	<dd>if, else if, else 처럼 사용할 수 있는 조건문</dd>
	 	<dt>&lt;c:forEach&gt;</dt>
	 	<dd>숫자를 이용한 반복문과 배열, 리스트 등 
	 		순차적으로 꺼낼 수 있는 (iterable) 객체를 통한 반복문을 사용할 수 있다</dd>
	 	<dt>&lt;c:forTokens&gt;</dt>
	 	<dd>문자열을 원하는 기준으로 자르면서 자른 문자열로 반복</dd>
	 	<dt>&lt;c:url&gt;</dt>
	 	<dd>복잡한 url을 좀 더 편리하게 생성할 수 있는 기능<br>
	 		(ContextPath를 자동으로 추가해준다)</dd>
	 </dl>
	 
	 <hr>
	 
	 <!--  c:set을 이용해 원하는 어트리뷰트를 추가 -->
	 <c:set var="waffle" value="strawberry" scope="page"/>
	 <c:set var="waffle" value="blueberry" scope="request"/>
	 <c:set var="waffle" value="mango" scope="session"/>
	 <c:set var="waffle" value="kiwi" scope="application"/>
	 
	 ${waffle }
	 
	 <!--  if문에 걸리기 때문에 blueberry의 값이 안 나온다 -->
	 <!-- 
	 <c:if test="${waffle eq 'strawberry' }">
	 	<h3>waffle은 strawberry입니다.</h3>
	 </c:if>
	 <c:if test="${waffle eq 'blueberry' }">
	 	<h3>waffle은 blueberry입니다.</h3>
	 </c:if>
	  -->
	 
	 <h3># c:if</h3>
	 <!--  requestScope에는 blueberry가 들어있기 때문에 blueberry가 나온다 -->
	 <c:if test="${requestScope.waffle eq 'strawberry' }">
	 	<h5>waffle은 strawberry입니다.</h5>
	 </c:if>
	  <c:if test="${requestScope.waffle eq 'blueberry' }">
	 	<h5>waffle은 blueberry입니다.</h5>
	 </c:if>
	 
	 
	  <h3># c:set, c:choose, c:when</h3>
	 <!-- ① score가 88점이었다. -->
	 <c:set var="score" value="88"/>
	 
	 <!-- ② score가 90, 80, 70, 60 이상이라면? 그외에는 F등급 -->
	 <c:choose>
	 	<c:when test="${score > 100 || score < 0 }">
	 		<h5>F등급입니다.</h5>
	 	</c:when>
	 	<c:when test="${score >= 90}">
	 		<h5>A등급입니다.</h5>
	 	</c:when>
	 	<c:when test="${score >= 80}">
	 		<h5>B등급입니다.</h5>
	 	</c:when>
	 	<c:when test="${score >= 70}">
	 		<h5>C등급입니다.</h5>
	 	</c:when>
	 	<c:when test="${score >= 60}">
	 		<h5>D등급입니다.</h5>
	 	</c:when>
	 	<c:otherwise>
	 		<h5>F등급입니다.</h5>
	 	</c:otherwise>
	 </c:choose>
	
	
	 <h3># forEach</h3> 
	 <h3>forEach 방법 1. 원하는 숫자로 반복 돌리는 버전</h3>
	 <!-- 웹페이지에서 [F12] 누르고 id 확인하면 list-item n으로 들어간다 -->
	 <ul>
	 	<c:forEach begin="0" end="10" var="i">
	 		<li id="list-item ${i }">${i+1 }번째 반복입니다.</li>
	 	</c:forEach>
	 </ul>
	 
	 <h3>forEach 방법 2. Iterable로 반복 돌리는 버전</h3>
	 <ul>
	 	<c:forEach items="${fruits }" var="f">
	 		<li id="${f }">${f }</li>
	 	</c:forEach>
	 </ul>
	 
	  <ul>
	 	<c:forEach items="${animals }" var="animal">
	 		<li id="${animal }">${animal }</li>
	 	</c:forEach>
	 </ul>
	 
	 <h3># c:forTokens</h3>
	 
	 <c:set var="portals" value="naver/daum/google/yahoo/nate/paran/hanmir"/>
	
	 <c:forTokens items="${portals }" delims="/" var="portal">
	 	<div id="${portal }">www.${portal }${portal eq 'daum' ? '.net' : '.com' }</div>
	 </c:forTokens>
	 
	 <h3># c:url</h3>
	 <ul>
	 	<!-- 기본 : contextPath를 앞에다 붙여준다. -->
	 	<li>기본 : <c:url value="/pizza/order"></c:url></li>
	 	<!-- var : c:set과 비슷한 역할(선언만 해주는 것) -->
	 	<li>어트리뷰트에 선언 : 
	 		<c:url value="/pizza/list" var="to_list" scope="page"/>
	 		${to_list }</li>
	 	<li><a href="${to_list }"/>주문하러가기</a></li>
	 	
	 	<!-- 상대경로에는 contextPath를 추가하지 않는다(현재위치로부터 찾아가는 경우) -->
	 	<li>파라미터 추가 : 
	 	<c:url value="./hello">
	 		<c:param name="first_name" value="Smith" />
	 		<c:param name="last_name" value="King" />
	 		<c:param name="age" value="45" />
	 	</c:url></li>
	 </ul>
</body>
</html>