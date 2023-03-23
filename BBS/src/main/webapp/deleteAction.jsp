<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href= 'login.jsp'"); // 로그인이 안되어 있으면 로그인페이지로 이동
		script.println("</script>");
	}
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) { //bbsID라는 매개변수가 존재한다면
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href= 'bbs.jsp'"); // 유효하지 않은 글이면 글목록으로 이동
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href= 'bbs.jsp'"); // 유효하지 않은 글이면 글목록으로 이동
		script.println("</script>");
	} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.delete(bbsID); // bbsID 글 삭제표시(데이터베이스 내에는 삭제가 안되고 0으로만 표시된다)
			if (result == -1) { // -1인 경우 글쓰기 실패
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // result가 -1이 아닌 경우 전부 다 글쓰기 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bbs.jsp'"); // 글삭제 성공시 게시판 메인화면(bbs.jsp)로 이동
				script.println("</script>");
			}
		}
	%>
</body>
</html>