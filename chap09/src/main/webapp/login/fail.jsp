<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 3 -->
	<p>�α��� ����...</p>
	
	<script>
		setTimeout(() => {
			location.href = '<%=request.getContextPath() %>/login/login.jsp';
		}, 3000); // 3��
	</script>

</body>
</html>