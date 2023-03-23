<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Register</title>
</head>
<body>

	<h3>Register Form</h3>
	
	<!-- get으로 가면 form으로 가고, post로 오면 회원에 등록을 하겠다 -->
	<form action="/chap04/memo/Register" method="POST">
		Name : <input type="text" name="name" /><br>
		ID : <input type="text" name="id"/><br>
		Password : <input type="text" name="pw"/><br>
		Password Confirm : <input type="text"/>(미구현 : Javascript 사용-password와 confirm이 같은지 체크)<br>
		Birthday : <input type="date" name="birthday" /><br>
		<input type="submit" value="register"/><br>
	</form>

</body>
</html>