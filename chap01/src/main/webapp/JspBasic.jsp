<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JspBasic.jsp</title>
</head>
<body>

	<%-- JSP �ּ� --%>
	<!-- HTML �ּ� -->

	<!-- Tomcat�� Chrome�� ���� : ����(?)-->
	<!-- Tomcat(Server) -->
	<%
	for (int i = 0; i < 10; ++i) {
		out.print("<div>Tomcat(Server)div!!</div>");
	}
	%>

	<!-- Chrome Client) -->
	<script>
		for (i = 0; i < 10; ++i) {
			// document.write();
		}
	</script>

	<h3># ������ Ŭ���̾�Ʈ�� ����</h3>
	<ul>
		<li>�ΰ��� ������ Server �ƴϸ� Client
		<li>��й�ȣ ���� �ΰ��� ������ Server���� �����!
	</ul>

	<h3># Web Server</h3>
	<ul>
		<li>��û�� ���� �˸��� �ڿ��� �����Ѵ�</li>
		<li>��û�� ���� �ٸ� ������ ���������� ���Ѵ�
		<li>����ġ : �׸� �ּ��� �� �׸��� �ش�</li>
		<li>�� ������ �ּ��� �� �������� �ش�</li>
		<li>���� ������ ó��</li>
	</ul>

	<h3># Web Application Server</h3>
	<ul>
		<li>�� �����ʹ� �ٸ��� ��û�� ������ �˸��� ���ø����̼� ������ �����Ͽ� ����� ������ ����</li>
		<li>���α׷��� �� ����� DB�� �����ϴ� ���� ������ ������ �� ����</li>
		<li>���� ������ ó��</li>
	</ul>

	<h3># JSP�� �����ΰ�?</h3>
	<ul>
		<li>Java Server Pages (JSP)</li>
		<li>���� �� �������� �����ϱ� ����, Java�� ���� API</li>
		<li>HTML �ȿ� ���ϴ´�� Java �ڵ带 ������ ���� �� �ִ�</li>
		<li>JSP �ȿ� ���� ��� 5���� : html, css, js, Java, JSP</li>
		<li>JSP�� ���������� �������� ������ Spring�� ���Դ�</li>
	</ul>

	<%-- JSP Script --%>
	<%-- % : ��û�� ���� ȣ��Ǵ� �κ�(?) --%>
	<%--
		<%  %> : �ڹ� �ڵ带 ����� �� �ִ� ���� (�޼��� ���� ���, �޼��� ������ �ȵ�)
		<%= %> : ���ϴ� ���� HTML�� ��� (out.print()�� ���� ��)
		<%! %> : �޼��带 ������ �� �ִ� ���� (Ŭ���� ���� ���)
		<%@ %> : JSP ���� �ɼ� ���� ����
	--%>

	<h3># JSP�� ó�� ����</h3>
	<ol>
		<li>������ �Ҵ�</li>
		<li>.jsp ������ 1���� �ڹ� �ڵ�� ��ȯ�ȴ�</li>
		<li>��ȯ�� �ڹ� �ڵ带 ������ �Ͽ� �� �����̳�(Tomcat)�� ����Ѵ�</li>
		<li>.class�� Tomcat�� ��� (.java �� compile �� .class)</li>
		<li>Ŭ���̾�Ʈ�� �ش� �������� ��û(�� �������� ����)�Ҷ����� �� �����̳ʿ� ��ϵǾ��ִ� ������ �������
			�����Ͽ� �����Ǵ� HTML�ڵ带 �����Ѵ�. (.jsp�� ������ ������� �����ϸ� �ش� HTML�ڵ带 ��ȯ�ϴ� ���α׷��̴�)
		</li>
		<li>HTML�� Apache, JSP�� Tomcat�� �ִ�. JSP�� �ڹ��ڵ�� ��ȯ�Ǿ� ������ ������ ���ľ� �ϱ�
			������.</li>
	</ol>

	<b><%="Hello!"%></b>
	<br>
	<b><%=10 + 123%></b>
	<br>

	<%
	// �޼��� ���� ���
	int a = 10;
	int b = 20;

	// out - HTML �������� �������� OutputStream
	out.print("<a href='http://www.naver.com' style='color: red; '>��ũ</a>");

	// �޼��� ���ο� Ŭ���� ���� ����
	class Apple {
		int size;
		int sweet;

		public Apple() {
			size = 10;
			sweet = 9;
		}

		public String toString() {
			return "<h5 style='color: red;'>����Դϴ�.</h5>";
		}
	}

	out.print(new Apple()); // �ش� ��ü�� toString���� ȣ���ϱ� ������ ���� toString�޼��带 ������ش�.

	for (int i = 0; i < 10; ++i) {
		out.print(rabbit());
		System.out.println("������� �䳢�� ��� " + rabbitCount + "���� �Դϴ�.");
	}
	%>

	<%!// %! : �޼��带 ������ �� �ִ� ������ ��

	// Ŭ���� ���� ��� (�޼��� ���� ����, �ν��Ͻ� ���� ���� ����)
	int rabbitCount = 0; // �ν��Ͻ� ���� : ���� �þ

	String rabbit() {
		return "<pre> /)/)\n(  ..)\n(   >$\nGood Luck " + rabbitCount++ + "</pre>";
	}%>

	<p>
		���� �䳢��
		<%=rabbitCount%>����
	</p>
</body>
</html>