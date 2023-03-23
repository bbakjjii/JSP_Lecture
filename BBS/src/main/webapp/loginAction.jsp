<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장을 사용하기 위해 작성하는 것 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 하는 것 -->
<!-- jsp:useBean : Java Beans를 사용하도록 하는 것. -->
<!-- scope:현재 페이지에서만 beans를 사용할 수 있도록 하는 것 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 로그인 페이지(login.jsp)에서 넘겨준 userID와 userPassword를 그대로 받아서 한명의 사용자의 userID와 userPasseword에 넣어주는 것 -->
<!-- 이 페이지 안에 넘어온 userID와 userPassword가 그대로 담기게 된다 -->
<jsp:setProperty name="user" property="userID" /> 
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null; // 로그인에 성공하면 로그인 페이지와 회원가입 페이지가 안 보이도록 한다
		// 세션이 존재하는 회원들은 userID에 해당 세션값을 넣어준다
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) { // session값이 있는 경우 또다시 로그인 할 수 없도록 막는다
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')"); 
			script.println("location.href= 'main.jsp'"); // 로그인이 되어있을 때 main.jsp 페이지로 이동
			script.println("</script>");	
		}
		UserDAO userDAO = new UserDAO(); // userDAO라는 하나의 인스턴스 생성. 데이터베이스에 접근할 수 있는 객체
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); // 로그인을 시도할 수 있도록 하는 곳
		if (result == 1) { // 로그인 성공 : 아이디와 로그인 모두 일치
			session.setAttribute("userID", user.getUserID());// 로그인 성공시 세션부여. 해당 유저의 ID를 세션값으로 넣어준다
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href= 'main.jsp'"); // 로그인이 성공했을 때 main.jsp 페이지로 이동
			script.println("</script>");	
		}
		else if (result == 0) { // 로그인 실패 : 아이디 일치, 비밀번호 불일치
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')"); 
			script.println("history.back()"); // 이전 페이지(로그인 페이지)로 사용자를 돌려보내는 것
			script.println("</script>");	
		}
		else if (result == -1) { // 로그인 실패 : 아이디 불일치
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')"); 
			script.println("history.back()"); // 이전 페이지(로그인 페이지)로 사용자를 돌려보내는 것
			script.println("</script>");	
		}
		else if (result == -2) { // 로그인 실패 : 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')"); 
			script.println("history.back()");
			script.println("</script>");	
		}
	%>
</body>
</html>