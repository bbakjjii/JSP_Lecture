<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>What is forward?</title>
</head>
<body>

	<h3># Forward</h3>
	<ul>
		<li>
			사용자가 보낸 요청을 해당 서블릿에서 처리하다가 
			다른 서블릿으로 전달하여 추가로 처리를 이어나가는 것
		</li>
		<li>
			사용자가 보낸 요청 객체를 그대로 전달하기 때문에
			요청에 실려있던 정보들(파라미터들)이 함께 그대로 전달된다
		</li>
	</ul>
	
	<h3># Redirect</h3>
	<ul>
		<li>요청을 보낸 사용자가 다른 주소로 다시 요청하도록 만드는 것</li>
		<li>
			리다이렉트 응답을 받은 클라이언트의 웹 브라우저에서 
			새로운 요청을 만들어 보내기 때문에 이전 요청에서 실려있던 정보는 남아있을 수 없다
		</li>
	</ul>
	
	<hr>
	<a href="/chap03/forward?hobby=eat&favorite=icecream">Forward</a><br>
	<a href="/chap03/redirect?hobby=eat&favorite=icecream">Redirect</a>
	
	<hr>
	
	<h3># forward의 용도</h3>
	<ul>
		<li>
			서블릿은 자바 코드를 작성하기에 편리하고 (ex: out.print에 코드를 다 넣어서 사용해야함)<br>
			JSP는 html 코드를 작성하기에 편리하다 (ex: java import기능이 불편)
		</li>
		<li>
			1차로 서블릿에서 자바로 처리를 모두 마친 후
			포워드를 통해 2차로 html 코드를 응답하는 방식을 굉장히 많이 사용한다
		</li>
		<li>
			이것을 view와 control의 분리라고 부른다
		</li>
	</ul>
	
	<h3># redirect의 용도</h3>
	<ul>
		<li>사용자가 요청에 함께 실어보낸 정보들을 새로고침으로 사용하지 못하도록 막는 용도</li>
		<li>ex> 사용자가 글을 쓴 후에 새로고침으로 같은 글이 계속 등록되는 것을 방지</li>
	</ul>
	
</body>
</html>