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

	�� ��ȣ : ${board.board_id}<br>
	�� ���� : ${board.write_title }<br>
	�۾��� : ${board.write_id }<br>
	�� ���� : <br>
	<textarea cols="30" rows="10" readonly>${board.write_content }</textarea><br>
	��õ �� : ${board.write_recommend }<br>
	���� �� : ${board.write_not_recommend }<br>
	��ȸ �� : ${board.write_view }<br>	
	
	
	<button onclick="location.href='./list?page=1'">�� ���</button>
	
	<!-- 50 -->
	<!-- ��� ���񽺷� ��Ī���� �����ϰ�, ��� ȭ������ �������� �����ְ� �� ȭ���� �����Ѵ� -->
	<button onclick="location.href='./modify?board_id=${board.board_id}'">�� ����</button>
	<button onclick="location.href='./delete?board_id=${board.board_id}'">�� ����</button>

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
		// pageNumber�� URL���� �����´�.
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if(board_id==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('��ȿ���� ���� ���Դϴ�.')");
			script.println("location.href='board_list.jsp'");
			script.println("</script>");	
		}
	%>
	
	
	
	<div class="container">
		<div class="row" style="border: solid 1px black; width:500x">
			<table class="table table-striped" style="text-align:center; border :1px solid #dddddd" > <%-- Ȧ,¦ �� ���� --%>
			
			</table>
			<form method="post" action="./replyAction.jsp?board_id=${board_id }">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<%-- Ȧ,¦ �� ���� --%>
					<thead>
						<tr>
							<th colspan="3"
								style="width: 1000px; background-color: #eeeeeee; text-align: center;">���</th>
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
								placeholder="����� �Է��ϼ���." name="replyContent" length="2048"></textarea></td>
						<td style="text-align: left; "></td>
					
					</tbody>
				</table>
				<input type="submit" class="btn" value="����Է�">
			</form>
		</div>
	</div>
</body>
</html>