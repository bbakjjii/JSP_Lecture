<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �� -->
<%@ page import="java.util.List" %>
<!-- �ٿ� ĳ���� �ؾ� �� -->
<%
	Object o1 = request.getAttribute("pastOrders");
	List<String> pastOrders = null;
	if (o1 instanceof List){
		pastOrders = (List)o1;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ֹ� ���</title>
</head>
<body>

	<h3>�ֹ��� ��� : ${customerName }</h3>
	<!-- 
	${info.name } <br>
	${info.address } <br>
	${info.city } <br>
	${info.email } <br>
	${info.phone } <br>
	${info.crust } <br>
	${info.pizza_size } <br>
	${info.topping } <br>
	${info.instruction } <br>
	 -->
	 
	 <!-- �� -->
	 <table border="2">
	 <%
	 	if (pastOrders != null && pastOrders.size() != 0) {
	 		for (String pastOrder : pastOrders) {
	 			out.print(pastOrder);
	 		} 
	 	} else {
	 		out.print("<tr><th>�ֹ� ������ �����ϴ�!</th></tr>");
	 	}
	 %>
	 </table>
	
	<a href="/chap07/pizza">return to index</a>
	
	<!-- �� -->
	<!--  PizzaOrderInserBusinessLogic ���Ͽ� �����̷�Ʈ �� -->
	<p>POST������� �Ķ���͸� �����ϰ� �� �� ���ΰ�ħ�� ���ƾ� �Ѵ�...(�����̷�Ʈ �ʿ�)</p>
	<p>�ڷΰ��⵵ ���ƾ� �ϴµ� �ڷΰ��⸦ ���� ���ؼ��� �ڹٽ�ũ��Ʈ�� history ��ü�� �����ؾ� �Ѵ�</p>
	
</body>
</html>