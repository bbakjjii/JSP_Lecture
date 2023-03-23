<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                   <li><a href="main.jsp">메인</a></li>
                   <li><a href="bbs.jsp">게시판</a></li>
           </ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
                     data-toggle="dropdown" role="button" aria-haspopup="true"
                     aria-expanded="false">접속하기<span class="caret"></span></a>
                     <ul class="dropdown-menu">
                     	<li><a href="login.jsp">로그인</a></li>
                     	<li class="active"><a href="join.jsp">회원가입</a></li> <!-- active 회원가입을 표시하는 파란색이 뜬다 -->
                     </ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- 회원가입 화면 시작 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="POST" action="joinAction.jsp"> <!-- joinAction.jsp로 데이터를 보낼 수 있도록 한다 -->
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<!-- placeholder:현재 어떠한 것도 입력되지 않았을 때 보여주는 내용 -->
						<!-- maxlength : ID의 길이를 20자로 제한 -->
						<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름을 입력하세요" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <!-- active : 기본적으로 선택이된 것을 의미 -->
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary"> 
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>	
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일을 입력하세요" name="userEmail" maxlength="20">
					</div>					
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	<!-- 회원가입 화면 끝 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>