<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.dto.Board" %>
<%@ page import="board.dao.BoardDao" %>
<%@ page import="board.dto.Reply" %>
<%@ page import="board.dao.ReplyDAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${board.write_title }</title>
</head>
<body>

	글 번호 : ${board.board_id}<br>
	글 제목 : ${board.write_title }<br>
	글쓴이 : ${board.write_id }<br>
	글 내용 : <br>
	<textarea cols="30" rows="10" readonly>${board.write_content }</textarea><br>
	추천 수 : ${board.write_recommend }<br>
	비추 수 : ${board.write_not_recommend }<br>
	조회 수 : ${board.write_view }<br>	
	
	
	<button onclick="location.href='./list?page=1'">글 목록</button>
	
	<!-- 50 -->
	<!-- 어느 서비스로 매칭할지 결정하고, 어느 화면으로 가야할지 보여주고 그 화면을 리턴한다 -->
	<button onclick="location.href='./modify?board_id=${board.board_id}'">글 수정</button>
	<button onclick="location.href='./delete?board_id=${board.board_id}'">글 삭제</button>

	<hr>
	<hr>
	<% 
		String write_id=null;
		if(session.getAttribute("write_id")!=null){
			write_id=(String)session.getAttribute("write_id");
		}
		
		int board_id=0;
		if(request.getParameter("board_id")!=null){
			board_id=Integer.parseInt(request.getParameter("board_id"));
		}
		
		int pageNumber=1;
		// pageNumber는 URL에서 가져온다.
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if(board_id==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='board_list.jsp'");
			script.println("</script>");	
		}
	%>
	
	
	
	<div class="container">
		<div class="row" style="border: solid 1px black; width:500x">
			<table class="table table-striped" style="text-align:center; border :1px solid #dddddd" > <%-- 홀,짝 행 구분 --%>
			
			</table>
			<form method="post" action="./replyAction.jsp?board_id=${board_id }">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<%-- 홀,짝 행 구분 --%>
					<thead>
						<tr>
							<th colspan="3"
								style="width: 1000px; background-color: #eeeeeee; text-align: center;">댓글</th>
						</tr>
					</thead>
					<tbody>
					
						<%
							ReplyDAO replyDAO=new ReplyDAO();
							ArrayList<Reply> list=replyDAO.getList(board_id, pageNumber);
							for(int i=list.size()-1;i>=0;i--){
							
						%>

						<tr>
							<td style="text-align: left;"><%= list.get(i).getReplyContent() %></td>
							<td style="text-align: right;"><%= list.get(i).getWrite_id() %>
				
							</td>
						</tr>
					
						<%
								}
						%>
						<td><textarea type="text" class="form-control"
								placeholder="댓글을 입력하세요." name="replyContent" length="2048"></textarea></td>
						<td style="text-align: left; "></td>
					
					</tbody>
				</table>
				<input type="submit" class="btn" value="댓글입력">
			</form>
		</div>
	</div>
</body>
</html>