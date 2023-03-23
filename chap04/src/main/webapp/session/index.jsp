<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session</title>
</head>
<body>

	<h3># Http Session</h3>
	<ol>
	<!-- 
		# 세션번호 확인 방법
		① 웹브라우저에서 [F12] 누르기
		② [Application] → Cookies → http://localhost:9000 클릭 → Name: JSESSIONID / Value: 907F48E1A4AA495D5658A75BE44291BE 확인
	 -->
		<li>클라이언트가 웹 서버에 처음 접속하면 서버는 해당 클라이언트에게 세션ID를 발급한다</li>
		<li>
			세션ID는 클라이언트의 웹 브라우저에 추가된다
			(다른 브라우저로 접속하는 경우 새로운 세션ID를 발급받는다)
		</li>
		<li>
			브라우저의 쿠키에 저장되어있는 세션ID는
			이후 클라이언트의 모든 요청에 포함되어 함께 서버로 전송된다
		</li>
		<li>
			쿠키에 저장된 세션ID는 기본적으로는 사용자의 웹 브라우저가 종료될 때 사라지도록 설정되어 있다
		</li>
		<li>
			세션 객체에 새로운 데이터(어트리뷰트)를 추가하는 것은 
			서버 컴퓨터의 자원을 사용하는 것이므로, 
			세션에 너무 많은 양의 데이터를 저장하면 안된다
		</li>
	</ol>
	
	<hr>
	
	<h3># 세션에 원하는 데이터 추가하기</h3>
	<form action="/chap04/session/add" method="POST">
		<select name="name">
			<option value="food">food</option>
			<option value="hobby">hobby</option>
			<option value="sports">sports</option>
		</select>
			<input id="value-field" name="value" type="text" value="default"/>
			<input type="submit" value="Add" />
	</form>
	
	<hr># 현재 세션 어트리뷰트 목록</hr>
	
	<!-- 시간이 long타입이면 UNIX 타입 -->
	<p>
		세션 ID: <%=session.getId() %><br>
		최초 접속 시간: <%=new java.util.Date(session.getCreationTime()) %><br>
		마지막으로 활동한 시간: <%=new java.util.Date(session.getLastAccessedTime()) %><br>
		
		<button onclick="location.href='/chap04/session/invalidate';">
			세션 만료시키기
		</button>
	</p>
	
	<ul>
	<li>food: <%=session.getAttribute("food") %></li>
	<li>hobby: <%=session.getAttribute("hobby") %></li>
	<li>sports: <%=session.getAttribute("sports") %></li>
	</ul>
	
	<script>
		const valueField = document.getElementById("value-field");
		
		valueField.addEventListener('click', () => {
			if (valueField.value === 'default') {
					valueField.value = "";
			}
		});
	</script>
	
</body>
</html>