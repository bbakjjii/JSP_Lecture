<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %><!-- 스크립트 문장을 실행할 수 있도록 함 -->
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %> <!-- 게시판 목록을 보기 위해 필요한 것 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 반응형웹으로 만듦 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<!-- bbs.jsp에서만 사용되는 style태그 -->
<style type="text/css">
	a, a:hover {
		color: #000000; /* 링크 태그는 검은색 */
		text-decoration: none; /* 글에 밑줄 없음 */
	}
</style>
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
		
		int pageNumber = 1; // 현재 게시판이 몇번째 페이지인지 알려주기 위함. 기본 1페이지.
		if (request.getParameter("pageNumber") != null) {
			// 페이지넘버에는 파라미터값을 넣어준다.
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); // 파라미터는 다 정수형으로 바꿔주는 perseInt를 넣어주어야 한다
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
	
	<!-- 게시판 화면 시작 -->
	<div class="container"> <!-- 특정 내용들을 담을 수 있는 컨테이너 -->
		<div class="row"> <!-- 테이블이 들어가는 공간 -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"><!-- 게시판의 글 목록들이 홀수와 짝수가 색상이 변동되면서 보기 좋은 테이블이 나오게 한다 -->
				<thead><!-- 테이블의 제목부분 -->
					<tr><!-- 테이블의 하나의 행 -->
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">댓글수</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<% 
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<!-- 현재 게시글에 대한 정보를 가져온다 -->
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td>댓글수 넣기</td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate() %></td>
						<td><%=list.get(i).getBbsViewCnt()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) { // 1페이지가 아니라면 이전페이지로 돌아간다
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a> <!-- 이전으로 가는 화살표 -->
			<%
				} if (bbsDAO.nextPage(pageNumber + 1)) { // 다음페이지가 존재한다면 다음페이지로 간다
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-right">다음</a> <!-- 다음으로 가는 화살표 -->
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>