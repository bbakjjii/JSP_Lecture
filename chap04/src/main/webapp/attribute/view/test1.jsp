<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// Attribute�� Object Ÿ������ ��ϵǱ� ������ �����Ӱ� ����ϱ� ���ؼ��� �ٿ�ĳ������ �ʿ��ϴ�
	chap04.model.Student student = 
		(chap04.model.Student)(request.getAttribute("info")); // �ٿ�ĳ���� �ؾ� ��
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1># ������ �� ��Ʈ����Ʈ ���� Ȯ���ϱ�</h1>
	<ul>
		<li>
			page: <%=pageContext.getAttribute("food") %>
			(������ �ϸ� �����)
		</li>
		<li>
			request: <%=request.getAttribute("food") %>
			(�����带 ��ġ�� ���� ���ο� ��û�� ��� ����)
		</li>
		<li>
			session: <%=session.getAttribute("food") %>
			(�ѹ� ����ϰ��� �� �������� �������� ������)
		</li>
		<li>
			application: <%=application.getAttribute("food") %>
			(�ѹ� ����ϰ��� ������ �������� ������)
		</li>
	</ul>
	
	<h3># ��Ʈ����Ʈ �� ���� ����</h3>
	
	Student name: <%=student.name %><br>
	Student kor: <%=student.kor %><br>
	Student eng: <%=student.eng %><br>
	Student math: <%=student.math %><br>
	
	<!-- index.jsp���� �����ϰ� ��ư ������ ���;� �� ����ȴ�. -->
	<!-- Student.java������ �ٷ� ������� �ʱ� ������ ���������� ������ ���°� ���� -->
	
	<h3># ��Ʈ����Ʈ �� ���� ���� ���� ����(EL, Expression Language)</h3>
	<!-- 
	Student info: chap04.model.Student@6a02c4cb �ذ���
	Student.java���� toString�� override�Ѵ�.
	--> 
	Student info: ${info } <br>
	Food info: ${food } <br>
	
	<h3># EL�� �� �ʵ尪�� �����ϱ� (�ش� ��ü�� Getter�� �����Ǿ� �־�� ��)</h3>
	<!-- Student.java�� getMath()�� �����ؾ� �� -->
	Math: ${info.math } <br> <!-- �˾Ƽ� getMath�� ã�´� -->
	Average: ${info.avg } <br> <!-- �˾Ƽ� getAvg�� ã�´� -->
	(���� �ʵ尡 ������ getter�� ������ ���� ����) 
	<!-- view������ ���� �����⸸ �ϵ��� ����ϴ� ���� ����! -->
</body>
</html>