<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �����ϱ�</title>
</head>
<body>

	<!-- 2 -->
	<h3># include�� ���� ���� �����ϱ�</h3>

	<ul>
		<li>�о��� ���� ���</li>
		<li>JSP include : 
				������ó�� request/response�� �ٸ� jsp�� ���´ٰ� �ٽ� ���ƿ��� ���<br>
				(���� ���¿��� ��û�� ���� ������ ������ ����� ����Ѵ�.)
				pageContext�� ����ϱ� �����.
		</li>
		<li>File include : 
				�ش� ���� ������ �о jsp ���ο� ���Խ�Ű�� ���<br>
				(������ ������ ���� ������ ���� ���ѹ��� �Ŀ� �������� �����Ѵ�.)<br>
				pageContext�� ����� �� �ִ�.
		</li>
	</ul>
	
	<a href="./main.jsp">main ������ ���� ����</a>
	<a href="../file_include/main.jsp">/file_include/main ������ ���� ����</a>
</body>
</html>