<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %><!-- 스크립트 문장을 실행할 수 있도록 함 -->
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %> <!-- 데이터베이스 접근 객체 -->
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList"%>
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
		

		int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
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
	
	<!-- 게시판 글쓰기 시작 -->
	<div class="container"> <!-- 특정 내용들을 담을 수 있는 컨테이너 -->
		<div class="row"> <!-- 테이블이 들어가는 공간 -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd"><!-- 게시판의 글 목록들이 홀수와 짝수가 색상이 변동되면서 보기 좋은 테이블이 나오게 한다 -->
				<thead><!-- 테이블의 제목부분 -->
					<tr><!-- 테이블의 하나의 행 -->
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th> <!-- colspan:3개만큼의 열을 가진다 -->
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<!-- 공백이나 꺽쇠표시, 줄바꿈을 정상적으로 처리하기 : 웹 보안상 악성 스크립트를 막을 수 있다.  -->
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;")
								.replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<!-- 공백이나 꺽쇠표시, 줄바꿈을 정상적으로 처리하기  -->
						<td colspan="2" style="min-height: 200px; text-align: left;">
						<%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;")
						.replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				// 이 글의 작성자가 본인이라면 이 글을 수정하거나 삭제할 수 있다
				if (userID != null && userID.equals(bbs.getUserID())){
			%>
					<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
		
		
		<hr>
		<hr>
		<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td align="left" bgcolor="skyblue">댓글</td>
							</tr>
							<tr>
								<%
									CommentDAO commentDAO = new CommentDAO();
									ArrayList<Comment> list = commentDAO.getList(bbsID);
									for (int i = 0; i < list.size(); i++) {
								%>
								<div class="container">
									<div class="row">
										<table class="table table-striped"
											style="text-align: center; border: 1px solid #dddddd">
											<tbody>
												<tr>
													<td align="left"><%=list.get(i).getUserID()%></td>
													<td align="right"><%=list.get(i).getCommentDate() %></td>
												</tr>
												<tr>
													<td align="left"><%=list.get(i).getCommentContent()%></td>
													<td align="right"><a
														href="commentUpdate.jsp?bbsID=<%=bbsID%>&commentID=<%=list.get(i).getCommentID()%>"
														class="btn btn-warning">수정</a> <a
														onclick="return confirm('정말로 삭제하시겠습니까?')"
														href="commentDeleteAction.jsp?bbsID=<%=bbsID%>&commentID=<%=list.get(i).getCommentID()%>"
														class="btn btn-danger">삭제</a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<%
									}
								%>
							</tr>
					</table>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="row">
					<form method="post" action="submitAction.jsp?bbsID=<%=bbsID%>">
						<table class="table table-bordered"
							style="text-align: center; border: 1px solid #dddddd">
							<tbody>
								<tr>
									<td align="left"><%=userID%></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="댓글 쓰기" name="commentContent" maxlength="300"></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn btn-success pull-right"
							value="댓글 쓰기">
					</form>
				</div>
			</div>
		</div>
	</div>
		<hr>
		<hr>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>