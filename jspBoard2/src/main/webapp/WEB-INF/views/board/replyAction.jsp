<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.dao.ReplyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reply" class="board.dto.Reply" scope="page"/>
<jsp:setProperty name="reply" property="replyContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		int board_id=1;
		if(request.getParameter("board_id")!=null){
			board_id=Integer.parseInt(request.getParameter("board_id"));
		}
	
		String write_id=null;
		if(session.getAttribute("write_id")!=null){
			write_id=(String)session.getAttribute("write_id");
		}
		if(write_id==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}
		else{
			if(reply.getReplyContent()==null){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('댓글을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				ReplyDAO replyDAO=new ReplyDAO();
				int result = replyDAO.write(board_id, reply.getReplyContent(), write_id);
				if(result==-1){
					PrintWriter script= response.getWriter();
					script.println("<script>");
					script.println("alert('댓글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					String url="list.jsp?board_id="+board_id;
					PrintWriter script= response.getWriter();
					script.println("<script>");
					script.println("location.href='"+url+"'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>