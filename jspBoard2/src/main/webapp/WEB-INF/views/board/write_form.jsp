<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>
</head>
<body>

	<!--  37 -->
	<!-- �� ���� �� -->
	
	<h3># �۾���</h3>
	<ul>
		<li>�� ��ȣ : ����ڰ� ���°� �ƴ� (�������� ����)</li>
		<li>�۾��� : ����ڰ� ���� �� ���� (�α��� �� ����ڴ� ������ ä����)</li>
		<li>��й�ȣ : ����ڰ� ���� �� �� ���� (�α��� �� ����ڴ� ��й�ȣ ���¶��� �Ⱥ���)</li>
		<li>�� ���� : ����ڰ� ����</li>
		<li>�� ���� : ����ڰ� ����</li>
		<li>�� �ۼ� �ð� : ����ڰ� ���°� �ƴ� (DB�� sysdate�� �����)</li>
		<li>��ȸ �� : ����ڰ� ���°� �ƴ�</li>
		<li>��õ �� : ����ڰ� ���°� �ƴ�</li>
		<li>���� �� : ����ڰ� ���°� �ƴ�</li>
	</ul>
	
	<!-- 40 -->
	<form action="./write" method="POST">
		�۾��� : <input type="text" name="write_id"/>
		��й�ȣ : <input type="password" name="write_pw"/><br>
		�� ���� : <input type="text" name="write_title" size="60"/><br>
		�� ���� : <br>
		<textarea name="write_content" cols="70" rows="10"></textarea><br>
		<input type="submit" value="�۾���"/><br>
	</form>
	
	<!-- 48 -->
	<script src="<%=request.getContextPath() %>/assets/script/form.js"></script>

</body>
</html>