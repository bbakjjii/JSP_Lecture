<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="chap04.model.Student" %>
<%
	// page scope�� attibute �߰��ϱ� (���� �������� �Ѿ�� ��ȿ�Ⱓ ����, ���� ���� �ִ� ������ ���� ����)
	pageContext.setAttribute("food", "kimbab");
	
	// request scope�� attribute �߰��ϱ� (������ �ϰ��� ��ȿ�Ⱓ ����, ��û ������ŭ ����)
	request.setAttribute("food", "Ramen");
	
	// session scope�� attribute �߰��ϱ� (������ ����Ǹ� ��ȿ�Ⱓ ���� - ����� ���� ����)
	session.setAttribute("food", "Sushi");
	
	// application scope�� attribute �߰��ϱ� (������ ������ ��ȿ�Ⱓ ����, ��� ����ڰ� �Բ� ���) - ���� ������
	application.setAttribute("food", "Chicken");
	
	// Parameter : HTML �� java (Server)
	// Attribute : Java(JSP) �� Java(�ٸ� ������)
	
	// ��Ʈ����Ʈ���� ��� ������ Ŭ������ ����س��� ������ �� �ִ�(���� ���� Ŭ������ ������ ����� �� �ִ�)
	// = ��ü������ ���α׷����� ������� �� �� �ִ�
	request.setAttribute("info", new Student("Kim", 50, 55, 60));
	
	request
		.getRequestDispatcher("/attribute/view/test1.jsp")
		.forward(request, response);
%>