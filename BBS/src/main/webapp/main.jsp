<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %><!-- 스크립트 문장을 실행할 수 있도록 함 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 반응형웹으로 만듦 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		// 로그인이 된 사람들은 로그인 정보를 담아주도록 한다
		String userID = null;
		// 만약 현재 session이 존재하는 사람이라면 그 ID값을 그대로 받아서 관리할 수 있도록 만든다 
		if (session.getAttribute("userID") != null) {
			// String으로 형변환한 후 session값을 그대로 가져올 수 있게 한다
			userID = (String) session.getAttribute("userID"); 
		}
	
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expended="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"
       				aria-expanded="false">
           <ul class="nav navbar-nav">
                   <li class="active"><a href="main.jsp">메인</a></li> <!-- 현재 접속한 페이지가 main페이지라는 걸 알려준다 -->
                   <li><a href="bbs.jsp">게시판</a></li>
           </ul>
           <%
				// 접속하기는 로그인이 되어있지 않은 경우에만 나오도록 해준다
           		if(userID == null) {
           %>
        		<ul class="nav navbar-nav navbar-right">
    				<li class="dropdown">
    					<a href="#" class="dropdown-toggle"
                         data-toggle="dropdown" role="button" aria-haspopup="true"
                         aria-expanded="false">접속하기<span class="caret"></span></a>
                         <ul class="dropdown-menu">
                         	<li><a href="login.jsp">로그인</a></li>
                         	<li><a href="join.jsp">회원가입</a></li>
                         </ul>
    				</li>
    			</ul>	
           <%
           		} else {
           %>	
        		<ul class="nav navbar-nav navbar-right">
    				<li class="dropdown">
    					<a href="#" class="dropdown-toggle"
                         data-toggle="dropdown" role="button" aria-haspopup="true"
                         aria-expanded="false">회원관리<span class="caret"></span></a>
                         <ul class="dropdown-menu">
                         	<li><a href="logoutAction.jsp">로그아웃</a></li>
                         </ul>
    				</li>
    			</ul>	    
           <%
           		}
           %>		
		</div>
	</nav>	
	
	<!-- 메인 페이지 디자인 -->
	<div class="container">
		<div class="jumbotron"><!-- 웹사이트를 소개하는 영역. 부트스트랩에서 제공하는 요소-->
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>
					이 웹 사이트는 부트스트랩으로 만든 JSP 웹 사이트 입니다. 최소한의 간단한 로직만을 이용해서 개발했습니다.
					디자인 탬플릿으로는 부트스트랩을 이용했습니다.
				</p>
				<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p> <!-- 링크는 아무것도 가르키지 않도록 '#'을 넣음 -->
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<!-- 아이디값은 동일한 아이디값을 가져야 한다 -->
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg" style="margin: auto;">
				</div>
				<div class="item">
					<img src="images/2.jpg" style="margin: auto;">
				</div>
				<div class="item">
					<img src="images/3.jpg" style="margin: auto;">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>