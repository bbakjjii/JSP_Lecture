<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��Ű</title>
</head>
<body>

	<!-- 1 -->
	<h3># Cookie</h3>
	<!-- ol : ������� ��ȣ�� �ٴ´�. 1., 2., 3., ... -->
	<ol>
		<li>�������� �����Ͽ� Ŭ���̾�Ʈ�� �� �������� ���ʷ� ����</li>
		<li>key/value�� �̷���� �ִ�</li>
		<li>�̹� �ִ� ��Ű���̸� ���� �����ϰ�, ������ ��Ű���̶�� ���ο� ��Ű�� �߰�</li>
		<li>��Ű�� �� �� �������� �˾Ƽ� ����</li>
		<li>�� �������� ����Ǿ� �ִ� ��Ű�� ������ ��û�� ������Ʈ ��ü�� ���ԵǾ� �Բ� ���۵ȴ�</li>
		<li>��Ű ���� ��� : �� ������ �� [F12] �� [Application] �� [Cookies]
	</ol>
	
	<!-- 5 -->
	<h3># Cookie�� �����ΰ�</h3>
	<ul>
		<li>���ʷδ� �������� �����Ͽ� �� �������� �����ϴ� ������</li>
		<li>��Ű�� name/value ���·� �Ǿ� �ִ�</li>
		<li>�ش� ��Ű�� ����� ������ path�� ���� ������ �� �ִ�</li>
		<li>�ش� ��Ű�� ������ maxAge�� ���� ������ �� �ִ�</li>
		<li>maxAge�� ������ ���̰�, 0�̸� ����, -1�̸� ������ �ǹ��Ѵ�</li>
	</ul>
	
	<h3># Cookie�� ��� ����</h3>
	<ol>
		<li>���ʷ� �������� ���ο� ��Ű�� �����ϰ� ���信 �Բ� �Ǿ� ������</li>
		<li>�� �������� ������ ���信 ��Ű�� �ִٸ� �� �������� ���� �ȴ�</li>
		<li>��Ű�� ����ִ� ������ �ش� ������ ������ ��� ��û�� ��Ű�� ���Եȴ�</li>
	</ol>
	
	<h3># ��Ű �߰��ϴ� ���</h3>
	<button onclick="location.href='<%=request.getContextPath() %>/cookie/add'"> ��Ű �߰��Ϸ� ����</button>


	<!-- 3 -->
	<button onclick="location.href='<%=request.getContextPath() %>/cookie/usage'"> ��Ű �� Ȱ���ϱ�</button>
	
</body>
</html>