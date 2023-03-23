<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Session</title>
</head>
<body>

	<h3># Http Session</h3>
	<ol>
	<!-- 
		# ���ǹ�ȣ Ȯ�� ���
		�� ������������ [F12] ������
		�� [Application] �� Cookies �� http://localhost:9000 Ŭ�� �� Name: JSESSIONID / Value: 907F48E1A4AA495D5658A75BE44291BE Ȯ��
	 -->
		<li>Ŭ���̾�Ʈ�� �� ������ ó�� �����ϸ� ������ �ش� Ŭ���̾�Ʈ���� ����ID�� �߱��Ѵ�</li>
		<li>
			����ID�� Ŭ���̾�Ʈ�� �� �������� �߰��ȴ�
			(�ٸ� �������� �����ϴ� ��� ���ο� ����ID�� �߱޹޴´�)
		</li>
		<li>
			�������� ��Ű�� ����Ǿ��ִ� ����ID��
			���� Ŭ���̾�Ʈ�� ��� ��û�� ���ԵǾ� �Բ� ������ ���۵ȴ�
		</li>
		<li>
			��Ű�� ����� ����ID�� �⺻�����δ� ������� �� �������� ����� �� ��������� �����Ǿ� �ִ�
		</li>
		<li>
			���� ��ü�� ���ο� ������(��Ʈ����Ʈ)�� �߰��ϴ� ���� 
			���� ��ǻ���� �ڿ��� ����ϴ� ���̹Ƿ�, 
			���ǿ� �ʹ� ���� ���� �����͸� �����ϸ� �ȵȴ�
		</li>
	</ol>
	
	<hr>
	
	<h3># ���ǿ� ���ϴ� ������ �߰��ϱ�</h3>
	<form action="/chap04/session/add" method="POST">
		<select name="name">
			<option value="food">food</option>
			<option value="hobby">hobby</option>
			<option value="sports">sports</option>
		</select>
			<input id="value-field" name="value" type="text" value="default"/>
			<input type="submit" value="Add" />
	</form>
	
	<hr># ���� ���� ��Ʈ����Ʈ ���</hr>
	
	<!-- �ð��� longŸ���̸� UNIX Ÿ�� -->
	<p>
		���� ID: <%=session.getId() %><br>
		���� ���� �ð�: <%=new java.util.Date(session.getCreationTime()) %><br>
		���������� Ȱ���� �ð�: <%=new java.util.Date(session.getLastAccessedTime()) %><br>
		
		<button onclick="location.href='/chap04/session/invalidate';">
			���� �����Ű��
		</button>
	</p>
	
	<ul>
	<li>food: <%=session.getAttribute("food") %></li>
	<li>hobby: <%=session.getAttribute("hobby") %></li>
	<li>sports: <%=session.getAttribute("sports") %></li>
	</ul>
	
	<script>
		const valueField = document.getElementById("value-field");
		
		valueField.addEventListener('click', () => {
			if (valueField.value === 'default') {
					valueField.value = "";
			}
		});
	</script>
	
</body>
</html>