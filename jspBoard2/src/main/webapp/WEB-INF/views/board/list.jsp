<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>

<!-- 33 -->
<c:url value="/assets/css/button.css" var="btnCSS"/>

<meta charset="EUC-KR">
<title>�Խ���</title>

<!-- 33 -->
<link rel="stylesheet" href="${btnCSS }" />
<!-- 
<img src="<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />" alt="thumb up" /></th>
 -->
</head>
<body>

	<!-- 19 -->	
	<table>
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>Name</th>
			<th>View</th>
			<th>�ۼ��ð�</th>
			<th>����������</th>
		</tr>
		
		<!-- 17 -->
		<c:forEach items="${boards}" var="board" >
			<tr>
				<td>${board.board_id}</td>
				
				
				<!-- 25 -->
				<td><a href="./contents?board_id=${board.board_id }">
					${board.write_title}</a></td>

				<td>${board.write_id}</td>
				<td>${board.write_view}</td> 
				
				<!-- 21 -->
				<td>${board.creationDateTime}</td> <!-- ���ð� �ð�����, ���� ������ ��¥�� ������ -->
				<td>${board.write_recommend}</td>
			</tr>
		</c:forEach>	
	</table>
	
	
		<c:forEach begin="${pagination_start}" end="${pagination_end}" var="i" >
			<a href="./list?page=${i }">${i }</a>
		</c:forEach>
		
		<!-- 33 -->
		<br>
		<br>
		<a class="btn" href="./write">�۾���</a>

</body>
</html>