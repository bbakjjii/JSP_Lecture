<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')"); 
			script.println("location.href= 'login.jsp'"); // 로그인이 안되어 있으면 로그인페이지로 이동
			script.println("</script>");	
		} else { // 로그인이 되어있으면 이쪽으로 넘어온다
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안 된 사항이 있습니다.')"); 
					script.println("history.back()");
					script.println("</script>");	
				} else {
					BbsDAO bbsDAO = new BbsDAO();
					int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent()); 
					if (result == -1) { // -1인 경우 글쓰기 실패
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다.')"); 
						script.println("history.back()");
						script.println("</script>");	
					}
					else { // result가 -1이 아닌 경우 전부 다 글쓰기 성공
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href = 'bbs.jsp'"); // 글쓰기 성공시 게시판 메인화면(bbs.jsp)로 이동
						script.println("</script>");	
					}	
				}
		}

	%>
</body>
</html>