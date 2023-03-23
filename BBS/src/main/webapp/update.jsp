<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %><!-- 스크립트 문장을 실행할 수 있도록 함 -->
<%@ page import="bbs.Bbs" %><!-- 스크립트 문장을 실행할 수 있도록 함 -->
<%@ page import="bbs.BbsDAO" %><!-- 스크립트 문장을 실행할 수 있도록 함 -->
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
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')"); 
			script.println("location.href= 'login.jsp'"); // 유효하지 않은 글이면 글목록으로 이동
			script.println("</script>");	
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) { //bbsID라는 매개변수가 존재한다면
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')"); 
			script.println("location.href= 'bbs.jsp'"); // 유효하지 않은 글이면 글목록으로 이동
			script.println("</script>");	
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')"); 
			script.println("location.href= 'bbs.jsp'"); // 유효하지 않은 글이면 글목록으로 이동
			script.println("</script>");	
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
                   <li><a href="main.jsp">메인</a></li> <!-- 현재 접속한 페이지가 main페이지라는 걸 알려준다 -->
                   <li class="active"><a href="bbs.jsp">게시판</a></li>
           </ul>
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
		</div>
	</nav>
	
	<!-- 게시판 글수정 시작 -->
	<div class="container"> <!-- 특정 내용들을 담을 수 있는 컨테이너 -->
		<div class="row"> <!-- 테이블이 들어가는 공간 -->
			<form method="POST" action="updateAction.jsp?bbsID=<%=bbsID%>"> <!-- 수정된 글이 updateAction.jsp로 보내진다 -->
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"><!-- 게시판의 글 목록들이 홀수와 짝수가 색상이 변동되면서 보기 좋은 테이블이 나오게 한다 -->
					<thead><!-- 테이블의 제목부분 -->
						<tr><!-- 테이블의 하나의 행 -->
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글수정 양식</th> <!-- colspan:2개만큼의 열을 가진다 -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목을 입력하세요" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td> <!-- 수정전 글 제목을 보여준다-->
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용을 입력하세요" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent() %></textarea></td> 
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글수정">
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>