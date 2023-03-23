<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 54 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${type} 확인 절차</title>
</head>
<body>

	<!-- 54 -->
	<c:choose>
		<c:when test="${type == 'modify' }">
			${type }비밀번호를 입력해 주세요. <br>
			<form action="./modify" method="POST">
				<input name="user_pw" type="password" />
				<!--  input 타입 hidden으로 value 실어서 보내기 -->
				<!-- post방식은 hidden으로 숨겨서 보낸다? -->
				<input name="board_id" type="hidden"  value="${board_id }"/> 
				<input type="submit" value="confirm" />
			</form>		
		</c:when>
		
		<c:when test="${type == 'delete' }">
			${type }비밀번호를 입력해 주세요. <br>
			<form action="./delete" method="POST">
				<input name="user_pw" type="password" />
				
				<!-- ${board_id }는 <%=request.getParameter("board_id")%> 또는 {param.board_id}로 쓸 수 있다 -->
				<input name="board_id" type="hidden"  value="${param.board_id}"/>
				<input type="submit" value="confirm" />
			</form>	
		</c:when>
		
		<c:otherwise>
			잘못된 접근입니다. <br>
			<a href="./list">목록으로 돌아가기</a>
		</c:otherwise>
	</c:choose>
</body>
</html>