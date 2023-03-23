<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, chap04.model.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸� �� (Memo App)</title>
</head>
<body>

	<h3># �䱸����</h3>
	<ul>
		<li>���̵�� ��й�ȣ�� �Է��� �α����� �� �� �ִ�</li>
		<li>ȸ�������� ���̵�� ��й�ȣ�� �Է��ϸ� �Ϸ�ȴ� (���̵� �ߺ��� üũ)</li>
		<li>�α��� �� ����� ���ο� �޸� ����� �� �ִ�</li>
		<li>�α��ο� �����ϸ� ������ ����ߴ� �޸���� ��򰡿� ������ �Ѵ�</li>
		<li>������ �������� �� ��� ������ ���ư��� ����� ����</li>
		<li>������ ������ ������ ����</li>
	</ul>
	
	<!-- ����� ���� -->
	<h3>�� ����� ����</h3>
	
	<!-- ������ Servlet���� �� ����� �ϰ� �Ծ�� �Ѵ�. -->
	<%
		Object mem = application.getAttribute("members");
	
		Map<String, Member> map = null;
		
		if (mem != null) {
			// �ٿ�ĳ����
			map = (Map) mem;
		}
	%>
	
	<h5>���� ȸ���� <%=map == null ? 0 : map.size() %>�� �Դϴ�.</h5>
	
	<%
		Object login = session.getAttribute("login");
		
		// login�� null�̰ų� boolean Ÿ���� login�� false���
		// �� ���� �α��� ���� ���� ���¶��
		if (login == null || !((boolean)login)) {
			
	%>
	<form id="login-form" action="/chap04/memo/login" method="POST"></form>
	
	ID:<input name="id" type="text" form="login-form" />
	PW:<input name="pw" type="text" form="login-form"/>
	
	<!-- button�±׿��� type="submit"�� �����ϴ� -->
	<button type="submit" form="login-form">�α���</button>
	<button onclick="location.href='/chap04/memo/Register'">ȸ������</button>
	
	<% 
		} else { 
			Member currMem = (Member)session.getAttribute("currMem");
	%>
		<!-- ���� ����� ��������? -->
		<div>'<%=currMem %>'�� ȯ���մϴ�!</div>
	<% 
			for (String memo : currMem.getMemos()) { %>
		
			<div><%=memo %></div>
	<%	
		}
	%>
	<form action="/chap04/memo/text" method="POST">
		<input type="text" name="memo-value" /> <input type="submit" vlaue="add"/>
	</form>
	<% } %>
</body>
</html>