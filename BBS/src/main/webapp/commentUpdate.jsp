<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	int commentID = 0;
	if (request.getParameter("commentID") != null) {
		commentID = Integer.parseInt(request.getParameter("commentID"));
	}
	CommentDAO commentDAO = new CommentDAO();
	String commentContent = commentDAO.getUpdateComment(commentID);
	%>
	<div class="container" align="center">
		<div class="col-lg-10">
			<div class="jumbotron" style="padding-top: 1px;">
				<h3>
					<br>댓글수정창
				</h3>
				<form name=c_commentUpdate>
					<input type="text" id="update" style="width: 400px; height: 50px;" maxlength=1024; value="<%=commentContent%>"> 
					<input type="button" onclick="send(<%=bbsID%>,<%=commentID%>)" value="수정"> <br>
					<br> <input type="file" id="updatePicture" name="updatePicture" />
				</form>
			</div>
		</div>
		<div class="col-lg-10"></div>
	</div>
</body>
<script>
	var upload = document.querySelector('#updatePicture');
	updatePicture.addEvent
	function send(bbsID,commentID){
		var sb;
		var commentContent = document.c_commentUpdate.update.value;
		sb = "commentUpdateAction.jsp?&bbsID="+bbsID+"&commentID="+commentID+"&commentContent="+commentContent;
		window.opener.location.href= sb;
		window.close();
	}
</script>
</html>