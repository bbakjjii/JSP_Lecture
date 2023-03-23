<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 54 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${type} Ȯ�� ����</title>
</head>
<body>

	<!-- 54 -->
	<c:choose>
		<c:when test="${type == 'modify' }">
			${type }��й�ȣ�� �Է��� �ּ���. <br>
			<form action="./modify" method="POST">
				<input name="user_pw" type="password" />
				<!--  input Ÿ�� hidden���� value �Ǿ ������ -->
				<!-- post����� hidden���� ���ܼ� ������? -->
				<input name="board_id" type="hidden"  value="${board_id }"/> 
				<input type="submit" value="confirm" />
			</form>		
		</c:when>
		
		<c:when test="${type == 'delete' }">
			${type }��й�ȣ�� �Է��� �ּ���. <br>
			<form action="./delete" method="POST">
				<input name="user_pw" type="password" />
				
				<!-- ${board_id }�� <%=request.getParameter("board_id")%> �Ǵ� {param.board_id}�� �� �� �ִ� -->
				<input name="board_id" type="hidden"  value="${param.board_id}"/>
				<input type="submit" value="confirm" />
			</form>	
		</c:when>
		
		<c:otherwise>
			�߸��� �����Դϴ�. <br>
			<a href="./list">������� ���ư���</a>
		</c:otherwise>
	</c:choose>
</body>
</html>