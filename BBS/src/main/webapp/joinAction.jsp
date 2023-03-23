<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장을 사용하기 위해 작성하는 것 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 하는 것 -->
<!-- jsp:useBean : Java Beans를 사용하도록 하는 것. -->
<!-- scope:현재 페이지에서만 beans를 사용할 수 있도록 하는 것 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 회원가입 페이지(join.jsp)에서 넘겨준 userID, userPassword, userName, userGender, userEmail을
	 그대로 받아서 한명의 사용자의 userID, userPassword, userName, userGender, userEmail에 넣어주는 것 -->
<!-- 이 페이지 안에 넘어온 userID, userPassword, userName, userGender, userEmail이 그대로 담기게 된다 -->
<!-- 각각의 변수들을 다 입력 받아 만들어진 하나의 인스턴스 user -->
<jsp:setProperty name="user" property="userID" /> 
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

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
		if (userID != null) { // session값이 있는 경우 또다시 회원가입을 할 수 없도록 막는다
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')"); 
			script.println("location.href= 'main.jsp'"); // 로그인이 되어있을 때 main.jsp 페이지로 이동
			script.println("</script>");	
		}
		// 입력해야 할 내용이 비어있는 상태에서 회원가입 버튼을 누르면 회원가입 페이지도 돌려보낸다
		if (user.getUserID() == null || user.getUserPassword() == null ||
			user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')"); 
			script.println("history.back()"); // 이전 페이지(회원가입 페이지)로 사용자를 돌려보내는 것
			script.println("</script>");	
		} else {
			UserDAO userDAO = new UserDAO(); // userDAO라는 하나의 인스턴스 생성. 데이터베이스에 접근할 수 있는 객체
			// 하나의 user라는 인스턴스가 join함수를 수행하도록 매개변수로 들어간다. 
			// 입력받은 데이터를 가지고 실제로 회원가입을 수행하도록 한다.
			int result = userDAO.join(user); 
			// -1은 데이터베이스 오류가 발생한 경우
			// 만약 이미 존재하는 ID를 입력했을 때 데이터베이스 오류가 발생하면서 -1이 반환된다.
			// userID는 기본키
			if (result == -1) { 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')"); 
				script.println("history.back()");
				script.println("</script>");	
			}
			else { // result가 -1이 아닌 경우 전부 다 회원가입 성공
				session.setAttribute("userID", user.getUserID());// 회원가입 성공시 세션부여. 해당 유저의 ID를 세션값으로 넣어준다
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'"); // 회원가입 성공시 main.jsp 페이지로 이동
				script.println("</script>");	
			}	
		}
	%>
</body>
</html>